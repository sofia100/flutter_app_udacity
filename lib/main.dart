/*
import 'package:flutter/material.dart';
class  hr extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: Colors.amberAccent,
        height: 300.0,
        width: 200,
        child: Center(
          child: Text(
            "huooooouiii",
                style: TextStyle(fontSize:30),

          ),
        ),
      ),
    );
  }

}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("yes"),
        ),
        body: hr()
      ),
    ),
  );
  print("done!!");
}
*/
/*************************************start of custom widget***********************************/
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:flutter/material.dart';
import 'category_route.dart';

// You can use a relative import, i.e. `import 'category.dart';` or
// a package import, as shown below.
// More details at http://dart-lang.github.io/linter/lints/avoid_relative_lib_imports.html

/*
// TODO: Pass this information into your custom [Category] widget
const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.greenAccent;
*/

/// The function that is called when main.dart is run.
void main() {
  runApp(UnitConverterApp());
  print("finished");
}

/// This widget is the root of our application.
/// Currently, we just show one widget in our app.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',

        theme: ThemeData(
          fontFamily: 'Raleway' ,
        textTheme: Theme.of(context).textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.grey[600],
    ),
    // This colors the [InputOutlineBorder] when it is selected
    primaryColor: Colors.grey[500],
    textSelectionHandleColor: Colors.green[500],
        ),
/*
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: Center(
          child: Category(
              color:_categoryColor,
              icon:_categoryIcon,
              name:_categoryName),
        ),
      ),

 */
      home: CategoryRoute(),
    );
  }
}
