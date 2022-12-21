public with sharing class CampingListController {
    
    @AuraEnabled
    public static List<Camping_Item__c>  getItems(){
        return [SELECT id, Name, Quantity__c, Price__c, Packed__c FROM Camping_Item__c];
    }

    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c campItem){
        try {
            System.debug(campItem);
            upsert campItem;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return campItem;
    }
}