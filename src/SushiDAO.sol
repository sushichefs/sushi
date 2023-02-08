// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.17;

import {ERC20} from "solmate/tokens/ERC20.sol"; 

contract SushiDAO is ERC20("Sushi DAO", unicode"🍣", 18) {
    constructor() payable {}
}