fun main() {
    val side1 = 3
    val side2 = 3
    val side3 = 3

    if (side1 == side2 && side2 == side3) {
        println("The triangle is equilateral.")
    } else if (side1 == side2 || side2 == side3 || side1 == side3) {
        println("The triangle is isosceles.")
    } else {
        println("The triangle is scalene.")
    }
}

