pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
contract AzNFT is ERC721URIStorage {
    uint public tokenCount;
    constructor() ERC721("AzNFT", "AZNFT"){}
    function mint(string memory _tokenURI) external returns(uint) {
        tokenCount++;
        _selfMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return tokenCount;
    }
}
