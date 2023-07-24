//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

contract Whitelist{
    //Max number of whitelsited addresses allowed
    uint8 public maxWhitelistedAddresses;
    //creata a mapping of whitelisted addresses
    //if an address is whitelisted,we would set it to true,if it is false bt default for all other addresses
    mapping(address => bool)public whitelistedAddresses;
    //numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //Setting the Max number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8  _maxWhitelistedAddresses){
        maxWhitelistedAddresses =_maxWhitelistedAddresses;
    }
    /**addressToWhitelist - This function adds the address of the sender to the whitelist */
    function addAddressToWhitelist() public{
        //check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender],"Sender has already been whitelisted");
        //check if the numAddressesWhitelisted < maxWhitelistedAddresses.if not then throw an error.
        require(numAddressesWhitelisted< maxWhitelistedAddresses,"More addresses cant be added, limit reached");
        //Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender]= true;
        //Increa the number of whitelusted addresses
        numAddressesWhitelisted +=1;
    }
}