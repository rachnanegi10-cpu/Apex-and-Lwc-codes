import { LightningElement } from 'lwc';
import almamate from '@salesforce/label/c.custom1';
import logo1 from '@salesforce/resourceUrl/Laptop';

export default class TemplateForLoop extends LightningElement {
    c1=almamate;
    imgLogo=logo1;
    contacts1 = [

        {
            no:1,
            name:'Rachna',
            title:'CEO'
        },

        {
            no:2,
            name:'Kavita',
            title:'Manager'
        },

        {
            no:3,
            name:'Shivam',
            title:'Lead'
        }
    ];
}