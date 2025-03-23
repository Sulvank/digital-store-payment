// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract DigitalStore {
    address public owner;
    uint256 public productPrice = 0.01 ether;

    mapping(address => bool) public hasPurchased;
    address[] public buyers;

    event ProductPurchased(address indexed buyer, uint256 amount);
    event FundsWithdrawn(address to, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el owner puede ejecutar esto");
        _;
    }

    function buyProduct() external payable {
        require(msg.value == productPrice, "Debes pagar exactamente el precio del producto");
        require(!hasPurchased[msg.sender], "Ya compraste este producto");

        hasPurchased[msg.sender] = true;
        buyers.push(msg.sender);

        emit ProductPurchased(msg.sender, msg.value);
    }

    function withdraw(address payable to) external onlyOwner {
        uint256 balance = address(this).balance;
        (bool success, ) = to.call{value: balance}("");
        require(success, "Fallo al retirar los fondos");
        emit FundsWithdrawn(to, balance);
    }

    function getBuyers() external view returns (address[] memory) {
        return buyers;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
