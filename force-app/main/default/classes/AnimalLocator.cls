public class AnimalLocator {
    public static String getAnimalNameById(Integer Id){
        Http http =new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/' +id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String str = '';
        system.debug('response '+response.getStatusCode());
        system.debug('response '+response.getBody());
        if(response.getStatuscode()==200){
            Map<String,Object> result = (Map<String,Object>)JSON.deserializeUntyped(response.getbody());
            Map<String,Object> animals = (Map<String,Object>)result.get('animal');
            system.debug('Recieved these animals '+animals);
            str = string.valueOf(animals.get('name'));
            system.debug('strResponse: '+str);
            
            
        }
        return str;
        
        
    }

}