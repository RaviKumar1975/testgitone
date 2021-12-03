public class AccountUtility
{
    public static void viewAnnualRevenue()
    {
        List<Account> accountslist = [SELECT Name, AnnualRevenue From Account];
        for(Account acc : accountslist)
        {
           string  acctRev= '<account name>: ' + acc.name + ',<annual revenue>: ' + acc.annualrevenue;
           System.debug(acctRev);
}
}
}