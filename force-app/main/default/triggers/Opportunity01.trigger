trigger Opportunity01 on Opportunity (before update) {
 
   Map<Id,string> mp = new Map<id,String>();    
   Map<id,Id> mpOpTOAcco = new Map<id,id>();
   Set<id>  ad = new Set<id>(); 
   Set<id>  ad1 = new Set<id>();    
  for(opportunity o:trigger.new){ 
    if(o.StageName == 'Closed won')
    {
        ad.add(o.Accountid);  
    }
  }
   for(Account aa:[select Id,Match_Billing_Address__c from Account where Id IN :ad and Match_Billing_Address__c=false])
   {
      ad1.add(aa.id); 
   }
    for(Opportunity opp: trigger.new ){
      if(ad1.contains(opp.AccountId)){
        opp.addError('check');  
      }
  }
}