// This class provides methods for the OpportunityDashboard LWC to retrieve filtered Opportunities.
public with sharing class OpportunityDashboardController {
    // @AuraEnabled makes the method callable from the LWC
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getFilteredOpportunities(String stage) {
        // Query Opportunities based on the provided stage and return the results
        return [SELECT Id, Name, Amount, StageName FROM Opportunity WHERE StageName = :stage];
    }
}
