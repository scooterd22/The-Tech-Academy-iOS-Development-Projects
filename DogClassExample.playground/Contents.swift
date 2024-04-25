
class Dog {
    var breed: String
    var color: String
    var height: Int
    var weight: Int
    
    init(breed: String, color: String, height: Int, weight: Int) {
        self.breed = breed
        self.color = color
        self.height = height
        self.weight = weight
    }
    
    func shake() {
        print("The dog shook")
    }
    
    func sit() {
        print("The dog sat")
    }
    
    func laydown() {
        print("The dog laid down")
    }
}

var newHound = Dog(breed: "Hound", color: "Brown", height: 2, weight: 60)
print(newHound.breed + " " + newHound.color + " \(newHound.height)ft \(newHound.weight)lbs")
newHound.shake()
newHound.sit()
newHound.laydown()



