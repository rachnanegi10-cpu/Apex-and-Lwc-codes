public class AccountTriggerHandler {
    public static Boolean isTriggerRunning = true;
    
    public static void afterUndelete(List<Account> accList){
        List<Id> accIds = new List<Id>();
        List<Account> updateAccount=new List<Account>();
        /* In case of after undelete record is read only so we can not directly update the record as it will trow an error. So first we fetch 
           the account and the perform update. In case of readonly you need to fetch the record and then make update.
            Trigger.old and Trigger.oldMap: These are always read-only, regardless of whether the trigger is a before or after event.
			Trigger.new and Trigger.newMap in after triggers: 
        	In all after trigger events (e.g., after insert, after update, after delete, after undelete),
            the records within Trigger.new and Trigger.newMap are read-only because they have already been saved to 
            the database (though not yet committed).Attempting to modify these records in an after trigger will 
            result in a System.FinalException: Record is read-only error.For before trigger we don't need a DML command while for after trigger
			we need a dml command.
			
		*/
        for(Account acc:accList){
            accIds.add(acc.Id);
        }
        
        List<Account> accountsToUpdate=[SELECT Id, Name FROM Account WHERE Id IN:accIds];
        
        for(Account accRec:accountsToUpdate){
            accRec.Name='Restored '+accRec.Name;
            updateAccount.add(accRec);
        }
        
        if(!updateAccount.isEmpty()){
            update updateAccount;
        }
    }
    
    public static void checkIndustry(List<Account> listAccount){
        
        for(Account accountRec: listAccount){
            
            if(accountRec.Industry == null){
                 accountRec.Industry.addError('Industry is reqired');
            }
        }
    }
    
    public static void checkType(List<Account> listAccount){
        
        for(Account accountRec: listAccount){
            
            if(accountRec.Type == null){
                 accountRec.Type.addError('Type is reqired');
            }
        }
    }
    
    public static void setAccountActive(List<Account> listAccount){
        
        for(Account accountRec: listAccount){
            
            if(accountRec.Rating == 'Hot'){
                
                 accountRec.Active__c = 'Yes';
                 
            }
        }
    }
    
    public static void setLeadStatus(List<Lead> listOfLeads){
        
        for(Lead leadRec:listOfLeads ){
            
            if(leadRec.status =='Closed - Converted' || leadRec.status =='Closed - Not Converted'){
                leadRec.LeadSource = 'Web';
            }
        }
    }
    
    public static void setAccountType(List<Account> listAccount){
        for(Account accRecord: listAccount){
            if(accRecord.Type == 'Prospect'){
                if(accRecord.Rating == 'Warm')
                accRecord.Rating.addError('Rating warm is not allowed');
            }
        }
    }
    /* Bulk Insertion
     */
    
    
    public static void bulkAccountInsertion(List<Account> accList){
        List<Account_Error__c> errorList = new List<Account_Error__c>();
        Map<String,String> fieldMap = new Map<String,String>();
        //List<String> field = new List<String>();
        Database.saveresult[] result =database.insert(accList,false); 
        for(database.saveresult r:result){
            if(r.isSuccess()){
              system.debug('AccountId: '+r.getId());

            }else{
                database.error[] err = r.getErrors();
                for(database.error e: err){
                    Account_Error__c err1 =new Account_Error__c();
                    List<String> field = e.getFields();
                    if (field != null && !field.isEmpty()){
                       err1.Error_Field__c =String.join(field, ', '); 
                    }else{
                        err1.Error_Field__c ='No specific field (General Error)';
                    }
                    err1.Error_Message__c =string.valueOf(e.getStatusCode());
                    system.debug('Fields: '+field);
                    // 
                    errorList.add(err1);
                   system.debug('Error Message: '+e.getMessage());
                    
                }
        }
            break;
        }
        insert errorList;
        
        
  }
        


    
    public static void handleAccountDuplicacy(List<Account> accountListNew){
        
        set<string> accNumber = new set<string>();
        set<string> accName = new set<string>();
        
        for(Account accRec: accountListNew){
            accNumber.add(accRec.AccountNumber);
            accName.add(accRec.Name);
        }
        
        List<Account> oldAccounts =[SELECT id,Name, AccountNumber FROM Account where Name in:accName and AccountNumber in:accNumber];
        
        for(Account accRecNew :accountListNew){
            
            Account ac = (Account)trigger.oldmap.get(accRecNew.id);
            
            if(accRecNew.AccountNumber == ac.AccountNumber && accRecNew.Name == ac.Name){
                
                accRecNew.addError('Name and AccountNumber must be different');
            }
       }
    }
    
    public static void annualRevenueCheck(List<Account> accList){
        for(Account accRec:accList){
            Account ac =(Account)trigger.oldmap.get(accRec.Id);
            if(accRec.AnnualRevenue > ac.AnnualRevenue && accRec.Rating != 'Warm'){
                accRec.AnnualRevenue.addError('New Revenue must be less than the old one');
            }
        }
    }
    
    public static void annualRevenueCheckRating(List<Account> accList){
        for(Account accRec:accList){
            
            if(accRec.AnnualRevenue < 2000){
                accRec.Rating='Hot';
            }
        }
        update accList;
    }
    
    Public static void setContactDes(Map<Id,Account> accMap){
        
        List<Contact> conList =[Select Accountid,id,Description from Contact where AccountId!=null and AccountId in: accMap.keySet()];
        
        for(Contact conRec: conList){
            Account accOld = (Account)trigger.oldmap.get(conRec.AccountId);
            Account accRec =accMap.get(conRec.AccountId);
            conRec.Description = accRec.Description;
            conRec.MailingCity = accRec.BillingCity;
            conRec.Phone = accRec.Phone;
            if(accRec.Type!=accOld.Type){
                accRec.BillingState='Negotiable';
                accRec.Active__c='yes';
                accMap.put(accRec.Id,accRec);
            }
        }
        update conList;
       // update accMap;
    }
    
    public static void setOldPhone(List<Account> accList){
        Map<id,Account> accmap= (Map<Id,Account>)Trigger.oldmap;
        List<Phone_Data__c> phoneData = new List<Phone_Data__c>();
        for(Account accRec:accList){
            //Account acc = accmap.get(accRec.id);
            
            if(accRec.Phone != Null && accRec.Phone !=accmap.get(accRec.id).Phone){
                accRec.Old_Phone_Number__c = accmap.get(accRec.id).Phone;
                Phone_Data__c phn = new Phone_Data__c();
                phn.Current_Phone_Number__c = accRec.Phone;
                phn.Old_Phone_Number__c=accmap.get(accRec.id).Phone;
                phoneData.add(phn);
            }
        }
        insert phoneData;
    }
    
    public static void deleteEvent(List<Account> accList){
        for(Account acc:accList){
            
            if(acc.AnnualRevenue < 3000){
                acc.addError('You are not allowed to delete this account');
            }
        }
    }
    
    public static void deleteEventActive(List<Account> accList){
        for(Account acc:accList){
            
            if(acc.Active__c=='Yes'){
                acc.addError('You are not allowed to delete this account');
            }
        }
    }
    
    public static void deleteAccOppo(List<Account> accList){
        List<Account> acListOpp=[SELECT Id, Name FROM Account WHERE Id IN(SELECT AccountId FROM Opportunity WHERE StageName='Prospecting') 
                                 AND Id in:accList];
        
        for(Account accRec:acListOpp){
            trigger.oldmap.get(accRec.Id).addError('You are not allowed to delete account with stage name "Prospecting"');
        }
    }
    
    public static void deleteAccContact(List<Account> accList){
        
        List<Account> accConList=[SELECT id,(Select AccountId FROM Contacts WHERE AccountId in: accList) From Account];
        for(Account accRec:accConList){
            
            if(accRec.contacts.size()>3){
                 accRec.addError('More than three contacts hence not allowed to delete the Account');
            }
        }
    }
    
    public static void code11(List<Account> accList){
        for(Account accRec:accList){
            Account acc = (Account)trigger.oldmap.get(accRec.id);
            if(acc.Industry!=accRec.Industry){
                accRec.Industry ='Banking';
            }
            
        }
        update accList;
    }
    
    public static void code12(List<Account> accList){
        for(Account accRec:accList){
            if(accRec.Active__c=='Yes'){
                accRec.addError('You are not allowed to delete');
            }
            
        }
       
    }
    
    public static void code13(Map<Id,Account> accMap){
        
            List<contact> conList = [select AccountId,Phone from Contact where AccountId !=null and AccountId in:accMap.keySet()];
            
            for(Contact conRec:conList){
               Account accOld =(Account)trigger.oldmap.get(conRec.AccountId);
               Account accNew = accMap.get(conRec.AccountId) ;
               conRec.Phone = accNew.Phone;
                accMap.put(accNew.Id,accNew);
                
            }
            update conList;
        
        
    }
    
    public static void code14(Map<Id,Account> accMap){
        
            List<contact> conList = [select AccountId,Phone,Description,MailingCity,Email from Contact where AccountId !=null and AccountId in:accMap.keySet()];
            List<Contact> conListUpdate = new List<Contact>();
            for(Contact conRec:conList){
               Account accOld =(Account)trigger.oldmap.get(conRec.AccountId);
               Account accNew = accMap.get(conRec.AccountId) ;
               conRec.Phone = accNew.Phone;
               conRec.MailingCity= accNew.BillingCity;
                conListUpdate.add(conRec);
                //accMap.put(accNew.Id,accNew);
                
                
            }
            update conListUpdate;
        
        
    }
    
    public static void code15(Map<Id,Account> accMap){
        
            List<contact> conList = [select AccountId,Phone from Contact where AccountId !=null and AccountId in:accMap.keySet()];
            
            for(Contact conRec:conList){
               Account accOld =(Account)trigger.oldmap.get(conRec.AccountId);
               Account accNew = accMap.get(conRec.AccountId) ;
               conRec.Phone = accNew.Phone;
                accMap.put(accNew.Id,accNew);
                
            }
            update conList;
        
        
    }
    
    public static void code17(Map<Id,Account> accMap){
        List<Contact> conList = [SELECT AccountId,Description,Email FROM Contact where AccountId!=null and AccountId in:accMap.keyset()];
        for(Contact conRec:conList){
            Account oldAcc = (Account)trigger.oldmap.get(conRec.AccountId);
            Account accRec = accMap.get(conRec.AccountId);
            conRec.Description = accRec.Description;
            if(conRec.Email!=null){
               // EmailMessageTriggerHandler.sendmail(conRec.Email);
            }
        }
        update conList;
    }
    
    public static void dataProtection(List<Account> accList){
        List<id> accId = new List<id>();
        for(Account accRec:accList){
            if(accRec.id != null){
                accId.add(accRec.Id);
            }
        }
        
        List<Contract> contractList = [Select AccountId,Status From Contract where AccountId in:accId];
        List<Opportunity> oppList = [Select AccountId,StageName From Opportunity where AccountId in:accId];
        
        Map<string,Id> accMap = new Map<String,Id>();
        for(Contract rec1:contractList){
            accMap.put(rec1.Status,rec1.AccountId);
        }
        
        for(Opportunity rec2:oppList){
            accMap.put(rec2.StageName,rec2.AccountId);
        }
        
        for(Account accRec:accList){
            if(accMap.containsKey('Closed Won') || accMap.containsKey('Activated')){
                accRec.addError('Account with Active Contract or Opportunity closed won can not be deleted');
            }
        }
        
    }


}