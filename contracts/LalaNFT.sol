// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract LalaNFT is Ownable, ERC721("LalaNft", "LNFT") {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    function totalSupply() public view returns(uint256) {
        return _tokenIds.current();
    }
    uint256 tokenId;
    mapping(address => tokenMetaData[]) public ownershipRecord;
    struct tokenMetaData {
        uint256 tokenId;
        uint256 timeStamp;
        string tokenURI;
    }

    //onlyOwner modifier is from Ownable
    //function mintToken(address recipient) onlyOwner public {
      //  require(owner()!=recipient, "Recipient cannot be the owner of the cont");
        //_safeMint(msg.sender, tokenId);
        //ownershipRecord[recipient].push(tokenMetaData(
          //  tokenId,
            //block.timestamp,
            //"http://img/name.png"
        //));
        //tokenId = tokenId + 1;
    //}
    //kinda another contract
    string[] public colors;
    mapping(string => bool) colorExists;
    function mint(string memory _color) public {
        require(!colorExists[_color], "the color already exist");
        colors.push(_color);
        uint256 _id = colors.length - 1 ;
        _mint(msg.sender, _id); //this openzeppeline function will trigger transfer event
        colorExists[_color] = true;
        _tokenIds.increment();
    }
}
