# SillyTavern 部署

本仓库包含 SillyTavern 的完整部署配置和自动化脚本。

## 快速开始

### Windows 用户

1. **克隆仓库到 F:\\SillyTavern**
   ```bash
   git clone https://github.com/WSDFERFPEO/SillyTavern.git F:\\SillyTavern
   cd F:\\SillyTavern
   ```

2. **运行部署脚本**
   ```bash
   .\\setup.bat
   ```
   脚本会自动：
   - 检查 Node.js 安装
   - 安装所有依赖
   - 配置环境变量

3. **启动 SillyTavern**
   ```bash
   .\\start.bat
   ```
   或运行：
   ```bash
   npm run start
   ```

访问 http://localhost:8000

## 文件说明

- `setup.bat` - Windows 部署脚本（自动检查依赖和安装）
- `start.bat` - 启动脚本
- `stop.bat` - 停止脚本
- `check-deps.js` - Node.js 依赖检查工具
- `package.json` - npm 依赖配置

## 需求

- Windows 7 及以上
- Node.js 18+ （脚本会提示安装）
- npm 9+
- 至少 2GB 空闲硬盘空间

## 故障排除

### Node.js 未找到
如果脚本提示找不到 Node.js，请：
1. 从 https://nodejs.org/ 下载 Node.js 18+ LTS
2. 安装完成后重启命令行
3. 重新运行 `setup.bat`

### 权限错误
如果出现权限错误，请以管理员身份运行命令行。

### 端口 8000 被占用
修改启动脚本中的端口号，在 `start.bat` 中更改为其他端口。

## 官方资源

- GitHub: https://github.com/SillyTavern/SillyTavern
- 官网: https://sillytavern.app
- Wiki: https://github.com/SillyTavern/SillyTavern/wiki

## 许可证

AGPL-3.0
