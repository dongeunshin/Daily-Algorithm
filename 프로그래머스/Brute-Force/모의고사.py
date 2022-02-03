def find_max(count_list):
    max = 0
    for count in count_list:
        if max < count:
            max = count
    return max
    
def solution(answers):
    answer = []
    count_1 = 0
    count_2 = 0
    count_3 = 0
    student_1 = [1, 2, 3, 4, 5]
    student_2 = [2, 1, 2, 3, 2, 4, 2, 5]
    student_3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    answers_len = len(answers)
    
    for i in range(answers_len):
        if answers[i] == student_1[i % len(student_1)]:
            count_1 += 1
        if answers[i] == student_2[i % len(student_2)]:
            count_2 += 1
        if answers[i] == student_3[i % len(student_3)]:
            count_3 += 1
            
    count_list = [count_1, count_2, count_3]
    max_count = find_max(count_list)
    
    for i in range(len(count_list)):
        if count_list[i] == max_count:
            answer += [i+1]
    
    return answer
