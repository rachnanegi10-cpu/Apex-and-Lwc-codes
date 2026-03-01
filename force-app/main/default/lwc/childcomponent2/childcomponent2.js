import { LightningElement } from 'lwc';

export default class Childcomponent2 extends LightningElement {
    hkey;

    hmethod(event){
        this.hkey = event.target.value;
        const myevent = new CustomEvent("getsearch",{detail:this.hkey});
        this.dispatchEvent(myevent);
    }
}