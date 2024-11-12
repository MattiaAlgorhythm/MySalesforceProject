// opportunityDashboard.js
import { LightningElement, wire, track } from 'lwc';
import getFilteredOpportunities from '@salesforce/apex/OpportunityDashboardController.getFilteredOpportunities';

export default class OpportunityDashboard extends LightningElement {
    @track opportunities;
    stage = '';

    @wire(getFilteredOpportunities, { stage: '$stage' })
    wiredOpportunities({ error, data }) {
        if (data) {
            this.opportunities = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleStageChange(event) {
        this.stage = event.target.value;
    }

    refreshData() {
        return refreshApex(this.opportunities);
    }
}
