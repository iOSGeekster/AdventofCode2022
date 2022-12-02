import Foundation

let url = Bundle.main.url(forResource: "input", withExtension: "txt")!

let rounds: [String] = try String(contentsOf: url, encoding: String.Encoding.utf8).components(separatedBy: "\n").map {
    $0
}.filter { !$0.isEmpty }

var score = 0
let win = 6
let draw = 3
let rock = 1
let paper = 2
let scissors = 3
func part1() {
    for round in rounds {
        let split = round.split(separator: " ")
        let opponent = split[0]
        let me = split[1]
        switch opponent {
        case "A":
            if me == "Y" {
                score += (win + paper)
            }
            if me == "X" {
                score += (draw + rock)
            }
            if me == "Z" {
                score += scissors
            }
        case "B":
            if me == "Y" {
                score += (draw + paper)
            }
            if me == "X" {
                score += rock
            }
            if me == "Z" {
                score += (win + scissors)
            }
        case "C":
            if me == "Y" {
                score += paper
            }
            if me == "X" {
                score += (win + rock)
            }
            if me == "Z" {
                score += (draw + scissors)
            }
        default:
            break
        }
    }
    print(score)
}

func part2() {
    score = 0
    for round in rounds {
        let split = round.split(separator: " ")
        let opponent = split[0]
        let me = split[1]
        switch opponent {
        case "A":
            if me == "Y" {
                score += (draw + rock)
            }
            if me == "X" {
                score += scissors
            }
            if me == "Z" {
                score += (win + paper)
            }
        case "B":
            if me == "Y" {
                score += (draw + paper)
            }
            if me == "X" {
                score += rock
            }
            if me == "Z" {
                score += (win + scissors)
            }
        case "C":
            if me == "Y" {
                score += (draw + scissors)
            }
            if me == "X" {
                score += paper
            }
            if me == "Z" {
                score += (win + rock)
            }
        default:
            break
        }
    }
    print(score)
}

part1()
part2()

