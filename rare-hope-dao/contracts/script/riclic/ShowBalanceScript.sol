// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { Script, console } from 'forge-std/Script.sol';
// import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import { Strings } from './Strings.sol';

contract ShowBalanceScript is Script {
  using Strings for uint256;

  function showBalance(address caller) public view {
    // =========                      Show caller balance                      ========= //
    uint256 balanceInWei = caller.balance;
    uint256 balanceInEther = balanceInWei / 1 ether; // 1 ether = 10 ** 18
    uint256 balanceDecimal = (balanceInWei % 1 ether) / (10 ** 13); // Smallest unit we care about is 10^13, for 5 decimal places

    // Format output
    string memory etherStr = Strings.toString(balanceInEther);

    string memory balanceStr;
    if (balanceDecimal == 0) {
      balanceStr = string.concat(etherStr, ' ETH');
    } else {
      string memory decimalStr = _formatDecimalPart(balanceDecimal);
      balanceStr = string.concat(etherStr, '.', decimalStr, ' ETH');
    }

    console.log('Balance is                     : ', balanceStr);
  }

  function _formatDecimalPart(
    uint256 decimalPart
  ) internal pure returns (string memory) {
    string memory decimalPartStr = Strings.toString(decimalPart);
    uint256 length = bytes(decimalPartStr).length;

    // Add leading zeros if necessary
    if (length < 5) {
      uint256 leadingZeros = 5 - length;
      bytes memory leadingZerosStr = new bytes(leadingZeros);
      for (uint256 i = 0; i < leadingZeros; i++) {
        leadingZerosStr[i] = bytes1('0');
      }
      decimalPartStr = string.concat(string(leadingZerosStr), decimalPartStr);
    }

    // Convert to bytes
    bytes memory decimalBytes = bytes(decimalPartStr);

    // Trim trailing zeros
    uint256 endIndex = decimalBytes.length;
    while (endIndex > 1 && decimalBytes[endIndex - 1] == '0') {
      endIndex--;
    }

    // Create the trimmed string
    bytes memory trimmedBytes = new bytes(endIndex);
    for (uint256 i = 0; i < endIndex; i++) {
      trimmedBytes[i] = decimalBytes[i];
    }

    return string(trimmedBytes);
  }
}
