@isTest
private class AnimalLocatorTest {
    @isTest static void AnimalCalloutMock(){
        Test.setMock(HttpCalloutMock.class,new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(3);
        string expectResult = 'cow';
        system.assertEquals(result,expectResult);
    }

}