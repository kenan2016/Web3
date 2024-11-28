// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// UUPS逻辑合约（升级函数写在逻辑合约内）

//逻辑合约最佳实践

// 是的，你可以直接调用逻辑合约的函数，而不通过代理合约。但这种操作在通常情况下并不推荐，因为它会破坏代理模式的核心目的，并可能引发以下问题：

// 1. 为什么可以直接调用逻辑合约？

// 逻辑合约和代理合约是两个独立的合约，分别部署在链上的不同地址。如果你知道逻辑合约的地址，可以直接与逻辑合约交互，调用其中的函数。
// 例如，在部署逻辑合约后，直接调用它的函数：

// UUPS1 logicContract = UUPS1(logicContractAddress);
// logicContract.foo();

// 这种调用完全绕过了代理合约。

// 2. 直接调用逻辑合约的影响

// 虽然直接调用逻辑合约是技术上可行的，但可能带来以下问题：

// (1) 状态冲突问题

// 逻辑合约的状态变量并未被实际使用。
// 	•	在代理模式中，所有的状态变量都存储在代理合约的存储槽中，而逻辑合约只定义逻辑。因此，直接调用逻辑合约时，它会尝试访问自己的存储，但存储槽可能是空的或未初始化的，导致意外行为。
// 	•	举例：
// 	•	假设你调用逻辑合约中的 foo() 函数，它会试图更新 words 状态变量。但由于代理合约存储槽中才是真正有效的存储，这种调用不会对代理合约的状态产生任何影响。

// (2) 绕过代理的控制逻辑

// 代理合约通常包含管理员权限控制或其他安全逻辑（如升级控制）。如果用户直接调用逻辑合约：
// 	•	这些控制逻辑会被绕过，可能导致不安全的操作。
// 	•	例如： 直接调用逻辑合约中的 upgrade() 函数，而不通过代理的 fallback，可能允许非管理员意外执行合约升级。

// (3) 无法实现统一接口

// 在系统设计中，代理合约的核心作用是提供一个固定的接口地址给用户，而逻辑合约可能在升级过程中被替换。如果用户直接调用逻辑合约地址：
// 	•	当逻辑合约地址发生变化时，用户将无法正确与新逻辑合约交互。
// 	•	而通过代理合约调用时，用户只需要知道代理地址即可。

// (4) 安全隐患

// 如果逻辑合约存在 payable 函数，用户可能意外发送资金到逻辑合约，导致资金进入非预期的存储槽或永久丢失。

// 3. 什么情况下需要直接调用逻辑合约？

// 尽管不推荐，某些场景下可能需要直接调用逻辑合约：
// 	1.	调试或测试：
// 	•	在开发或测试阶段，可以直接调用逻辑合约，验证其功能是否正确。
// 	2.	非代理模式设计：
// 	•	如果你并未计划通过代理模式调用逻辑合约，而是希望逻辑合约单独作为一个合约使用，则直接调用是可以的。
// 	3.	故障恢复：
// 	•	如果代理合约中存在重大问题，可以直接调用逻辑合约来执行某些关键操作（如资金取回）。

// 4. 代理合约和逻辑合约的最佳实践

// 	1.	始终通过代理合约调用逻辑合约。
// 	•	通过代理合约，用户的交互将遵循预期的安全控制和逻辑流程。
// 	2.	将逻辑合约的访问限制为内部使用。
// 	•	可以通过编写一个基础合约，只允许代理合约通过 delegatecall 调用逻辑合约函数：

// contract Logic {
//     address public proxy;

//     modifier onlyProxy() {
//         require(msg.sender == proxy, "Can only be called via proxy");
//         _;
//     }

//     function foo() public onlyProxy {
//         // your logic
//     }
// }

// 5. 总结

// 虽然可以直接调用逻辑合约的函数，但这样做可能导致存储冲突、安全隐患以及管理混乱。因此，在使用代理模式时，推荐所有交互都通过代理合约进行，确保统一的调用入口和一致的逻辑管理。