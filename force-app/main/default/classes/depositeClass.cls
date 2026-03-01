public virtual class depositeClass {
    
   public integer dmt;
    
    public depositeClass(integer dmt){
        this.dmt=dmt;
        system.debug('Show me the amount of constuctor class: '+this.dmt);
    }

}