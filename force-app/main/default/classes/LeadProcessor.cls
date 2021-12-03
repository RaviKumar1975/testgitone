public class LeadProcessor implements 
Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
       // system.debug('value of Database.getQueryLocator'+ Database.getQueryLocator);
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
        system.debug('value of scope'+ scope.size());
        for (Lead lead : scope) {
            
                lead.LeadSource = 'Dreamforce';
                
                recordsProcessed = recordsProcessed + 1;
   
        }
        update leads;
    }    

        public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. ravi');
        
    }    
}