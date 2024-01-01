// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

/**
 * @title IMeatPuppetSystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IMeatPuppetSystem {
  function initGES(address tokeniser, address directionFinder) external returns (address);

  function spawn(uint32 startId) external;

  function processCommandTokens(string[] calldata tokens) external returns (uint8 err);
}
