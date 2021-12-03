/*Create a custom validation  error using trigger on opportunity object -
If opportunity stage is marked as closed won and the related account on opportunity do not have any contact related to it
 , It should show error that "You cannot close the opportunity as there in no contact linked to the account "*/
 
trigger opportunity02 on Opportunity (before insert,before update) {
    
    set<id>ad=new set<id>();
    set<id>ad1=new set<id>();
    for(opportunity opp:trigger.new){ 
    if(opp.StageName == 'Closed won')
    {
        ad.add(opp.Accountid);  
    }
  }
   for(contact a:[select id from contact Where AccountId IN:ad])
   {
      ad1.add(a.id); 
   } 
    for(opportunity opp1:trigger.new){ 
    if(ad1.size()==0)
    {
        opp1.addError('You cannot close the opportunity as there in no contact linked to the account');  
    }

}
}