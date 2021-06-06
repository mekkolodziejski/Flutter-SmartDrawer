// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:prattle/widget/smartdrawer.dart';
//
// class MainPage extends StatefulWidget {
//   static const routeName = '/main_page';
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MainPage> {
//   GlobalKey<SmartDrawerState> _smartDrawerKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//         onWillPop: () async => true,
//         child: SmartDrawer(
//           key: _smartDrawerKey,
//           menu: Container(width: MediaQuery.of(context).size.width * .6, child: _buildMenu()),
//           page: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.lime,
//             child: GestureDetector(
//               onTap: () {
//                 _smartDrawerKey.currentState!.openDrawer();
//               },
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 22.0,
//               ),
//             ),
//           ),
//         ));
//   }
//
//   Widget _buildMenu() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(vertical: 50.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     _smartDrawerKey.currentState!.closeDrawer();
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     radius: 22.0,
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   "Close",
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
