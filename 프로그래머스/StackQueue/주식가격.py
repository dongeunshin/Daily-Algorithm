def solution(prices):
    answer = []
    for i in range(len(prices)-1):
        for j in range(i, len(prices)):
            if prices[i] > prices[j]:
                answer.append(j-i)
                break
        else:
            answer.append(len(prices) - 1 - i)
    answer.append(0)
    return answer

# 스택문제이지만 구현으로 쉽게 풀리다니,,,
