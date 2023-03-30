var private = require('./private.json'); // a dictionary.
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${private.alchemy_api_key}`,
      accounts: private.accounts
    },
    localhost: {
      url: "http://127.0.0.1:8545"
    },
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${private.alchemy_api_key}`,
      accounts: private.accounts
    },
    mumbai: {
      url: `https://polygon-mumbai.g.alchemy.com/v2/${private.alchemy_api_key}`,
      accounts: private.accounts
    },
  },
};
