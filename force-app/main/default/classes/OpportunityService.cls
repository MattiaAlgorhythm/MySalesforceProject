/*
Project Overview: Advanced Opportunity Management System
We'll implement a system that applies automatic discounts to Opportunities and provides an interactive dashboard using Lightning Web Components (LWC). 
This project will include:
Apex Service Class for business logic.
Apex Trigger to automate the process.
Lightning Web Component (LWC) for a real-time dashboard. */

/* The OpportunityService class will handle all the business logic for applying discounts based on Opportunity Amount */

public class OpportunityService {
    // Method to apply discount based on the Opportunity Amount
    public static void applyDiscount(Opportunity opp) { // using static method because the logic does not require an instance of the class
        if (opp.Amount > 50000) {
            opp.Discount__c = 0.1; // 10% discount for Opportunities over 50,000
        } else if (opp.Amount > 10000) {
            opp.Discount__c = 0.05; // 5% discount for Opportunities over 10,000
        } else {
            opp.Discount__c = 0.02; // 2% discount for smaller Opportunities
        }
    }
}