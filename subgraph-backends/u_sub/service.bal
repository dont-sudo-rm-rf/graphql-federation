import u_sub.datasource;

import ballerina/graphql;

public type User record {|
    @graphql:ID string id;
    string name;
    string email;
|};

service graphql:Service on new graphql:Listener(9091) {
    resource function get users() returns User[] => datasource:getUsers();
}