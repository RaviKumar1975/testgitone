public class AccountAllRecordControler
{
    @AuraEnabled
    public static List<Account> getAccountlist()
    {
        List<Account> acc =  new list<Account>([select Id,Name, Phone, Type from Account]);
        return  acc;
    }

}