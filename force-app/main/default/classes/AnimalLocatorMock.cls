@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content Type','application/json');
        response.setbody('{"animal":{"id":1,"name":"cow","eats":"grass"}}');
        response.setStatusCode(200);
        return response;
    }
    
    

}