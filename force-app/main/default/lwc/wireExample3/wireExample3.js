import { LightningElement,wire} from 'lwc';
import getaccount from '@salesforce/apex/wire3.getAccount';
export default class WireExample3 extends LightningElement {
    Account2;
    error1;

    @wire(getaccount) Account1({error,data}){

        if(data){
            this.Account2=data;
            this.error1=undefined;
        }
        else if(error){
            this.error1 = this.error;
            this.Account2=undefined;
        }
    }
}