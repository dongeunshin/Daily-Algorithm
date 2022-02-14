def solution(bridge_length, weight, truck_weights):
    answer = 0
    total_weight = 0
    truck_on_bridge = [0] * bridge_length
    while len(truck_on_bridge) > 0:
        answer += 1
        total_weight -= truck_on_bridge.pop(0)
        # truck_on_bridge.pop(0)
        if len(truck_weights) > 0:
            if total_weight + truck_weights[0] <= weight:
                total_weight += truck_weights[0]
                truck_on_bridge += [truck_weights[0]]
                truck_weights.pop(0)
            else:
                truck_on_bridge += [0]
    return answer
    
    # 불친절한 문제 설명
    # 다리 길이가 3이라면, 트럭은 시간당 한칸씩 전진한다. 즉 3초간 머물 수 
