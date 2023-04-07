const { ethers, upgrades } = require("hardhat");

async function main() {
  if (network.name === "hardhat") {
    console.warn(
      "You are trying to deploy a contract to the Hardhat Network, which" +
        "gets automatically created and destroyed every time. Use the Hardhat" +
        " option '--network localhost'"
    );
  }

  const [deployer] = await ethers.getSigners()

  console.log("Deploying with", await deployer.getAddress())

  const V1 = await ethers.getContractFactory("Contract");
  const v1 = await upgrades.deployProxy(V1.address, [0]);
  await v1.deployed();
  console.log("deployed to:", v1.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
