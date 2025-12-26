// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../contracts/tokens/LiquidityGeneratorERC20.sol";
import "../contracts/mocks/MockUniswapRouter.sol";

contract LiquidityGeneratorERC20Test is Test {
    LiquidityGeneratorERC20 token;
    MockUniswapRouter router;

    function setUp() public {
        router = new MockUniswapRouter();

        token = new LiquidityGeneratorERC20(
            "Liquidity Token",
            "LIQ",
            1_000_000,
            address(router),
            address(0x1234)
        );
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), 1_000_000 ether);
    }

    function testBlacklist() public {
        token.blacklist(address(1), true);
        vm.expectRevert();
        token.transfer(address(1), 100 ether);
    }
}
