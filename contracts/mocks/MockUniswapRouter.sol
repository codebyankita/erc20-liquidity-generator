// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockUniswapRouter {
    address public immutable WETH_ADDRESS;

    constructor() {
        WETH_ADDRESS = address(0xBEEF);
    }

    function factory() external pure returns (address) {
        return address(this);
    }

    function WETH() external view returns (address) {
        return WETH_ADDRESS;
    }

    function createPair(address, address) external pure returns (address) {
        return address(0xCAFE);
    }

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint, uint, address[] calldata, address, uint
    ) external {}

    function addLiquidityETH(
        address, uint, uint, uint, address, uint
    ) external payable returns (uint, uint, uint) {
        return (0, 0, 0);
    }
}
