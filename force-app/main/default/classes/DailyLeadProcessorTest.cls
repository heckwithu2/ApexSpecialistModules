@isTest
public class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 ? * * *';

    @isTest
    private static void DailyLeadProcessTester() {
        List<Lead> leads = new List<Lead>();
        for ( Integer i = 0; i <500; i++) {
            if ( i < 250) {
                leads.add(new Lead(LastName='Heck', Company='nCino'));
            }else {
                leads.add(new Lead(LastName='Heck', Company='Salesforce'));
            }
        }
        insert leads;

        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Error not 200 leads with dreamforce in leadsource.');

        List<CronTrigger> cts = [SELECT Id, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = : jobId];

        Datetime midnight = Datetime.newInstance(Date.Today(), Time.newInstance(0,0,0,0));
        System.assertEquals(midnight.addHours(24), cts[0].NextFireTime, 'Error');
    }
}