const hre = require("hardhat");

async function main() {
  const MyFirstNFT = await hre.ethers.getContractFactory("MyFirstNFT");
  const myFirstNFT = await MyFirstNFT.deploy();

  

  await myFirstNFT.waitForDeployment();
  console.log("MyFirstNFT deployed to:", myFirstNFT.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
