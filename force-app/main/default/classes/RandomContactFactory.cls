public with sharing class RandomContactFactory {
    public RandomContactFactory() {}

    public static List<Contact> generateRandomContacts(Integer numberOfContacts, string lastname) {

        List<Contact> ContactList = new List<Contact>();

        for (Integer i = 0; i < numberOfContacts; i++) {
            Contact c = new Contact(FirstName= lastname + ' ' +i);
            ContactList.add(c);
        }
        return ContactList;
    }
}