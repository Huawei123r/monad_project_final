const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const SimpleNFT = await ethers.getContractFactory("SimpleNFT");
  const simpleNFT = await SimpleNFT.deploy();

  await simpleNFT.waitForDeployment();

  console.log("SimpleNFT deployed to:", await simpleNFT.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
