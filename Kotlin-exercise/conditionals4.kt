fun main() {
    val num1 = 12
    val num2 = 25
    val num3 = 9

    val largest = if (num1 >= num2 && num1 >= num3) {
        num1
    } else if (num2 >= num1 && num2 >= num3) {
        num2
    } else {
        num3
    }

    println("The largest number is $largest")
}
