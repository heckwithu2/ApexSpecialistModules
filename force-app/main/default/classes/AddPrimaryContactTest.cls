@isTest
public with sharing class AddPrimaryContactTest {
    public AddPrimaryContactTest() {

    }

    @isTest
    static void testQueable(){
        List<Account> accounts = new List<Account>();
        for (Integer i=0; i<500; i++) {
            Account acc = new Account(name='Test Account');

            if (i <250) {
                acc.BillingState = 'NY';
            }else {
                acc.BillingState = 'CA';
            }

            accounts.add(acc);
        }
        insert accounts;

        Contact contact = new Contact(Firstname='Jeremiah', LastName='Heck');
        insert contact;

        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        List<Contact> contactsCheck = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(200, contactsCheck.size());
    }
}