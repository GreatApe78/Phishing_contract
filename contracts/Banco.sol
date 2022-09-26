// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Banco {
    address public owner;

    constructor() {
        owner = tx.origin;
    }

    function Depositar() public payable {}

    function Sacar(address _to, uint256 _amount) public {
        require(tx.origin == owner, "nao eh o dono");

        (bool callSuccess, ) = payable(_to).call{value: _amount}("");

        require(callSuccess, "Call failed");
    }

    function get_balance() public view returns (uint256) {
        return address(this).balance;
    }
}
