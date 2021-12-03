public class QuoteLineItemtask1 
{
    public static void onAfterInsert(List<QuoteLineItem> newlist)
    {
          QuoteLineItemHelpertask1.rollUpValuesOnQuote(newlist);
     }
    public static void onAfterUpdate(List<QuoteLineItem> newlist,Map<Id,QuoteLineItem> newmap,List<QuoteLineItem> oldlist,Map<Id,QuoteLineItem> oldmap)
    {
        
          
         QuoteLineItemHelpertask1.rollUpValuesOnQuote1(newlist,newmap,oldlist,oldmap);
         
     }   
    public static void onAfterDelete(List<QuoteLineItem> oldlist,Map<Id,QuoteLineItem> oldmap)
  {
     
         QuoteLineItemHelpertask1.rollUpValuesOnQuote2(null,null,oldlist,oldmap);
   }

}