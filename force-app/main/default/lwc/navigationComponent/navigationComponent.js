import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';

export default class NavigationComponent extends NavigationMixin(LightningElement) {

    HA(){
        alert('Hello');
        this[NavigationMixin.Navigate]({
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'home',
                
            }
        });
        
        //this[NavigationMixin.Navigate](this.pageref);
    }

    Hn(){
        this.pageref={
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                actionName:'new'
            }
        };

        this[NavigationMixin.Navigate](this.pageref);


    }

    Hr(){
        this.pageref={
            type:'standard__objectPage',
            attributes:{
                objectApiName:'Account',
                recordId:'001dM00003TUVP7QAP',
                actionname:'edit'
            }
        };
        this[NavigationMixin.Navigate](this.pageref);
    }

    Hg(){
        this[NavigationMixin.Navigate]({
            type:'standard__webPage',
            "attributes":{
                "url":'https://www.google.com'
            }
        });
        
    }
}