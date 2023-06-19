import UIKit
//В рамках прошлого домашнего задания был создан класс пиццерии с переменной, в которой хранится пицца, удалите её. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
protocol MenuProtocol {
    var cost: Double { get }
    var name: String { get }
}
struct Pizza: MenuProtocol{
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

struct Potato: MenuProtocol {
    enum Size: String {
    case big
    case medium
    case small
    }
    var size: Size
    var cost: Double
    
}
class Pizzeria {
    private var menu: [MenuProtocol]
    init(menu: [MenuProtocol]) {
        self.menu = menu
    }
//Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
    func add(_ new: MenuProtocol) {
        menu.append(new)
    }
}

///Создайте протокол, в котором будут содержаться функции открытия и закрытия.

protocol WorkingTime {
    func open()
    func close()
}

//Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.
extension Pizzeria: WorkingTime {
    func open() {
        print("Pizzeria is open")
    }
    
    func close() {
        print("Pizzeria closed")
    }
}
//Написать функцию, в которой происходит вычитание одного числа из другого. Функция должна работать и с Int, и с Double.Функция должна возвращать результат вычитания.
func calc<T: Numeric>(a: T, b: T) -> T {
    a - b
}
