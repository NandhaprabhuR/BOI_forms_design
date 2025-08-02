// Previous page imports are no longer needed for direct navigation
// import 'package:boiforms/screens/page1.dart';
// import 'package:boiforms/screens/page10.dart';
// import 'package:boiforms/screens/page2.dart';
// import 'package:boiforms/screens/page3.dart';
// import 'package:boiforms/screens/page4.dart';
// import 'package:boiforms/screens/page5.dart';
// import 'package:boiforms/screens/page6.dart';
// import 'package:boiforms/screens/page7.dart';
// import 'package:boiforms/screens/page8.dart';
// import 'package:boiforms/screens/page9.dart';
import 'package:boiforms/screens/pdfdesign.dart'; // Import the new PDF design screen
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

/// The main application widget.
/// It's now a StatelessWidget as it only needs to build the MaterialApp
/// and set the initial screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank of India Account Opening Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false, // This line removes the debug banner
      // The home property is now set directly to the PdfDesignPage.
      home: const PdfDesignPage(),
    );
  }
}

/*
// The original multi-page navigation logic using StatefulWidget and IndexedStack
// has been commented out but is kept here for reference.

class _MyAppState extends State<MyApp> {
  int _currentPageIndex = 0; // 0 for Page1, ..., 9 for Page10

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank of India Account Opening Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bank of India Account Opening Form'),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: IndexedStack(
          index: _currentPageIndex,
          children: const [
            Page1Form(),
            Page2Form(),
            Page3Form(),
            Page4Form(),
            Page5Form(),
            Page6Form(),
            Page7Form(),
            Page8Form(),
            Page9Form(),
            Page10Form(),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
          child: FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.blue[800],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: PopupMenuButton<int>(
              icon: Text(
                (_currentPageIndex + 1).toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onSelected: (int selectedPage) {
                setState(() {
                  _currentPageIndex = selectedPage - 1;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(value: 1, child: Text('Page 1')),
                const PopupMenuItem<int>(value: 2, child: Text('Page 2')),
                const PopupMenuItem<int>(value: 3, child: Text('Page 3')),
                const PopupMenuItem<int>(value: 4, child: Text('Page 4')),
                const PopupMenuItem<int>(value: 5, child: Text('Page 5')),
                const PopupMenuItem<int>(value: 6, child: Text('Page 6')),
                const PopupMenuItem<int>(value: 7, child: Text('Page 7')),
                const PopupMenuItem<int>(value: 8, child: Text('Page 8')),
                const PopupMenuItem<int>(value: 9, child: Text('Page 9')),
                const PopupMenuItem<int>(value: 10, child: Text('Page 10')),
              ],
              tooltip: 'Select Page',
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
*/






// import 'package:boiforms/screens/page1.dart';
// import 'package:boiforms/screens/page10.dart';
// import 'package:boiforms/screens/page2.dart';
// import 'package:boiforms/screens/page3.dart';
// import 'package:boiforms/screens/page4.dart';
// import 'package:boiforms/screens/page5.dart';
// import 'package:boiforms/screens/page6.dart';
// import 'package:boiforms/screens/page7.dart';
// import 'package:boiforms/screens/page8.dart';
// import 'package:boiforms/screens/page9.dart';
// import 'package:flutter/material.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   int _currentPageIndex = 0; // 0 for Page1, ..., 9 for Page10
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Bank of India Account Opening Form',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         fontFamily: 'Inter',
//       ),
//       debugShowCheckedModeBanner: false, // This line removes the debug banner
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Bank of India Account Opening Form'),
//           centerTitle: true,
//           backgroundColor: Colors.blue[800],
//         ),
//         body: IndexedStack( // Use IndexedStack to keep pages alive and manage state
//           index: _currentPageIndex,
//           children: const [
//             Page1Form(),
//             Page2Form(),
//             Page3Form(),
//             Page4Form(),
//             Page5Form(),
//             Page6Form(),
//             Page7Form(),
//             Page8Form(),
//             Page9Form(),
//             Page10Form(), // Add Page10Form here
//           ],
//         ),
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
//           child: FloatingActionButton(
//             onPressed: null, // Disabled for direct click, relies on PopupMenuButton for page selection
//             backgroundColor: Colors.blue[800],
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             child: PopupMenuButton<int>(
//               // The icon now displays the current page number
//               icon: Text(
//                 (_currentPageIndex + 1).toString(), // Display current page number (1-based)
//                 style: const TextStyle(
//                   fontSize: 24, // Make the number prominent
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               onSelected: (int selectedPage) {
//                 // This callback is triggered when a page is selected from the menu
//                 setState(() {
//                   _currentPageIndex = selectedPage - 1; // Adjust for 0-based index
//                 });
//               },
//               itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
//                 // List of all pages for selection
//                 const PopupMenuItem<int>(
//                   value: 1,
//                   child: Text('Page 1'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 2,
//                   child: Text('Page 2'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 3,
//                   child: Text('Page 3'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 4,
//                   child: Text('Page 4'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 5,
//                   child: Text('Page 5'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 6,
//                   child: Text('Page 6'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 7,
//                   child: Text('Page 7'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 8,
//                   child: Text('Page 8'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 9,
//                   child: Text('Page 9'),
//                 ),
//                 const PopupMenuItem<int>(
//                   value: 10,
//                   child: Text('Page 10'),
//                 ),
//               ],
//               tooltip: 'Select Page', // Tooltip for accessibility
//             ),
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       ),
//     );
//   }
// }
