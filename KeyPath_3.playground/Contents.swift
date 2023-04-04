import Foundation
struct Product {
    let id: Int
    let name: String
    let price: Int
}
struct Post {
    let title:String
    let data:TimeZone
}
protocol LoadProduct {
    func getProduct(_ completion: ([Product]) -> Void)
}
protocol LostPost {
    func getPost(_ completion: ([Post]) -> Void)
}

func setter<Object: AnyObject, Value>(
    for object: Object,
    keyPath: ReferenceWritableKeyPath<Object, Value>
) -> (Value) -> Void {
    return {
        [weak object] value in
        object?[keyPath: keyPath] = value
    }
}

class ViewModel {
    let loader: LoadProduct
    init(loader: LoadProduct) {
        self.loader = loader
    }
    private var products: [Product] = [Product]() {
        didSet {
            rendering()
        }
    }
    private func rendering(){
        
        // View binding
        
    }
    func loadProducts() {
        loader.getProduct {
            [weak self] products in
            self?.products = products
        }
    }
    func opti_loadProducts(){
        loader.getProduct(setter(for: self, keyPath: \.products))
    }
}
class OtherViewModel {
    let loader: LostPost
    init(loader: LostPost) {
        self.loader = loader
    }
    private var posts: [Post] = [Post]() {
        didSet {
            rendering()
        }
    }
    private func rendering(){
        
        // View binding
        
    }
    func opti_loadProducts(){
        loader.getPost(setter(for: self, keyPath: \.posts))
    }
}
