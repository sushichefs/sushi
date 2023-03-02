// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.19;

import "forge-std/Test.sol";

import {SushiDAO} from "src/SushiDAO.sol";

contract SushiDAOTest is Test {
    using stdStorage for StdStorage;

    SushiDAO dao;

    function setUp() public payable {
        dao = new SushiDAO();
    }

    function testProposal() public payable {}
}
