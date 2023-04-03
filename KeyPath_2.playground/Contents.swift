import UIKit
struct Product{
    let id: Int
    let name: String
    let price: Int
}
struct Person{
    let personName: String
    let age: Int
}
protocol NamePriceTableViewCell:UITableViewCell{
    var titleLabel: UILabel {get}
    var subTitleLabel: UILabel {get}
    
}
struct ProductCellConfigurator{
    func configure(_ cell: NamePriceTableViewCell, for product: Product) {
        cell.titleLabel.text = product.name
        cell.subTitleLabel.text = String(product.price)
    }
}
struct CellConfigurator<Model> {
    let titleKeyPath: KeyPath<Model, String>
    let subTitleKeyPath: KeyPath<Model, Int>
    
    func configure(_ cell: NamePriceTableViewCell, for model: Model) {
        cell.titleLabel.text = model[keyPath: titleKeyPath]
        cell.subTitleLabel.text = String(model[keyPath: subTitleKeyPath])
    }
}

let productCellConfigure = CellConfigurator<Product>(
    titleKeyPath: \.name,
    subTitleKeyPath: \.price)
let personCellConfigure = CellConfigurator<Person>(
    titleKeyPath: \.personName,
    subTitleKeyPath: \.age)
