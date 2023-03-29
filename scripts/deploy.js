// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
const hre = require("hardhat");

async function main() {
  console.log(process.argv)

  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);
  console.log("Account balance:", (await deployer.getBalance()).toString());

  const Class = await hre.ethers.getContractFactory('Logic');
  console.log('deploying Logic ...');
  const object = await Class.deploy();
  console.log('Logic deployed to: ', object.address);
  console.log('remember to copy the deployed contract address.');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
