public class AssignmentCodes {
    public static List<String> processEmailList() {

    List<String> emailList = new List<String>{'john.doe@example.com', 'jane.doe@example.com','john.doe@example.com','alice.smith@example.com',

												'bob.jones@example.com', 'alice.smith@example.com'};



Set<String> emailSet = new Set<String>(emailList);



List<String> uniqueEmailList = new List<String>(emailSet);



uniqueEmailList.sort();

return uniqueEmailList;

}
    
    public static Boolean checkProductCode(String productCode)

{

Set<String> productCodes = new Set<String>();



productCodes.add('P001');

productCodes.add('P002');

productCodes.add('P003');

productCodes.add('P004');



return productCodes.contains(productCode);

}
    
    public static Decimal getProductPrice(String productName)

{

Map<String, Decimal> productPrices = new Map<String,

Decimal>();



productPrices.put('ProductA', 19.99);

productPrices.put('ProductB', 29.99);

productPrices.put('ProductC', 39.99);

productPrices.put('ProductD', 49.99);



return productPrices.get(productName);

}

public static List<String> processAccountNames() {

List<String> accountNames = new List<String>{'Acme Corp', 'Globex Corp', 'Initech', 'Umbrella Corp', 'Acme Corp', 'Globex Corp'};

Set<String> accountNameSet = new Set<String>(accountNames);

List<String> uniqueAccountNames = new List<String>(accountNameSet);

uniqueAccountNames.sort();

String firstAccount = uniqueAccountNames[0];

String lastAccount = uniqueAccountNames[uniqueAccountNames.size() - 1];

System.debug('First Account: ' + firstAccount);

System.debug('Last Account: ' + lastAccount);

return uniqueAccountNames;

}
    
    public static void manageCustomerIDs() {

			Set<String> customerIDs = new Set<String>{'C001', 'C002', 'C003', 'C001', 'C004'};
			Boolean exists = customerIDs.contains('C002');

			System.debug('Customer ID C002 exists: ' + exists);
			customerIDs.remove('C003');

			System.debug('Customer IDs: ' + customerIDs);

					}
            
            
            }