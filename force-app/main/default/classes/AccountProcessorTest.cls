@isTest
public class AccountProcessorTest {
    @isTest static void testCountContacts() {

        //add Account with multiple contacts
        Account accountInContext = new Account(Name='Jeremiahs Test Account');
        insert accountInContext;

        Contact c1 = new Contact(FirstName='Carl', LastName = 'heck', AccountId = accountInContext.Id);
        Contact c2 = new Contact(FirstName='Kyle', LastName = 'heck', AccountId = accountInContext.Id);
        Contact c3 = new Contact(FirstName='Sam', LastName = 'heck', AccountId = accountInContext.Id);
        insert c1;
        insert c2;
        insert c3;

        List<Id> aIds = new List<Id>();
        aIds.add(accountInContext.Id);

        Test.startTest();
        AccountProcessor.countContacts(aIds);
        Test.stopTest();
    } 

}