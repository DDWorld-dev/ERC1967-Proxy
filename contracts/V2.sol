// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./utils/Initializable.sol";
import "./UUPSUpgradeable.sol";

contract V2 is Initializable, UUPSUpgradeable{
    uint public x;
    address owner;
    uint public y;
    modifier onlyOwner(){
        require(owner == msg.sender, "error");
        _;
    }
    function initialize(uint _y) public payable reinitializer(2){
        y = _y;
        owner = msg.sender; 
    }
    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}