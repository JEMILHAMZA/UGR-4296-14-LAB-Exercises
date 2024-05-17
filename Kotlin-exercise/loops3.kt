fun main() {
    val number = 121
    if (isPalindrome(number)) {
        println("$number is a palindrome")
    } else {
        println("$number is not a palindrome")
    }
}

fun isPalindrome(n: Int): Boolean {
    var original = n
    var reversed = 0

    while (original != 0) {
        val digit = original % 10
        reversed = reversed * 10 + digit
        original /= 10
    }

    return n == reversed
}
