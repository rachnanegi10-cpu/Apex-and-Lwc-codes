trigger ContractTrigger on Contract (before insert,after insert, after update, before update) {

    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
       // ContractTriggerHandler.contractActivation(Trigger.New);
    }
}