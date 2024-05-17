fun hasUniqueCharacters(s: String): Boolean {
    val charSet = mutableSetOf<Char>()
    for (char in s) {
        if (!charSet.add(char)) {
            return false
        }
    }
    return true
}

fun main() {
    val testString = "abcdefg"
    println("Does '$testString' have all unique characters? ${hasUniqueCharacters(testString)}")
}
