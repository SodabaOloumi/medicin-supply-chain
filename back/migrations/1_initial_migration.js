const Migrations = artifacts.require("supplyChain");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
