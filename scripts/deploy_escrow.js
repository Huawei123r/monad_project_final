const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();
  const beneficiaryAddress = deployer.address; // Using deployer as beneficiary for simplicity
  const deadline = 600; // 10 minutes

  console.log("Deploying contracts with the account:", deployer.address);

  const Escrow = await ethers.getContractFactory("Escrow");
  const escrow = await Escrow.deploy(beneficiaryAddress, deadline, {
    value: ethers.parseEther("0.1")
  });

  await escrow.waitForDeployment();

  console.log("Escrow deployed to:", await escrow.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
