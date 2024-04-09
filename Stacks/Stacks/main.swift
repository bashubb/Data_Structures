//
//  main.swift
//  Stacks
//
//  Created by HubertMac on 09/04/2024.
//

import Foundation

struct Stack<Element> {
    private var array = [Element]()
    var count: Int { array.count }
    var isEmpty: Bool { array.isEmpty }
    
    init(_ items: [Element]) {
        self.array = items
    }
    
    init() { }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        array.popLast()
    }
    
    func peek() -> Element? {
        array.last
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        var result = "["
        var first = true
        
        for item in array {
            if first {
                first = false
            } else {
                result += ", "
            }
            
            debugPrint(item, terminator: "", to: &result)
        }
        
        result += "]"
        return result
    }
}

extension Stack: Equatable where Element: Equatable { }
let stackA = Stack([1, 2, 3])
let stackB = Stack([1, 2, 3])

extension Stack: Hashable where Element: Hashable { }

extension Stack: Decodable where Element: Decodable { }
extension Stack: Encodable where Element: Encodable { }

var numbers: Stack = [1, 2, 3, 4, 5]
numbers.push(4)
numbers.push(8)
numbers.push(15)
numbers.push(16)
print(numbers.pop())
print(numbers.pop())
print(numbers.pop())
print(numbers.pop())
print(numbers.pop())

var names = Stack<String>()
names.push("Leonardo")
names.push("Michelangelo")
names.push("Donatello")
names.push("Raphael")


