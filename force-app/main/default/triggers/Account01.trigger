trigger Account01 on Account (before insert) {
    
    set<id>st=new set<id>();
    set<id>st1=new set<id>();
    for(Account acc:trigger.new){ 
	       st.add(acc.Id);   
  }
    for(contact a:[select id from contact Where AccountId IN:st])
   {
      st1.add(a.id); 
   } 
          
  
 }