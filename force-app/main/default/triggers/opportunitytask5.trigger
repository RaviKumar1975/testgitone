trigger opportunitytask5 on Opportunity (after insert, after update, after delete) 
{
    if(trigger.isAfter)
    {
        if(trigger.isinsert)
        {  
            map<Id,id> map1 = new map<Id,id>();
            map<id,account> accmap = new map<Id,account>();
            
            for(Opportunity opp:Trigger.New)
           {     
                 if(opp.StageName == 'Closed won')
                 {
                    map1.put(opp.id, opp.AccountId);
                 }
           }            
              for (account acc: [select id,name,(select id, Amount from opportunities) from account where id in :map1.values()]) 
              {
              decimal closedamount = 0;
              for (Opportunity opp : acc.opportunities) 
              {
                  closedamount += opp.Amount;
              }
               acc.closed_amount__c = closedamount; 
               accmap.put(acc.id, acc);
              }
            if (!accmap.isempty())
            {
              update accmap.values();
            }
        }
    }
    
     if(trigger.isAfter)
    {
        if(trigger.isUpdate)
        {  
            map<Id,id> map1 = new map<Id,id>();
            map<id,account> accmap = new map<Id,account>();
            
            for(Opportunity opp:Trigger.New)
           {     
                 if(opp.StageName == 'Closed won')
                 {
                    map1.put(opp.id, opp.AccountId);
                 }
           }            
              for (account acc: [select id, closed_amount__c,(select Amount from opportunities where StageName='Closed Won') from account where id in :map1.values()]) 
              {
              double closedamount = 0;
              for (Opportunity opp : acc.opportunities) 
              {
                  closedamount += opp.Amount;
              }
               acc.closed_amount__c = closedamount; 
               accmap.put(acc.id, acc);
              }
            if (!accmap.isempty())
            {
              update accmap.values();
            }
        }
    }
}