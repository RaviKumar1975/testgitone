trigger opportunity8 on Opportunity (after insert)
{
     if(Trigger.isafter)
    {
        if(Trigger.isinsert)
        {   
            map<string, id> map1 = new map<string, id>(); 
            map<String,string> contactvsid = new map<String,string>();   
            List<OpportunityContactRole> opportunitycontact = new List<OpportunityContactRole>();
            
            for(Opportunity opp : Trigger.new)
            {  
                if(opp.email_with_name__c != null)
                {
                     String[] str = opp.email_with_name__c.split(',');
                     String name= str[0];
                     String email=  str[1];
                     contactvsid.put(email,name);
                    system.debug('contactvsid'+ contactvsid);
                }
            }
             
           for(Contact con:[select id, name ,email from contact where email IN:contactvsid.keySet() AND name IN:contactvsid.values()])
            {   
                system.debug('con'+ con);
                if(con.name != null && con.email != null)
                {
                    string str = con.name +','+ con.Email;
                    map1.put(str, con.id);
                    system.debug('map1'+ map1);
                }
            }
            
            for(Opportunity opp : trigger.new)
            {  
                
                if(map1.containsKey(opp.email_with_name__c))
                {    
                           OpportunityContactRole ocr = new OpportunityContactRole();
                            ocr.ContactId=map1.get(opp.email_with_name__c);
                             ocr.OpportunityId=opp.id;
                             opportunitycontact.add(ocr);                           
                       }
                   }
                     insert opportunitycontact;
                } 
                 
        }

}