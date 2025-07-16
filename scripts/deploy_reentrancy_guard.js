const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const Guarded = await ethers.getContractFactory("Guarded");
  const guarded = await Guarded.deploy();

  await guarded.waitForDeployment();

  console.log("Guarded deployed to:", await guarded.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
