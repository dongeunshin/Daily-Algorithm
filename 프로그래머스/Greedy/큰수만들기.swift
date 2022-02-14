import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var _k = k
    let ansLen = number.count - k
    var ans: [String] = []
    for n in number{
        let _n = String(n)
        
        if _k == 0{
            ans.append(_n)
            continue
        }
        
        if ans.isEmpty{
            ans.append(_n)
        }else if ans.last! < _n{
            while !ans.isEmpty && _k > 0 && ans.last! < String(n){
                ans.popLast()
                _k -= 1
            }
            ans.append(_n)
        }else if ans.last! >= _n{
            ans.append(_n)
        }
    }
    while ans.count > ansLen{
        ans.popLast()
    }
    return ans.joined()
}
