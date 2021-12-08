import 'dart:convert';

class Post {

  var status;
  var name;
  var salary;
  var age;
  var id;

  Post({this.status, this.name, this.salary, this.age, this.id});

  Post.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'name': name,
        'salary': salary,
        'age': age,
        'id': id,
      };
}
