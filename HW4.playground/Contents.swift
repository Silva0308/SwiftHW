import UIKit
//Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).
//enum PizzaType: String {
   // case margerita = "Margerita"
    //case quattro = "Quattro formaggi"
    //case napoli = "Napoletana"
   // case peperoni = "Peperoni"
   // case cheese  = "Cheese"
//}
//Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.
struct Pizza{
    enum PizzaType: String {
        case margerita = "Margerita"
        case quattro = "Quattro formaggi"
        case napoli = "Napoletana"
        case peperoni = "Peperoni"
        case cheese  = "Cheese"
    }
    enum Additions {
        case peper
        case moreCheese
        case tomato
    }
    var type: PizzaType
    var isFat: Bool
    var cost: Double
    var additions: [Additions]
}
//Создать класс пиццерии, добавить массив с возможными видами пиццы. Переменная с массивом должна быть приватной. Массив задаётся в инициализаторе.
class Pizzeria {
    private var pizza: [Pizza]
    init(pizza: [Pizza]) {
        self.pizza = pizza
    }
    //Написать в классе пиццерии функции для добавления нового вида пиццы и для получения всех доступных пицц.
    func addPizza(_ pizza: Pizza){
        self.pizza.append(pizza)
    }
    func getAll() ->[Pizza]{
        return pizza
    }
}
//Создать экземпляр класса пиццерии и добавить в него несколько видов пицц.
var pizza = [Pizza(type: .cheese, isFat: true, cost: 3.75, additions: []),Pizza(type: .margerita, isFat: false, cost: 7.45, additions: [.moreCheese])]
var mypizzeria = Pizzeria(pizza: pizza)
mypizzeria.addPizza(Pizza(type: .quattro, isFat: false, cost: 4.05, additions: [.peper]))
