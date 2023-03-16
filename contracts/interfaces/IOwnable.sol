//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IOwnable {
  // Event
  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /// @notice Leaves the contract without owner. It will not be possible to call `onlyOwner` modifier anymore.
  /// @param isRenounce: Boolean parameter with which you confirm renunciation of ownership
  function renounceOwnership(bool isRenounce) external;

  /// @notice Transfers ownership of the contract to a new account.
  /// @param newOwner: The address of the new owner of the contract
  /// @param direct: Boolean parameter that will be used to change the owner of the contract directly
  function transferOwnership(address newOwner, bool direct) external;

  /// @notice The `pendingOwner` have to confirm, if he wants to be the new owner of the contract.
  function claimOwnership() external;
}
