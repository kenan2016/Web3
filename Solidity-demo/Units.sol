// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract UnitDemo{
    function weiUnit() pure public returns(uint){
        assert(1 wei == 1);
        assert(1 wei == 1);
        return (1 wei);
    }

    function gweiUnit() pure public returns(uint) {
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }

       function ethUnit() pure public returns(uint) {
        assert(1 ether == 1e18);
        assert(1 ether == 1000000000000000000);
        return 1 ether;
    }

    function secondUnit() pure public returns(uint){
        assert(1 seconds == 1);
        assert(6 seconds == 60);
        return 1 seconds;
    }


function minutesUnit() external pure returns(uint) {
    assert(1 minutes == 60);
    assert(1 minutes == 60 seconds);
    return 1 minutes;
}

function hoursUnit() external pure returns(uint) {
    assert(1 hours == 3600);
    assert(1 hours == 60 minutes);
    return 1 hours;
}

function daysUnit() external pure returns(uint) {
    assert(1 days == 86400);
    assert(1 days == 24 hours);
    return 1 days;
}

function weeksUnit() external pure returns(uint) {
    assert(1 weeks == 604800);
    assert(1 weeks == 7 days);
    return 1 weeks;
}
}