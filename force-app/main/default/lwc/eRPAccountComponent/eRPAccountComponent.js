import { LightningElement,api,wire } from 'lwc';
import getAccount from "@salesforce/apex/ERPClass.GetAcc";

export default class ERPAccountComponent extends LightningElement {
@wire(getAccount) accounts;
accountIdfromParent;
accountIdfromParentOppo;
@api recordId;
handleClick(event){
    event.preventDefault();
    const accId =event.target.dataset.accountid;
    this.accountIdfromParent=accId;
    this.accountIdfromParentOppo=accId;
    
}
}