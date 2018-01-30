pragma solidity ^0.4.18;

contract sample {
    int public b = 78;
    int internal c = 90;

    function a() external {

    }

    function sample() {
        this.a();
        a();
        b = 21；
        this.b()
        this.b(8)
        c = 9;
    }
}