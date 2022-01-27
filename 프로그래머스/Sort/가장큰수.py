def solution(numbers):
    answer = ''
    numbers = [str(num) for num in numbers]
    numbers.sort(key=lambda x: x*4,reverse = True)  # 이 방법은 떠올리지 못했다
    for num in numbers:
        answer += num
    print(answer)
    print(int(answer))
    return str(int(answer))
