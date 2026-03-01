public class calci{

    public void add(){
        integer x=20;
        integer y=30;
        system.debug('addition of two number is: '+(x+y));
    }
    
    public  calci(integer x,integer y){
       
        system.debug('subtraction of two number is: '+(x-y));
        
        
    }
    
    public void add(integer x,integer y,integer z){
        z = x*y;
        system.debug('product of two number is: '+z);
    }
    
}