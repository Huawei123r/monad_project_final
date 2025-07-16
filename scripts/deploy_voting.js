const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const proposalNames = ["Proposal 1", "Proposal 2", "Proposal 3"];
  const Voting = await ethers.getContractFactory("Voting");
  const voting = await Voting.deploy(proposalNames);

  await voting.waitForDeployment();

  console.log("Voting deployed to:", await voting.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
