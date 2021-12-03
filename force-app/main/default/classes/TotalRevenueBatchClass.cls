public class TotalRevenueBatchClass implements 
Database.Batchable<sObject>, Database.Stateful
{
    public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select id, Total_Revenue__c,Total_New_buisness__c,TotalRenewal_amount__c,TotalUpsell_amount__c,(select id,StageName,UpsellAmount_c__c,RenewalAmount_c__c,Type,NewBusiness_c__c from Opportunities) from Account');
        
    }
    public void execute(Database.BatchableContext bc, List<Account> scope)
    {   
          system.debug('check acc1.Opportunities------- '+scope);
        integer avv4=0;
        List<Account> acc =  new List<Account>();
        for(Account acc1:scope)
        {
            system.debug('check acc1.Opportunities------- '+acc1.Opportunities);
            integer avv1=0,avv2=0,avv3=0;  
            for(Opportunity opp: acc1.Opportunities)
            {
               
                if(opp.StageName =='Closed Won') 
                {
                    if(opp.Type=='Renewal')
                    { 
                        avv1=avv1+Integer.valueOf(opp.RenewalAmount_c__c);
                        
                    }
                   
                    
                    if(opp.Type=='Upsell') 
                    {
                        avv2=avv2+Integer.valueOf(opp.UpsellAmount_c__c);
                       
                    }
                    
                    if(opp.Type=='New Business') 
                    {
                        avv3=avv3+Integer.valueOf(opp.NewBusiness_c__c);
                        
                    }
                    
                }
                
               
             recordsProcessed = recordsProcessed + 1;
            }
            
            acc1.TotalRenewal_amount__c=avv1;
            acc1.TotalUpsell_amount__c=avv2;
            acc1.Total_New_buisness__c=avv3;
            acc.add(acc1);
            avv4= Integer.valueOf(acc1.TotalRenewal_amount__c)+Integer.valueOf(acc1.Total_New_buisness__c)+Integer.valueOf(acc1.TotalUpsell_amount__c);
            acc1.Total_Revenue__c=avv4;   
           system.debug('value idTotalRenewal_amount__c '+acc1.TotalRenewal_amount__c);
           system.debug('value acc1.Total_Revenue__c '+acc1.Total_Revenue__c);
            }
        
        update acc;
        
    }    
    public void finish(Database.BatchableContext bc)
    {
        System.debug(recordsProcessed + ' records processed.ravi');
        
    }   
}