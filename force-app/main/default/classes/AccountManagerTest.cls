@isTest
public with sharing class AccountManagerTest {
    
    @isTest
    static void testGetMethod() {
        Account a = new Account(name='Jeremiahs beans');
        insert a;
        Contact c = new Contact(AccountId=a.Id, FirstName='Jeremiah',LastName='Heck');
        insert c;

        RestRequest request = new RestRequest();
        request.requestURI = 'https://ncino-b3-dev-ed.develop.lightning.force.com/services/apexrest/Accounts/' + a.id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account myAcct = AccountManager.getAccount();
        System.assert(myAcct != null);
        System.assertEquals('TestAccount', myAcct.Name);
    }   
}


