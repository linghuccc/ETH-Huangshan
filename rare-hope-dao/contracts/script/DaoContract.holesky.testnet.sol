// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import { Script, console } from 'forge-std/Script.sol';
import { ShowBalanceScript } from './riclic/ShowBalanceScript.sol';
import { DaoContract } from '../src/DaoContract.sol';

contract DeployScript is Script {
  function run() external {
    // =========                    从 .env 得到 Private Key                    ========= //
    uint256 deployerPrivateKey = vm.envUint('TEST_PRIVATE_KEY');
    address deployer = vm.addr(deployerPrivateKey);
    console.log('The Deployer address is        : ', deployer);

    // =========   调用 ShowBalanceScript 合约并显示 Deployer account balance   ========= //
    ShowBalanceScript showBalanceScript = new ShowBalanceScript();
    showBalanceScript.showBalance(deployer);

    // =========                       部署 DaoContract 合约                        ========= //
    vm.startBroadcast(deployerPrivateKey);
    DaoContract myContract = new DaoContract();
    vm.stopBroadcast();

    address addrContract = address(myContract);
    console.log('Main contract deployed at      : ', addrContract);
  }
}
