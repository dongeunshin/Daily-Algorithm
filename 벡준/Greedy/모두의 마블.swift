let n = Int(readLine()!)!
var level : [Int] = readLine()!.split(separator: " ").map{Int($0)!}
level.sort()
var gold = 0
while level.count > 1 {
    let card1 = level.popLast()!
    let card2 = level.popLast()!
    gold += card1 + card2
    level.append(max(card1, card2))
}
print(gold)
