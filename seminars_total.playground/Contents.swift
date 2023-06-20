// Lesson 2. Part 2

import Foundation

////Создать перечисление, которое имеет в виде кейсов два вида чая: зеленый и черный
//
////enum Tea {
////    case blackTea
////    case greenTea
////}
//
////Задать для кейсов названия “Black tea” и “Green tea”
//
////enum Tea: String {
////    case blackTea = "Black tea"
////    case greenTea = "Green tea"
////}
//
////Написать внутри перечисления функцию, которая будет возвращать цвет чая в строковом формате, то есть, если это blackTea, то black, а если greenTea, то green
//
////enum Tea: String {
////    case blackTea = "Black tea"
////    case greenTea = "Green tea"
////    case fruitTes = "Fruit tea"
////
////    func getColor() -> String {
////        switch self {
////        case .blackTea: return "black"
////        case .greenTea: return "green"
////        }
////    }
////}
//
////Создать переменную с типом созданного перечисления, а затем при помощи print вывести цвет чая
//
////let tea: Tea = .blackTea
////print(tea.getColor())
//
////Написать функцию, которая на вход принимает параметр типа Tea, но который является опционалом. Функция должна печатать название чая, если значение есть и “Данный вид чая не найден”, если значение nil. Написать функцию нужно в 2 вариантах: используя guard let, используя if let
//
////func getNameV1(tea: Tea?) {
////    guard let tea = tea else {
////        print("Данный вид чая не найден")
////        return
////    }
////    print(tea.rawValue)
////}
////
////
////func getNameV2(tea: Tea?) {
////    if let tea = tea {
////        print(tea.rawValue)
////    } else {
////        print("Данный вид чая не найден")
////    }
////}
//
//// Lesson 4. Part 1.
//
////Создать перечисление с видами чая (black, fruit, green), далее создать структуру, в которой будет хранится вид чая и его стоимость.
//
//enum TeaType {
//    case black
//    case green
//    case fruit
//}
//
//
//struct Tea {
//    var type: TeaType
//    var cost: Double
//}
//
////Создать класс Cafe, в котором хранится массив с чаем. Переменная с массивом должна быть приватной. Значение в массив должно устанавливаться в инициализаторе
//
//class Cafe{
//    private var tea: [Tea]
//
//    init(tea: [Tea]) {
//        self.tea = tea
//    }
//}
//
////Добавить в структуру чая функцию getCost, которая будет возвращать стоимость чая. На вход функция принимает процент скидки (только целое число), который необходимо применить к стоимости. Если скидка больше 50% напечатать в консоль о невозможности применить скидку и вернуть изначальную стоимость чая.
//
//struct Tea {
//    var type: TeaType
//    var cost: Double
//
//    func getCost(sale: Int) -> Double {
//        guard sale <= 50 else {
//            print("Невозможно применить скидку")
//            return cost
//        }
//        return cost * Double(sale) / 100
//    }
//}
//
////Добавить в класс функцию, которая на вход принимает тип чая и скидку, которую нужно применить. Функция должна вернуть стоимость, которую должен заплатить покупатель. Если данного вида чая нет в массиве(меню) - вернуть nil.
//
//class Cafe{
//    private var tea: [Tea]
//
//    init(tea: [Tea]) {
//        self.tea = tea
//    }
//
//    func getCost(type: TeaType, sale: Int) -> Double? {
//        guard let oneTea = tea.first { $0.type == type } else {
//            return nil
//        }
//        return oneTea.getCost(sale: sale)
//    }
//}
//
//// Lesson 4. Part 2.
//
////Сделать тип чая вложенным типом для структуры чая.
//
////struct Tea {
////    enum TeaType {
////        case black
////        case green
////        case fruit
////    }
////
////    var type: TeaType
////    var cost: Double
////
////    func getCost(sale: Int) -> Double {
////        guard sale <= 50 else {
////            print("Невозможно применить скидку")
////            return cost
////        }
////        return cost - cost * Double(sale) / 100
////    }
////}
//
////Сделать так, чтобы в структуре чая можно было получить стоимость только через функцию getCost, то есть чтобы извне функции не было доступа к переменной со стоимостью чая.
//
////private var cost: Double
////
////
////​​    init(type: TeaType, cost: Double) {
////    self.type = type
////    self.cost = cost
////}
//
////Создать класс Person, внутри которого должна быть структура Activity, внутри которой должно быть перечисление TypeOfActivity (тип активности) с тремя кейсами: pupil, student, employee. Создать переменную и явно указать ей тип “тип активности”.
//
//class Person {
//    struct Activity {
//        enum TypeOfActivity {
//            case pupil
//            case student
//            case employee
//        }
//    }
//}
//
//let typeOfActivity: Person.Activity.TypeOfActivity
//
////Добавить в класс Cafe функцию, которая на основе типа активности, предложенной суммы и возможной скидки возвращает доступный чая. Чай выбирается по следующим критериям: если это pupil, то доступен и черный, и зеленый, и фруктовый чай. Если это student, то только черный, а если employee, то черный и фруктовый. Если предложенной суммы хватает на все доступные виды чая, то вернуть самый дорогой. Если суммы хватает только на один, то вернуть его. Если суммы хватает на несколько доступных  видов чая, но у них одинаковая стоимость, то вернуть любой из них. Если суммы не хватает ни на один вид чая, то вернуть nil.
//
////func getTea(activity: Person.Activity.TypeOfActivity, cost: Double, sale: Int) -> Tea? {
////    switch activity {
////    case .pupil:
////        let givenTea = tea.filter { $0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
////        return givenTea.first
////    case .student:
////        let givenTea = tea.filter { $0.type == .black && $0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
////        return givenTea.first
////    case .employee:
////        let givenTea = tea.filter { ($0.type == .black || $0.type == .fruit) && $0.getCost(sale: sale) <= cost}.sorted { $0.getCost(sale: sale) > $1.getCost(sale: sale) }
////        return givenTea.first
////    }
////}

