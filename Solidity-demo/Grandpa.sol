// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Grandpa {
    event Log(string log);

    function hip() public virtual{
        emit Log("Grandpa");
    }

    function pop() public virtual{
        emit Log("Grandpa");
    }

    function log() public virtual{
        emit Log("Grandpa");
    }
}

contract Father is Grandpa{
    function log() public virtual override{
        emit Log("Father");
    }

    function hip() public virtual override{
        emit Log("Father");
    }

    function pop() public virtual override{
        emit Log("Father");
    }
}

contract Son is Grandpa, Father{
   
   // 继承两个function: hip()和pop()，输出值为Erzi。
    function hip() public virtual override(Grandpa, Father){
        emit Log("son");
    }

    function pop() public virtual override(Grandpa, Father) {
        emit Log("son");
    }

}
