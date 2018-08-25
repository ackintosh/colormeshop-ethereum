pragma solidity ^0.4.23;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Colormeshop.sol";

contract TestColormeshop {
    Colormeshop colormeshop = Colormeshop(DeployedAddresses.Colormeshop());

    function testUserCanAddProductTransaction() public {
        int returnedValue = colormeshop.addProductTransaction("test_product_code", 2);
        int expected = 2;

        Assert.equal(returnedValue, expected, "ProductTransaction should be recorded.");
    }

    function testContractCountsProductTransactions() public {
        uint count = colormeshop.productTransactionCount();
        uint expected = 1;

        Assert.equal(count, expected, "");
    }
}
