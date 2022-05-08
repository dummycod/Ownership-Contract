// SPDX-License-Identifier: MIT
pragma solidity "0.8.12";

contract OwnershipContract{
    
    struct FileDetails{
        string owner;
        uint timestamp;
    }

    mapping (string=>FileDetails) files;

    event logFileAddedStatus(bool status,uint timestamp,string owner,string fileHash);

    function set(string memory owner, string memory fileHash) public {
        
        if(files[fileHash].timestamp==0){
        
            files[fileHash] = FileDetails(owner,block.timestamp);
            emit logFileAddedStatus(true,block.timestamp,owner,fileHash);
        
        }else{
            emit logFileAddedStatus(false,block.timestamp,owner,fileHash);
        }
    }

    function get(string memory fileHash) public view returns (string memory owner, uint timestamp){
        return (files[fileHash].owner,files[fileHash].timestamp);
    }
}