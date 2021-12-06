trigger caseTrigger on Case (After insert,After update)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            Casetriggerhandler.onAfterInsert(Trigger.New,Trigger.NewMap);
        }
        if(Trigger.isUpdate)
        {
            Casetriggerhandler.onAfterUpdate(Trigger.New,Trigger.NewMap,Trigger.old,Trigger.oldMap);
        }
        
    }
}