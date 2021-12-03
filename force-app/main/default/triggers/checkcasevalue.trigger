trigger checkcasevalue on Case (after update)
{
    set<Id> setId = new set<Id>();
    list<string> lt= new list<string>();
    for(case cs1:Trigger.new)
    {
        Case cs = trigger.oldmap.get(cs1.id);
        if(cs1.status!=cs.status)
        {
            setId.add(cs1.Id);
        }
    }
    list<case> cslist= new list<case>();
    for(Case con:[select id,status,Total_Time__c,timestorevalue__c from case where id IN:setId])
    {
        if(con.Total_Time__c==null)
        {
            con.Total_Time__c = system.now();
            cslist.add(con);
        }
        else if(con.Total_Time__c!=null)
        {
            con.start_date__c=con.Total_Time__c;
            con.Total_Time__c = system.now();
            cslist.add(con);
        }
        system.debug('time is'+ con.Total_Time__c);
        long dt=con.Total_Time__c.getTime()-con.start_date__c.getTime();
        System.debug('seconds --'+dt);
        long millseconds = dt/1000;
        Integer min = Integer.valueof(millseconds/60);
        System.debug('min --'+min );
        Integer hour = min/60;
        System.debug('hour --'+hour);
        String datevalue= hour+':'+min;
        System.debug('datevalue --'+datevalue );
        con.timestorevalue__c=datevalue;
        System.debug('timestore__c --'+con.timestorevalue__c ); 
    }
    update cslist;
    
    list<Case_Tracking__c> cts=new list<Case_Tracking__c>();
    Case_Tracking__c cstt =new Case_Tracking__c();
    for(case cs:[select id,timestorevalue__c from case where id IN:setId])
    {
        system.debug('value of all record'+cs);
        cstt.Caseid__c=cs.id; 
        cstt.time_case1__c=cs.timestorevalue__c;
        cstt.value__c=trigger.oldmap.get(cs.id).Status;
        cts.add(cstt);
        system.debug('value of cts '+cts);
    }
    insert cts;
    
}