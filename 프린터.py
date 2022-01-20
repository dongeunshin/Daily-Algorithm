def solution(priorities, location):
    cnt = 0
    p = []
    w = []
    for i in range(len(priorities)):
        p.append((i,priorities[i]))

    maxP = max(priorities)
    while p:
        popP = p.pop(0)
        if maxP == popP[1]:
            cnt += 1
            if popP[0] == location:
                return cnt
            priorities.pop(0)
            maxP = max(priorities)
        else:
            priorities.append(priorities.pop(0))
            p.append(popP)

print(solution([2, 1, 3, 2], 2))
print(solution([1, 1, 9, 1, 1, 1], 0))

# priorities의 max를 매번 구하지 않고 한번의 sort로 해결 할 수 있다