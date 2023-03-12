@isTest
public with sharing class TestRestrictContactByName {
    
    @isTest static void TestRestrictContactByName() {
        
        //add case with valid name
        Contact contact = new Contact(LastName='INVALIDNAME');
        insert contact;

        Test.startTest();
        Database.SaveResult result = Database.insert(contact, false);
        Test.stopTest();

        System.assert(
            !result.isSuccess()
        );

        //not valid name
        Contact contact2 = new Contact(LastName='INVALIDNAME_NOTVALID');
        insert contact2;
        Test.startTest();
        result = Database.insert(contact2, false);
        Test.stopTest();
        System.assert(
            result.isSuccess()
        );
    }
}