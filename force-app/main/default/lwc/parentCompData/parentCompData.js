import { LightningElement,wire } from 'lwc';
import getacc1 from '@salesforce/apex/fetchdatatable.accountData';

export default class ParentCompData extends LightningElement {

    selectedAccountId;
    aclist=[];

    columns1 = [
        {
            label:'Account Name',
            fieldName: 'Name'
        },
        {
            label:'Account Type',
            fieldName:'Type'
        }
    ];

    @wire(getacc1) wiredc({data,error}){
        if(data){
            this.aclist=data;
        }else if(error){
            console.log('Data not found');
        }
    }

    hselect(event){
        const selectedRows = event.detail.selectedRows;
        if(selectedRows.length > 0){
            this.selectedAccountId=selectedRows[0].Id;
        }
        else{
            this.selectedAccountId = null;
        }
    }

}