import { LightningElement } from 'lwc';
import firsttemp from './lifecylclehooks2.html';
import secondtemp from './lifecylclehooks.html';

export default class Lifecylclehooks extends LightningElement {
    myval='Hello world';
    hkey='Connected callback';
    hkey1='Rendered callback';
    tempnumber='temp1';
    constructor(){
        super();
        alert('Hi welcome for this site');
        alert('show me my message '+this.myval);
        console.log('constructor stage is initialised');
    }

    connectedCallback(){
        alert('Component is initialized in dom '+this.hkey);
        console.log('Connected call back stage is initialized');
    }

    renderedCallback(){
        alert('This is rendered callback :'+this.hkey1);
    }

    hclick(){

        if(this.tempnumber==='temp1'){
            this.tempnumber='temp2';
        }
        else{
            if(this.tempnumber==='temp2'){
                this.tempnumber='temp1';
            }
        }

    }

    render(){
        console.log('This is rendered method');
        if(this.tempnumber==='temp1'){
            return firsttemp;
        }
        else{
            return secondtemp;
        }
    }
}
