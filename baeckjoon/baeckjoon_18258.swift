import Foundation

func solution(){
    let n = Int(readLine()!)!
    var myQueue = Queue<Int>()
    
    for _ in 0..<n {
        let input = readLine()!
        switch input {
        case "pop" :
            print(myQueue.pop())
        case "size" :
            print(myQueue.size)
        case "empty" :
            print(myQueue.empty)
        case "front" :
            print(myQueue.front())
        case "back" :
            print(myQueue.back())
        case let x where x.contains("push"):
            let input = Int(x.replacingOccurrences(of: "push ", with: "")) ?? 0
            myQueue.push(input)
        default:
            break
        }
    }
}

struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var size: Int {
        return queue.count
    }
    
    public var empty: Int {
        return queue.isEmpty ? 1 : 0
    }
    
    public mutating func push(_ element: T) {
        queue.append(element)
    }
    
    public mutating func pop() -> Int {
        guard head <= queue.count, let element = queue[head] else { return -1 }
        queue[head] = nil
        head += 1
        
        if head > queue.count/4 {
            queue.removeFirst(head)
            head = 0
        }
        return element as! Int
    }
    
    public mutating func front() -> Int {
        guard let element = queue[head] else { return -1 }
        return element as! Int
    }

    public mutating func back() -> Int {
        guard let element = queue[queue.endIndex] else { return -1 }
        return element as! Int
    }
}