import Foundation

func solution(_ name:String) -> Int {
    var ans = 0
    let initName :[Character] = Array(repeating: "A", count: name.count)
    let givenName = Array(name)
    print(initName, givenName)
    
    //알파벳 이동
    for i in 0..<name.count{
        if initName[i] != givenName[i]{
            ans += countUpDown(from: initName[i], to: givenName[i])
        }
    }
    
    //커서 이동
    let n = name.count
    var move = n - 1
    for idx in 0..<n{
        var next_idx = idx + 1
        while (next_idx < n) && (Array(name)[next_idx] == "A"){
            next_idx += 1
        }
        let distance = min(idx, n - next_idx)
        move = min(move, idx + n - next_idx + distance)
    }
    ans += move
    return ans
}

func countUpDown(from start: Character, to end:Character) -> Int{
    let alpha :[Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let s = alpha.firstIndex(of: start)!
    let e = alpha.firstIndex(of: end)!
    let moveUp = e - s
    let moveDown = 26 - e
    return moveUp < moveDown ? moveUp : moveDown
}
