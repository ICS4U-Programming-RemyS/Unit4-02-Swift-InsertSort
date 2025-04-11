// InsertSort.swift
//
// Created by Remy Skelton
// Created on 2025-April-10
// Version 1.0
// Copyright (c) Remy Skelton. All rights reserved.
//
// This program generates a random array, sorts it using the insertion sort algorithm,
// and writes the sorted array to an output file.

// Import Foundation for file handling
import Foundation

// Define constants
let arraySize = 10
let maxRandomNumber = 100
let minRandomNumber = 1

// Welcome message
print("Welcome to the Insert Sort program!")
print("This program generates a random array, sorts it using the insertion sort algorithm,")
print("and writes the result to output.txt.")

// Function to generate a random array of integers
func generateRandomArray(size: Int, min: Int, max: Int) -> [Int] {
    // Create an empty array to hold the random numbers
    var randomArray = [Int]()
    // Generate random numbers within the specified range
    for _ in 0..<size {
        // Generate a random number between min and max using Int.random(in:)
        let randomNumber = Int.random(in: min...max)
        randomArray.append(randomNumber)
    }
    // Return the generated random array
    return randomArray
}

// Function to perform insertion sort
func insertionSort(unsortedArray: [Int]) -> [Int] {
    // Create a copy of the unsorted array to sort
    var sortedArray = unsortedArray
    // Loop through the array starting from the second element
    for currentIndex in 1..<sortedArray.count {
        // Store the current value to be inserted
        let currentValue = sortedArray[currentIndex]
        // Initialize the index for the sorted part of the array
        var insertIndex = currentIndex - 1
        // Shift elements of the sorted part of the array to the right
        while insertIndex >= 0 && sortedArray[insertIndex] > currentValue {
            // Move the larger element to the right
            sortedArray[insertIndex + 1] = sortedArray[insertIndex]
            // Decrease the index to check the next element
            insertIndex -= 1
        }
        // Insert the current value at the correct position
        sortedArray[insertIndex + 1] = currentValue
    }
    // Return the sorted array
    return sortedArray
}

// Generate the random array
let randomArray = generateRandomArray(size: arraySize, min: minRandomNumber, max: maxRandomNumber)

// Write the unsorted array to input.txt
let inputFilePath = "input.txt"
let inputFileURL = URL(fileURLWithPath: inputFilePath)
// Convert the random array to a string and write it to the input file
do {
    // Convert the random array to a string
    let inputArrayString = randomArray.map { String($0) }.joined(separator: " ")
    // Write the unsorted array string to the input file
    try inputArrayString.write(to: inputFileURL, atomically: true, encoding: .utf8)

    // Print a success message
    print("Unsorted array written to input.txt.")
} catch {
    // Print an error message if writing to the file fails
    print("Error writing to input file: \(error)")
}

// Sort the array using insertion sort
let sortedArray = insertionSort(unsortedArray: randomArray)

// Write the sorted array to output.txt
let outputFilePath = "output.txt"
let outputFileURL = URL(fileURLWithPath: outputFilePath)
do {
    // Convert the sorted array to a string
    let sortedArrayString = sortedArray.map { String($0) }.joined(separator: " ")
    // Write the sorted array with the label "Sorted array:"
    let outputString = "Sorted array: \(sortedArrayString)"
    // Write the sorted array string to the output file
    try outputString.write(to: outputFileURL, atomically: true, encoding: .utf8)
    // Print a success message
    print("Sorted array written to output.txt.")
} catch {

    // Print an error message if writing to the file fails
    print("Error writing to output file: \(error)")
}
