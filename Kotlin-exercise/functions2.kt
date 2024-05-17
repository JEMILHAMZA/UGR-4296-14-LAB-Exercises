fun factorial(n: Int): Int {
    return if (n == 1) n else n * factorial(n - 1)
}

fun main() {
    val number = 5
    println("Factorial of $number is ${factorial(number)}")
}
