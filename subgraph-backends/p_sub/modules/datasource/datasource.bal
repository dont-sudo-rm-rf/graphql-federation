type Product readonly & record {|
    string id;
    string name;
    string description;
    float price;
|};

isolated table<Product> key(id) products = table[
    {id: "product_0", name: "Shoes", description: "A pair of shoes", price: 100},
    {id: "product_1", name: "T-shirt", description: "A t-shirt", price: 25},
    {id: "product_2", name: "Pants", description: "A pair of pants", price: 50}
];

public isolated function getProducts() returns readonly & Product[] {
    lock {
        return from Product product in products select product;
    }
}

public isolated function getProduct(string id) returns Product? {
    lock {
        return products[id];
    }
}