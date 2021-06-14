var TodoList = artifacts.require("./build/contracts/TodoList.sol");

module.exports = function(deployer) {
  deployer.deploy(TodoList);
};