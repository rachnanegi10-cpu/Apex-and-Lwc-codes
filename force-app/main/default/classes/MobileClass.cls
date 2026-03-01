public class MobileClass implements mobileInterface, Mobile_Extra{

    public static void dial_call(integer dialnum){
        system.debug('show me dial num: '+dialnum);
        if(dialnum < 10){
            system.debug('show me error');
        }
    }
    
    public static void recv_call(integer recvecall){
        system.debug('show me dial num: '+recvecall);
        if(recvecall < 10){
            system.debug('show me error');
        }
    }
        
        public static string pic_loader(){
            
            system.debug('show me success');
            
            return 'show me success';
        }
        
        public static string file_loader(){
            system.debug('show me sucess');
            
            return 'show me success';
        }
        
    }