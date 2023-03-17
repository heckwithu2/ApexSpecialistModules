@Restresource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween(
            '/Accounts/','/contacts'
        );
        Account result = [SELECT Id, Name, (Select Id, FirstName, LastName from contacts) FROM Account WHERE id = : accountId];
        return result;
    }

}