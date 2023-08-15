const { ethers, network } = require("hardhat");
require("dotenv").config();

const main = async () => {
  try {
    const ToDo = await ethers.getContractFactory("ToDoList");
    console.log("Contract is being deployed...");
    const toDo = await ToDo.deploy();
    if (network.config.chainId === 5 && process.env.ETHERSCAN_API_KEY) {
      await toDo.waitForDeployment(2);
      console.log(`Contract Address: ${toDo.target}`);
    }
    console.log(`Contract Address: ${toDo.target}`);
  } catch (error) {
    console.error(error.message);
  }
};

main();

module.exports = main;
