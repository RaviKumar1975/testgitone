trigger contact1 on Contact (after insert,after delete,after update)
{
    if(Trigger.isafter)
    {
        if(Trigger.isinsert)
        {
          ContactTriggerHandler.onAfterInsert(Trigger.New,Trigger.NewMap);
        }
        if(Trigger.isdelete)
        {
         ContactTriggerHandler.onAfterUpdate(Trigger.New,Trigger.NewMap,Trigger.old,Trigger.oldMap);
        }
          
       if(Trigger.isupdate)
        {
          ContactTriggerHandler.onAfterDelete(Trigger.old,Trigger.OldMap);   
        }
 }
}