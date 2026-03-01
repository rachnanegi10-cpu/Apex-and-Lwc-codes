import { LightningElement } from 'lwc';

export default class ZodiacSignMessanger extends LightningElement {
    userName;
    userBirthdate;

    zodiacTrait = [
        {
            sign:'Capricon',
            from:'12-22',
            to:'01-19',
            emoji:'w',
            trait:"You are good,practicle"
        },
        {
            sign:'Arise',
            from:'2-19',
            to:'03-20',
            emoji:'w',
            trait:"You are good,particular"
        }
    ];

    handleNameChange(event){
        this.userName=event.target.value;
    }

    handleDateChange(event){
        this.userBirthdate=event.target.value;
    }

    handleSubmit(){
           
            let userDob = new Date(this.userBirthdate);
            const userMonth=userDob.getMonth()+1;
            const userDate = userDob.getDate();
            this.checkZodiacSign(userMonth,userDate);
        
        
    }

    checkZodiacSign(month,day){
        for(let sign of this.zodiacTrait ){
            console.log('sign: '+sign);
        }

    }
}