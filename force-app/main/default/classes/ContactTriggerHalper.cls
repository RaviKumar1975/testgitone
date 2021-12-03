public class ContactTriggerHalper 
{
    public static void afterInsert(List<Contact> newlist,Map<Id,Contact> newmap)
    {
        set<id>st=New set<id>();
    List<Account>lt=New  List<Account>();
    for(contact con:newlist)
    {
        st.add(con.AccountId);
    }
  for(Account acc:[select id,name,No_of_contacts1__c,(select id from contacts)from Account where id IN:st])
  {
      String str = string.valueOf(acc.contacts.size());
      acc.No_of_contacts1__c =str;
       lt.add(acc);
      
  }
    update lt;
 }
    
    public static void afterUpdate(List<Contact> newlist,Map<Id,Contact> newmap,List<Contact> oldlist,Map<Id,Contact> oldmap)
    { 
        set<id>st=New set<id>();
          List<Account>lt=New  List<Account>();
    for(contact con:oldlist)
    {
        st.add(con.AccountId);
    }
  for(Account acc:[select id,name,No_of_contacts1__c,(select id from contacts)from Account where id IN:st])
  {
      String str = string.valueOf(acc.contacts.size());
      acc.No_of_contacts1__c =str;
      lt.add(acc);
      
  }
    update lt;
 }

    
    public static void afterDelete(List<Contact> oldlist,Map<Id,Contact> oldmap)
    {
        set<id>st=New set<id>();
        List<Account>lt=New  List<Account>();
            
    for(contact con:oldlist)
    {
        contact con1 = oldMap.get(con.Id);
        if(con.AccountId != con1.AccountId && con.AccountId != Null)
        {
            st.add(con.AccountId);
            st.add(con1.AccountId);
        }
    }
  for(Account acc:[select id,name,No_of_contacts1__c,(select id from contacts)from Account where id IN:st])
  {
      String str = string.valueOf(acc.contacts.size());
      acc.No_of_contacts1__c =str;
       lt.add(acc);
   }
    update lt; 
        }
    }