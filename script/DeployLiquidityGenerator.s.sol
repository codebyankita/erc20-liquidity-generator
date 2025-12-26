// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../contracts/tokens/LiquidityGeneratorERC20.sol";

contract DeployLiquidityGenerator is Script {
    function run() external {
        vm.startBroadcast();

        new LiquidityGeneratorERC20(
            "Liquidity Token",
            "LIQ",
            1_000_000,
            address(0xRouter),
            address(0xCharity)
        );

        vm.stopBroadcast();
    }
}
