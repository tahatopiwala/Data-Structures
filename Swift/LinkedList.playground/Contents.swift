/*
    @author Taha Topiwala
*/

import Foundation

class SingleLinkedList<T> {
    
    var head : Node<T>? = nil
    var tail : Node<T>? = nil
    var length : Int = 0
    
    init(){
        
    }
    
    func add(value:T) -> Bool {
        
        let node = Node<T>(data:value)
        
        if self.isEmpty(){
            
            self.head = node
            self.tail = node
            
        }else{
            
            var currentNode : Node<T> = self.head!
            
            while currentNode.next != nil{
                currentNode = currentNode.next!
            }
            
            currentNode.next = node
            self.tail = node
        }
        
        self.length++
        
        return true
    }
    
    func addAtPosition(data:T, position: Int) -> Bool{
        
        if position < 1 {
            return false
        }
        
        let tempNode : Node = Node<T>(data: data)
        
        if position == (self.length + 1) {
            
            self.tail!.next = tempNode
            self.tail = tempNode
            
            self.length++
            
            return true
        }
        
        var count : Int = 1
        var currentNode : Node = self.head!
        var previousNode : Node = self.head!
        
        while currentNode.next !== nil && count < position {
            previousNode = currentNode
            currentNode = currentNode.next!
            count++
        }
        
        
        previousNode.next = tempNode
        tempNode.next = currentNode
        
        self.length++
        
        return true
        
    }
    
    func searchAtPosition(position : Int) -> Node<T>{
        if position < 1 || position > self.length {
            
            let newNode : Node<T> = Node<T>()
            
            return newNode
            
        }else{
            
            var count : Int = 1
        
            var currentNode : Node<T> = self.head!
        
            while count < position && currentNode.next != nil {
                currentNode = currentNode.next!
                count++
            }
            
            return currentNode
        }
        
    }
    
    func removeAtPosition(position: Int) -> Bool {
        
        if position < 1 || position > self.length {
            return false;
        }
        
        if position == 1 {
        
            self.head = self.head?.next
        
            return true
        }
        
        var count : Int = 1
        var currentNode : Node<T> = self.head!
        var previousNode : Node<T> = self.head!
        
        while currentNode.next != nil && count < position {
            previousNode = currentNode
            currentNode = currentNode.next!
            count++
        }
        
        previousNode.next = currentNode.next
        self.length--
        
        return true
    }
    
    func size() -> Int{
        return self.length
    }
    
    func getFirstNode() -> Node<T>? {
        return self.head
    }
    
    func getLastNode() -> Node<T>? {
        return self.tail
    }
    
    func isEmpty() -> Bool{
        return (self.length == 0)
    }
}

class Node<T> {
    
    var data : T? = nil
    var next : Node<T>? = nil
    
    init(){}
    
    init(data: T){
        self.data = data
    }
}

var x = SingleLinkedList<String>()

x.add("Taha")
x.add("Batul")
x.add("Mazher")
x.add("Tasnim")

x.removeAtPosition(1)

print(x.searchAtPosition(1).data!)