// Lesson 5. Part 1.

//Создать протокол для меню. Протокол должен содержать стоимость и наименование. Стоимость и название должны быть get-only

protocol MenuProtocol {
    var cost: Double { get }
    var name: String { get }
}

//Создайте класс кафе, в нем должен быть массив с наименованиями меню  и инициализатор. Подпишите структуру чая с прошлого занятия на протокол из первого пункта. В качестве name должен быть вид чая и “tea”, то есть, например, для черного чая должно быть black tea, а для зеленого green tea

struct Tea: MenuProtocol {
    enum TeaType: String {
        case black
        case green
        case fruit
    }

    var type: TeaType
    var name: String { type.rawValue + " tea"}
    var cost: Double
    var temp: Double

    init(type: TeaType, cost: Double, temp: Double) {
        self.type = type
        self.cost = cost
        self.temp = temp
    }

    func getCost(sale: Int) -> Double {
        guard sale <= 50 else {
            print("Невозможно применить скидку")
            return cost
        }
        return cost - cost * Double(sale) / 100
    }

}

//class Cafe {
//    private var menu: [MenuProtocol]
//
//    init(menu: [MenuProtocol]) {
//        self.menu = menu
//    }
//}

//Создайте еще 3 кафе, для которых класс Cafe будет родительским.

//class FirstCafe: Cafe {}
//class SecondCafe: Cafe {}
//class ThirdCafe: Cafe {}

//Добавить в родительский класс функцию (add) по добавлению новой позиции в меню. Саму переменную меню сделать приватной, если она еще таковой не является

//class Cafe {
//    fileprivate var menu: [MenuProtocol]
//
//    init(menu: [MenuProtocol]) {
//        self.menu = menu
//    }
//
//    func add(_ new: MenuProtocol) {
//        menu.append(new)
//    }
//
//    func get() -> [MenuProtocol] {
//        menu
//    }
//
//    func getAvailable(cost: Double) -> [MenuProtocol] {
//        menu.filter { $0.cost <= cost }
//    }
//}

//Сделать так, чтобы в первом из трех классов наследников(например, FirstCafe) функция add помимо того, что выполняла все тоже самое, что и в родительском классе, печатала в консоль стоимость добавляемой позиции.

//class FirstCafe: Cafe {
//    override func add(_ new: MenuProtocol) {
//        super.add(new)
//        print(new.cost)
//    }
//}

//Создать класс автомата с едой, не реализовывать в нем ни методов, ни свойств, однако этот класс должен уметь делать все тоже самое, что и FirstCafe

