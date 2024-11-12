// OpportunityTrigger.trigger
// This trigger is executed before an Opportunity is inserted or updated.
trigger OpportunityTrigger on Opportunity (before insert, before update) {
    // Loop through each Opportunity in the trigger context
    for (Opportunity opp : Trigger.new) {
        // Call the OpportunityService to apply the discount
        OpportunityService.applyDiscount(opp);

        // Example: Create a Task for the Account Manager (oppty.owner) if the discount is applied
        if (opp.Discount__c > 0) {
            Task task = new Task(
                WhatId = opp.Id,
                Subject = 'Review Discounted Opportunity',
                Status = 'Not Started',
                Priority = 'High',
                OwnerId = opp.OwnerId
            );
            insert task; // Insert the Task
        }
    }
}
