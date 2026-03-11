import { LightningElement,api,wire,track } from 'lwc';
import getContact from '@salesforce/apex/searchContact.getContact';
import getOpps from '@salesforce/apex/searchContact.getOpportunity';
const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' }
];

const COLUMNS2 = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Stage Name', fieldName: 'StageName', type: 'emaPicklistil' },
    { label: 'Type', fieldName: 'Type', type: 'Picklist' }
];

export default class SearchContact extends LightningElement {
    @track contacts;
    @track error;
    @track opps;
    columns=COLUMNS;
    columns2=COLUMNS2;
    selectedAccountId;

    handleAccountChange(event){
        this.selectedAccountId=event.detail.recordId;
        if(this.selectedAccountId){
            this.loadContacts();
            this.loadOpps();
        }else{
            this.contacts=undefined;
            this.opps=undefined;
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

    loadOpps(){

        getOpps({accountId:this.selectedAccountId})
                    .then(result=>
                        {   
                            this.opps=result; 
                            this.error=undefined;})
                    .catch(error=>{
                        this.error=error;
                        this.opps=undefined;
                    });

    }

}