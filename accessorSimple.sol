pragma solidity ^0.4.18;

contract sample1 {
    int public b = 78;
    int internal c = 90;

    function a() external {
    }

    function sample1() {
        this.a();
        // compile error
        // a();
        b = 21;
        // public 修饰，可以用 this 或者直接访问。
        this.b();
        // compile error, public 修饰，默认有getter 函数，没有setter函数。需要的话自己写
        // this.b(8);
        c = 9;
    }
}

contract sample2 {
    int internal d = 9;
    int private e = 90;
}

contract sample3 is sample2 {
    sample1 s;

    function sample3() {
        s = new sample1();
        s.a();
        var f = s.b;
        // compile error 
        // s.b = 18;
        // compile error, internal  
        // s.c();
        d = 8;
        // compile error, internal not used to inherit
        // e = 7;
    }
}