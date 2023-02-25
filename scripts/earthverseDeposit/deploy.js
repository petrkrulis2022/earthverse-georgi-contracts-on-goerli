const { ethers } = require("hardhat");

const main = async () => {
  const EarthverseDeposit = await ethers.getContractFactory(
    "EarthverseDeposit"
  );

  // Deploy the contract
  const earthverseDeposit = await EarthverseDeposit.deploy(
    "0x750dF7BE1082AC535B317f6C4DfcA74756D8ab6d",
    "0x7e2386E09580d85F7f4Ceb2387a4d5A1764B2257"
  );
  await earthverseDeposit.deployed();

  // Print the address of the deployed contract
  console.log(
    `Contract EarthverseDeposit deployed to:`,
    earthverseDeposit.address
  );

  // Wait for etherscan to notice that the contract has been deployed
  await earthverseDeposit.deployTransaction.wait(10);

  // Verify the contract after deploying
  await hre.run("verify:verify", {
    address: earthverseDeposit.address,
    constructorArguments: [],
  });
};

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
