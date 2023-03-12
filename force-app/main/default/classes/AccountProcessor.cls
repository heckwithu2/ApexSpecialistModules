public with sharing class AccountProcessor {
    @future 
    public static void countContacts(List<Id> accountIds) {

        List<Account> accountstoUpdateBulkified = new List<Account>();

        List<Account> relatedAccounts = [
            SELECT Id, Name, (Select Id from Contacts) FROM Account 
            WHERE Id = : accountIds];
        
        for(Account acc: relatedAccounts) {
            List<Contact> contactList = acc.Contacts;
            acc.Number_Of_Contacts__c = contactList.size();
            accountstoUpdateBulkified.add(acc);
        }   

        update accountstoUpdateBulkified;
    }
}