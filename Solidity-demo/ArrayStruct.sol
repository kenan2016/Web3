
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract ArrayAndStruct{
       function f() public pure {
        g([uint(1), 2, 3]);
    }
    function g(uint[3] memory _data) public pure {
        // ...
    }

    function arrFunc() pure public {
        uint8[] memory x = new uint8[](3);
        x[0] = 1;
        x[1] = 2;
        x[2] = 3;
        // x.push(1);
        // x.pop();
        // x.push();
        x.length;
    }

  struct Person1{
    uint age;
    string name;
  }

  Person1 p1;

  function initPerson() external{
        Person1 storage p2 = p1;
        p2.age = 20;
        p2.name = "Tom";
    }

    function initPerson2() external{
        p1.age = 20;
        p1.name = "Tom";
    }

    function constructorFunc() external{
      p1 = Person1(20, "Tom");
    }
  
}