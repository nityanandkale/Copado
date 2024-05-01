public class OrderSearchBatch implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Start method, return an empty query locator as we don't need to query any records
        return Database.getQueryLocator([SELECT Id FROM Account WHERE Id = null]);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        // Execute method, print "hello" to the debug log
        System.debug('hello');
    }

    public void finish(Database.BatchableContext BC) {
        // Finish method, optional
    }
}
