def solution(numbers):
    answer = ''
    s_numbers = [str(n) for n in numbers]
    s_numbers.sort(key=lambda x : x*4, reverse=True) 
    for n in s_numbers:
        answer += n
    return str(int(answer)) # 0000 일때 0으로 바꿔줘야 한다!
