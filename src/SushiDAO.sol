// SPDX-License-Identifier: WTFPL
pragma solidity ^0.8.19;

import {ERC20Votes} from "solbase/tokens/ERC20/extensions/ERC20Votes.sol";
import {safeTransfer, safeTransferFrom} from "solbase/utils/SafeTransfer.sol";

/// @title Sushi DAO
/// @notice A DAO for SUSHI token holders.
/// @author z0r0z.eth
contract SushiDAO is ERC20Votes("Sushi DAO", unicode"🍣", 18) {
    /// -----------------------------------------------------------------------
    /// DAO Storage
    /// -----------------------------------------------------------------------

    address internal constant SUSHI = 0x6B3595068778DD592e39A122f4f5a5cF09C90fE2;

    bool public paused = true;

    /// -----------------------------------------------------------------------
    /// Custom Errors
    /// -----------------------------------------------------------------------

    error Paused();

    /// -----------------------------------------------------------------------
    /// Constructor
    /// -----------------------------------------------------------------------

    constructor() payable {}

    /// -----------------------------------------------------------------------
    /// DAO Membership Logic
    /// -----------------------------------------------------------------------

    /// @notice Enter the DAO. Pay some SUSHIs. Earn some shares.
    function enter(uint256 amount) public payable virtual {
        safeTransferFrom(SUSHI, msg.sender, address(this), amount);

        _mint(msg.sender, amount);
    }

    /// @notice Leave the DAO. Claim back your SUSHIs.
    function leave(uint256 amount) public payable virtual {
        safeTransfer(SUSHI, msg.sender, amount);

        _burn(msg.sender, amount);
    }

    /// -----------------------------------------------------------------------
    /// Transferability Logic
    /// -----------------------------------------------------------------------

    function transfer(address to, uint256 amount) public override returns (bool) {
        if (paused) {
            revert Paused();
        }

        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        if (paused) {
            revert Paused();
        }

        return super.transferFrom(from, to, amount);
    }
}
