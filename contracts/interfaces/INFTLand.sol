//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface INFTLand {
  /// @notice Allows the seller to mint a NFT Land.
  /// @param ipfsURI: IPFS's link  of metadata for the NFT Land
  function safeMintNFT(string calldata ipfsURI) external returns (uint256);
}
