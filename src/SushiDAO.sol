// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.19;

import {SafeTransferLib} from "solady/utils/SafeTransferLib.sol";
import {ERC20Votes} from "solbase/tokens/ERC20/extensions/ERC20Votes.sol";

contract SushiDAO is ERC20Votes("Sushi DAO", unicode"🍣", 18) {
    using SafeTransferLib for address;

    address internal immutable sushi = 0x6B3595068778DD592e39A122f4f5a5cF09C90fE2;

    constructor() payable {}

    // Enter the DAO. Pay some SUSHIs. Earn some shares.
    function enter(uint256 amount) public payable virtual {
        sushi.safeTransferFrom(msg.sender, address(this), amount);

        _mint(msg.sender, amount);
    }

    // Leave the DAO. Claim back your SUSHIs.
    function leave(uint256 amount) public payable virtual {
        sushi.safeTransfer(msg.sender, amount);

        _burn(msg.sender, amount);
    }
}
