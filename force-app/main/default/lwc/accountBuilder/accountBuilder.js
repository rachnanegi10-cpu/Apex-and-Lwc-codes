import { LightningElement } from 'lwc';

export default class AccountBuilder extends LightningElement {
    fields=['Name','Active__c','Customer_segment__c'];
    fieldsOpportunity=['Name','StageName','Type','CloseDate'];
    fieldsContact=['Name','Email','Phone'];
}