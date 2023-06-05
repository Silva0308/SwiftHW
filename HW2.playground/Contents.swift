import UIKit

//Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент — это годовой процент, третий аргумент — это срок функция возвращает сколько денег получит пользователь по итогу.
func bankAcc( s: Float, p: Float, t: Float) -> Float{
    var total: Float = 0
    total = (s * p * t) / 365 / 100
    return total
}
print(bankAcc(s: 50000, p: 4.7, t: 365))
//Создать перечисление, которое содержит 3 вида пиццы, и создать переменные с каждым видом пиццы.
enum Pizza: String {
    case margerita = "Margerita"
    case quattro = "Quattro formaggi"
    case napoli = "Napoletana"}
var p1 = Pizza.margerita
var p2 = Pizza.napoli
var p3 = Pizza.quattro

//Добавить возможность получения названия пиццы через rawValue.
func getName(p: Pizza) -> String {
    p.rawValue
}
print(getName(p: p1))
print(p2.rawValue) // так тоже можно
print(p3.rawValue)
