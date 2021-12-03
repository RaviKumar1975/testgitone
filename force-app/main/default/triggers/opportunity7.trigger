trigger opportunity7 on Opportunity (after insert, after delete)
{
    if(Trigger.isafter)
    {
        if(Trigger.isinsert)
        {   
            map<List<String>,string> map1 = new map<List<String>,string>(); 
            List<List<String>> contactvsid = new List<List<String>>();   
            List<OpportunityContactRole> opportunitycontactrole = new List<OpportunityContactRole>();
            
            for(Opportunity opp : Trigger.new)
            {  
                if(opp.email_with_name__c != null)
                {
                    String[] str = opp.email_with_name__c.split(',');
                    contactvsid.add(str);
                }
            }
            integer i=0; 
            for(Contact con:[select id, name ,email from contact])
            {
                if(con.name != null && con.email != null)
                {
                    list<String> strlist=contactvsid.get(i);
                    if(strlist.contains(con.name)  && strlist.contains(con.Email))
                    {
                        map1.put(strlist,con.id);
                        i++;
                    }
                }
            }
            for(Opportunity opp : trigger.new)
            {  
                for(List<String> StrList:map1.keySet())
                {
                   if(opp.email_with_name__c != null)
                   {
                       String[] str= opp.email_with_name__c.split(',');
                   
                      if(StrList[0].contains(str[0]) &&   StrList[1].contains(str[1]))
                       {
                            
                             OpportunityContactRole ocr = new OpportunityContactRole();
                             ocr.ContactId=map1.get(strlist);
                             ocr.OpportunityId=opp.id;
                             opportunitycontactrole.add(ocr);                           
                       }
                   }
                } 
           }
            insert opportunitycontactrole;
        }
    }
}