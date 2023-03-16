//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IAccessContract {
  // Event
  event EarthverseDepositAddressChanged(address oldAddress, address newAddress);

  /// @notice Аllows the contract owner to give a new address for earthverseDeposit.
  /// @param _earthverseDepositAddress: The address of earthverseDeposit contract.
  function setNewEarthverseDepositAddress(
    address _earthverseDepositAddress
  ) external;
}
