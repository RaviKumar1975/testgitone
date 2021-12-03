public class AccountHandler
{
    public static  void insertAccount(Integer v)
    {
        integer n=1;
        List<Account> addAccounts = New List<Account>();
         while(n <= v)
         {
             Account store = new Account();
             store.Name = 'Acme Inc ' + n;
            store.AccountNumber = '35629' + n;
            addAccounts.add(store);
             n=n+1;
             
         }
        insert addAccounts;

}
}