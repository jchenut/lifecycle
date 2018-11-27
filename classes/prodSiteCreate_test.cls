@isTest(isParallel=false)
public class prodSiteCreate_test {
    
    @isTest
    static void TestProdSiteTrigger () {
        
        // Define a user to run the test.
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@chenut.com';
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                          LocaleSidKey='en_US', ProfileId = p.Id,
                          TimeZoneSidKey='America/Los_Angeles',
                          UserName=uniqueUserName);
        insert u;
        
        PermissionSet pset = new PermissionSet();
        pset=[select id, name from PermissionSet where Name='MagicApp'];
        
        PermissionSetAssignment psa = new PermissionSetAssignment (PermissionSetId = pset.id, AssigneeId = u.id);
        insert psa;   
        
        Test.startTest();
        System.runAs(u) {
            System.debug('   --------- Inside test class: run test');
            Account acct = new Account(Name='Test Account');
            insert acct; 
            Site__c ProdSite = new Site__c(Account__c=acct.id, Name='TestSite', Capacity__c=2000, uuid__c=null);
            Database.insert(ProdSite);
            
            List<Site__c> pSites = [select id, name, capacity__c, uuid__c from Site__c where Name='TestSite'];
            System.debug('   ====== LIST SIZE: ' + pSites.size());
            if (pSites.size() > 0) {
                System.debug('================ LIST PRODUCTION SITES =====================');
                Site__c pSite=pSites[0];
            	System.debug('   ====== SITE ID: ' +pSite.id);
                System.debug('   ====== SITE NAME: ' +pSite.name);
                System.debug('   ====== SITE CAPACITY: ' +pSite.Capacity__c);
                System.debug('   ====== SITE UUID: ' +pSite.uuid__c);
                
            	String uuid=pSite.uuid__c;
                
            	if (uuid != null) System.assert(uuid.length() == 36);
            }
            System.debug('   --------- Inside test class: stop test');
        }
        Test.stopTest();
    }
}