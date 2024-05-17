class Triangle(private val side1: Double, private val side2: Double, private val side3: Double) {
    fun type(): String {
        return when {
            side1 == side2 && side2 == side3 -> "Equilateral"
            side1 == side2 || side2 == side3 || side1 == side3 -> "Isosceles"
            else -> "Scalene"
        }
    }
}

fun main() {
    val triangle = Triangle(3.0, 3.0, 3.0)
    println("Triangle Type: ${triangle.type()}")
}
