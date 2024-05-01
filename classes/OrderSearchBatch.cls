public class OrderSearchBatch implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Start method, return the query locator
        return Database.getQueryLocator([
            SELECT Id, Name 
            FROM Order__c 
            WHERE Quantity__c = 10 // Example search key
        ]);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        // Execute method, print "hello" to the debug log
        System.debug('hello');

        // Your logic to process each batch of records goes here
    }

    public void finish(Database.BatchableContext BC) {
        // Finish method, optional
    }
}
