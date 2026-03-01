public class CustomerManager {
    
    public class Customer {

		public String customerID { get; set; }

		public Customer(String customerID) {

		this.customerID = customerID;

	}
        
        public void manageCustomers() {

			Set<String> customerIDs = new Set<String>();

			List<Customer> customers = new List<Customer>{new Customer('C001'),new Customer('C002'),new Customer('C003'),new Customer('C001'),new Customer('C004')

																	};

			for (Customer cust : customers) {

					customerIDs.add(cust.customerID);

				}



			Boolean exists = customerIDs.contains('C002');

			System.debug('Customer ID C002 exists: ' + exists);

			customerIDs.remove('C003');

			System.debug('Customer IDs: ' + customerIDs);

}
    }

}