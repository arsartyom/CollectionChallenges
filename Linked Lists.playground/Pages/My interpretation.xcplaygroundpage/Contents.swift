//: [Previous](@previous)

import Foundation
class Node<Value>: Comparable{
    public var value: Value
    public var next: Node<Value>?
    
    public init(value: Value, next: Node? = nil){
        self.value = value
        self.next = next
    }
}
extension Node: CustomStringConvertible{
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(next)"
    }
}
var node1 = Node(value: 1)
var node2 = Node(value: 2)
var node3 = Node(value: 3)
node2.next = node3
node1.next = node2
print(node1)

struct LinkedList<Value>{
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init(){}
    
    public func isEmpty() -> Bool{
        if head == nil {
            return true
        }
        else{ return false }
    }

    mutating func push(_ element: Value){
        head = Node(value: element, next: head)
        if tail == nil {
            tail = head
        }
    }
    mutating func append(_ element: Value){
        if head == nil {
            push(element)
            return
        }
        tail!.next = Node(value: element, next: nil)
        tail = tail?.next
    }
    func node(at index: Int) -> Node<Value>?{
        var currentNode = head
        var counter = 0
        while currentNode != nil && counter < index {
            currentNode = currentNode!.next
            counter += 1
        }
        return currentNode
    }
}
extension LinkedList: CustomStringConvertible{
    var description: String {
        guard let head = head else {
            return "List is empty"
        }
        return("\(head)")
    }
}
//Challenge 1: Print in reverse
//Create a function that prints the nodes of a linked list in reverse order. For example:
//1 -> 2 -> 3 -> nil
//// should print out the following:
//3
//2
//1
func reversePrint<Value>(list: LinkedList<Value>){
    guard let node = list.head else {
        print("No elements in list")
        return
    }
    func printing<Value>(_ node: Node<Value>?){
        guard let node = node else { return}
        printing(node.next)
        print(node.value)
    }
    printing(node)
    
}
var l = LinkedList<Int>()
l.push(10)
l.push(18)
l.push(25)
reversePrint(list: l)
print(l)

//«Challenge 2: Find the middle node»
//«Create a function that finds the middle node of a linked list. For example:
//1 -> 2 -> 3 -> 4 -> nil
//// middle is 3
//
//1 -> 2 -> 3 -> nil
//// middle is 2»
func middleNode<Value>(of list:LinkedList<Value>) -> Node<Value>?{
    var fast = list.head
    var slow = list.head
    while let nextFast = fast?.next{
        fast = nextFast.next
        slow = slow?.next
    }
    return slow
}
middleNode(of: l)?.value // prints 18

//«Challenge 3: Reverse a linked list
//Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction. For example:»
//«// before
//1 -> 2 -> 3 -> nil
//
//// after
//3 -> 2 -> 1 -> nil»

func reverseList<Value>(of list: LinkedList<Value>) -> LinkedList<Value>{
    var nodeHead = list.head
    var newList = LinkedList<Value>()
    func reversing(_ node: Node<Value>?){
        guard let node = node else { return }
        reversing(node.next)
        newList.append(node.value as! Value)
    }
    reversing(nodeHead)
    return newList
}
print(reverseList(of:  l))

