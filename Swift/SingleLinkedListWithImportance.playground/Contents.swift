/*
    @author Taha Topiwala
*/

import Foundation

class DoubleLinkedListWithImportance<T> {
    
    private var head : Node<T>? = nil
    var tail : Node<T>? = nil
    var length : Int
    var maxImportance : Int
    
    init(importanceValue : Int){
        self.length = 0;
        self.maxImportance = importanceValue
    }
    
    init(value : T, importanceValue : Int){
        self.length = 1;
        self.maxImportance = importanceValue
        
        let temporaryNode : Node<T>
        
        if importanceValue < self.maxImportance {
            temporaryNode = Node<T>(value: value, importance: 0)
        }else{
            temporaryNode = Node<T>(value: value, importance: importanceValue)
        }
        self.head = temporaryNode
        self.tail = temporaryNode
    }
    
    func addAtLowestImportance(value : T) -> Bool{
        return true
    }
    
    func deleteAtLowestImportance(count : Int) -> Bool{
        return true
    }
    
    func addAtHighestImportance(value : T) -> Bool{
        return true
    }
    
    func deleteAtHighestImportance(count : Int) -> Bool{
        return true
    }
    
    func getFirstNode() -> Node<T>? {
        return self.head
    }
    
    func getLastNode() -> Node<T>? {
        return self.tail
    }
    
    func searchAtPosition(position : Int) -> Node<T>?{
        var returnNode = self.head
        
        if position < 1 || position > self.length {
            returnNode = Node<T>()
        }else{
            var count:Int = 1
            
            while count < position && returnNode?.next != nil {
                returnNode = returnNode?.next
                count++
            }
        }
        
        return returnNode
    }
    
    func printAllNodes(){
        var printingString : String = ""
        if var printNode = self.head {
            var count : Int = 0
            while count < self.length && printNode.next != nil {
                printingString += "\(printNode.value!)"
                printNode = printNode.next!
                count++
            }
            printingString += "\(printNode.value!)"
        }
        print(printingString)
    }
}

class Node<T> {
    
    var value : T?
    var next : Node<T>?
    var previous : Node<T>?
    var importance : Int
    
    init(){
        self.value = nil
        self.next = nil
        self.previous = nil
        self.importance = 0
    }
    
    init(value : T, importance : Int){
        self.next = nil
        self.previous = nil
        self.importance = importance
        self.value = value
    }
}

// Linked List with Initialising Importance Value and First Node Value

var listWithImportanceValueAndFirstNode = DoubleLinkedListWithImportance<String>(importanceValue: 10)

if var y = listWithImportanceValueAndFirstNode.head {
    for x in y.value!.characters {
        print(x)
    }
}

listWithImportanceValueAndFirstNode.printAllNodes()
