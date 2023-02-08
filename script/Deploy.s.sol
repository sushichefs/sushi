// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";

import {SushiDAO} from "src/SushiDAO.sol";

/// @notice A very simple deployment script
contract Deploy is Script {

  /// @notice The main script entrypoint
  /// @return dao The deployed contract
  function run() external returns (SushiDAO dao) {
    vm.startBroadcast();
    dao = new SushiDAO();
    vm.stopBroadcast();
  }
}