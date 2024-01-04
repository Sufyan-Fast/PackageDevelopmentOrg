@isTest
private class JobListPageControllerTest {

    @isTest
    static void testConstructor() {
        // Create a test App_setting_Ref__c record
        App_setting_Ref__c testSetting = new App_setting_Ref__c(
            External_Community_Or_Site_URL__c = 'https://hawklogixpakistan3-dev-ed.develop.my.site.com/'
            // Add other required fields here
        );
        insert testSetting;

        // Create a test Job__c record
        Job__c testJob = new Job__c(
            Name = 'Test Job'
            // Add other required fields here
        );
        insert testJob;

        // Set up the current page
        PageReference pageRef = Page.JobsList; // Replace with the actual name of your Visualforce page
        Test.setCurrentPage(pageRef);

        

        // Create an instance of the controller and invoke the constructor
        JobListPageController controller = new JobListPageController();
        

        // Perform assertions to validate the behavior of the constructor
        System.assertNotEquals(null, controller.jobs, 'Job list should not be null');
        System.assertEquals(1, controller.jobs.size(), 'Job list should contain one job'); // Adjust based on your test data
        System.assertEquals(testSetting.External_Community_Or_Site_URL__c + '/JobsList?', controller.url,
            'URL should match the expected JobsList URL');
        System.assertEquals(testSetting.External_Community_Or_Site_URL__c + '/Jobdetails?', controller.url1,
            'URL1 should match the expected Jobdetails URL');
    }

    // Additional test methods for other functionalities can be added as needed
}