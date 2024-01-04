public class JobListPageController {
		public List<Job__c> jobs { get; set; }
    public string url {get; set;}
     public string url1 {get; set;}
    // Constructor to initialize the job list
    public JobListPageController() {
        App_setting_Ref__c var= App_Setting_Ref__c.getInstance();
        url= var.External_Community_Or_Site_URL__c+ '/JobsList?';
        jobs = [SELECT Id, Name, Job_Description__c, Employment_type__c, Job_Requirements__c, Job_Number__c, Date_Posted__c FROM Job__c];
        // Add more fields to the SELECT statement as needed
        url1 = var.External_Community_Or_Site_URL__c+ '/Jobdetails?';
    }
}