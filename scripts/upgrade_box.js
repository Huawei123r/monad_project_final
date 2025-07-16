const { ethers, upgrades } = require("hardhat");

async function main() {
  const proxyAddress = "YOUR_PROXY_ADDRESS"; // Replace with your deployed proxy address
  const BoxV2 = await ethers.getContractFactory("BoxV2");
  const upgraded = await upgrades.upgradeProxy(proxyAddress, BoxV2);
  console.log("Box upgraded to BoxV2");
}

main();
