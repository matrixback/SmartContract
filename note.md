### 可见性

external: 只对函数有用，只能通过其他合约或者交易调用。合约内部调用时，需要用this.f() 调用。

public: 函数默认为public

internal: 当前合约或继承的合约可访问。不可以使用this访问。

private: 只能内部访问，继承合约都不能访问。

