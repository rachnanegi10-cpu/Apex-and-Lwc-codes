import { LightningElement,wire} from 'lwc';
import getCase from "@salesforce/apex/ERPClass.GetCase";

const COLUMNS = [{label:'Case Number',fieldName:'CaseNumber',type:'Auto Number'},
                 {label: 'Status',fieldName:'Status',type:'Picklist'}];

export default class CaseDisplay extends LightningElement {
    columns=COLUMNS;
    @wire(getCase) case1;
    
}