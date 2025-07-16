const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // Deploy a new SimpleToken for the Faucet
  const SimpleToken = await ethers.getContractFactory("SimpleToken");
  const simpleToken = await SimpleToken.deploy(ethers.parseEther("1000000"));
  await simpleToken.waitForDeployment();
  const simpleTokenAddress = await simpleToken.getAddress();
  console.log("SimpleToken deployed to:", simpleTokenAddress);

  // Deploy the Faucet
  const Faucet = await ethers.getContractFactory("Faucet");
  const faucet = await Faucet.deploy(simpleTokenAddress, ethers.parseEther("100"));
  await faucet.waitForDeployment();
  const faucetAddress = await faucet.getAddress();
  console.log("Faucet deployed to:", faucetAddress);

  // Transfer some tokens to the Faucet
  await simpleToken.transfer(faucetAddress, ethers.parseEther("100000"));
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
