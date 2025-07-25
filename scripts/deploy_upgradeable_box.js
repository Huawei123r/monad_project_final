const { ethers, upgrades } = require("hardhat");

async function main() {
  const Box = await ethers.getContractFactory("Box");
  const box = await upgrades.deployProxy(Box, [42], { initializer: 'initialize' });
  await box.waitForDeployment();
  console.log("Box deployed to:", await box.getAddress());
}

main();
