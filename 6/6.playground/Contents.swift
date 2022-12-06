import Foundation
let url = Bundle.main.url(forResource: "input", withExtension: "txt")!
var input = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map { $0 }.filter { !$0.isEmpty }.map { Array($0 )}[0]

print(input)

//var start = 0
//var current = 3
//var chars = 4
var found = false

var start = 0
var current = 13
var chars = 14

func part1() {
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
