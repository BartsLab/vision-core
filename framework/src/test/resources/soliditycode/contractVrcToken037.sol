//pragma solidity ^0.4.24;

contract transferVrc10 {
    function receive(address payable rec) public payable {
        uint256 aamount=address(this).tokenBalance(msg.tokenid);
        uint256 bamount=rec.tokenBalance(msg.tokenid);
        require(msg.tokenvalue==aamount);
        require(aamount==msg.tokenvalue);
        rec.transferToken(aamount,msg.tokenid);
        require(0==address(this).tokenBalance(msg.tokenid));
        require(bamount+aamount==rec.tokenBalance(msg.tokenid));
        (bool success, bytes memory data) =rec.call(abi.encodeWithSignature("checkVrc10(uint256,vrcToken,uint256)",bamount+aamount,msg.tokenid,0));
        require(success);

    }
}

contract receiveVrc10 {
    function() external payable {}
    function checkVrc10(uint256 amount,vrcToken tid,uint256 meamount) public{
        require(amount==address(this).tokenBalance(tid));
        require(meamount==msg.sender.tokenBalance(tid));
    }
}