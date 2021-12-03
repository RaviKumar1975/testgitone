trigger Quotelineitem1 on QuoteLineItem (after insert, after update, after delete)
{
     if(!Quotelineitemclass1.firstcall) 
     {
         Quotelineitemclass1.firstcall = true; 
    
         if(Trigger.isAfter)
     {
            if(Trigger.isInsert){
                QuoteLineItemtask1.onAfterInsert(Trigger.New);
                 system.debug('trigger value');
               Quotelineitemclass1.firstcall = false; 
                
            }
         
            if(Trigger.isUpdate){
                 
                QuoteLineItemtask1.onAfterUpdate(Trigger.New,Trigger.Newmap,Trigger.old,Trigger.oldMap);
                Quotelineitemclass1.firstcall = false;
               
                }
            if(Trigger.isDelete){
                
                QuoteLineItemtask1.onAfterDelete(Trigger.old,Trigger.OldMap);
            }
        }
   }    
}