// SPDX-License-Identifier: GPL-3.0
pragma solidity > 0.8.0;
contract HouseManager{
    struct House{
        uint id;
        string house_address;
        address owner;

        

    }

    mapping (uint => address)  public owners;
    House[] public  house; 
    

    function addHouse(string memory _address) public{
        uint id = house.length;
        house.push(House(id,_address,msg.sender));
        owners[id] = msg.sender;
    }

    function deleteHouse(uint _id)public{
        require(owners[_id]==msg.sender,"You are not owner");
        delete house[_id];
    }

    function updateHouse(uint _id, string memory _address) public{
         require(owners[_id]==msg.sender,"You are not owner");
        house[_id].house_address = _address;
    }
}