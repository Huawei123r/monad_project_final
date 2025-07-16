const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy two new SimpleTokens for the DEX
  const SimpleToken = await ethers.getContractFactory("SimpleToken");
  const token1 = await SimpleToken.deploy(ethers.parseEther("1000000"));
  await token1.waitForDeployment();
  const token1Address = await token1.getAddress();
  console.log("Token1 deployed to:", token1Address);

  const token2 = await SimpleToken.deploy(ethers.parseEther("1000000"));
  await token2.waitForDeployment();
  const token2Address = await token2.getAddress();
  console.log("Token2 deployed to:", token2Address);

  // Deploy the SimpleDEX
  const SimpleDEX = await ethers.getContractFactory("SimpleDEX");
  const simpleDEX = await SimpleDEX.deploy(token1Address, token2Address);
  await simpleDEX.waitForDeployment();
  const simpleDEXAddress = await simpleDEX.getAddress();
  console.log("SimpleDEX deployed to:", simpleDEXAddress);

  // Add liquidity to the DEX
  await token1.approve(simpleDEXAddress, ethers.parseEther("100000"));
  await token2.approve(simpleDEXAddress, ethers.parseEther("100000"));
  await simpleDEX.addLiquidity(ethers.parseEther("100000"), ethers.parseEther("100000"));
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
