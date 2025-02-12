import Foundation

func gcd(_ a:Int, _ b:Int) -> Int{
    if a == 0 { return Int(b) }
    return gcd(b%a, a)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    return Int64(w*h-w-h+gcd(w,h))
}
