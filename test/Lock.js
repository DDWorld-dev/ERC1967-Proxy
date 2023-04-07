const { expect } = require("chai");
const { ethers, upgrades } = require("hardhat")

describe("V", function() {
  let v1
  let v2
  let proxyContract
  let owner
  let sender
  beforeEach(async function() {
    [owner, sender] = await ethers.getSigners()

    const V1 = await ethers.getContractFactory("V1")
    v1 = await V1.deploy()
    await v1.deployed()
    
    console.log("address V1", v1.address);
    const Proxy = await ethers.getContractFactory("ERC1967Proxy")
    proxyContract = await Proxy.deploy(v1.address, "0xfe4b84df0000000000000000000000000000000000000000000000000000000000000006")
    await proxyContract.deployed()
    console.log("Address proxy", proxyContract.address)
  })

  it('works', async function(){
    
    const txData = {
      to: proxyContract.address,
      data: "0x371303c0",
  }
    const tx = await sender.sendTransaction(txData)
    await tx.wait()
    let x = await proxyContract.x()
    console.log("x:", x.toString())
    const V2 = await ethers.getContractFactory("V2")
    v2 = await V2.deploy()
    await v2.deployed()
    proxyContract.newImplementation(v2.address, "0x043df9260000000000000000000000000000000000000000000000000000000000000006")
    const txData1 = {
      to: proxyContract.address,
      data: "0xb3bcfa82",
  }
    const tx1 = await sender.sendTransaction(txData)
    await tx1.wait()
    console.log("x:", x.toString())
  });
});