import { LightningElement } from 'lwc';

export default class ParentComponent extends LightningElement {
    //sendVal='Hurray my value derives from Parent component';
    sendVal;
    sname;
    hclick(){
        alert('Success');
        this.sendVal='Hurray my value derives from Parent component';
    }

    hmethod(){
        alert('Success');
        var child1 = this.template.querySelector('c-child-component');
        var sendparam={'fname':this.sname};
        child1.testmethod(sendparam);
    }

    click(event){
        this.sname=event.target.value;

    }


}