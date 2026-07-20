# SillyTavern 部署指南

## 部署位置

**本部署配置用于**: `F:\SillyTavern`

## 快速部署步骤

### 1. 克隆仓库

```bash
git clone https://github.com/WSDFERFPEO/SillyTavern.git F:\SillyTavern
cd F:\SillyTavern
```

### 2. 运行自动化部署脚本

```bash
.\setup.bat
```

脚本会自动：
- ✅ 检查 Node.js 是否安装（如果没有，提示下载）
- ✅ 验证 npm 版本
- ✅ 下载并安装所有依赖包
- ✅ 运行依赖检查工具

### 3. 启动服务

```bash
.\start.bat
```

或者直接运行：
```bash
npm run start
```

### 4. 访问应用

打开浏览器访问: http://localhost:8000

## 文件结构

```
F:\SillyTavern
├── setup.bat              # 部署脚本（检查依赖、安装包）
├── start.bat              # 启动脚本
├── stop.bat               # 停止脚本
├── check-deps.js          # 依赖验证工具
├── package.json           # npm 依赖配置
├── README.md              # 项目说明
├── DEPLOYMENT.md          # 本文件
└── node_modules/          # 依赖包（运行 setup.bat 后生成）
```

## 依赖检查详情

### setup.bat 检查项

1. **Node.js**
   - 验证 Node.js 是否安装
   - 检查版本是否 >= 18.0.0
   - 如果未安装，提示从 https://nodejs.org/ 下载

2. **npm**
   - 验证 npm 是否安装
   - 检查版本是否 >= 9.0.0

3. **package.json**
   - 验证 package.json 文件存在
   - 检查文件格式有效性

4. **依赖包**
   - 运行 `npm install` 安装所有依赖
   - 验证核心模块（express, body-parser 等）
   - 输出验证结果

### check-deps.js 检查项

- ✅ node_modules 目录存在
- ✅ 核心模块已安装（express, body-parser）
- ✅ package.json 格式有效
- ✅ 项目名称和版本信息

## 常见问题

### Q: Node.js 未找到
**A**: 
1. 从 https://nodejs.org/ 下载 Node.js 18 LTS
2. 运行安装程序
3. 重启命令行窗口
4. 重新运行 `setup.bat`

### Q: 权限被拒绝
**A**: 
- 右键命令行 → "以管理员身份运行"
- 然后再次运行脚本

### Q: 端口 8000 已被占用
**A**:
- 编辑 `start.bat`，将 8000 改为其他端口
- 或运行 `stop.bat` 停止占用该端口的进程

### Q: npm install 下载缓慢
**A**:
- 使用国内镜像加速:
  ```bash
  npm config set registry https://registry.npmmirror.com
  ```
- 然后重新运行 `setup.bat`

### Q: 如何卸载
**A**:
```bash
# 删除所有依赖
rmdir /s /q node_modules

# 删除整个文件夹
cd ..
rmdir /s /q F:\SillyTavern
```

## 系统要求

| 项目 | 要求 | 状态 |
|------|------|------|
| 操作系统 | Windows 7+ | ✅ |
| Node.js | >= 18.0.0 | ✅ |
| npm | >= 9.0.0 | ✅ |
| 硬盘空间 | >= 2GB | ✅ |
| RAM | >= 2GB | 推荐 |

## 脚本说明

### setup.bat
```batch
执行流程：
1. 检查 Node.js 版本
2. 检查 npm 版本
3. 验证 package.json 存在
4. 运行 npm install
5. 执行 check-deps.js 验证
```

### start.bat
```batch
执行流程：
1. 验证 node_modules 存在
2. 启动服务 (npm run start)
3. 输出访问地址: http://localhost:8000
```

### stop.bat
```batch
执行流程：
1. 查找占用端口 8000 的进程
2. 终止这些进程
3. 确认停止成功
```

## 更新依赖

要更新所有依赖到最新版本：

```bash
npm update
```

## 获取官方代码

如需同步官方 SillyTavern 最新代码：

```bash
git remote add upstream https://github.com/SillyTavern/SillyTavern.git
git fetch upstream
git merge upstream/release
```

## 技术支持

- 官方 GitHub: https://github.com/SillyTavern/SillyTavern
- 官方网站: https://sillytavern.app
- 官方 Wiki: https://github.com/SillyTavern/SillyTavern/wiki

## 许可证

AGPL-3.0 - 详见 LICENSE 文件
