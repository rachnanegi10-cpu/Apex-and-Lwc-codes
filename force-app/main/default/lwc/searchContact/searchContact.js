import { LightningElement,api,wire,track } from 'lwc';
import getContact from '@salesforce/apex/searchContact.getContact';
const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' }
];

export default class SearchContact extends LightningElement {
    @track contacts;
    @track error;
    columns=COLUMNS;
    selectedAccountId;

    handleAccountChange(event){
        this.selectedAccountId=event.detail.recordId;
        if(this.selectedAccountId){
            this.loadContacts();
        }else{
            this.contacts=undefined;
            this.error=undefined;
        }
    }

    loadContacts(){

        getContact({accountId:this.selectedAccountId})
                    .then(result=>
                        {   
                            this.contacts=result; 
                            this.error=undefined;})
                    .catch(error=>{
                        this.error=error;
                        this.contacts=undefined;
                    });

    }

}