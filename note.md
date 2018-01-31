### 可见性

external: 只对函数有用，只能通过其他合约或者交易调用。合约内部调用时，需要用this.f() 调用。

public: 函数默认为public

internal: 当前合约或继承的合约可访问。不可以使用this访问。

private: 只能内部访问，继承合约都不能访问。

声明为 public 的状态变量，相当于是一个同名的 getter 函数，可以直接用 c.b() 访问。

Solidity 0.4.16 added two new specifiers for contract functions: pure and view. Solidity 0.4.17 adds the ability to enforce those specifiers—if you attempt to read or write to storage or log events in the body of a function that claims not to do so, your contract will not compile. This is disabled by default for backwards compatibility.

pure was introduced to specify functions that do not read or modify the state of the blockchain, like math functions.

view was introduced to specify functions that can read, but can never modify the state of the blockchain. view is an alias for constant, an existing specifier that was not enforced by the compiler.

### 回退函数 fallback function

一个合约可以有唯一的未命名函数, 不能有实参，不能返回任何值。
执行场景：
    没有其他函数匹配。
    交易发送以太币却不调用任何方法。

使回退函数尽可能便宜。

    contract sample {
        function() payable {

        }
    }

### 继承

通过代码备份支持多重继承，多态。来自父合约的代码最终被复制到最终合约里。

if a contructor takes an argument, it needs to be provided at the contructor of the child contract.

In Solidity child constructor doesn't call parent contructor 
instead parent is initilized and copied to child.

父合约被复制到子合约中。

#### super

引用最终继承链的下一个合约。继承链始于衍生最充分的合约，终于衍生最不充分的合约。
通俗地说，就是最相近的那个合约。

function myFunc() {
    super.myFunc();
}

#### 抽象合约


## 库

类似于库，只是在某个地址只部署一次，且其代码由不同的合约反复使用。

库没有状态变量，不支持继承，不能接收以太币。可以包含结构体和枚举类型。

    library math {
        function addInt(int a, int b) returns (int c) {
            return a + b;
        }
    }

    contract sample {
        function data() returns (int b) {
            return math.addInt(1, 2);
        }
    }

不能在合约源代码中添加库地址，而是需要在编译时向编译器提供库地址。

使用场景：

许多合约，把共同代码部署成一个库，节省 gas。
库可以给数据类型成员添加函数。

如果一个库里只包含内部函数和structs/enums，则不需要部署库，因为其所有的内容都被复制给使用它的合约。

using for 
using A for B
using A for *

### 返回多值

### 导入其他文件

### 全局可用变量

区块和交易属性
block.blockhash
block.coinbase(address) 当前区块矿工地址
block.difficulty(int) 当前区块的难度值
block.gaslimit

block.numer
block.timestamp

msg.data
msg.gas
msg.sender
msg.sig
msg.value

now == block.timestamp
tx.gasprice
tx.origin

地址类型相关
address.balance
address.send，发送失败时返回 false

合约相关
this
selfdetruct: 销毁当前合约，并把其中的资金发送到指定地址

### 存在，真实性，所有权合约的证明

## 编译
命令行 solc 编译器
solcjs
Browser Solidity