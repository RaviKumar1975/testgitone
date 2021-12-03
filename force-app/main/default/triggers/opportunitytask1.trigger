trigger opportunitytask1 on Opportunity (before insert,before update) 
{
    for(opportunity opp:Trigger.new)
    {  
       if(trigger.isbefore)
       {
        if(trigger.isInsert)
        {
            if(  opp.Usdivision__c== True)
            {
               
                opp.Partnership_Source__c='UsDivison';
            }
        }
        if(trigger.isUpdate)
        {       
              Opportunity oldopp = trigger.oldmap.get(opp.Id);
 
             if(oldopp.Usdivision__c != opp.Usdivision__c && opp.Usdivision__c== True)
            {
               
                opp.Partnership_Source__c='UsDivison';
            }
        }
      }
    }
}