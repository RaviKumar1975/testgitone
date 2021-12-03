public class ContactSearch 
{
      public static List<Contact> searchForContacts(string lastName, string  mailingpostalcode  )
      {
         List<contact> con=[select id,name from contact where lastName=:lastName and MailingPostalCode=:mailingpostalcode];
          return con;
      }
    

}