const { ethers } = require("hardhat");

async function main() {
  const [owner1] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", owner1.address);

  const owners = [owner1.address];
  const required = 1;

  const MultiSigWallet = await ethers.getContractFactory("MultiSigWallet");
  const multiSigWallet = await MultiSigWallet.deploy(owners, required);

  await multiSigWallet.waitForDeployment();

  console.log("MultiSigWallet deployed to:", await multiSigWallet.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
