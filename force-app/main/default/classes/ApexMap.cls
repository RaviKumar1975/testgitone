public class ApexMap {
    public static void Maptest() {  
        Map < String, String > studDept = new Map < String, String > ();    
        studDept.put('D01', 'CSE');  
        system.debug(studDept);    
        studDept.put('D02', 'CIVIL');  
        studDept.put('D03', 'MECH');  
        studDept.put('D04', 'EEE'); 
        system.debug(studDept);
        system.debug('get(D01) - Department is: ' + studDept.get('D01'));    
        system.debug('Department keyset() are : ' + studDept.keyset());  
        system.debug('Department values() are : ' + studDept.values());  
        Integer s = studDept.size();  
        system.debug('size() - Department Map Size : ' + s);  
    }

}