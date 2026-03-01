import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    f1 =0;
    f2=0;
    res=0;

     fno(event) {
        this.f1=event.target.value;
        
    }
    sno(event){
        this.f2=event.target.value;
    }

    add(){
        this.res =Number(this.f1)+Number(this.f2);
    }
    sub(){
        this.res =Number(this.f1)-Number(this.f2);
    }
    mul(){
        this.res=Number(this.f1)*Number(this.f2);
    }

    div(){
        this.res=Number(this.f1)/Number(this.f2);
    }

    clear(){
        this.f1="";
        this.f2="";

    }
}