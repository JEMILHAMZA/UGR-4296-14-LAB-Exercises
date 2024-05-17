fun main() {
    val start = 10
    val end = 50

    for (num in start..end) {
        if (isPrime(num)) {
            println("$num is a prime number")
        }
    }
}

fun isPrime(n: Int): Boolean {
    if (n < 2) return false
    for (i in 2 until n) {
        if (n % i == 0) return false
    }
    return true
}
