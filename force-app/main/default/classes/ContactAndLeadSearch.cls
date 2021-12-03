public class ContactAndLeadSearch {

public static List<List<SObject>> searchContactsAndLeads(String param)
{
    Contact a = new Contact();
    a.LastName='Smith';
    insert a;

    Lead b = new Lead();
    b.LastName='Smith';
    b.Company='jff';
    insert b;

    List<List<SObject>> retval = [FIND 'Smith' IN ALL FIELDS RETURNING Contact(Name, LastName, FirstName where LastName=:param or FirstName=:param), Lead(Name, LastName, FirstName where LastName=:param or FirstName=:param)];
    return retval;
}
}