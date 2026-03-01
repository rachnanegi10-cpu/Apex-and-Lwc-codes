import { LightningElement,wire } from 'lwc';
import Accwire from '@salesforce/apex/displayClass.displayAccount';

export default class DisplayComponent extends LightningElement {

    //@wire(Accwire) Account1;
    Account1;
    error;

    click(){

        alert('Welcome');

        Accwire().then(result=>{
            this.Account1=result;
        }).catch(error=>{
            this.error=error;
        });
            
        
    }

    cclick(){
        this.Account1=null;
    }


}