import p_sub.datasource;

import ballerina/graphql;

public type Product record {|
    @graphql:ID string id;
    string name;
    string description;
    float price;
|};

service graphql:Service on new graphql:Listener(9090) {
    resource function get products() returns Product[] => datasource:getProducts();

    resource function get product(@graphql:ID string id) returns Product? =>
    datasource:getProduct(id);
}
