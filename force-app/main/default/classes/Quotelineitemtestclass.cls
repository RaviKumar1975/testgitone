@isTest
public class Quotelineitemtestclass
{    
    static Account account;
    static Opportunity opp;
    static product2 pro;
    static PricebookEntry pbe;
    static Quote quoe;
    static Quotelineitem qli;
 
 
     Static testMethod void insert1()
     {  
         
         account = Quotelinetestfactory.createAccounts(1)[0];
         insert account;
         system.debug('value of account insert case '+ account);
         
         opp = Quotelinetestfactory.createOpportunity(1,account.id)[0];
         insert opp;
         system.debug('value of account opp case '+ opp);
         
         
         pro = Quotelinetestfactory.createproduct2(1)[0];
         insert pro;
         system.debug('value of account pro case '+ pro);
         
         Id pb = Test.getStandardPricebookId();
         
         pbe = Quotelinetestfactory.createPricebookEntry(1, pro.id, pb)[0];
         insert pbe;
         system.debug('value of account pbe case '+ pbe);

         
         quoe= Quotelinetestfactory.createQuote(1, opp.id, pb)[0];
         insert quoe;
         system.debug('value of account quoe case '+ quoe);
         
         
         qli=Quotelinetestfactory.createQuotelineitem(1, quoe.Id , pro.id)[0];
         test.startTest();
         insert qli;
         test.stopTest();
         List<QuoteLineItem> countqls = [SELECT Id FROM QuoteLineItem WHERE QuoteId=:quoe.id];
         system.debug('value of countqls insert case '+ countqls);
        // System.assertEquals(2,countqls.size());
       }
     Static testMethod void update1()
     {  
         
         
         Account acc = New Account(Name = 'quotelineitemchecktest');
         insert acc;
         
         Opportunity opp =new Opportunity(name='quotelineitemchecktest', AccountId=acc.id, Account_value__c='345',CloseDate= Date.newInstance(2016, 2, 6),StageName='Prospecting');
         insert opp;
         
         
         product2 pro= new product2(Name='producttestcheck', maintenancetype__c='Hardware',productcode='HRM001');
         insert pro;
         
         Id pb = Test.getStandardPricebookId();
         
         PricebookEntry pbe = new PricebookEntry(Pricebook2Id = pb, product2id=pro.id,unitprice=1.0, isActive=true);
         insert pbe;

         
         Quote quo= new Quote(Name ='testcheck', OpportunityId=opp.id, Pricebook2Id = pb);
         insert quo;
         
         
         Quotelineitem q =new Quotelineitem(QuoteId=quo.Id, PricebookEntryId=Label.PricebookEntryId,Quantity=Integer.valueOf(2),UnitPrice=Integer.valueOf(50),product2id=pro.Id);
         insert q;         
         q.Quantity=Integer.valueOf(2);
         q.UnitPrice=Integer.valueOf(50);
         test.startTest();
         update q;
         test.stopTest();
         
         
        
     }
     Static testMethod void delete1()
     {  
         
         
         Account acc = New Account(Name = 'quotelineitemchecktest');
         insert acc;
         
         Opportunity opp =new Opportunity(name='quotelineitemchecktest', AccountId=acc.id, Account_value__c='345',CloseDate= Date.newInstance(2016, 2, 6),StageName='Prospecting');
         insert opp;
         
         
         product2 pro= new product2(Name='producttestcheck', maintenancetype__c='Hardware');
         insert pro;
         
         Id pb = Test.getStandardPricebookId();
         
         PricebookEntry pbe = new PricebookEntry(Pricebook2Id = pb, product2id=pro.id,unitprice=1.0, isActive=true);
         insert pbe;

         
         Quote quo= new Quote(Name ='testcheck', OpportunityId=opp.id, Pricebook2Id = pb);
         insert quo;
         
         
         Quotelineitem q =new Quotelineitem(QuoteId=quo.Id, PricebookEntryId=Label.PricebookEntryId,Quantity=Integer.valueOf(2),UnitPrice=Integer.valueOf(50),product2id=pro.Id);
         insert q;
        
         
         List<QuoteLineItem> countqls = [SELECT Id FROM QuoteLineItem WHERE QuoteId=:quo.id];
         system.debug('value of countqls '+ countqls);
        // System.assertEquals(2,countqls.size());
         test.startTest();
         delete q;
         test.stopTest();
         
        
     }
}