import UIKit

//Написать функцию, которая на вход принимает число типа Int, а возвращает, является ли число четным

func IsEven (value: Int) -> Bool {
  value % 2 == 0
}
print(IsEven(value: 5))
//Написать функцию, которая на вход принимает 3 числа: a, b, c и возвращает результат вычисления b^2 - 4 * a * c

func Mult (a: Int, b: Int, c: Int) -> Int {
    return b*b - 4 * a * c
}
print (Mult(a: 2, b: 5, c: 3))
//Написать функцию, которая рассчитает площадь прямоугольника. На вход два параметра: длина и ширина, на выход: площадь
func Square (with a: Int, b :Int) -> Int {
    return a*b
}
print (Square(with: 5, b: 2))
//Напишите функции, которая на вход принимает целое положительное число, а возвращает сумму всех чисел от 1 до переданного числа
func SumNum (a: Int) -> Int{
    var sum = 0
    for i in 1...a{
        sum += i}
    return sum
}

//Создать опционал с типом Int и создать еще одну переменную, которая содержит значение первой переменной, но не является опционалом.  Сделать это необходимо 2 способами: при помощи force unwrapping,  nil coalescing

var a: Int? = 5
var b = a!
var c = a ?? 10

//Создать перечисление, которое имеет в виде кейсов два вида чая: зеленый и черный
//enum Tea: String {
//    case green
//    case black
//}

//Задать для кейсов названия “Black tea” и “Green tea”
enum Tea: String {
    case green = "Green tea"
    case black = "Black tea"
    func getColor() -> String {
       // self.rawValue
        switch self {
        case .green: return "green"
        case .black: return "black"
        }
    }
}
//Написать внутри перечисления функцию, которая будет возвращать цвет чая в строковом формате, то есть, если это blackTea, то black, а если greenTea, то green

var tea: Tea = .green
tea.getColor()


//Создать переменную с типом созданного перечисления, а затем при помощи print вывести цвет чая
var first = Tea.black
print(first)
//Написать функцию, которая на вход принимает параметр типа Tea, но который является опционалом. Функция должна печатать название чая, если значение есть и “Данный вид чая не найден”, если значение nil. Написать функцию нужно в 2 вариантах: используя guard let, используя if let
func whatTea(b: Tea?){
    if let b {
        print(b.rawValue)
    }
    else{
        print("Данный вид чая не найден")
    }
}

func someTea (a: Tea?){
    guard let c = a
    else{
        print("Данный вид чая не найден")
        return
    }
    print(c.rawValue)
}
