trigger emptask4 on Employee__c (before insert)
{
   date dob = system.today();
    if(trigger.isbefore){
        if(trigger.isinsert){
            for(Employee__c a : trigger.new){
                if(a.Dob__c.month() > dob.month()){
                    a.Age__c = dob.year() - a.Dob__c.year()  - 1;
                }
                else if(a.Dob__c.month() < dob.month()){
                    a.Age__c = dob.year() - a.Dob__c.year();
                }
                else if(a.Dob__c.month() == dob.month()){
                    if(a.Dob__c.day() > dob.day()){
                        a.Age__c =dob.year() - a.DOB__c.year() - 1;
                    }
                    else if(a.Dob__c.day() <= dob.day()){
                        a.Age__c = dob.year() - a.Dob__c.year();
                    }
                }
            }
        }
    }
 }