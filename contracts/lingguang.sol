// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;
import "zeppelin-solidity/contracts/token/ERC20/ERC20.sol";

interface IRoomRule {
    function joinThreshold(address account) external returns (bool);

    function proposeThreshold(address account) external returns (bool);
}

contract Room {
    // 章节
    struct Chapter {
        uint256 num;
        string title;
        bytes32 id;
        string author;
        uint256 reward;
        uint256 likes;
        uint256 votes;
    }

    // 书籍作品
    struct Book {
        mapping(bytes32 => Chapter) chapters;
        bytes32 id;
        uint256 reward;
        uint256 likes;
        address[] author;
        uint256 currentChapterNumber;
        mapping(bytes32 => Chapter) chaptersOnProposing;
        bytes32 currentMostSupportCapter;
    }

    uint256 id;
    string dec;
    IRoomRule rule;
    mapping(bytes32 => Book) books;

    // 申请加入房间
    function join() external {
        bool canJoin = rule.joinThreshold(msg.sender);
        if (!canJoin) {
            return;
        }
    }

    function proposeChapter(
        bytes32 chapterId,
        bytes32 bookId,
        uint256 chapterNumber,
        string memory title
    ) external {
        address chapterAuthor = msg.sender;
        bool canPropose = rule.proposeThreshold(chapterAuthor);
        if (!canPropose) {
            return;
        }

        Book storage book = books[bookId];
        if (book.id == bytes32(0)) {
            return;
        }

        if (book.currentChapterNumber + 1 != chapterNumber) {
            return;
        }

        Chapter storage chapter = book.chaptersOnProposing[chapterId];
        // 该章节已被提案过
        if (chapter.id != bytes32(0)) {
            return;
        }
        chapter.id = chapterId;
        chapter.num = chapterNumber;
        chapter.title = title;
    }

    function voteChanpter() external {}

    // 创建书籍
    function createBook() external {
        bool canPropose = rule.proposeThreshold(msg.sender);
        if (!canPropose) {
            return;
        }
    }
}

contract RoomManage is ERC20 {
    mapping(address => Room) rooms;
    uint256 basefee = 10;
    uint256 fee = 10;
    uint256 roomAmount;
    uint256 maxFee = 100000;
    address myAddr = 0x8FFA8517805Be4d4a72bC830286D91Cc8b03C326;

    constructor() ERC20("D", "D") {
        _mint(myAddr, 10**8);
    }

    function openRoom() external {
        // 开房间收手续费
        fee = basefee * roomAmount;
        if (fee > maxFee) {
            fee = maxFee;
        }
        transfer(address(this), fee);

        Room room = new Room();
        rooms[address(room)] = room;
        roomAmount++;
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override {}

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override {}
}
