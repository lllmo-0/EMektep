// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   static const String route = '/profile';
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   int a = 0;
//   List<String> names = [];
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Memory Leak
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Profile"),
//         ),
//         body: ListView(
//           children: [
//             ListTile(
//               title: Text("Edit"),
//               leading: Icon(Icons.pending),
//             ),
//             TextField(),
//             Text("$a"),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   a++;
//                 });
//               },
//               child: Text("Increment"),
//             ),
//             TextButton(
//               onPressed: () {
//                 a--;
//               },
//               child: Text("Decrement"),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: Text("Refresh"),
//             )
//           ],
//         ));
//   }
// }
