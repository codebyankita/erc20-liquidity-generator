// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract BaseToken {
    string public name;
    string public symbol;
    uint8 public immutable decimals;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }
}
