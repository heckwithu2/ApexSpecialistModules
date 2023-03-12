trigger AccountAddressTrigger on Account (before insert, before update) {	
    if(Trigger.new[0].Match_Billing_Address__c == true){
        Trigger.new[0].ShippingPostalCode = Trigger.new[0].BillingPostalCode;
    }
    System.debug(Trigger.new);
}