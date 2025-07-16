const hre = require("hardhat");

async function main() {
  const initialSupply = hre.ethers.parseEther("1000000"); // 1,000,000 tokens
  const MyFirstToken = await hre.ethers.getContractFactory("MyFirstToken");
  const myFirstToken = await MyFirstToken.deploy(initialSupply);

  await myFirstToken.waitForDeployment();

  console.log("MyFirstToken deployed to:", myFirstToken.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});