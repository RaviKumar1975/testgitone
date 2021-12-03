public class PropertyUtility
{
     public static void newListedProperties()
     {
        List<Property__c> newPropList = [SELECT Name, Broker__r.Email__c FROM Property__c WHERE Days_On_Market__c<=30];
      for(Property__c pty : newPropList)
        {
             String propEmail = (pty.Name + ' : ' + pty.Broker__r.Email__c);
             system.debug(propEmail);
 }
     }
}