public class OpportunityTriggerHandler {
    
    public static void insertOppoLineItem(List<Opportunity> oppList){
        
        List<Id> oppIds = new List<Id>();
        set<id> priceBookId = new set<id>();
        Map<Id,List<PricebookEntry>> mapProduct = new Map<Id,List<PricebookEntry>>();
        for(Opportunity oppRec: oppList){
            if(oppRec.Pricebook2Id != NULL){
                oppIds.add(oppRec.id);
                priceBookId.add(oppRec.Pricebook2Id);
                system.debug('Opportunity: '+oppIds);
                system.debug('Pricebook2Id: '+oppRec.Pricebook2Id);
            }
            
        }
        
        List<PricebookEntry> productList = [SELECT id,Product2Id,Pricebook2Id from PricebookEntry where Pricebook2Id in:priceBookId ];
        system.debug('price book: '+productList);
        
        for(PricebookEntry proRec:productList){
            
            //if(mapProduct.containsKey(proRec.Pricebook2Id)){
             		mapProduct.put(proRec.Pricebook2Id,new List<PricebookEntry>());
            		system.debug('Map: '+mapProduct);
            //}
            mapProduct.get(proRec.Pricebook2Id).add(proRec);
        }
        
        List<OpportunityLineItem> oppLineItem = new List<OpportunityLineItem>();
        for(Opportunity oppRec: oppList){
            if(mapProduct.containsKey(oppRec.Pricebook2Id)){
                
                List<PricebookEntry> prbEntry = mapProduct.get(oppRec.Pricebook2Id);
                if(!prbEntry.isEmpty()){
                    PricebookEntry firstElement =prbEntry[0];
                    OpportunityLineItem oppLineItem1 = new OpportunityLineItem();
                    oppLineItem1.OpportunityId =oppRec.Id;
                    oppLineItem1.PricebookEntryId = firstElement.Id;
                    oppLineItem1.Quantity=2000;
                    oppLineItem1.TotalPrice =50000;
                    oppLineItem.add(oppLineItem1);
                }
                    
            }
                
          	
        }
        if(!oppLineItem.isEmpty()){
        insert oppLineItem;
            system.debug('inserted'+oppLineItem);
        }
    }
    
    Public static void aggregationOpportintity(List<Opportunity> opList){
        List<String> accId = new List<String>();
        Map<id,Account> accMap = new Map<Id,Account>();
        
        for(Opportunity opp:opList){
            accId.add(opp.AccountId);
           }
        List<Account> acc= [SELECT Id,Maximum_Amount__c,Minimum_Amount__c from Account where Id in:accId];
        for(Account accR: acc){
            accMap.put(accR.id,accR);
        }
        List<Account> accountUpdate = new List<Account>();
        List<Aggregateresult> result = [SELECT Accountid acid,max(Amount) maxamt,min(Amount) minamt
                                        FROM Opportunity WHERE id in: accId group by Accountid];
        
        for(Aggregateresult r:result){
            
             id recordId = (id)r.get('acid');
            Account accRec = accMap.get(recordId);
            accRec.Maximum_Amount__c =(decimal)r.get('maxamt');
            accRec.Minimum_Amount__c =(decimal)r.get('minamt');
            accountUpdate.add(accRec);
            
            
        }
        update accountUpdate;
    }
    
    public static void oppAmountUpdateNotAllowed(List<Opportunity> oppList){
		
		Map<Id,Opportunity> opmap= (Map<Id,Opportunity>)trigger.oldmap;
		for(Opportunity oppRec: oppList){
			
			Opportunity opp = opmap.get(oppRec.id);
			//if(oppRec.Amount != null){
				if(OppRec.Amount != opp.Amount ){
				
				oppRec.addError('User is not allowed to change the amount');
				
			}
		}
	}
    
    public static void handleOppRestriction(List<Opportunity> oppList){
        
        for(Opportunity oppRec:oppList){
            if(oppRec.Start_Date__c != system.today() || oppRec.Start_Date__c < oppRec.CloseDate){
                
                oppRec.Project__c.addError('Not Allowed to enter this value');
            }
        }
        
        
    }
    
    public static void followUpTask(List<opportunity> oppList){
        List<Task> taskList = new List<task>();
        for(Opportunity oppRec:oppList){
            if(oppRec.Id !=null ){
                Task taskRec = new Task();
                taskRec.WhatId = oppRec.Id;
                taskRec.Description = 'Follow up task on Opportunity update';
                taskList.add(taskRec);
            }
        }
        if(!taskList.isEmpty()){
        	Insert taskList;
    	}
    }

}