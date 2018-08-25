pragma solidity ^0.4.23;

contract Colormeshop {
    struct ProductTransaction {
        string productCode;
        int value;
    }

    ProductTransaction[] public productTransactions;
    uint public productTransactionCount;

    constructor() public {
        productTransactionCount = 0;
    }

    function addProductTransaction(string productCode, int value) public returns (int) {
        productTransactions.push(ProductTransaction(productCode, value));
        productTransactionCount++;
        return value;
    }

    // Returning array of struct is experimental.
    // We need to declare `pragma experimental ABIEncoderV2;` if use the function below.
    // function getProductTransactions() public view returns (ProductTransaction[]) {
    //     return productTransactions;
    // }
}
