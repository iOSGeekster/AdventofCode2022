import Foundation
let url = Bundle.main.url(forResource: "input", withExtension: "txt")!

let allSections: [String] = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map {
    $0
}.filter { !$0.isEmpty }

var result = 0
func part1() {
    for sectionPair in allSections {
        let section = sectionPair.split(separator: ",")
        let firstStart = section[0].split(separator: "-").map { Int($0)! }[0]
        let firstEnd = section[0].split(separator: "-").map { Int($0)! }[1]
        let secondStart = section[1].split(separator: "-").map { Int($0)! }[0]
        let secondEnd = section[1].split(separator: "-").map { Int($0)! }[1]

        if (firstStart <= secondStart && firstEnd >= secondEnd) || (secondStart <= firstStart && secondEnd >= firstEnd) {
            result += 1
        }
    }
    print(result)
}

func part2() {
    result = 0
    for sectionPair in allSections {
        let section = sectionPair.split(separator: ",")
        let firstStart = section[0].split(separator: "-").map { Int($0)! }[0]
        let firstEnd = section[0].split(separator: "-").map { Int($0)! }[1]
        let secondStart = section[1].split(separator: "-").map { Int($0)! }[0]
        let secondEnd = section[1].split(separator: "-").map { Int($0)! }[1]

        if (firstStart <= secondStart && firstEnd >= secondStart) || (secondStart <= firstStart && secondEnd >= firstStart) {
            result += 1
        }
    }

    print(result)
}

part1()
part2()
