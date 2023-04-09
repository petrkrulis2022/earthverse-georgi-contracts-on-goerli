//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {INFTDollar} from "./interfaces/INFTDollar.sol";
import {AccessContract} from "./AccessContract.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/// @author Georgi Karagyozov
/// @notice Stablecoin NFTD contract, which NFTD tokens are minted and sent to the NFT Land seller at 1 to 1 ratio when someone buy thir NFT Land.
contract NFTDollar is INFTDollar, ERC20Burnable, AccessContract {
  constructor() ERC20("NFT Dollar", "NFTD") {}

  /// @notice Mint new NFTD tokens.
  /// @param to: The address to which they will be sent.
  /// @param amount: The amount to be minted.
  /// @param decimalsOfInput: Decimal of the stablecoin(USDC, DAI, USDT etc.), through which NFT Land will be purchased by the buyer.
  function mint(
    address to,
    uint256 amount,
    uint256 decimalsOfInput
  ) external onlyAvailableContract {
    _mint(to, amount * 10 ** (18 - decimalsOfInput));
  }
}
