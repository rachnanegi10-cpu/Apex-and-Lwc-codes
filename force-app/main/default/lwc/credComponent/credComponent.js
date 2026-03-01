import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateContactForm extends LightningElement {
    firstName;
    lastName;
    contactCreated = false;

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

    createContact() {
        const fields = {
            FirstName: this.firstName,
            LastName: this.lastName
        };
        const recordInput = { apiName: 'Contact', fields };
        createRecord(recordInput)
            .then(contact => {
                console.log('Contact created:', contact);
                this.contactCreated = true;
                // Perform any additional actions like showing a success message
            })
            .catch(error => {
                console.error('Error creating contact:', error);
                // Handle error scenarios
            });
    }
}