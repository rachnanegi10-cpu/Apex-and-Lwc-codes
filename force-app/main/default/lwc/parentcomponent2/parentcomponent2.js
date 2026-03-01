import { LightningElement } from 'lwc';

export default class Parentcomponent2 extends LightningElement {
    showval;

    pval1(event){
        this.showval = event.detail;
    }
}