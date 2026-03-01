import { LightningElement,track } from 'lwc';

export default class Loancomponent extends LightningElement {
    rate1=10;
    rate2=15;
    term1=0;
    amount1=0;
    intrest=0;
    repay=0;
    pay=0;
    isChecked=false;
   
    showres(){
        if(this.isChecked==true){
            this.rate2;
        }
        else{
            this.rate1;
        }
    }
    handleCheck(event){
        this.isChecked=event.target.checked;
    }
    amount(event){
        this.amount1=event.target.value;
    }

    term(event){
        this.term1=event.target.value;
    }

   calculate(){
    if(this.isChecked==false){
       this.pay=Number(this.amount1)*Number(this.rate1)*Number(this.term1);
       this.intrest=Number(this.pay)/100;
       this.repay=Number(this.amount1)+Number(this.intrest);
    }else{

        this.pay=Number(this.amount1)*Number(this.rate2)*Number(this.term1);
       this.intrest=Number(this.pay)/100;
       this.repay=Number(this.amount1)+Number(this.intrest);
    }
}
}