// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IRocketpool {
  function deposit() external payable;
}

interface IWETH {
  function withdraw(uint256 amount) external;
}

interface IEarthverseDeposit {
  // Events
  event NewStablecoinAddressAdded(address stablecoinAddress);
  event StablecoinAddressRemoved(address stablecoinAddress);
  event StakedAndReceivedNFTLand(
    address indexed sender,
    uint256 indexed amountOut
  );

  /// @notice Sends the requested NFT Land to the buyer, sends stablecoin NFTD to the seller,
  /// swaping stablecoin(USDC, DAI, USDT etc.) to WETH and then staking it in Rocket Pool.
  /// @dev First manually call Stablecoin contract "Approve" function.
  /// @param tokenIn: The address of the stablecoin contract like USDC, DAI, USDT etc.
  /// @param amountIn: The amount in the stablecoin(USDC, DAI, USDT etc.) that is offered to buy this NFT Land.
  /// @param nftLandId: Item id of listing mapping where this NFT Land is stored.
  /// @param decimalsOfInput: Decimal of the stablecoin(USDC, DAI, USDT etc.), through which NFT Land will be purchased by the buyer.
  function depositRPAndSendNFTLand(
    address tokenIn,
    uint256 amountIn,
    uint256 nftLandId,
    uint256 decimalsOfInput
  ) external returns (uint256 amountOut);

  /// @notice Allows the admin to add a new address for the stablecoin.
  /// @param stablecoinAddress: The stablecoin address.
  function addNewStablecoinAddress(address stablecoinAddress) external;

  /// @notice Allows the admin to remove a address for the stablecoin.
  /// @param stablecoinAddress: The stablecoin address.
  function removeStablecoinAddress(address stablecoinAddress) external;
}
