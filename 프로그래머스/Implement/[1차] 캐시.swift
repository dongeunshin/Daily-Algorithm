func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let tmp = cities.map{ return $0.uppercased() }
    
    var caches: [String] = []
    var count = 0
    
    for city in tmp {
        if caches.contains(city) {
            count += 1
            caches.remove(at: caches.firstIndex(of: city)!)
            caches.append(city)
        }
        else {
            count += 5
            caches.append(city)
            if caches.count > cacheSize {
                caches.removeFirst()
            }
        }
    }
    
    return count
}
