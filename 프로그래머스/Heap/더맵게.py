import heapq
def solution(scoville, K):
    answer = 0
    value = 0
    heapq.heapify(scoville)
    print(heapq)
    while scoville[0] < K:
        value = heapq.heappop(scoville) + (heapq.heappop(scoville) * 2)
        heapq.heappush(scoville,value)
        answer += 1
        if len(scoville) == 1 and scoville[0] < K:
            return -1
    return answer
  
  # heap을 직접 구현해서 풀어바야 하나?
