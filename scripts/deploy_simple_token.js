const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const SimpleToken = await ethers.getContractFactory("SimpleToken");
  const simpleToken = await SimpleToken.deploy(1000000);

  await simpleToken.waitForDeployment();

  console.log("SimpleToken deployed to:", await simpleToken.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
