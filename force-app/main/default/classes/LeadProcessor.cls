public class LeadProcessor implements 
    Database.Batchable<sObject>{
        
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead WHERE Leadsource != \'Dreamforce\''
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> records){
        // process each batch of records
        //List<Lead> leads = new List<Lead>;
        for(Lead lead: records) {
            lead.LeadSource = 'Dreamforce';
        }
        update records;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug('Done');
    }
}