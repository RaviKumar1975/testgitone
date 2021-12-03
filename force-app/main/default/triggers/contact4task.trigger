trigger contact4task on Contact (after insert,after Update,after delete) 
{    
    
    if(Trigger.isafter)
    {
        if(Trigger.isInsert)
        {
           map<id,id>map1 = new map<id,id>();
           list<contact> lt1=new list<contact>(); 
           Set<Id> accountIds = new Set<Id>();
      List<Account> updatedAccounts = new List<Account>();
      for (Contact c : Trigger.new) 
      {
        accountIds.add(c.AccountId);
         map1.put(c.id,c.AccountId);
           
      }
            system.debug('hello'+ map1);
  
      Map<Id,Account> accountMap = new Map<Id,Account>([Select Id, New_primary_contact__c,old_primary_contact__c, (Select Id, Name from Contacts where primary__c = true) from Account where Id in :accountIds]);
     
            for(Account acc:accountMap.values())
            {
                for(Contact con:acc.contacts)
                {
                  if(!map1.containskey(con.Id))
                  {
                    con.primary__c = false; 
                     lt1.add(con);
                       system.debug('hello1');
                  }
                }
            }
            update lt1;
                
     for (Contact c : Trigger.new) 
      {
        if (c.primary__c ) 
        {
             system.debug('hello2');
            Account updAccount = accountMap.get(c.AccountId);
            
           if (updAccount.Contacts != null && updAccount.Contacts.size()>0) 
            {
                if(updAccount.New_primary_contact__c==null)
                {
                 updAccount.New_primary_contact__c = c.Id; 
                 updatedAccounts.add(updAccount);
                }
                else if(updAccount.New_primary_contact__c != null)
                {
                  updAccount.Old_Primary_Contact__c = updAccount.New_Primary_Contact__c;
                  updAccount.New_Primary_Contact__c = c.Id; 
                  updatedAccounts.add(updAccount);
                 
                }
            }
         }
      }
       update updatedAccounts;     
  } 
}
    
     
        if(Trigger.isUpdate)
        {
          map<id,id>map1= new map<id,id>();
           list<contact> lt1=new list<contact>(); 
           Set<Id> accountIds = new Set<Id>();
           List<Account> updatedAccounts = new List<Account>();
      for (Contact c : Trigger.new) 
      { 
              accountIds.add(c.AccountId);
              map1.put(c.id,c.AccountId);
      }
  
      Map<Id,Account> accountMap = new Map<Id,Account>([Select Id, New_primary_contact__c,old_primary_contact__c, (Select Id, Name from Contacts where primary__c = true) from Account where Id in :accountIds]);
     
            for(Account acc:accountMap.values())
            {
                for(Contact con:acc.contacts)
                {
                  if(!map1.containskey(con.Id))
                  {
                    con.primary__c = false; 
                     lt1.add(con);
                  }
                }
            }
            update lt1;
                
     for (Contact c : Trigger.new) 
      {
          Account updAccount = accountMap.get(c.AccountId);
            if(c.primary__c == false)
                {
                  updAccount.New_Primary_Contact__c = null; 
                  updatedAccounts.add(updAccount);
                }
          
            if (c.primary__c) 
          {
             if (updAccount.Contacts != null && updAccount.Contacts.size()>0)
            {
                if(updAccount.New_primary_contact__c==null)
                {
                     updAccount.New_primary_contact__c = c.Id; 
                     updatedAccounts.add(updAccount);
                }
                else if(updAccount.New_primary_contact__c != null)
                {
                      string str= updAccount.New_Primary_Contact__c;
                      updAccount.Old_Primary_Contact__c = str;
                      updAccount.New_Primary_Contact__c = c.Id; 
                      updatedAccounts.add(updAccount);
                 }
             }
         }
      }
        update updatedAccounts;   
    }
      
  
 if(Trigger.isdelete)
        {
            map<id,id>map1= new map<id,id>();
           list<contact> lt1=new list<contact>(); 
           Set<Id> accountIds = new Set<Id>();
           List<Account> updatedAccounts = new List<Account>();
      for (Contact c : Trigger.old) 
      {
          
              accountIds.add(c.AccountId);
              map1.put(c.id,c.AccountId);
      }
  
           Map<Id,Account> accountMap = new Map<Id,Account>([Select Id, New_primary_contact__c,old_primary_contact__c, (Select Id, Name from Contacts where primary__c = true) from Account where Id in :accountIds]);
      
         for (Contact c : Trigger.old) 
      {
          Account updAccount = accountMap.get(c.AccountId);
            
            if (c.primary__c) 
          {
             if (updAccount.Contacts != null && updAccount.Contacts.size()>0)
            {
                if(updAccount.New_primary_contact__c==null)
                {
                     updAccount.New_primary_contact__c = null; 
                     updatedAccounts.add(updAccount);
                }
                else if(updAccount.New_primary_contact__c != null)
                {
                      string str= updAccount.New_Primary_Contact__c;
                      updAccount.Old_Primary_Contact__c = str;
                      updAccount.New_Primary_Contact__c = null; 
                      updatedAccounts.add(updAccount);
                 }
             }
         }
      }
        delete updatedAccounts;   
}
}