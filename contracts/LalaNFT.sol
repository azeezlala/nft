// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LalaNFT is Ownable, ERC721("LalaNft", "LNFT") {
    uint256 tokenId;
    mapping(address => tokenMetaData[]) public ownershipRecord;
    struct tokenMetaData {
        uint256 tokenId;
        uint256 timeStamp;
        string tokenURI;
    }
    //onlyOwner modifier is from Ownable
    function mintToken(address recipient) onlyOwner public {
        require(owner()!=recipient, "Recipient cannot be the owner of the cont");
        _safeMint(msg.sender, tokenId);
        ownershipRecord[recipient].push(tokenMetaData(
            tokenId,
            block.timestamp,
            "http://img/name.png"
        ));
        tokenId = tokenId + 1;
    }
}
