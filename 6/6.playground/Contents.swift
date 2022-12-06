import Foundation
let url = Bundle.main.url(forResource: "input", withExtension: "txt")!
var input = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map { $0 }.filter { !$0.isEmpty }.map { Array($0 )}[0]

func part1() {
    var start = 0
    var current = 3
    var chars = 4
    var found = false

    while !found {
        let test = input[start...current]
        if Set(test).count == 4 {
            found = true
            print(chars)
            return
        } else {
            start += 1
            current += 1
            chars += 1
        }
    }
}

func part2() {
    var start = 0
    var current = 13
    var chars = 14
    var found = false

    while !found {
        let test = input[start...current]
        if Set(test).count == 14 {
            found = true
            print(chars)
            return
        } else {
            start += 1
            current += 1
            chars += 1
        }
    }
}

part1()
part2()
