@isTest
public with sharing class LeadProcessorTest {
    // In the test class, insert 200 Lead records, 
    // execute the LeadProcessor Batch class and test that all Lead records were updated correctly
    // The unit tests must cover all lines of code included in the LeadProcessor class, resulting in 100% code coverage
    // Before verifying this challenge, run your test class at least once using the Developer Console Run All feature  
    @isTest 
    static void test() {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(Lastname='heck', Company='Salesforce'));
        }
        insert leads;
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp, 200);
        Test.stopTest();

        List<Lead> leadsCheck = [Select Id from Lead where LeadSource = 'Dreamforce'];
        System.assertEquals(200, leadsCheck.size(), 'Error this isnt 200 leads with the dreamforce value');
    }
}