public class toDoList {
    
    public static List<WorkItem> toDoListItem = new List<WorkItem>();
    
    public static void addNewWorkItem(WorkItem toDoItem){
        toDoListItem.add(toDoItem);
       
    }
    
    public static List<toDoList.WorkItem> retriveItem(){
        
        return toDoListItem;
    }
    
    public static void updateWorkItem(integer toDoId, string newStatus){
        
        for(toDoList.WorkItem witem:toDoListItem){
            
            if(witem.toDoId == toDoId){
                witem.toDoStatus = newStatus;
            }
        }
      system.debug(toDoListItem);  
    }
    
    public static integer totalItem(){
        return toDoListItem.size();
    }
    
    public class WorkItem{
        public Integer toDoId;
        public string toDoName;
        public string toDoDescription;
        public string toDoStatus;
        
    }

}