ragma Solidity ^0.4.2

contract Sample
{
    //state variables
    uint256 data;
    address owner;

    //event definition
    event logData(uint256 dataToLog);

    // function modifier
    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _;
    }

    //constructor
    function Sample(uint256 initData, address initOwner) {
        data = initData;
        owner = initOwner;
    }

    //functions
    function getData() returns(uint256 returnedData) {
        return data;
    }

    function setData(uint256 newData) onlyOwner {
        logData(newData);
        data = newData;
    }
}
