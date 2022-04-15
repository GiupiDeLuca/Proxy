const Age = artifacts.require("Age");
const Proxy = artifacts.require("Proxy");
const AgeUpdate = artifacts.require("AgeUpdate");

module.exports = async function (deployer, network, accounts) {
  // deploy new instance of both contracts
  const age = await Age.new();
  const proxy = await Proxy.new(age.address);

  // Age is now deployed at the existing proxy address and the result points to a new variable 
  // this allows us to interact with proxy through the functional contract Age
  const proxyToAge = await Age.at(proxy.address);

  // set age
  await proxyToAge.setAge(33);
  // get age
  let ageGet = await proxyToAge.getAge();
  console.log("Age before update: " + ageGet.toNumber());

  // deploy new version of Age contract with some updates
  const ageUpdate = await AgeUpdate.new();

  // change the _cuurentAddress in Proxy
  await proxy.upgrade(ageUpdate.address);
  
  // both values for age shoould match
  ageGet = await proxyToAge.getAge();
  console.log("Age after update: " + ageGet.toNumber());
};
