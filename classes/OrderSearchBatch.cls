public class OrderSearchBatch implements Database.Batchable<sObject> {
    private Integer searchKey;
    private Decimal paymentAmount;

    // Constructor to accept String for searchKey and convert it to Integer
    public OrderSearchBatch(String searchKeyStr, Decimal paymentAmount) {
        // Apex does not throw NumberFormatException, so we use regular expression to validate
        if (searchKeyStr.isNumeric()) {
            this.searchKey = Integer.valueOf(searchKeyStr); // Convert String to Integer
        } else {
            // If the input is not numeric, we handle it by setting a default or throwing an exception
            throw new IllegalArgumentException('Invalid search key format. Must be a numeric value.');
        }
        this.paymentAmount = paymentAmount;
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        // Assuming the field Quantity__c is a numerical field in Order__c custom object
        String queryString = 'SELECT Id, Name FROM Order__c WHERE Quantity__c = :searchKey';
        return Database.getQueryLocator(queryString);
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        // Example execution logic for Order__c records
        
