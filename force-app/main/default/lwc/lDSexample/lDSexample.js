import { LightningElement,api } from 'lwc';
import name1 from '@salesforce/schema/Account.Name';
import Type1 from '@salesforce/schema/Account.Type';
import ind1 from '@salesforce/schema/Account.Industry';
import recid from '@salesforce/schema/Account.id';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LDSexample extends LightningElement {
    @api objectApiName;
    @api recordId;
    acid;
    N1 = name1;
    T1 = Type1;
    I1 = ind1;
    R1 = recid;
   showres=false;

    //field1=['Name','Type','Company','LeadStatus','Rating'];
    //field1=[name1,Type1,ind1,recid];

    hclick(){
        this.showres=true;
    }

    hsubmit(event){
        this.acid=event.detail.id;

        this.dispatchEvent(
            new ShowToastEvent({
                title:'Record save box',
                message:'Hurray !!! Record created succesfully',
                variant:'success'
            })
        );
    }
}