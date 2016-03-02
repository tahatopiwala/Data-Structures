import Foundation

class Trie {
    
    var data : Dictionary<Character, AnyObject>!
    
    init(data : Dictionary<Character, AnyObject>){
        
        if let dict = data as? Dictionary<Character, AnyObject> {
            self.data = dict
        }
    
    }
    
    func prefixSearch(name : String) -> Bool{
        
        if name.characters.count == 1 {
            let index = name.startIndex.advancedBy(0)
            if self.data[name[index]] != nil {
            
                return true
            }else{
                return false
            }
            
        }else{
            return self.performSearch(name, dict: self.data)
        }
    
    }
    
    func performSearch(name : String, dict: Dictionary<Character, AnyObject>) -> Bool{
        
        if name.characters.count == 1{
            let index = name.startIndex.advancedBy(0)
            if self.data[name[index]] != nil{
                return true
            }else{
                return false
            }
        }else{
            let index = name.startIndex.advancedBy(0)
            if let next = self.data[name[index]] as? Dictionary<Character, AnyObject>{
            
                let substring = name.substringWithRange(name.startIndex.advancedBy(1)..<name.endIndex.advancedBy(0))
                return performSearch(substring, dict: next)
            
            }else{
                
                return false
            }
        }
    }
    
}
