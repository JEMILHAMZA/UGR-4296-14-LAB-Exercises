fun main() {
    val month = 5 // May
    val day = 18

    val season = when (month) {
        12, 1, 2 -> "Winter"
        3, 4, 5 -> "Spring"
        6, 7, 8 -> "Summer"
        9, 10, 11 -> "Fall"
        else -> "Unknown"
    }

    println("Season: $season")
}


