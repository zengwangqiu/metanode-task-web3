// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC721 is ERC721Enumerable, Ownable {
    mapping(uint256 => string) internal _tokenURIs;

    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721(name_, symbol_) Ownable(msg.sender) {}

    function mintNFT(string memory tokenURI_) public {
        uint256 tokenId = totalSupply() + 1;
        _tokenURIs[tokenId] = tokenURI_;
        _mint(msg.sender, tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        _requireOwned(tokenId);
        return _tokenURIs[tokenId];
    }
}
