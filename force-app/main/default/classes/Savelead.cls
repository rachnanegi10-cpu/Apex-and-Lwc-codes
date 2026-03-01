public class Savelead {
    Lead l;
    public savelead(){
        l=new lead();
        
    }
    public void saverecord(){
        //insert l;
    }
    public lead getleads1(){
        
        return l;
    }
    
    public pagereference openGoogle(){
   		pagereference p1 =new pagereference('https://www.google.com');
        return p1;
    }
    
    public pagereference savereord(){
        insert l;
        pagereference p1=new pagereference('/'+l.id);
        return p1;
    }

}