//pragma solidity ^0.4.24;
contract transferTokenContract {
    constructor() payable public{}
    function() payable external{}
    function transferTokenTest(address payable toAddress, uint256 tokenValue, vrcToken id) payable public  {
            toAddress.transferToken(tokenValue, id);
    }
    function transferTokenTestIDOverBigInteger(address payable toAddress) payable public  {
        toAddress.transferToken(1, 9223372036854775809);
    }
    function transferTokenTestValueRandomIdBigInteger(address payable toAddress) payable public  {
        toAddress.transferToken(1, 36893488147420103233);
    }
    function msgTokenValueAndTokenIdTest() public payable returns(vrcToken, uint256){
        vrcToken id = msg.tokenid;
        uint256 value = msg.tokenvalue;
        return (id, value);
    }
    function getTokenBalanceTest(address accountAddress) payable public returns (uint256){
        vrcToken id = 1000001;
        return accountAddress.tokenBalance(id);
    }
    function getTokenBalnce(address toAddress, vrcToken tokenId) public payable returns(uint256){
        return toAddress.tokenBalance(tokenId);
    }
}