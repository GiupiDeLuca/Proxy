const Age = artifacts.require("Age");
const Proxy = artifacts.require("Proxy");

module.exports = async function(deployer, network, accounts) {
    const age = await Age.deployed();
    const proxy = await Proxy.deployed(age.address);
}