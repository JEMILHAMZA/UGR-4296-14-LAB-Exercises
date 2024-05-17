fun sortArray(arr: IntArray): IntArray {
    return arr.sortedArray()
}

fun main() {
    val array = intArrayOf(5, 2, 8, 1, 3)
    val sortedArray = sortArray(array)
    println("Sorted Array: ${sortedArray.joinToString()}")
}
