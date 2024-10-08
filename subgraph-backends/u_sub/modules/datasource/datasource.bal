public type User readonly & record{|
    string id;
    string name;
    string email;
|};

isolated table<User> key(id) users = table [
  {id: "user_0", name: "Alice", email: "alice@sample.com"},
  {id: "user_1", name: "Bob", email: "bob@sample.com"},
  {id: "user_2", name: "Charlie", email: "charlie@sample.com"},
  {id: "user_3", name: "Dave", email: "dave@sample.com"},
  {id: "user_4", name: "Eve", email: "eve@sample.com"}
];

public isolated function getUsers() returns readonly & User[] {
    lock {
        return from User user in users select user;
    }
}