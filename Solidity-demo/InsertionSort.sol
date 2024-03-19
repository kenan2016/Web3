// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract InsertionSort {
    // / if else
    function ifElseFunc(uint a, uint b) public pure returns(bool) {
        if(a>b) {
            return true;
        } else {
            return false;
        }
    }

     // for loop
     function loopFunc() pure public returns(int){
        int sum = 0;
        for(int i = 0; i < 10; i++){
            sum += i;
        }
        return (sum);
     }

   function whileTest(uint a) public pure returns(uint){
    uint res = 0;
    while(a<=100){
        res = res+a;
        a++;
    }
    return res;
   } 

   function dowhileTest(uint a) pure public returns(uint){
    uint res = 0;
    do{
        res = res+a;
        a++;
    }while (a<=100);

    return res;
   }

    // 三元运算符 ternary/conditional operator
    function ternaryTest(uint256 x, uint256 y) public pure returns(uint256){
        // return the max of x and y
        return x >= y ? x: y; 
    }

    // 插入排序 正确版
    function insertionSort(uint[] memory a) public pure returns(uint[] memory) {
        // note that uint can not take negative value
        for (uint i = 1;i < a.length;i++){
            uint temp = a[i];
            uint j=i;
            while( (j >= 1) && (temp < a[j-1])){
                a[j] = a[j-1];
                j--;
            }
            a[j] = temp;
        }
        return(a);
    }

}