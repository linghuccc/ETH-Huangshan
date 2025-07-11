## ✨ 项目名称：希罕DAO（Rare Hope DAO）

### 项目描述：

一个慈善性质的智能合约平台，帮助罕见病患者及其家庭，募集平日所需的医药费以及生活费。

### 技术栈：

前端：React, Vite，Typescript, Rainbowkit

后端：Foundry, Solidity, 部署在 Holesky testnet

| 合约     | 地址                                                                                                                               |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| DAO 合约 | [0x734CEb19cDDAbf7B2e28eb0105bd94c34BE7022b](https://holesky.etherscan.io/address/0x734CEb19cDDAbf7B2e28eb0105bd94c34BE7022b#code) |

### 安装与运行指南：

1. 环境准备：

   确保已安装如下工具：

   - Node.js v23.9.0

   - npm v10.9.2

2. 克隆项目：

```bash
git clone <repository-url>
```

3. 安装依赖

```bash
cd rare-hope-dao
yarn install
```

4. 配置参数

```bash
cp .env.example .env.local
```

然后配置 .env.local 文件中 VITE_PROJECT_ID 参数的值

5. 启动前端

```bash
yarn run dev
```

### 项目亮点/创新点：

整个 DAO 的运行，只需要一个智能合约，无需任何其他工具，如 snapshot 等。

### 团队成员：

[Ric Li C](https://x.com/RicBuidler)

### 演示 PPT：

[demo](public/demo.pptx)
