import { LightningElement,wire } from 'lwc';
import getaccount from '@salesforce/apex/wire3.getAccount';

export default class WireExampleonclick extends LightningElement {

    showacc;
    error;
    Accounts1;
    @wire(getaccount) wireac({error,data})
    {
        if(data)
        {
            this.Accounts1=data;
            //this.error=undefined;


        }
       
    }

    
    
    
    hclick(event){
        const acid = event.currentTarget.dataset.id;
        this.showacc = this.Accounts1.find(acc => acc.id === acid);
    }

}