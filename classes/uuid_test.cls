@isTest
public class uuid_test {

    @isTest static void generateTest () {
        String Str=uuid.generate();
        Integer Strlen=Str.length();
        
        System.assertEquals(Strlen, 36);
        
    }

}