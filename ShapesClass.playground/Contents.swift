import Foundation

class Shape {
    var color = "yellow"
    
    func getArea(height: Double, width: Double) -> Double {
        return height * width
    }
    
    func getArea(base: Double, height: Double) -> Double {
        return (base * height)/2
    }
    
    func getArea(radius: Double) -> Double {
        return 3.1415 * pow(radius, 2)
    }
}

class Rectangle: Shape {
    var height: Double
    var width: Double
    
    init(height: Double, width: Double) {
        self.height = height
        self.width = width
    }
}

class Triangle: Shape {
    var base: Double = 12
    var height: Double = 10
}

class Circle: Shape {
    var radius: Double = 5
    
}

var rect = Rectangle(height: 10, width: 12)
let rectArea = rect.getArea(height: rect.height, width: rect.width)
print(rectArea)

var triangle = Triangle()
let triangleArea = triangle.getArea(base: triangle.base, height: triangle.height)
print(triangleArea)

var circle = Circle()
let circleArea = circle.getArea(radius: circle.radius)
print(String(format: "%.2f", circleArea))

print(circle.color)

