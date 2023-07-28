// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class ExampleTwo extends StatefulWidget {
//   const ExampleTwo({super.key});
//
//   @override
//   State<ExampleTwo> createState() => _ExampleTwoState();
// }
//
// class _ExampleTwoState extends State<ExampleTwo> {
//
//   List<Photos> photosList = [];
//
//   Future<List<Photos>> getPhotos()async{
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//     var data  = jsonDecode(response.body.toString());
//
//     if(response.statusCode == 200){
//       for(Map i in data){
//         Photos photos = Photos(title: i['title'], url: i['url']);
//       photosList.add(photos);
//       }
//       return photosList;
//     }else {
//       return photosList;
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('API Testing'),
//       ),
//       body: Column(
//         children: [
//
//         ],
//       ),
//     );
//   }
// }
//
// class Photos {
//   String title , url ;
//
//   Photos({required this.title ,required this.url});
// }