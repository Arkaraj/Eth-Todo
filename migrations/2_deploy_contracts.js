const Todo = artifacts.require("./TodoList.sol");

module.exports = function (deployer) {
    deployer.deploy(Todo);
};
