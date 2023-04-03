// 비즈니스 모델
struct Product{
    let id:Int
    let name:String
    let price:Int
}
let products: [Product] = [
    Product(id: 1, name: "Shoes", price: 1000),
    Product(id: 2, name: "Cap", price: 4000),
    Product(id: 3, name: "Bag", price: 6000)
]

let productIDs = products.map{$0.id}
let productNames = products.map{$0.name}

let productIDs_KeyPath = products.map(\.id)
let productNames_KeyPath = products.map(\.name)

extension Sequence{
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted {
            a, b in
            return a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}
let sort_productIDs = products.sorted{$0.id < $1.id}
let sort_productNames = products.sorted{$0.name < $1.name}

let sort_productIDs_KeyPath = products.sorted(by: \.id)
let sort_productNames_KeyPath = products.sorted(by: \.name)

