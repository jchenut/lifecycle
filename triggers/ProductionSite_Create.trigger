trigger ProductionSite_Create on Site__c (before insert) {
		System.debug (' ======================== TRIGGER =================== ');
    for (Site__c ProdSite : Trigger.new) {
        System.debug('>>>>>>> Inside Trigger loop: generate UUID');
        ProdSite.UUID__c=UUID.generate();
        System.debug('>>>>>>> Inside Trigger loop:  ProdSite.UUID__c is '+ ProdSite.UUID__c);
	}
}