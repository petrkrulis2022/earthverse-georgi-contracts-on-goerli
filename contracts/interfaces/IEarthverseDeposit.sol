// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IRocketpool {
  function deposit() external payable;
}

interface IWETH {
  function withdraw(uint256 amount) external;
}
