func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var time = 540
    var times:[Int] = timetable.map{Int($0.split(separator: ":")[0])!*60 + Int($0.split(separator: ":")[1])!}.sorted(by:<)
    var people:Int = 0
    var last:Int = time
    var hour:String,minute:String = ""
    
    for _ in 0..<n {
        people = m
        for _ in 0..<m {
            if times.isEmpty || times.first! > time { break }
            last = times.removeFirst()
            people -= 1
        }
        time += t
    }
    
    time = people == 0 ? last-1 : time-t
    hour = time/60  < 10 ? "0\(time/60)" : "\(time/60)"
    minute = time%60 < 10 ? "0\(time%60)" : "\(time%60)"
    return hour + ":" + minute
}

// 실패한 시도 =========================================================================================
func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
   var total = 0
   var ans = "00:00"
   var busArrived = "09:00"
   var lastBusArrived = "00:00"
   let sortedTimetable = timetable.sorted()
   for bus in 1...n {
       var currNumOfCrew = 0
       for time in sortedTimetable where total < timetable.count {
           if lastBusArrived <= time && time <= busArrived{
               currNumOfCrew += 1
               total += 1
           }
       }
       // 마지막 배차 시간일 경우
       if bus == n {
           if total < m && sortedTimetable.last! < "09:00" {
               ans = "09:00"
               break
           }
           if total == 0 {
               ans = busArrived
               break
           }
           var tmpAns = sortedTimetable[total - 1].split(separator: ":").map({Int($0)!})
           if currNumOfCrew >= m || total >= timetable.count {
               if tmpAns[1] > 0 {
                   tmpAns[1] -= 1
               }else {
                   tmpAns[0] -= 1
                   tmpAns[1] = 59
               }
               ans = arrToStr(tmpAns)
           }else if currNumOfCrew < m {
               ans = busArrived
               ans = ans <= "09:00" ? "09:00" : ans
           }
           break
       }

       // 다음 배차 시간
       let h = t / 60
       let m = t % 60
       var nextArrived = busArrived.split(separator: ":").map({Int($0)!})
       nextArrived[0] = nextArrived[0] + h
       nextArrived[1] = nextArrived[1] + m
       if nextArrived[1] >= 60 {
           nextArrived[0] = nextArrived[1] / 60
           nextArrived[1] %= 60
       }

       lastBusArrived = busArrived
       busArrived = ""

       busArrived = arrToStr(nextArrived)
   }
   return ans
}
func arrToStr(_ arr: [Int]) -> String {
    let h = arr[0] >= 10 ? String(arr[0]) : "0" + String(arr[0])
    let m = arr[1] >= 10 ? String(arr[1]) : "0" + String(arr[1])
    return h + ":" + m
}
