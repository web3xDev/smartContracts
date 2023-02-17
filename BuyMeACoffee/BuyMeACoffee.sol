// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract BuyMeACoffee {
    mapping(address => uint256) private balances;
    mapping(address => bool) private creators;

    uint256 private feeBalance;
    address private admin;

    event NewCoffee(address indexed _from, address indexed _to, uint256 _amount);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can perform this action.");
        _;
    }

    modifier onlyCreator() {
        require(creators[msg.sender], "Only creators can perform this action.");
        _;
    }

    function addCreator(address _creator) public {
        require(_creator != address(0), "Invalid creator address.");
        require(!creators[_creator], "Creator already added.");
        creators[_creator] = true;
    }

    function buyCoffee(address _creator) public payable {
        require(msg.value > 0, "Amount must be greater than 0.");
        require(creators[_creator], "Invalid creator address.");

        uint256 fee = msg.value / 20; // 5% fee
        require(msg.value > fee, "Fee calculation underflowed.");
        require(feeBalance + fee >= feeBalance, "Fee calculation overflowed.");

        balances[_creator] += msg.value - fee;
        feeBalance += fee;

        emit NewCoffee(msg.sender, _creator, msg.value);
    }

    function withdraw(uint256 _amount) public onlyCreator {
        require(_amount > 0, "Amount must be greater than 0.");
        require(balances[msg.sender] >= _amount, "Insufficient balance.");
        require(address(this).balance >= _amount, "Insufficient contract balance.");

        // Set balance to 0 before transferring to prevent reentrancy attacks
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view onlyCreator returns (uint256) {
        return balances[msg.sender];
    }

    function isAdmin() public view returns (bool) {
        return msg.sender == admin;
    }

    function setAdmin(address _newAdmin) public onlyAdmin {
        require(_newAdmin != address(0), "Invalid admin address.");
        admin = _newAdmin;
    }

    function addCreatorByAdmin(address _creator) public onlyAdmin {
        require(_creator != address(0), "Invalid creator address.");
        require(!creators[_creator], "Creator already added.");
        creators[_creator] = true;
    }
}
