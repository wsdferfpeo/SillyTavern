#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const packageJsonPath = path.join(__dirname, 'package.json');
const nodeModulesPath = path.join(__dirname, 'node_modules');

console.log('\n[*] Verifying dependencies...\n');

let hasErrors = false;

// Check if package.json exists
if (!fs.existsSync(packageJsonPath)) {
  console.log('[!] package.json not found');
  hasErrors = true;
}

// Check if node_modules exists
if (!fs.existsSync(nodeModulesPath)) {
  console.log('[!] node_modules directory not found');
  console.log('    Run: npm install');
  hasErrors = true;
} else {
  // Check key dependencies
  const requiredModules = ['express', 'body-parser'];
  let missingModules = [];
  
  requiredModules.forEach(module => {
    const modulePath = path.join(nodeModulesPath, module);
    if (!fs.existsSync(modulePath)) {
      missingModules.push(module);
      console.log(`[!] Missing module: ${module}`);
    }
  });
  
  if (missingModules.length > 0) {
    hasErrors = true;
  }
}

// Read and validate package.json
if (fs.existsSync(packageJsonPath)) {
  try {
    const packageJson = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));
    if (packageJson.name) {
      console.log(`[+] Project: ${packageJson.name}`);
    }
    if (packageJson.version) {
      console.log(`[+] Version: ${packageJson.version}`);
    }
  } catch (e) {
    console.log('[!] Invalid package.json format');
    hasErrors = true;
  }
}

if (!hasErrors) {
  console.log('\n[+] All dependencies verified successfully!');
  console.log('[+] You can now run: npm run start\n');
  process.exit(0);
} else {
  console.log('\n[!] Some dependencies are missing or invalid');
  console.log('[*] Run setup.bat to install dependencies\n');
  process.exit(1);
}
