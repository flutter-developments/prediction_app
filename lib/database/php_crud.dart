// // <?php

// // $db_name = "school";
// // $db_server = "127.0.0.1";
// // $db_user = "root";
// // $db_pass = "";

// // $db = new PDO("mysql:host={$db_server};dbname={$db_name};charset=utf8", $db_user, $db_pass);
// // $db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
// // $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// // <?php
// // header('Content-Type: application/json');
// // include "../flutter_api/db.php";

// // $stmt = $db->prepare("SELECT id, name, age FROM student");
// // $stmt->execute();
// // $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

// // echo json_encode($result);

// // <?php
// // header('Content-Type: application/json');
// // include "../flutter_api/db.php";

// // $id = (int) $_POST['id'];

// // $stmt = $db->prepare("SELECT name, age FROM student WHERE ID = ?");
// // $stmt->execute([$id]);
// // $result = $stmt->fetch(PDO::FETCH_ASSOC);

// // echo json_encode([
// // 'result' => $result
// // ]);


// // <?php
// // header('Content-Type: application/json');
// // include "../flutter_api/db.php";
// //https://medium.com/app-dev-community/flutter-crud-application-using-php-rest-api-bb585c4d7d9c

// // $name = $_POST['name'];
// // $age = (int) $_POST['age'];

// // $stmt = $db->prepare("INSERT INTO student (name, age) VALUES (?, ?)");
// // $result = $stmt->execute([$name, $age]);

// // echo json_encode([
// // 'success' => $result
// // ]);

// import 'package:flutter/material.dart';


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';


// void main() => runApp(App());

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter + PHP CRUD',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Home(),
//         '/create': (context) => Create(),
//         '/details': (context) => Details(),
//         '/edit': (context) => Edit(),
//       },
//     );
//   }
// }

// class Student {
//   final int id;
//   final String name;
//   final int age;

//   Student({this.id, this.name, this.age});

//   factory Student.fromJson(Map<String, dynamic> json) {
//     return Student(
//       id: json['id'],
//       name: json['name'],
//       age: json['age'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'name': name,
//     'age': age,
//   };
// }

// class Env {
//   static String URL_PREFIX = "http://10.0.2.2/flutter_api";
// }


// class Home extends StatefulWidget {
//   Home({Key key}) : super(key: key);
//   @override
//   HomeState createState() => HomeState();
// }

// class HomeState extends State<Home> {
//   Future<List<Student>> students;
//   final studentListKey = GlobalKey<HomeState>();

//   @override
//   void initState() {
//     super.initState();
//     students = getStudentList();
//   }

//   Future<List<Student>> getStudentList() async {
//     final response = await http.get("${Env.URL_PREFIX}/list.php");
//     final items = json.decode(response.body).cast<Map<String, dynamic>>();
//     List<Student> students = items.map<Student>((json) {
//       return Student.fromJson(json);
//     }).toList();

//     return students;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: studentListKey,
//       appBar: AppBar(
//         title: Text('Student List'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<Student>>(
//           future: students,
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             // By default, show a loading spinner.
//             if (!snapshot.hasData) return CircularProgressIndicator();
//             // Render student lists
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var data = snapshot.data[index];
//                 return Card(
//                   child: ListTile(
//                     leading: Icon(Icons.person),
//                     trailing: Icon(Icons.view_list),
//                     title: Text(
//                       data.name,
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => Details(student: data)),
//                       );
//                     },
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (_) {
//             return Create();
//           }));
//         },
//       ),
//     );
//   }
// }