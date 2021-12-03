@IsTest
public class AddPrimaryContactTest {
    
    @IsTest
    public static void testing() {
        List<account> acc_lst = new List<account>();
          for(Integer i=0;i<50;i++)
         {
             acc_lst.add(new Account(BillingState = 'CA', name = 'Test'+i));
         }
         for(Integer j=0;j<50;j++)
         {
             acc_lst.add(new Account(BillingState = 'NY', name = 'Test'+j));
         }    
        insert acc_lst;
        Test.startTest();
        contact c = new contact(lastname='alex');
        AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
        system.debug('apc = '+apc);
        System.enqueueJob(apc);
        Test.stopTest();
        List<contact> c_lst = new List<contact>([select id from contact]);
        Integer size = c_lst.size();
        system.assertEquals(50, size);
    }

}