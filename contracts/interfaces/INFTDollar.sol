//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface INFTDollar {
  /// @notice Mint new NFTD tokens.
  /// @param to: The address to which they will be sent.
  /// @param amount: The amount to be minted.
  /// @param decimalsOfInput: Decimal of the stablecoin(USDC, DAI, USDT etc.), through which NFT Land will be purchased by the buyer.
  function mint(address to, uint256 amount, uint256 decimalsOfInput) external;
}
