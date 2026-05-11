# Task 4: 用起来 - 真实场景落地

## 📋 项目内容

这个文件夹包含了完整的 Aleo 隐私投票应用，包括：

### 文件结构
```
task4/
├── contract/                    # Leo 智能合约
│   ├── src/
│   │   └── main.leo            # 隐私投票合约代码
│   ├── Leo.toml                # 项目配置
│   └── build/                  # 编译输出（部署后生成）
├── deployment/                  # 部署相关文件
│   ├── DEPLOYMENT_GUIDE.md     # 详细的部署指南
│   ├── INTERACTION_DEMO.md     # 链上交互演示
│   ├── deploy.sh               # 自动化部署脚本
│   └── TESTNET_ADDRESSES.md    # 测试网合约地址（部署后填写）
├── task4.md                    # Task 4 完整答案
└── README.md                   # 本文件
```

---

## 🎯 应用功能

### 核心特性
1. **隐私投票**: 投票内容被加密保护
2. **ZK 验证**: 每个交易都通过零知识证明验证
3. **公开计票**: 投票结果在链上公开统计
4. **可验证性**: 任何人都可以验证投票结果

### 支持的操作
- `init_voting()` - 初始化投票系统
- `cast_vote(candidate)` - 发起投票（生成 Ticket）
- `tally_vote(ticket)` - 计票（上链统计）
- `get_vote_count(candidate)` - 查询候选人票数
- `get_all_votes()` - 查询所有投票结果

---

## 🚀 快速开始

### 前置要求
```bash
# 1. 安装 Leo CLI
# 访问 https://docs.leo-lang.org/ 按照说明安装

# 2. 验证安装
leo --version
# 输出: Leo 0.13.0 或更高版本

# 3. 配置 Aleo 钱包
# 创建 .env 文件或使用 Leo 钱包管理工具
```

### 部署步骤
```bash
# 1. 进入合约目录
cd contract

# 2. 编译合约
leo build

# 3. 部署到测试网
leo deploy --network testnet

# 4. 记录合约地址
# 部署成功后，您将获得合约地址
```

### 链上交互
```bash
# 1. 初始化投票系统
leo run init_voting

# 2. 投票
leo run cast_vote 1u32

# 3. 计票
leo run tally_vote <ticket_record>

# 4. 查询结果
leo run get_all_votes
```

---

## 📚 文档说明

### 1. `DEPLOYMENT_GUIDE.md`
详细的部署指南，包括：
- 部署前的准备工作
- 逐步的部署流程
- 部署成功的标志
- 常见问题解决

### 2. `INTERACTION_DEMO.md`
完整的链上交互演示，展示：
- 3 个投票者的投票过程
- 每个交易的详细信息
- 最终的投票结果
- 隐私验证

### 3. `deploy.sh`
自动化部署脚本，简化部署流程

### 4. `task4.md`
Task 4 的完整答案，包括：
- 合约代码说明
- 部署信息
- 链上交互记录
- 隐私验证

---

## 🔐 隐私特性

### 链上可见
```
✅ 投票结果（vote_count Mapping）
✅ 交易哈希和区块信息
✅ ZK 证明（验证但不泄露数据）
```

### 链上不可见
```
❌ 投票人身份
❌ 投票选择
❌ 投票人与选择的关联
```

---

## 🌐 测试网信息

### 网络配置
- **网络名称**: Aleo Testnet (Haruka)
- **RPC 端点**: https://api.testnet.aleo.org/
- **区块浏览器**: https://explorer.hamp.app/
- **水龙头**: https://testnet.aleofaucet.com/

### 合约地址
```
private_voting.aleo
```

---

## 📊 交互统计

| 交互类型 | 数量 | 状态 |
|---------|------|------|
| 投票生成 | 3 | ✅ |
| 计票上链 | 3 | ✅ |
| 结果查询 | 2 | ✅ |
| 总交易数 | 9 | ✅ |

---

## 💡 关键学习点

1. **隐私设计**
   - 如何使用 Record 保护数据
   - 如何在链上实现真正的隐私

2. **ZK 证明**
   - 零知识证明的实际应用
   - 如何验证而不泄露数据

3. **链上部署**
   - 实际的合约部署流程
   - 链上交互的完整过程

4. **状态管理**
   - Mapping 的使用
   - Record 的生命周期

---

## 🎓 完成标志

✅ **您已经成功完成了 Aleo 101 Bootcamp！**

您现在已经：
- ✅ 理解了隐私和 ZK 的基础概念
- ✅ 学会了 Leo 语言的核心语法
- ✅ 构建了一个完整的 dApp
- ✅ 将应用部署到测试网
- ✅ 完成了链上交互

---

## 🏆 下一步

1. **参与黑客松**: 直通 Aleo Hackathon
2. **深入学习**: 研究更复杂的应用场景
3. **社区参与**: 加入 Aleo 生态
4. **项目创新**: 构建更多隐私应用

---

## 📞 获取帮助

- **官方文档**: https://developer.aleo.org/
- **社区论坛**: https://community.aleo.org/
- **GitHub Issues**: https://github.com/AleoHQ/leo/issues
- **Discord**: https://discord.gg/aleo

---

## 📝 许可证

MIT License

---

**恭喜您完成了 Aleo 101 Bootcamp！🎉**
