from itertools import combinations

def solution(orders, course):
    answer = []
    orders = [list(order) for order in orders]
    for num in course:
        temp = []
        for order in orders:
            if len(order) >= num:
                for tuple in list(combinations(order, num)):
                    temp.append(''.join(sorted(tuple)))
        dict = {}
        if len(temp) > 0:
            for w in temp:
                if w not in dict:
                    dict[w] = 1
                else:
                    dict[w] += 1
            print(dict)
            max_count = temp.count(max(dict, key=dict.get))
            if max_count >= 2:
                for key, value in dict.items():
                    if value == max_count:
                        answer.append(key)
    
    return sorted(answer)
