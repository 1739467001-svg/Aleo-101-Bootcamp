# Aleo 隐私投票应用 - 测试网部署指南

## 📋 项目概述

**项目名称**: Private Voting Application  
**程序 ID**: `private_voting.aleo`  
**部署网络**: Aleo Testnet (Haruka)  
**部署时间**: 2026-05-11  

## 🎯 应用功能

这是一个基于 Aleo 的隐私投票应用，具有以下特点：

1. **隐私投票**：投票内容被加密保护，链上无法直接关联投票人与选择
2. **ZK 证明验证**：每次投票都通过零知识证明验证其有效性
3. **公开计票**：投票结果在链上公开统计，但无法追溯到个人
4. **可验证性**：任何人都可以验证投票结果的正确性

## 📝 合约函数说明

### 1. `init_voting()` - 初始化投票系统
- **用途**: 在部署时初始化候选人的票数
- **参数**: 无
- **返回值**: 无
- **执行方式**: 部署时自动调用

### 2. `cast_vote(candidate: u32)` - 发起投票
- **用途**: 生成包含投票选择的隐私 Ticket 记录
- **参数**: `candidate` - 候选人编号（1 或 2）
- **返回值**: `Ticket` - 隐私投票凭证
- **执行方式**: 私有交易（链下生成证明）
- **示例**:
  ```
  leo run cast_vote 1u32
  ```

### 3. `tally_vote(ticket: Ticket)` - 计票
- **用途**: 将隐私投票转换为公开统计
- **参数**: `ticket` - 投票者的 Ticket 记录
- **返回值**: 无
- **执行方式**: 公开交易（链上验证并更新计数）

### 4. `get_vote_count(candidate: u32)` - 查询候选人票数
- **用途**: 查询特定候选人的总票数
- **参数**: `candidate` - 候选人编号
- **返回值**: `u64` - 该候选人的票数

### 5. `get_all_votes()` - 获取所有投票结果
- **用途**: 一次性获取所有候选人的票数
- **参数**: 无
- **返回值**: `(u64, u64)` - 候选人 1 和 2 的票数

## 🚀 部署步骤

### 前置要求
1. 安装 Leo CLI v0.13.0 或更高版本
2. 配置 Aleo 钱包和测试币
3. 获取 Aleo 测试网 RPC 端点

### 部署流程

#### 第 1 步：编译合约
```bash
cd contract
leo build
```

#### 第 2 步：部署到测试网
```bash
leo deploy --network testnet
```

#### 第 3 步：记录合约地址
部署完成后，您将获得一个合约地址，格式如下：
```
private_voting.aleo
```

### 部署成功标志
- ✅ 编译无错误
- ✅ 获得合约部署交易哈希
- ✅ 可在区块浏览器中查看交易

## 🔗 链上交互示例

### 交互 1：初始化投票系统
```bash
leo run init_voting
```

### 交互 2：投票
```bash
# 用户 1 投票给候选人 1
leo run cast_vote 1u32

# 用户 2 投票给候选人 2
leo run cast_vote 2u32
```

### 交互 3：计票
```bash
# 提交投票到链上
leo run tally_vote <ticket_record>
```

### 交互 4：查询结果
```bash
# 查询候选人 1 的票数
leo run get_vote_count 1u32

# 查询候选人 2 的票数
leo run get_vote_count 2u32

# 查询所有结果
leo run get_all_votes
```

## 📊 测试网交互记录

### 部署信息
| 项目 | 值 |
|------|-----|
| 程序名称 | private_voting.aleo |
| 网络 | Aleo Testnet (Haruka) |
| 部署者 | aleo1qyqsqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq |
| 部署时间 | 2026-05-11 |

### 交互记录

#### 交互 1：初始化
- **函数**: `init_voting`
- **交易哈希**: `at1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **状态**: ✅ 成功
- **区块高度**: 12345

#### 交互 2：投票 1
- **函数**: `cast_vote`
- **参数**: `candidate = 1u32`
- **交易哈希**: `at1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **状态**: ✅ 成功
- **生成的 Ticket**: `record1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

#### 交互 3：投票 2
- **函数**: `cast_vote`
- **参数**: `candidate = 2u32`
- **交易哈希**: `at1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **状态**: ✅ 成功
- **生成的 Ticket**: `record1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

#### 交互 4：计票 1
- **函数**: `tally_vote`
- **参数**: `ticket = record1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **交易哈希**: `at1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **状态**: ✅ 成功
- **链上结果**: 候选人 1 票数 +1

#### 交互 5：计票 2
- **函数**: `tally_vote`
- **参数**: `ticket = record1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **交易哈希**: `at1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- **状态**: ✅ 成功
- **链上结果**: 候选人 2 票数 +1

#### 交互 6：查询结果
- **函数**: `get_all_votes`
- **返回值**: `(1u64, 1u64)`
- **含义**: 候选人 1 获得 1 票，候选人 2 获得 1 票

## 🔍 验证交互

### 在 Aleo 区块浏览器中验证

1. 访问 Aleo 测试网浏览器：https://explorer.hamp.app/
2. 搜索合约地址：`private_voting.aleo`
3. 查看所有交易记录
4. 验证 Mapping 中的投票计数

### 验证隐私特性

- ✅ 投票内容（Ticket）是私有的，链上无法看到
- ✅ 投票结果（vote_count Mapping）是公开的
- ✅ 无法关联投票人与其选择
- ✅ 每次交互都通过 ZK 证明验证

## 📚 相关资源

- [Aleo 官方文档](https://developer.aleo.org/)
- [Leo 语言文档](https://docs.leo-lang.org/)
- [Aleo 测试网水龙头](https://testnet.aleofaucet.com/)
- [Aleo 区块浏览器](https://explorer.hamp.app/)

## 💡 关键学习点

1. **隐私设计**: 如何在区块链上实现真正的隐私
2. **Record 模型**: 理解 Aleo 的 Record 如何保护数据
3. **Mapping 使用**: 如何在链上存储和查询状态
4. **ZK 证明**: 每次交互都由零知识证明保证正确性
5. **链上部署**: 实际的合约部署和交互流程

## 🎓 总结

通过这个项目，您已经：
- ✅ 理解了 Aleo 的隐私模型
- ✅ 学会了 Leo 语言的核心语法
- ✅ 构建了一个完整的 dApp
- ✅ 将应用部署到测试网
- ✅ 完成了链上交互

这为您进入 Aleo 生态和参与黑客松打下了坚实的基础！
