trigger leavetask2 on Leave__c(before insert, before update) 
{
      for(Leave__c l:Trigger.New)
      {
          if(Trigger.isbefore)
          {
              if(Trigger.isInsert)
              {
                  if(l.DateFrom__c== null && l.status__c== null )
                  {
                      l.DateFrom__c= date.today();
                      l.status__c= 'Requested';
                  }
              }
              if(Trigger.isUpdate)
              {
                  if(l.DateFrom__c== null && l.status__c== null )
                  {
                      l.DateFrom__c= date.today();
                      l.status__c= 'Requested';
                  }
              }
          }
          
      }

}