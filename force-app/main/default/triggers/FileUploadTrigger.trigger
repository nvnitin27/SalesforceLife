trigger FileUploadTrigger on ContentDocumentLink(after insert, after update, after delete) {
    List < ContentDocumentLink > cdls = (Trigger.new == null ? Trigger.old : Trigger.new);
    Set < ID > parentIds = new Set < ID > ();

    for (ContentDocumentLink cdl : cdls )
    {
        parentIds.add(cdl.LinkedEntityId);
    }
    for (List < Contract > contracts : [SELECT Id, (SELECT Id FROM ContentDocumentLinks LIMIT 1 ) FROM Contract WHERE Id IN : parentIds] )
    {
        for (Contract c : contracts )
        {
            c.File_Attached__c = (c.ContentDocumentLinks.size() > 0);
        }
    update contracts;
    }
}