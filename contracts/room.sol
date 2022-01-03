
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IRoomRule {
    function joinThreshold(address account) external returns (bool);

    function proposeThreshold(address account) external returns (bool);
}

contract Room is ERC20 {
    IRoomRule rule;
    uint256 id;
    string dec;
    constructor(address ruleAddress, string memory name, address mintReceipt) ERC20(name, name) {
        _mint(mintReceipt, 10**8);

        rule = IRoomRule(ruleAddress);
    }


    // 章节
    struct Chapter {
        uint256 num;
        string title;
        bytes32 id;
        address author;
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
        mapping(address=>address) authors;
        uint256 currentChapterNumber;
        mapping(bytes32 => Chapter) chaptersOnProposing;
        bytes32 currentMostSupportCapter;
    }

    struct LockAmountToken {
        uint256 amount;
        bool canRefund;
    }

    // 投票或提案会锁定账户指定余额
    mapping(address=>LockAmountToken) lockedToken_d;
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


        Book storage book = books[bookId];
        require(book.id == bytes32(0), "book not exist");
        require(book.currentChapterNumber + 1 != chapterNumber, "error chapter number");

        // 质押小d比个数
        require(!lockedToken_d[msg.sender].canRefund, "the address alread lock token");
        uint256 lockAmount = 1000;
        transfer(address(this), lockAmount);
        lockedToken_d[msg.sender].amount = lockAmount;

        Chapter storage chapter = book.chaptersOnProposing[chapterId];
        // 该章节已被提案过
        if (chapter.id != bytes32(0)) {
            return;
        }

        chapter.id = chapterId;
        chapter.num = chapterNumber;
        chapter.title = title;
        chapter.author = chapterAuthor;
    }

    function voteChanpter() external {
        // 给章节投票，票数优先达到一定数额的章节胜出
    }

    // 创建书籍
    function createBook(bytes32 bookId) external {
        bool canPropose = rule.proposeThreshold(msg.sender);
        if (!canPropose) {
            return;
        }

        require(bookId!=bytes32(0), "a zero bookId");

        Book storage book = books[bookId];
        require(bookId==bytes32(0), "book existed");

        book.id = bookId;
        book.authors[msg.sender] = msg.sender;
    }

    function refund() external {
        // 退回已解锁的资金
        // 将对应账号的LockAmountToken.canRefund改为false
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