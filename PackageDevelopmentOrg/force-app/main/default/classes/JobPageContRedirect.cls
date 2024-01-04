public class JobPageContRedirect {
    private ApexPages.StandardController controller;
    public string recordId {get;set;}
    public string url {get; set;}
     public string url1 {get; set;}
     Public App_setting_Ref__c var;

    // Constructor with StandardController parameter
    public JobPageContRedirect(ApexPages.StandardController controller) {
        this.controller = controller;
        // Fetch the Id parameter from the URL
        var= App_Setting_Ref__c.getInstance();
        url= var.External_Community_Or_Site_URL__c+ '/JobsList?';

    }

   public PageReference redirectMethod() {
    try {
        recordId = ApexPages.currentPage().getParameters().get('id');
        System.debug('recordId => ' + recordId);

        // Log the URL for debugging
        System.debug('Redirect URL => ' + var.External_Community_Or_Site_URL__c + '/ApplyPage?id=' + recordId);

        PageReference pageRef = new PageReference(var.External_Community_Or_Site_URL__c + '/ApplyPage?id=' + recordId);
        return pageRef;
    } catch (Exception e) {
        System.debug('Exception in redirectMethod: ' + e.getMessage());
        // Log the exception details
        return null; // or handle the exception appropriately
    }
}
    public string returns(){
         App_setting_Ref__c var= App_Setting_Ref__c.getInstance();
        url1= var.External_Community_Or_Site_URL__c+ '/Jobslist?';
        return url1;
    }

}