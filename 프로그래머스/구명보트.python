def solution(people, limit):
    answer = 0
    people.sort()
    print(people)
    i = 0
    j = len(people) - 1
    total = sum(people)
    while total > 0:
        if people[i] + people[j] <= limit:
            total -= people[i]
            i += 1
        total -= people[j]
        j -= 1
        answer += 1
    return answer
