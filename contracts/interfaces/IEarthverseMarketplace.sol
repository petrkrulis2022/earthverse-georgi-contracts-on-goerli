// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

interface IEarthverseMarketplace {
  struct ListingNFTLand {
    uint256 id;
    IERC721 nftLand;
    uint256 tokenId;
    uint256 price;
    address seller;
  }

  // Events
  event NFTLandListed(
    uint256 itemId,
    uint256 indexed tokenId,
    uint256 indexed price,
    address indexed seller
  );

  event NFTLandBought(
    uint256 itemId,
    uint256 price,
    uint256 indexed tokenId,
    address indexed seller,
    address indexed buyer
  );

  /// @notice Allows the user/seller to add new NFT Land.
  /// @param nftLand: The address of NFT Land contract
  /// @param tokenId: The unique token mid of the NFT Land itself.
  /// @param price: The sale price of NFT Land.
  function listNFTLand(
    IERC721 nftLand,
    uint256 tokenId,
    uint256 price
  ) external;

  /// @notice Allows the buyer to buy a given NFT Land.
  /// @param buyer: Тhe address that will receive the NFT Land.
  /// @param itemId: Item id of listing mapping where this NFT Land is stored.
  /// @param price: The price offered by the buyer.
  /// @param decimalsOfInput: Decimal of the stablecoin(USDC, DAI, USDT etc.), through which NFT Land will be purchased by the buyer.
  /// @return The address of the old seller of this NFT Land.
  function buyNFTLand(
    address buyer,
    uint256 itemId,
    uint256 price,
    uint256 decimalsOfInput
  ) external returns (address);
}
