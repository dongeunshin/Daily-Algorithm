def solution(progresses, speeds):
    answer = []
    while progresses:
        for i in range(len(progresses)):
            progresses[i] += speeds[i]
        cnt = 0
        while progresses:
            if progresses[0] < 100:
                break
            else:
                cnt += 1
                progresses.pop(0)
                speeds.pop(0) # speeds도 같이 pop해주지 않아서 한 차례 실패
        if cnt > 0:
            answer.append(cnt)
    return answer
  
  
