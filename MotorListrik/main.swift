//
//  main.swift
//  MotorListrik
//
//  Created by Ridha Ahmad Firdaus on 18/07/22.
//

import Foundation

// MARK: Mendapatkan nilai string dari pengguna.
func getInput(message: String) -> String? {
    print(message, terminator: " : ");
    return readLine()
}

// MARK: Mendapatkan nilai integer dari pengguna.
func getInputInt(message: String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
    } else {
        return nil
    }
}

// MARK: Menampung variabel speed
var speedTotal = 0

// MARK: Closure untuk mendapatkan kecepatan
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    func incrementer() -> Int {
        speedTotal += amount
        return speedTotal
    }
    return incrementer
}

// MARK: Closure untuk mengurangi kecepatan
func makeDecrementer(forDecrement amount: Int) -> () -> Int {
    func decrement() -> Int {
        speedTotal -= amount
        return speedTotal
    }
    return decrement
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let decrementByTen = makeDecrementer(forDecrement: 10)

// MARK: Menyalakan mesin motor listrik
func turnOnEngine() {
    print("Hidupkan mesin.........")
    print("Selamat datang di Motor Listrik Dicoding")
    print("Brem brem brem brem")
}

// MARK: Mematikan mesin motor listrik
func turnOffEngine() {
    print("Ciiiiiiiitttttt......")
    print("Motor berhenti!!!!")
}

// MARK: Menampilkan kecepatan saat ini
func showSpeed() {
    print("Kecepatan saat ini : \(speedTotal)")
    print("Ngeeeeengggggggg")
}

// MARK: Memberikan aksi ke motor listrik
func action() {
    print("----------------------------------------")
    print("Ayo beraksi:")
    print("[1] Tambahkan kecepatan")
    print("[2] Kurangi kecepatan")
    print("[3] Matikan mesin")
    if let state = getInputInt(message: "Masukkan aksi Anda") {
        switch state {
        case 1:
            speedTotal = incrementByTen()
            showSpeed()
            action()
        case 2:
            if speedTotal > 0 {
                speedTotal = decrementByTen()
                showSpeed()
                action()
            } else {
                turnOffEngine()
                break
            }
        case 3:
            turnOffEngine()
            break
            default:
            break
        }
    } else {
        print("Input tidak valid")
    }
}

// MARK: Memulai program
turnOnEngine()
action()
