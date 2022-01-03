// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./room.sol";

interface ILingguangRule {
    function openRoomFee() external returns (uint256);
}

contract Lingguang is ERC20, Ownable {
    mapping(address => Room) rooms;
    uint256 roomAmount;
    ILingguangRule rule;

    constructor() ERC20("D", "D") {
        address myAddr = 0x8FFA8517805Be4d4a72bC830286D91Cc8b03C326;
        _mint(myAddr, 10**8);

        address lingguangRuleAddress =  address(1);
        rule = ILingguangRule(lingguangRuleAddress);
    }

    function openRoom(address roomRuleAddress, string memory roomName, address roomMintReceipt) external {
        // 开房间收手续费
        uint256 fee = rule.openRoomFee();
        transfer(address(this), fee);

        Room room = new Room(roomRuleAddress, roomName, roomMintReceipt);
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


    function getTotalFee() external  {
        // 将Lingguang的手续费提现到owner账号
    }
}
