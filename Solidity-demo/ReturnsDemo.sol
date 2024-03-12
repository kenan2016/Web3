// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract ReturnsDemo{
    function returnMuiltRe() public pure returns(uint256,bool, uint256[3] memory){
            return(1, true, [uint256(1),2,5]);
    }

   function autoReturn() public pure returns(uint256 _num, bool _flag,uint256[3] memory _arr){
    _num =1;
    _flag = true;
    _arr = [uint256(1),2,3];
   }

   function getReturns() public pure{
        uint256 _num;
        bool _flag;
        uint256[3] memory _arr;
        (_num, _flag,_arr) = autoReturn();
        // 读取部分
         (, _flag,) = autoReturn();
   }

}