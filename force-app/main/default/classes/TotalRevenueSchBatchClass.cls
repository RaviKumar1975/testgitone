public class TotalRevenueSchBatchClass implements Schedulable
{
   public void execute (SchedulableContext SC){
         TotalRevenueBatchClass b1 = new  TotalRevenueBatchClass();
         database.executeBatch(b1);
      // string sch = '0 0 0 1 4 ?';
       //string sch = '0 0/2 0 ? * * *';
       //system.schedule ('Batch', sch, new TotalRevenueSchBatchClass());
    }

}