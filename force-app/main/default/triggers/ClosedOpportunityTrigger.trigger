trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Opportunity> oppList = [SELECT Id,Name,StageName FROM Opportunity
    WHERE Id IN :Trigger.new];

    List<Task> taskList = new List<Task>();

    for(Opportunity opp : oppList) { 
        if (opp.StageName == 'Closed Won' ) {
            Task task = new Task();
	        task.Subject = 'Follow Up Test Task';
            task.WhatId = opp.Id;
            taskList.add(task);
        }
    }
    insert taskList;
}
