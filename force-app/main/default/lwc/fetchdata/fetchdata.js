import { LightningElement,wire } from 'lwc';
import accData from '@salesforce/apex/fetchdatatable.accountData';

export default class Fetchdata extends LightningElement {

    Account1;
    @wire(accData) Account1({data,error}){

        if(data){

            this.Account1=data;
        }else if(error){

            console.log('Data not found');
            
        }
    }
}