//class VendingMachine: FirstCafe {}

//Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.

//final class VendingMachine: FirstCafe {
//    func get(number: Int, cost: Double) -> MenuProtocol? {
//        guard number < menu.count else {
//            return nil
//        }
//        let element  = menu[number]
//        if element.cost <= cost {
//            return element
//        } else {
//            return nil
//        }
//    }
//}

// Lesson 5. Part 2.

//Создать две структуры: лимонад и салат. Сделать так, чтобы и то и то можно  добавить в меню кафе.

struct Lemonade: MenuProtocol {
    enum LemonadeType: String {
        case standart
    }
    var cost: Double
    var type: LemonadeType
    var name: String { type.rawValue + " lemonade" }
}


struct Salad: MenuProtocol {
    enum SaladType: String {
        case standart
    }
    var cost: Double
    var type: SaladType
    var name: String { type.rawValue }
}

//Добавить в класс кафе функция, которая возвращает все позиции меню

//func get() -> [MenuProtocol] {
//        menu
//    }

//Добавить в класс кафе функцию, которая на основе цены возвращает массив позиция которые можно купить (Например, есть черный чай за 50, зеленый за 60, лимонад за 100 и салат за 150. Функция получае 90, значит она должна вернуть черный чай и зеленый чай)

//func getAvailable(cost: Double) -> [MenuProtocol] {
//        menu.filter { $0.cost <= cost }
//    }

//Задать переменной с меню в классе Cafe уровень fileprivate

//fileprivate var menu: [MenuProtocol]

//Добавить в класс автомата с едой функцию, которая на основе полученного номера (номер элемента в массиве) и денег возвращает товар под необходимым номером, если денег хватает и nil, если денег не хватает. Если товар не найден, тоже вернуть nil
//final class VendingMachine: FirstCafe {
//    func get(number: Int, cost: Double) -> MenuProtocol? {
//        guard number < menu.count else {
//            return nil
//        }
//        let element  = menu[number]
//        if element.cost <=  cost {
//            return element
//        } else {
//            return nil
//        }
//    }
//}

//Создать протокол, в котором будет содержаться две функции: start и final.

//protocol WorkProtocol {
//    func start()
//    func final()
//}

//Для класса автомата с едой создать расширение, в котором будут содержаться функции из протокола из пункта 6 (класс должен быть подписан на протокол). В функции start должно печататься о начале работы автомата, а в final о завершении

//extension VendingMachine: WorkProtocol {
//    func start() {
//        print("Start")
//    }
//
//    func final() {
//        print("Final")
//    }
//}
//Создайте переменную “a”, в которой будет хранится массив с Tea. Создайте другую переменную “b” и присвойте ей переменную “a”. Выведете в консоль адреса массивов. Затем в “b” добавьте еще один элемент. Выведете в консоль адреса массивов. Объясните полученный результат (можно рядом в комментарии)

var a: [Tea] = [Tea(type: .fruit, cost: 3.10, temp: 97.3), Tea(type: .green, cost: 3.50, temp: 87.4)]
var b = a
b.append(Tea(type: .black, cost: 3.75, temp: 95.6))

func getAddress(_ collection: UnsafeRawPointer) {
    print(Int(bitPattern: collection))
}

getAddress(a)
getAddress(b)

//Создайте класс, в котором будет одна переменная “test” типа String. Создайте экземпляр класса (название переменной, например, c). Создайте еще одну переменную (название переменной, например, d) и присвойте ей c. В переменной d измените “test”. Выведите в консоль “test” для c и d. Объясните результат
class MyClass {
    var test: String = " "
}
var c = MyClass()
var d = c
d.test = "new string"
print(c.test)
print(d.test)

