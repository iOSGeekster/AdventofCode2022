import Foundation
let url = Bundle.main.url(forResource: "input", withExtension: "txt")!

let items: [String] = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map {
    $0
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

let abc = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

var priority = 0
func part1() {
    for item in items {
        let splitter = item.count / 2
        let firstCompartment = item[item.startIndex..<item.index(item.startIndex, offsetBy: splitter)]
        let secondCompartment = item[item.index(item.startIndex, offsetBy: splitter)...]

        for char in firstCompartment {
            if secondCompartment.contains(char) {
                let index = abc.firstIndex(of: char)
                priority += index!.utf16Offset(in: abc) + 1
                break
            }
        }
    }

    print(priority)
}

func part2() {
    let groups = items.chunked(into: 3)
    for group in groups {
        for char in group[0] {
            if group[1].contains(char) && group[2].contains(char) {
                let index = abc.firstIndex(of: char)
                priority += index!.utf16Offset(in: abc) + 1
                break
            }
        }
    }
    print(priority)
}
part1()
part2()


