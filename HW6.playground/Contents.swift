import UIKit
//Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар.
struct Pers{
    var name :String
    var salary :Double
    enum Position: String {
        case cassier = "Cashier"
        case chief = "Chief"
    }
}
protocol MenuProtocol {
    var cost: Double { get }
    var name: String { get }
}
struct Pizza: MenuProtocol{
    var name: String
    
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
    var name: String
    
    enum Size: String {
    case big
    case medium
    case small
    }
    var size: Size
    var cost: Double
    
}
class Pizzeria {
//Добавить в класс пиццерии массив с работниками.
    private var menu: [MenuProtocol]
    var personal: [Pers]
    var tables: [Table]
    init(menu: [MenuProtocol], personal: [Pers]) {
        self.menu = menu
        self.personal = personal
        tables = [Table(posts: 1)] // столик меньше, чем на 1 не бывает:)
    }
    //Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится кафе, в котором стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.
    
    func add(_ new: MenuProtocol) {
        menu.append(new)
    }

}

//Создать класс столика, в нём должно быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задаётся в инициализаторе
class Table {
    weak var cafe: Pizzeria? //столик может быть и не в кафе
    var posts: Int
    init (posts: Int){
        self.posts = posts
    }
    func guests(g: Int) ->Bool{
        g <= posts
    }
}


