// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Banco {
    address public owner;

    constructor() {
        owner = tx.origin;
    }

    function Sacar() public payable {
        require(owner == tx.origin, "nao eh o dono");

        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");

        require(callSuccess, "Call failed");
    }
}
