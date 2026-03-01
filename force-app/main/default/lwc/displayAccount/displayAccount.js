import { LightningElement,wire } from 'lwc';
import AccWire from '@salesforce/apex/displayAccount.displayAccount';

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'Picklist' }
];

export default class DisplayAccount extends LightningElement {
    columns=COLUMNS;
    @wire(AccWire) accounts;
}