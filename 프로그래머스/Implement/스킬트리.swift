import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var ans = 0
    let _skill = skill.map { $0 }
    
    for s in skill_trees{
        var i = 0
        let ss = s.map { $0 }
        for cha in ss{
            if i < _skill.count && cha == _skill[i]{
                i += 1
            }else if _skill.contains(cha){
                i = -1
                break
            }
        }
        if i != -1 {
            ans += 1
        }
    }
    return ans
}
