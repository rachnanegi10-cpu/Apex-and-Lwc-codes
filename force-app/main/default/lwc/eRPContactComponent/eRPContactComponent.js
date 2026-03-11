import { LightningElement ,api,wire} from 'lwc';
import getContact from "@salesforce/apex/ERPClass.GetContact";


export default class ERPContactComponent extends LightningElement {
    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email', type: 'email' }
    ];
    @api accountId;
    @wire(getContact,{accountId:'$accountId'}) contacts;
    

}