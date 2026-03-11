import { LightningElement,wire } from 'lwc';
import getLead from "@salesforce/apex/ERPClass.GetLead";

const COLUMNS = [{label:'Name',fieldName:'Name',type:'Name'},
                 {label: 'Status',fieldName:'Status',type:'Picklist'}];

export default class CaseDisplay extends LightningElement {
    columns=COLUMNS;
    @wire(getLead) lead1;
    
}