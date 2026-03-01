import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
    cval='I am from child component';
    @api pval;
    Newval;
    @api testmethod(parentparam){
        alert('Get the parameter from parent '+parentparam.fname);
        this.Newval=parentparam.fname;
    }
}