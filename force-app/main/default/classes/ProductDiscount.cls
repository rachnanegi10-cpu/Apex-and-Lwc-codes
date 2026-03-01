public class ProductDiscount {
    
    public static void productPrice(string category, decimal price){
        decimal final_price = priceCalculator(category,price);
        system.debug('Discounted Price of '+category+' is:'+final_price);
        
    }
    
    private static decimal priceCalculator(string category,decimal price){
        decimal final_price;
        
        if(price > 0){
        switch on (category){
            
            when'Fruit'{ final_price = price - (price*10/100);
                       
        }
            when'clothes'{
                final_price = price - (price*20/100);
               
            }
            when else {
                final_price = price;
                system.debug('No discount on the given product');
            }
        } 
    }else{
            system.debug('Price should be a natural number');
        }
        
        return final_price;

}
}