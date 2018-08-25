pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;

contract Colormeshop {
    struct ProductTransaction {
        string productCode;
        int value;
    }

    ProductTransaction[] public productTransactions;

    function addProductTransaction(string productCode, int value) public returns (int) {
        productTransactions.push(ProductTransaction(productCode, value));
        return value;
    }

    function getProductTransactions() public view returns (ProductTransaction[]) {
        return productTransactions;
    }
}
