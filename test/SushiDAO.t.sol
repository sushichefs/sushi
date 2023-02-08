// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import {SushiDAO} from "src/SushiDAO.sol";

contract SushiDAOTest is Test {
    using stdStorage for StdStorage;

    SushiDAO dao;

    function setUp() external {
        dao = new SushiDAO();
    }

    function testProposal() external {}
}
