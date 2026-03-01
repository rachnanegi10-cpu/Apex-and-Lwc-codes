import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ToastComponent extends LightningElement {

    f1=0;
    f2=0;
    res = 0;
    Toast1(event){
        const show1 = new ShowToastEvent(
            
            {
                title:"First alert",
                message:"success of show toast event",
                varient:"destructive",
                //mode:"sticky"


        }
    ) ;

    this.dispatchevent(show1);
    }

    fno(event){
        this.f1=event.target.value;
    }
    sno(event){
        this.f2=event.target.value;
    }

    addc(){
        this.res=Number(this.f1)+Number(this.f2);
    }

    minus(){
        this.res=Number(this.f1)-Number(this.f2);
    }
    clear(){
        this.f1="";
        this.f2="";
    }

    menus1(event){
        const s1 = event.detail.value;
        switch(s1){
            case 'Add':
                this.addc();
                break;
            case 'Minus':
                this.minus();
                break;
            case 'Clear':
                this.clear();
                break;
        }
    }
}