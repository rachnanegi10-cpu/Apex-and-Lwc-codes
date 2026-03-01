public class LanguageSelector {
    public static string returnLanguageType(string country){
        String languageType = 'English';
        String LocalToCheck = country.toLowerCase();
        
        switch on LocalToCheck{
            when 'uae'{
                languageType = 'Arabic';
            }
            when 'russia'{
                languageType = 'Russian';
            }
            when 'china'{
                languageType = 'Chines';
            }
            when else{
                languageType = 'English';
            }
        }
        return languageType;
    }

}