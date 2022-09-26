const Banco = artifacts.require("Banco");
const Ladrao = artifacts.require("Ladrao")



module.exports = async (deployer, network, accounts) => {

    await deployer.deploy(Banco);

    var ktr = await Banco.deployed();


    await deployer.deploy(Ladrao, ktr.address);


    var thief = await Ladrao.deployed();





}