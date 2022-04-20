func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var pre_answer = 0
    var answer = 0
    var answerArr = [[Int]]()
    var arr = Array(repeating:Array(repeating:"0",count:n),count:m)
    for (i,b) in board.enumerated(){
        arr[i] = b.map{String($0)}
    }

    repeat{
        pre_answer = answer
        for i in stride(from:0,to:m-1,by:1){ 
            for j in stride(from:0,to:n-1,by:1){ 
                if arr[i][j] == "0" {continue}
                if arr[i][j] == arr[i+1][j] && arr[i][j] == arr[i][j+1] && arr[i][j] == arr[i+1][j+1]{
                    answerArr = answerArr + [[i,j]]+[[i+1,j]]+[[i,j+1]]+[[i+1,j+1]]
                }
            }
        }

        answerArr = Array(Set(answerArr))

        answer += answerArr.count
        for i in answerArr{
            arr[i[0]][i[1]] = "0"
        }

        for j in stride(from:0,to:n,by:1){ 
            var first = 0
            if arr[m-1][j] == "0" {first = m-1}
            for i in stride(from:m-2,through:0,by:-1){ 
                if arr[i][j] == "0"{
                    if i>first {first = i }
                }
                else if arr[i+1][j] == "0"{
                    arr[first][j] = arr[i][j]
                    arr[i][j] = "0"
                    first -= 1
                }
            }
        }
        answerArr = [[Int]]()
    } while(pre_answer<answer)
    return answer
}
