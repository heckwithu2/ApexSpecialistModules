@isTest
public with sharing class TestVerifyDate {

    public VerifyDate verifyDate;
    
    @isTest static void testCheckDates() {
        Date myDate1 = date.newInstance(1989, 4, 21);
        Date myDate2 = date.newInstance(1989, 5, 01);

        Date myDate3 = date.newInstance(1991, 3, 11);
        Date myDate4 = date.newInstance(1991, 5, 21);

        //within 30 days 
        System.assertEquals(
            myDate2,
            verifyDate.CheckDates(myDate1,myDate2)
        );

        //not within 30 days, returns last of month
        Date lastOfMonth = date.newInstance(1991, 5, 31);
        System.assertEquals(
            lastOfMonth,
            verifyDate.CheckDates(myDate3,myDate4)
        );
    }
}