const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const Owner = await ethers.getContractFactory("Owner");
  const owner = await Owner.deploy();

  await owner.waitForDeployment();

  console.log("Owner contract deployed to:", await owner.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
