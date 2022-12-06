import Foundation
let url = Bundle.main.url(forResource: "test", withExtension: "txt")!

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}
struct Move {
    let from: Int
    let to: Int
    let count: Int
}
var input = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map {
    $0
}.split(whereSeparator: \.isEmpty)
let indexes = input[0].last!.enumerated().filter { !$0.element.isWhitespace }.map { (offset: $0.offset, element: Int(String($0.element))! - 1) }
let lines = input[0].reversed().dropFirst().map { $0.enumerated() }
var stacks = Array(repeating: [Character](), count: indexes.map(\.element).max()! + 1)
for line in lines {
    let arr = Array(line)
    for (offset, stackIndex) in indexes {
        if offset < arr.count && !arr[offset].element.isWhitespace {
            stacks[stackIndex].append(arr[offset].element)
        }
    }
}

let moves = input[1].map { move in
    let trimmed = move.replacingOccurrences(of: " ", with: "").map { String($0) }
    print(trimmed)
    return Move(from: Int(trimmed[4])!, to: Int(trimmed[9])!, count: Int(trimmed[12])!)
}

        print((part1(stacks: stacks, moves: moves), part2(stacks: stacks, moves: moves)))

    func part1(stacks: [[Character]], moves: [Move]) -> String {
        var stacks = stacks
        for move in moves {
            for _ in 0..<move.count {
                let item = stacks[move.from - 1].removeLast()
                stacks[move.to - 1].append(item)
            }
        }

        return stacks.map { String($0.last!) }.joined()
    }

    func part2(stacks: [[Character]], moves: [Move]) -> String {
        var stacks = stacks
        for move in moves {
            var items = [Character]()
            for _ in 0..<move.count {
                items.append(stacks[move.from - 1].removeLast())
            }
            stacks[move.to - 1].append(contentsOf: items.reversed())
        }

        return stacks.map { String($0.last!) }.joined()
    }

