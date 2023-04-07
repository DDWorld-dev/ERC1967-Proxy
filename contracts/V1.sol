// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./utils/Initializable.sol";
import "./UUPSUpgradeable.sol";

contract V1 is Initializable, UUPSUpgradeable{
    uint256 public number;
    address owner;
    modifier onlyOwner(){
        require(owner == msg.sender, "error");
        _;
    }
    function initialize(uint _number) public payable initializer {
        __UUPSUpgradeable_init();
        number = _number;
        owner = msg.sender;
    }
    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}