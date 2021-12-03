@isTest
public class TotalRevenueBatchTestClass
{ 
    public static String CRON_EXP = '* 4/1 * ? * * *';
 @testSetup    
     static void setup()
    {
        Account acc = new Account(name='ravipannu');
        insert acc;
        List<Opportunity> acc_lst = new List<Opportunity>();
        for(Integer i=0;i<100;i++)
        {
            acc_lst.add(new Opportunity(name='test'+i,AccountId=acc.id, Account_value__c='345',CloseDate= Date.newInstance(2016, 2, 6),RenewalAmount_c__c=300,Type='Renewal',StageName='Closed Won'));
        }
        insert acc_lst;  
        system.debug('value of accouacc_lstnt'+acc_lst.size());
        
        
    }
    static testmethod void test() 
    {  
        Test.startTest();
        //TotalRevenueBatchClass lp = new TotalRevenueBatchClass();
        //Id batchId = Database.executeBatch(lp);
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new TotalRevenueSchBatchClass());
        Test.stopTest();
        System.assertEquals(100, [select count() from Opportunity]);
    }
    
}