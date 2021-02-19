import UIKit

//«Challenge 1: Reverse an Array
//Create a function that prints the contents of an array in reversed order.»

//Challenge 1
// MARK: - Not stack version
struct Challenge1<Element>{
    var storage: [Element] = []
    
    public init(){
        
    }
    
    mutating func myRevers(_ array: [Element]){
        storage = array.reversed()
        print(storage)
    }
}

var challenge = Challenge1<Int>()
challenge.myRevers([9,3,5,64,2,4,7])
// MARK: - Stack version

struct Stack<Element>{
    private var storage: [Element] = []
    public init(){
        
    }
    mutating func push(_ element: Element){
            storage.append(element)
    }
    mutating func pop() -> Element?{
        storage.popLast()
    }

    }
func myReverse<Element>(_ array: [Element]){
    var stack = Stack<Element>()
    
    for element in array{
        stack.push(element)
    }
    while  let value = stack.pop() {
        print(value)
    }
}
var array = [1,2,4,6,8,3,24,1]
myReverse(array)

