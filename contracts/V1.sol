// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./utils/Initializable.sol";
import "./UUPSUpgradeable.sol";

contract V1 is Initializable, UUPSUpgradeable{
    uint256 public x;
    address owner;
    modifier onlyOwner(){
        require(owner == msg.sender, "error");
        _;
    }

    function initialize(uint _x) public payable initializer {
        __UUPSUpgradeable_init();
        x = _x;
        owner = msg.sender;
    }
    function inc() public {
        x += 3;
    }
    function getX() public view returns(uint){
        return x;
    }
    
    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}