//Создайте структуру, в котором будет одна переменная “test” типа String. Создайте переменную, в которой будет лежать структура (название переменной, например, e). Создайте еще одну переменную (название переменной, например, f) и присвойте ей e. В переменной f измените “test”. Выведите в консоль “test” для e и f. Объясните результат
struct MyStruct {
    var test: String = "my string"
}
var e = MyStruct()
var f = e
f.test = "new"
print(e.test)
print(f.test)
//Создайте класс магазина. В нем должно быть два массива, один с товарами, второй с работниками. Для работников создайте свою структуру, а для товаров свою. Для товаров должно быть минимум 3 разных структуры, например, еда, напитки и одежда. Добавить в класс функцию, которая будет добавлять работника в массив. Написать функцию, которая будет добавлять новый товар в массив.
struct Pers{
    var name :String
    var salary :Double
}
protocol GoodsProtocol {
    var cost: Double { get }
    var name: String { get }
}
struct Food: GoodsProtocol{
    var cost: Double
    var name: String
}
struct Drinks: GoodsProtocol{
    var cost: Double
    var name: String

}
struct Clothes: GoodsProtocol{
    var cost: Double
    var name: String
}
class Store{
    var goods: [GoodsProtocol]
    var pers: [Pers]
    var owner: Owner
    var cafe: Cafe
    init(goods: [GoodsProtocol], pers: [Pers], owner: Owner){
        self.goods = goods
        self.pers = pers
        self.owner = owner
        cafe = Cafe(menu: [])
    }
    func add(_ new: GoodsProtocol) {
           goods.append(new)
       }
   }

// Создать класс владельца магазина. Добавить в него свойство, в котором будет хранится магазин, которым он владеет. А в класс магазина добавить переменную, в которой будет хранится владелец магазина. Ответьте на вопрос: Есть ли в такой связке магазин -> директор и директор -> магазин какая-то проблема? Если да, то какая и как ее решить?
class Owner {
    weak var store: Store?
    
}
//С прошлого семинара есть класс Cafe, в котором есть переменная menu, в которую можно добавлять и чай, и лимонад, и салат. Необходимо добавить в структуру чая свойство температуры. Написать функцию в классе Cafe, которая выведет температуру всех Tea из переменной menu.

class Cafe {
    fileprivate var menu: [MenuProtocol]

    init(menu: [MenuProtocol]) {
        self.menu = menu
    }

    func add(_ new: MenuProtocol) {
        menu.append(new)
    }

    func get() -> [MenuProtocol] {
        menu
    }

    func getAvailable(cost: Double) -> [MenuProtocol] {
        menu.filter { $0.cost <= cost }
    }
    func getTempOfTea(){
        for m in menu{
            guard let m = m as? Tea else{
                continue
            }
            print(m.temp)
        }
    }
//    func getMenu() -> Dictionary<MenuProtocol, [String]>{
//        for m in menu
//    }
}
///Добавить в  ранее созданный класс магазина свойство, в котором будет хранится Cafe. Сделать так, чтобы все свойства класса магазина (массив товаров и работников, владелец магазина и кафе) устанавливались в инициализаторе, но в инициализатор передается только массив товаров и работников, а также владелец магазина. Кафе создается внутри инициализатора

//Добавить в класс кафе свойство, в котором будет хранится владелец кафе. Значение свойству должно устанавливаться в инициализаторе. Когда в классе магазина создается Cafe - владелец и у магазина и у кафе должен быть один.


//init(menu: [MenuProtocol], cafeOwner: Owner) {
//self.menu = menu
//self.cafeOwner = cafeOwner}


//Написать в классе магазина функцию, которая возвращает меню кафе в виде словаря [<что это>: [массив позиций]], например, в меню есть [чай, чай, лимонад, салат, салат], а вернуть функция должна [“tea”: [чай, чай], “lemonade”: [лимонад], “salad”; [салат, салат] ]. Если для позиции ничего нет (например, нет ни одного лимонада), под ключом должен вернуться пустой массив
func getMenu() -> [String: [MenuProtocol]]{
    var tea: [Tea] =  []
    var lemonade: [Lemonade] = []
    var salad: [Salad] = []
    for product in cafe.menu {
        if let product = product as? Tea {
            tea.append(product)
        } else if let product as? Lemonade {
            lemonade.append(product)}
        else if let product as? Salad {
            salad.append(product)
        }
    }
    return ["tea": tea, "lemonade": lemonade, "salad": salad]
}

//Добавить в класс магазина функцию, которая на основе словаря из предыдущего задания возвращает словарь с теми же ключами, но вместо массива позиций должен быть массив стоимостей этих позиций

func getCost() -> [String: [Double]]{
    let menu =  getMenu()
    var final: [String: [Double]] = [:]
    for p in menu{
        let cost =  p.value.map {$0.cost}
        final.updateValue(cost, forKey: p.key)
    }
    return final
}
