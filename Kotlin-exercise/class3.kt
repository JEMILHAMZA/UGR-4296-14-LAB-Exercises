class ShoppingCart {
    private val items = mutableListOf<Pair<String, Double>>()

    fun addItem(item: String, price: Double) {
        items.add(item to price)
    }

    fun removeItem(item: String) {
        items.removeIf { it.first == item }
    }

    fun totalPrice(): Double {
        return items.sumOf { it.second }
    }

    fun showItems() {
        for (item in items) {
            println("${item.first}: $${item.second}")
        }
    }
}

fun main() {
    val cart = ShoppingCart()
    cart.addItem("Apple", 1.5)
    cart.addItem("Banana", 0.75)
    cart.showItems()
    println("Total Price: $${cart.totalPrice()}")
    cart.removeItem("Apple")
    cart.showItems()
    println("Total Price: $${cart.totalPrice()}")
}
