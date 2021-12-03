public class QuoteLineItemHelpertask1 
{
    public static void rollUpValuesOnQuote(List<QuoteLineItem> newlist)
    {
         system.debug('trigger value2'+newlist);
        set<id> quoteid = new set<id>();
        List<QuoteLineItem> insertqli = new List<QuoteLineItem>();
        
        Map<Id,QuoteLineItem> quotetoqli = new Map<Id,QuoteLineItem>();
        List<QuoteLineItem> qlitoUpdate = new List<QuoteLineItem>();
        
        for(QuoteLineItem qt : newlist)
        {
            quoteid.add(qt.QuoteId);
        }
        for(Quote qt:[select id,email,(select quoteId,totalprice,unitprice,product2.Id,product2.productcode,product2.maintenancetype__c from QuoteLineItems)from Quote where id IN:quoteid])
        {
            double maintancecost;
            double totalprice=0;
            for(QuoteLineItem qlitem:qt.QuoteLineItems)
            {
                if (qlitem.product2.maintenancetype__c == 'Hardware') {
                    totalprice+=qlitem.totalprice;
                }
                
                if (qlitem.product2.productcode=='HRM001') 
                {
                    quotetoqli.put(qlitem.quoteId,qlitem);
                }
            }
            
            if (quotetoqli.containskey(qt.Id) && totalprice>0) 
            {
                QuoteLineItem qli = quotetoqli.get(qt.Id);
                qli.unitprice = (totalprice *18)/100;
                qlitoUpdate.add(qli);
                
                system.debug('value of qlitoUpdate'+ quotetoqli);
                
            }
            else if (totalprice>0 && !quotetoqli.containskey(qt.Id)) 
            {
                QuoteLineItem qtl= new QuoteLineItem();
                qtl.QuoteId=qt.Id;
                qtl.Product2Id=Label.idoffproduct;
                qtl.PricebookEntryId=Label.PricebookEntryId;
                qtl.Quantity=1;
                qtl.UnitPrice= (totalprice *18)/100;
                system.debug('value is UnitPrice'+qtl.UnitPrice);
                insertqli.add(qtl);
            }
            
        }
        if (!insertqli.isEmpty())
        {
            insert insertqli;
        }
        
        if (!qlitoUpdate.isEmpty())
        {
            Update qlitoUpdate;
        }
        
    }
  public static void rollUpValuesOnQuote1(List<QuoteLineItem> newlist,Map<Id,QuoteLineItem> newmap,List<QuoteLineItem> oldlist,Map<Id,QuoteLineItem> oldmap)
         {
        
        system.debug('helper value is'+newlist);
        set<id> quoteid = new set<id>();
        Map<Id,QuoteLineItem> quotetoqli = new Map<Id,QuoteLineItem>();
        List<QuoteLineItem> qlitoUpdate = new List<QuoteLineItem>();
        
        for(QuoteLineItem qt : newlist)
        {  
            QuoteLineItem qltt = oldmap.get(qt.id);
            if (qltt.UnitPrice != qt.unitprice || qltt.Quantity != qt.quantity) 
            {
                quoteid.add(qt.QuoteId);
                system.debug('value iss quoteid' +quoteid);  
            }
            
        }
        for(Quote qt:[select id,email,(select quoteId,totalprice,unitprice,product2.Id,product2.productcode,product2.maintenancetype__c from QuoteLineItems)from Quote where id IN:quoteid])
        {
            double maintancecost;
            double totalprice=0;
            for(QuoteLineItem qlitem:qt.QuoteLineItems)
            {
                if (qlitem.product2.maintenancetype__c == 'Hardware') {
                    totalprice+=qlitem.totalprice;
                }
                system.debug('value iss totalprice' +totalprice);
                if (qlitem.product2.productcode=='HRM001') {
                    quotetoqli.put(qlitem.quoteId,qlitem);
                }
            }
            
            if (quotetoqli.containskey(qt.Id) && totalprice>0)
            {
                QuoteLineItem qli = quotetoqli.get(qt.Id);
                qli.unitprice = (totalprice *18)/100;
                qlitoUpdate.add(qli);
                system.debug('value iss unitprice' +qli.unitprice);
            }
            
            
            
            if (!qlitoUpdate.isEmpty())
            {
                Update qlitoUpdate;
            }
        }
    }
    public static void rollUpValuesOnQuote2(List<QuoteLineItem> newlist, Map<Id,QuoteLineItem> newmap, List<QuoteLineItem> oldlist, Map<Id,QuoteLineItem> oldmap)
    {
        system.debug('value'+ oldlist);
        set<id> quoteid = new set<id>();
        list<QuoteLineItem> quoteid1 = new list<QuoteLineItem>();
        List<QuoteLineItem> insertqli = new List<QuoteLineItem>();
        
        Map<Id,QuoteLineItem> quotetoqli = new Map<Id,QuoteLineItem>();
        List<QuoteLineItem> qlitoUpdate = new List<QuoteLineItem>();
        
        for(QuoteLineItem qt : oldlist)
        {
            quoteid.add(qt.QuoteId);
        }
        for(Quote qt:[select id,email,(select quoteId,totalprice,unitprice,product2.Id,product2.productcode,product2.maintenancetype__c from QuoteLineItems)from Quote where id IN:quoteid])
        {
            double maintancecost;
            double totalprice=0;
            QuoteLineItem maintanceproduct;
            List<id> qll1 = new List<id>();
            list<id> map2 = new list<id>(); 
            for(QuoteLineItem qlitem:qt.QuoteLineItems)
            {
                
                if (qlitem.product2.maintenancetype__c == 'Hardware') {
                    totalprice+=qlitem.totalprice;
                }
                
                if (qlitem.product2.productcode=='HRM001') {
                    quotetoqli.put(qlitem.quoteId,qlitem);
                    maintanceproduct= qlitem;
                    
                }
                
                if(qlitem.product2.maintenancetype__c == 'Hardware')
                {
                    qll1.add(qlitem.Id); 
                }
                
                
            }
            
            if (quotetoqli.containskey(qt.Id) && totalprice>0) 
            {
                QuoteLineItem qli = quotetoqli.get(qt.Id);
                qli.unitprice = (totalprice *18)/100;
                qlitoUpdate.add(qli);
                
            }
            
            
            if(qll1.size()==0 && quotetoqli.containskey(qt.Id))
            {
                quoteid1.add(quotetoqli.get(qt.Id));      
            }
            
        }
        
        if (!quoteid1.isEmpty())
        {
            delete quoteid1;
        }
        
        if (!qlitoUpdate.isEmpty())
        {
            Update qlitoUpdate;
        }  
        
    }
    
}