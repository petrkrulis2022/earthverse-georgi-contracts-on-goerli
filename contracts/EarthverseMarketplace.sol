// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IEarthverseMarketplace} from "./interfaces/IEarthverseMarketplace.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {AccessContract} from "./AccessContract.sol";

// Custom errors
error EarthverseMarketplace_NotOwner();
error EarthverseMarketplace_PriceMustBeAboveZero();
error EarthverseMarketplace_AlreadyListed(uint256 tokenId);
error EarthverseMarketplace_PriceDoNotMet(uint256 itemId, uint256 price);
error EarthverseMarketplace_ItemDoesntExit(uint256 itemId);
error EarthverseMarketplace_SellerCannotBeBuyer();

/// @author Georgi Karagyozov
/// @notice EarthverseMarketplace contract which is used to store NFT Land and allow the buyer to purchase them.
contract EarthverseMarketplace is IEarthverseMarketplace, AccessContract {
  uint256 public itemCount;

  mapping(uint256 => ListingNFTLand) public listing;

  modifier isOwner(
    IERC721 nftLand,
    uint256 tokenId,
    address spender
  ) {
    if (spender != nftLand.ownerOf(tokenId))
      revert EarthverseMarketplace_NotOwner();
    _;
  }

  modifier notListed(uint256 tokenId) {
    ListingNFTLand memory _listing = listing[tokenId];
    if (_listing.price > 0) revert EarthverseMarketplace_AlreadyListed(tokenId);
    _;
  }

  /// @notice Allows the user/seller to add new NFT Land.
  /// @param nftLand: The address of NFT Land contract
  /// @param tokenId: The unique token mid of the NFT Land itself.
  /// @param price: The sale price of NFT Land.
  function listNFTLand(
    IERC721 nftLand,
    uint256 tokenId,
    uint256 price
  ) external notListed(tokenId) isOwner(nftLand, tokenId, msg.sender) {
    if (price <= 0) revert EarthverseMarketplace_PriceMustBeAboveZero();

    ++itemCount;
    listing[itemCount] = ListingNFTLand(
      itemCount,
      nftLand,
      tokenId,
      price,
      msg.sender
    );

    emit NFTLandListed(itemCount, tokenId, price, msg.sender);

    nftLand.transferFrom(msg.sender, address(this), tokenId);
  }

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
  ) external zeroAddress(buyer) onlyAvailableContract returns (address) {
    if (itemId <= 0 || itemId > itemCount)
      revert EarthverseMarketplace_ItemDoesntExit(itemId);

    ListingNFTLand storage nftLandItem = listing[itemId];

    if (price < (nftLandItem.price * 10 ** decimalsOfInput))
      revert EarthverseMarketplace_PriceDoNotMet(itemId, nftLandItem.price);
    if (buyer == nftLandItem.seller)
      revert EarthverseMarketplace_SellerCannotBeBuyer();

    address oldSeller = nftLandItem.seller;
    nftLandItem.seller = buyer;

    emit NFTLandBought(
      itemId,
      nftLandItem.price,
      nftLandItem.tokenId,
      oldSeller,
      buyer
    );

    return oldSeller;
  }
}
