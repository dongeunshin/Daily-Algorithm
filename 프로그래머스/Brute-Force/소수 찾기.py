from itertools import permutations

def solution(numbers):
    answer = 0
    nums = []
    for i in range(1,len(numbers)+1):
        # print(list(permutations(numbers,i)))
        nums += [int(''.join(num)) for num in permutations(numbers,i) if num[0] != 0]
    # print(nums)
    for n in set(nums):
        if n < 2: continue
        for i in range(2,int(n ** 0.5) + 1):
            if n % i == 0:
                break
        else:
            answer += 1
    return answer
