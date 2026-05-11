# Task 3: Private Shield Vote (DApp)

这是一个基于 Aleo 构建的隐私投票应用示例。

## 项目结构
- `/contract`: 包含 Leo 智能合约代码。
  - `main.leo`: 实现隐私投票记录（Ticket）生成和公开计票逻辑。
- `/frontend`: 包含基于 React 的前端交互代码。
  - `App.js`: 模拟与 Aleo SDK 和 Leo Wallet 的交互。

## 核心功能
1. **隐私投票**：投票人的选择被封装在隐私 Record 中，链上无法直接关联投票人与选择。
2. **ZK 证明生成**：前端通过 Aleo SDK 在本地生成投票证明。
3. **公开计票**：通过 Finalize 逻辑更新公开的计票结果。

## 运行说明
1. 进入 `contract` 目录，使用 `leo build` 编译合约。
2. 进入 `frontend` 目录，运行 `npm install` 和 `npm start` 启动前端。
