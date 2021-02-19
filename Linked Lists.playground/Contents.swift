import UIKit

public class Node<Value>{

    public var value: Value
    public var next: Node?

    public init(_ value: Value,_ next: Node? = nil){
        self.value = value
        self.next = next
    }

}
extension Node: CustomStringConvertible{
    public var description: String{
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> " + String.init(describing: next) + " "
    }
}

public struct LinkedList<Value>{
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init(){
        
    }
    public var isEmpty: Bool{
        return head == nil
    }
    //push func
    mutating func push(_ element: Value){
        head = Node(element, head)
        if tail == nil{
            tail = head
        }
    }
    mutating func append(_ element: Value){
        guard !isEmpty else{
            push(element)
            return
        }
        tail!.next = Node(element)
        tail = tail?.next
        
        }
    public func node(at index: Int) -> Node<Value>?{
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index{
            currentNode = currentNode!.next
            currentIndex+=1
        }
        return currentNode
    }
    
    public mutating func isert(_ value: Value, after node: Node<Value>) -> Node<Value>{
        guard tail !== node else{
            append(value)
            return tail!
        }
        node.next = Node(value, node.next)
        return node.next!
    }
    public mutating func pop() -> Value?{
        defer{
            head = head?.next
            if isEmpty{
                tail = nil
            }
        }
        return head?.value
    }
    public mutating func removeLast() -> Value?{
        
        guard let head = head else {
            return nil
        }
        guard head.next != nil else{
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next{
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    public mutating func remove(after node: Node<Value>) -> Value?{
        defer{
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    }
    
        
        
    

extension LinkedList: CustomStringConvertible{
    public var description: String {
        guard let head = head else{
            return "List is empty"
        }
        return String(describing: head)
    }
}


