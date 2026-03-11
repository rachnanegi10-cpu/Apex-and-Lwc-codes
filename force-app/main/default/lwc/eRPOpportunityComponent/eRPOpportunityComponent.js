import { LightningElement,api,wire } from 'lwc';
import getOpportunity from '@salesforce/apex/ERPClass.GetOpp';

export default class ERPOpportunityComponent extends LightningElement {
    columns = [
        { label: 'Stage Name', fieldName: 'StageName',type:'Picklist' },
        { label: 'Name', fieldName: 'Name' ,type:'Text'},
        { label: 'Type', fieldName: 'Type', type: 'Picklist' }
    ];
 @api accountId;
 @wire(getOpportunity,{accountId:'$accountId'}) opps;
 
}