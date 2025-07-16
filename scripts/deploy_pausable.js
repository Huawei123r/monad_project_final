const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const PausableContract = await ethers.getContractFactory("PausableContract");
  const pausableContract = await PausableContract.deploy();

  await pausableContract.waitForDeployment();

  console.log("PausableContract deployed to:", await pausableContract.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
