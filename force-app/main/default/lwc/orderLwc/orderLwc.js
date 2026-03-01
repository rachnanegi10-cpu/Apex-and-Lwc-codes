import { LightningElement } from 'lwc';

export default class OrderLwc extends LightningElement {
    showres =false;
    ischecked=false;

    
    
    onclick(event){

    this.showres=true;
    this.ischecked=event.target.checked;
    }
}