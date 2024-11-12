@isTest
public class OpportunityServiceTest {
    @isTest
    static void testApplyDiscount() {
        // Crea un'opportunità con un importo > 50,000
        Opportunity opp1 = new Opportunity(
            Name = 'Test Opportunity 1',
            Amount = 60000,
            CloseDate = Date.today().addDays(30),
            StageName = 'Prospecting'
        );
        insert opp1;

        // Verifica che il discount sia applicato correttamente
        OpportunityService.applyDiscount(opp1);
        System.assertEquals(0.1, opp1.Discount__c, 'Il discount non è corretto per importi superiori a 50,000');

        // Crea un'opportunità con un importo tra 10,000 e 50,000
        Opportunity opp2 = new Opportunity(
            Name = 'Test Opportunity 2',
            Amount = 20000,
            CloseDate = Date.today().addDays(30),
            StageName = 'Prospecting'
        );
        insert opp2;

        // Verifica che il discount sia applicato correttamente
        OpportunityService.applyDiscount(opp2);
        System.assertEquals(0.05, opp2.Discount__c, 'Il discount non è corretto per importi tra 10,000 e 50,000');

        // Crea un'opportunità con un importo < 10,000
        Opportunity opp3 = new Opportunity(
            Name = 'Test Opportunity 3',
            Amount = 5000,
            CloseDate = Date.today().addDays(30),
            StageName = 'Prospecting'
        );
        insert opp3;

        // Verifica che il discount sia applicato correttamente
        OpportunityService.applyDiscount(opp3);
        System.assertEquals(0.02, opp3.Discount__c, 'Il discount non è corretto per importi inferiori a 10,000');
    }
}
