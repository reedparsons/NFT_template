//Contracts/BridsEye.sol
// SPDX-License-Identifier: MIT
pragma solidity >=0.1.0 <9.0.0;

//import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/access/Ownable.sol";
//import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";



  contract BirdsEyeView_NFT is ERC721, Ownable  {
   using Strings for uint256;
    using SafeMath for uint256;
        // Optional mapping for token URIs
        mapping (uint256 => string) private _tokenURIs;
    // Constant state variables in Solidity are similar to other languages
    // but you must assign from an expression which is constant at compile time.
/*sets the minimum amount oth Eth to recieve in paymet*/ 
    int private constant _ERC721_RESERVE = 0x01;
   
     // Mapping from NFT ID to its owner's address
    mapping(uint256 => address) public NftToOwner;


    // Mapping from owner's address to number of owned token
    mapping(address => uint256) public ownerNftCount;

     struct NFT {
        string name;
        string contentCreator;
        string nftCreator;
        uint8 amountMinted;
        string imprint; 
        string schemaID;
        uint256 tokenID;
    }

    NFT public birdsEyeNFT;

  constructor() ERC721("Birds Eye NFT", "GTBE") {
        birdsEyeNFT.name = "Birds Eye NFT";
        birdsEyeNFT.imprint = "02955b95c0b85c1842eaa3705f4c5cfe8355ac9dd1cdfebff105151dfc7f2439";
        birdsEyeNFT.schemaID = "cc705efdb2e6b75f300f2ea8ebfacb3e95952e630e5b2e5ec7669c897576f472";  
         //  birdsEyeNFT.tokenURI
        birdsEyeNFT.amountMinted = 0;
        birdsEyeNFT.contentCreator = "Gerry Thomas";
        birdsEyeNFT.nftCreator = "The Nest";
        }

 /*Declaring function mint with three arguments,
  variable _to of type address which will store the address of the receiver of NFT token, 
  variable _tokenId of uint256 type which will hold the token id, 
  variable _uri of type string which will store the URI of the JSON file.
   Declaring mint as external means, it can be accessed from other smart contracts and outside the self scope.
 */
    function mint(address receiver, uint256 tokenId, uint8 amountToMint/*string memory storageUri*/) external onlyOwner {
        
        assert(NftToOwner[tokenId] == address(0));
        NftToOwner[tokenId]=msg.sender;
         birdsEyeNFT.tokenID = tokenId;
      //  tokenURI(tokenId)
        super._mint(receiver, tokenId);
       // super._setTokenUri(tokenId, storageUri);
        ownerNftCount[msg.sender] = SafeMath.add(ownerNftCount[msg.sender], 1);
       birdsEyeNFT.amountMinted+=amountToMint;
    }



function getImprint() 
public view returns (string memory) 
{
    return birdsEyeNFT.imprint;
}

function getSchemaID() 
public view returns (string memory) 
{
    return birdsEyeNFT.schemaID;
}


/*Forced overrides */
    function _burn(uint256 tokenId) internal {
        super._burn(tokenId);
    }
 
}


