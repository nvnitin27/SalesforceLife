@IsTest
Public class FileUploadTriggerTestClass {
    
    static testmethod void testmethod1(){
        Test.startTest();
        Account accA =new Account(Name='Demo');
        insert accA ;

        Contract con = New Contract(Name='Test Contract', AccountId=accA.Id);
        insert con;
        
        ContentVersion content=new ContentVersion(); 
        content.Title='Header_Picture1'; 
        content.PathOnClient='/' + content.Title + '.jpg'; 
        Blob bodyBlob=Blob.valueOf('Unit Test ContentVersion Body'); 
        content.VersionData=bodyBlob; 
        //content.LinkedEntityId=sub.id;
        content.origin = 'H';
        insert content;
        ContentDocumentLink contentlink=new ContentDocumentLink();
        contentlink.LinkedEntityId=con.id;
        contentlink.contentdocumentid=[select contentdocumentid from contentversion where id =: content.id].contentdocumentid;
        contentlink.ShareType = 'I';
        contentlink.Visibility = 'AllUsers'; 
                
        insert contentlink;
        Test.stopTest();
        
    }
}