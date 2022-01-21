def solution(clothes):
    answer = 1
    dic = {}
    for item in clothes:
        if item[1] in dic:
            dic[item[1]] += 1
        else: 
            dic[item[1]] = 1
    for value in dic.values():
        answer *= (value + 1)
    return answer - 1
  
  
  # 아무것도 입지 않은 경우 1을 빼주는 것을 신경써줘야 한다.
