@istest
public class JobPageContRedirectTest {
	 @isTest
    static void testRedirectMethod() {
        // Create a test App_setting_Ref__c record
        App_setting_Ref__c testSetting = new App_setting_Ref__c(
            External_Community_Or_Site_URL__c = 'https://hawklogixpakistan3-dev-ed.develop.my.site.com'
            // Add other required fields here
        );
        insert testSetting;

        // Create a test Job__c record
        Job__c testJob = new Job__c(
            Name = 'Test Job'
            // Add other required fields here
        );
        insert testJob;

        // Set up the current page with parameters
        PageReference pageRef = Page.ApplyPage; // Replace with the actual name of your Visualforce page
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', testJob.Id);

        // Create an instance of the controller and invoke the constructor
        JobPageContRedirect controller = new JobPageContRedirect(new ApexPages.StandardController(testJob));

        // Set the App_setting_Ref__c instance variable
        controller.var = testSetting;

        // Invoke the redirectMethod
        PageReference result = controller.redirectMethod();

        // Perform assertions to validate the behavior of the method
        System.assertNotEquals(null, result, 'PageReference should not be null');
        System.assertEquals(testSetting.External_Community_Or_Site_URL__c + '/ApplyPage?id=' + testJob.Id, result.getUrl(),
            'PageReference URL should match the expected URL');

        // Optionally, you can add more assertions based on your specific requirements
    }
}