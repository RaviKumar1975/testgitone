public class ContactTriggerHandler 
 {
   public static void onafterInsert(List<Contact> newlist,Map<Id,Contact> newmap)
   {
       ContactTriggerHalper.afterInsert(newlist,newmap);
   }
   public static void onafterUpdate(List<Contact> newlist,Map<Id,Contact> newmap,List<Contact> oldlist,Map<Id,Contact> oldmap)
    {
         ContactTriggerHalper.afterUpdate(newlist,newmap,oldlist,oldmap);
    }
    public static void onafterDelete(List<Contact> oldlist,Map<Id,Contact> oldmap)
    {
        ContactTriggerHalper.afterDelete(oldlist,oldmap);
    }
}