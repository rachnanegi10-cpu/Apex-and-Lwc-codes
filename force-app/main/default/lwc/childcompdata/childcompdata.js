import { LightningElement,api,wire } from 'lwc';
import getcon1 from '@salesforce/apex/fetchdatatable.contactData';
export default class Childcompdata extends LightningElement {
    @api accountid;
    contact1;
    error;
    @wire(getcon1,{val:'$accountid'}) wiredcon({data,error}){
        if(data){
            this.contact1=data;
        }else if(error){
            this.error=error;
            console.log('Data Not Found');
        }
    }
}