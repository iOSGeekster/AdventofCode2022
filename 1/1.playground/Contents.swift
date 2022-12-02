import Foundation

let url = Bundle.main.url(forResource: "input", withExtension: "txt")!

let numbers: [String] = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map {
    $0
}

var highest = 0
var highest2 = 0
var highest3 = 0

let bundled = numbers.split(separator: "")

for test in bundled {
    let calc = test.map { Int($0)! }.reduce(0, +)
    if calc > highest {
        highest3 = highest2
        highest2 = highest
        highest = calc
    } else if calc > highest2 {
        highest3 = highest2
        highest2 = calc
    } else if calc > highest3 {
        highest3 = calc
    }
}

print(highest)
print(highest+highest2+highest3)
