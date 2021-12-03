public class Quotelinetestfactory
{    
    //Id pb = Test.getStandardPricebookId();
    // Account
     public static List<Account> createAccounts( Integer numberOfAccounts) 
     {
        List<Account> accounts = new List<Account>();
        for ( Integer i = 0 ; i < numberOfAccounts ; i++ ) {
            
            Account account = new Account( Name = 'Test Account' + Math.random());
            accounts.add( account);
        }
        return accounts;
     }
    
    //OPPORTUNINTY
     public static List<Opportunity> createOpportunity( Integer numberOfOpportunity, id acc) 
     {
        List<Opportunity> OPP = new List<Opportunity>();
        for ( Integer i = 0 ; i < numberOfOpportunity ; i++ ) 
        {
            
            Opportunity OPP1 = new Opportunity( Name = 'Test Opportunity' + Math.random(), AccountId=acc, Account_value__c='345',CloseDate= Date.newInstance(2016, 2, 6),StageName='Prospecting');
            OPP.add( OPP1);
        }
        return OPP;
     }
    
    //product
     public static List<product2> createproduct2( Integer numberOfproduct2) 
     {
        List<product2> OPP6 = new List<product2>();
        for ( Integer i = 0 ; i < numberOfproduct2 ; i++ ) 
        {
            product2 OPP1 = new product2( Name='producttestcheck', maintenancetype__c='Hardware');
            OPP6.add( OPP1);
        }
        return OPP6;
     }
    
    //PricebookEntry
     public static List<PricebookEntry> createPricebookEntry( Integer numberOfPricebookEntry, id acc1,id pb) 
     {
        List<PricebookEntry> OPP = new List<PricebookEntry>();
        for ( Integer i = 0 ; i < numberOfPricebookEntry ; i++ ) 
        {
            
            PricebookEntry OPP1 = new PricebookEntry(Pricebook2Id = pb, product2id=acc1,unitprice=1.0, isActive=true);
            OPP.add( OPP1);
        }
        return OPP;
     }
    
    //Quote
     public static List<Quote> createQuote( Integer numberOfQuote, id opp,id pb) 
     {
        List<Quote> OPP2 = new List<Quote>();
        for ( Integer i = 0 ; i < numberOfQuote ; i++ ) 
        {
            
            Quote OPP1 = new Quote(Name ='testcheck', OpportunityId=opp, Pricebook2Id = pb);
            OPP2.add( OPP1);
        }
        return OPP2;
     }
    
    //Quote
     public static List<Quotelineitem> createQuotelineitem( Integer numberOfQuotelineitem, id quo, id pro) 
     {
        List<Quotelineitem> OPP2 = new List<Quotelineitem>();
        for ( Integer i = 0 ; i < numberOfQuotelineitem ; i++ ) 
        {
            
            Quotelineitem OPP1 = new Quotelineitem(QuoteId=quo, PricebookEntryId=Label.PricebookEntryId,Quantity=Integer.valueOf(2),UnitPrice=Integer.valueOf(50),product2id=pro);
            OPP2.add( OPP1);
        }
        return OPP2;
     }
}