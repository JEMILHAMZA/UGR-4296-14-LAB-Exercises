package com.example.counterapp

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    private lateinit var countTextView: TextView
    private lateinit var incrementButton: Button
    private lateinit var decrementButton: Button
    private lateinit var resetButton: Button

    private var count = 0

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main) // Set the layout

        countTextView = findViewById(R.id.countTextView)
        incrementButton = findViewById(R.id.incrementButton)
        decrementButton = findViewById(R.id.decrementButton)
        resetButton = findViewById(R.id.resetButton)

        // Set initial count
        updateCountText()

        // Increment button click listener
        incrementButton.setOnClickListener {
            count++
            updateCountText()
        }

        // Decrement button click listener
        decrementButton.setOnClickListener {
            count--
            updateCountText()
        }

        // Reset button click listener
        resetButton.setOnClickListener {
            count = 0
            updateCountText()
        }
    }

    // Method to update the count text view
    private fun updateCountText() {
        countTextView.text = count.toString()
    }
}