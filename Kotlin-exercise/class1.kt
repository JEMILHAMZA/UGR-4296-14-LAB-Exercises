class Rectangle(private val length: Double, private val width: Double) {
    fun perimeter(): Double {
        return 2 * (length + width)
    }

    fun area(): Double {
        return length * width
    }
}

fun main() {
    val rectangle = Rectangle(5.0, 3.0)
    println("Perimeter: ${rectangle.perimeter()}")
    println("Area: ${rectangle.area()}")
}
