
import Foundation

//«Challenge 2: Balance the parentheses
//Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced. For example:
//// 1
//h((e))llo(world)() // balanced parentheses
//
//// 2
//(hello world // unbalanced parentheses»
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
    func isEmpty() -> Bool{
        return storage.isEmpty
    }

    }
func checkParentheses(_ str: String) -> Bool{
    var stack = Stack<Character>()
    for character in str{
        if character == "("{
            stack.push(character)
        }else if character == ")"{
            if stack.isEmpty(){
                return false
            } else {
                stack.pop()
            }
            
        }
    }
    return stack.isEmpty()
}

var str = "fjfk((dskdlsk))sskd"
checkParentheses(str)
