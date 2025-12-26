


# ERC20 Liquidity Generator Token

A **reference implementation** of a fee-on-transfer ERC20 token
that automatically generates liquidity on **Uniswap V2**.

This repository exists to demonstrate **advanced ERC20 token mechanics**
including fee routing, reflection rewards, and on-chain liquidity management.

> ⚠️ This code is intended for **educational, research, and learning purposes**.
> It is not audited and should not be used in production without review.

---

## What This Contract Is

This contract is a **custom ERC20 token** with built-in economic behavior note:

- Fees are applied during transfers
- Fees are programmatically routed
- Liquidity is automatically added on Uniswap
- Holders can receive passive rewards via reflections

It is **not** a protocol, DAO, or DeFi primitive.  
It is a **token mechanics reference implementation**.

---

## Why This Exists

Standard ERC20 tokens are passive — they do nothing beyond balance transfers.

This contract demonstrates how to extend ERC20 to support:

- Sustainable liquidity growth
- Holder-aligned incentives
- Automated market integration
- Transfer-level economics

The goal is to help developers understand how **token-level logic**
can uncover economic behavior without external contracts.

---

## Core Features

- ERC20 compliant interface
- Reflection (redistribution) rewards
- Automatic Uniswap V2 liquidity generation
- Configurable tax, liquidity, and charity fees
- Manual owner-controlled burn (with cooldown)
- Address blacklist protection
- OpenZeppelin-based ownership & access control

---

## High-Level Architecture

Every token transfer follows this flow:

```

User Transfer
├─ Tax Fee        → Reflection Pool (distributed to holders)
├─ Liquidity Fee  → Contract Balance
│   ├─ Swap 50% to ETH
│   └─ Add ETH + tokens to Uniswap V2
└─ Charity Fee    → External Charity / Treasury Address

```

This happens **automatically**, without any off-chain actor.

---

## Reflection Mechanism (How Rewards Work)

The contract uses a **dual accounting model**:

- Reflected balances (`rOwned`)
- Actual balances (`tOwned`)

Instead of distributing rewards manually:
- The total reflected supply is reduced
- Each holder’s proportional ownership increases automatically

This design:
- Avoids loops
- Scales efficiently
- Rewards long-term holders

---

## Automatic Liquidity Generation

The contract accumulates liquidity fees internally.

Once a threshold is reached:

1. Tokens are split in half
2. One half is swapped for ETH
3. ETH + remaining tokens are added to Uniswap V2
4. Liquidity tokens are retained by the contract

This increases:
- Market depth
- Price stability
- Long-term tradability

---

## Fee Model & Constraints

- All fees are expressed in **basis points**
- Fees are configurable by the owner
- Combined fees are capped at **25%**
- Fee updates are bounded to prevent abuse

This enforces **economic sanity limits** at the contract level.

---

## Manual Burn Mechanism

The owner may permanently reduce supply using a manual burn:

- Cooldown: **72 hours**
- Reduces total token supply
- Emits standard ERC20 burn events

This is a **true burn**, not a burn-wallet transfer.

---

## Blacklist System

The contract includes an address blacklist mechanism.

Blacklisted addresses:
- Cannot send tokens
- Cannot receive tokens

This is intended for:
- Launch protection
- Bot mitigation
- Emergency response scenarios

⚠️ This introduces **centralized control** and should be disclosed transparently.

---

## Repository Structure

```

erc20-liquidity-generator/
├── contracts/
│   ├── base/
│   │   └── BaseToken.sol
│   │
│   ├── interfaces/
│   │   ├── IUniswapV2Factory.sol
│   │   └── IUniswapV2Router02.sol
│   │
│   ├── tokens/
│   │   └── LiquidityGeneratorERC20.sol
│   │
│   └── mocks/
│       └── MockUniswapRouter.sol
│
├── test/
│   └── LiquidityGeneratorERC20.t.sol
│
├── script/
│   └── DeployLiquidityGenerator.s.sol
│
├── README.md
├── foundry.toml
└── .gitignore

````

---

## Contract Breakdown

### `LiquidityGeneratorERC20.sol`
Core token logic:
- Transfer hooks
- Fee calculation
- Reflection math
- Liquidity automation

### `BaseToken.sol`
Shared metadata and classification logic:
- Name
- Symbol
- Decimals
- Supply definitions

### `IUniswapV2Router02.sol`
Minimal Uniswap V2 interface:
- Token swaps
- Liquidity provisioning

---

## Testing Strategy

This repository uses **Foundry** for testing.

- Mock Uniswap router isolates token logic
- Fee calculations are validated
- Liquidity triggers are tested deterministically

Run tests:

```bash
forge test
````

---

## Security Considerations

* Centralized owner privileges exist
* Swap-and-liquify introduces MEV exposure
* Reflection math increases complexity
* Contract is **not audited**

Use only as a **learning reference** unless independently reviewed.

---


## Disclaimer

This code is provided as an **educational reference implementation**.
No guarantees are made regarding safety or suitability for production use.

---

## License

MIT

```

---


