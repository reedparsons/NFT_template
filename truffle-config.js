module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    }
  },
  solc: {
    version : "^0.8.0",
    optimizer: {
      enabled: false,
     // runs: 200
    },
    evmVersion: "petersburg"
  }
}