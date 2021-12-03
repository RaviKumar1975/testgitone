trigger accounttask3 on Account (before insert, before update)
{       
    for(Account acc:Trigger.new)
      {
        if(trigger.isbefore)
        {
            if(trigger.isinsert)
            {  
               
                    if(acc.CopyBillingAddress__c == True)
                    {
                        
                         acc.ShippingCity = acc.BillingCity; 
			             acc.ShippingCountry = acc.BillingCountry;
			             acc.ShippingPostalCode = acc.BillingPostalCode;
			             acc.ShippingState = acc.BillingState;
			             acc.ShippingStreet = acc.BillingStreet;
                    }
                 }
                    if(trigger.isUpdate)
                     {  
                
                    if(acc.CopyBillingAddress__c == True)

                     {
                        
                         acc.ShippingCity = acc.BillingCity; 
			             acc.ShippingCountry = acc.BillingCountry;
			             acc.ShippingPostalCode = acc.BillingPostalCode;
			             acc.ShippingState = acc.BillingState;
			             acc.ShippingStreet = acc.BillingStreet;
                     }
                }
             
            }
                
     }
}