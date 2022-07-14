let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = arr[0]
let m = arr[1]


func f(_ values: String, _ count: Int) -> Void {
    if count == m {
        print(values)
    } else {
        for i in 1...n {
            f(values+"\(i) ", count+1)
        }
    }
}

f("", 0)
