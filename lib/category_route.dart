/*
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutterapp/unit_converter.dart';
import 'backdrop.dart';
import 'category.dart';
import 'package:flutterapp/category.dart';
import 'category_tile.dart';
import 'unit.dart';
import 'api.dart';
import 'dart:async';
import 'dart:convert';

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  CategoryRouteState createState() => CategoryRouteState();
}
class CategoryRouteState extends State<CategoryRoute>{


Category defaultCategory, currentCategory;


  final  categories = <Category>[];



*/
/*static const _baseColors = <Color>[
Colors.teal,
Colors.orange,
Colors.pinkAccent,
Colors.blueAccent,
Colors.yellow,
Colors.greenAccent,
Colors.purpleAccent,
Colors.red,
];*//*


  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
  ];

  static const _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
  ];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    // We have static unit conversions located in our
    // assets/data/regular_units.json
    if (categories.isEmpty) {
      await _retrieveLocalCategories();
      await _retrieveApiCategory();
    }
  }

  /// Retrieves a list of [Categories] and their [Unit]s
  Future<void> _retrieveLocalCategories() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
      data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
        name: key,
        units: units,
        color: _baseColors[categoryIndex],
        iconLocation: _icons[categoryIndex],
      );
      setState(() {
        if (categoryIndex == 0) {
          defaultCategory = category;
        }
        categories.add(category);
      });
      categoryIndex += 1;
    });
  }

  /// Retrieves a [Category] and its [Unit]s from an API on the web
  Future<void> _retrieveApiCategory() async {
    // Add a placeholder while we fetch the Currency category using the API
    setState(() {
      categories.add(Category(
        name: apiCategory['name'],
        units: [],
        color: _baseColors.last,
        iconLocation: _icons.last,
      ));
    });
    final api = Api();
    final jsonUnits = await api.getUnits(apiCategory['route']);
    // If the API errors out or we have no internet connection, this category
    // remains in placeholder mode (disabled)
    if (jsonUnits != null) {
      final units = <Unit>[];
      for (var unit in jsonUnits) {
        units.add(Unit.fromJson(unit));
      }
      setState(() {
        categories.removeLast();
        categories.add(Category(
          name: apiCategory['name'],
          units: units,
          color: _baseColors.last,
          iconLocation: _icons.last,
        ));
      });
    }
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      currentCategory = category;
    });
  }

*/
/*
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < _categoryNames.length; i++) {
      var ctgry=(Category(
        name: _categoryNames[i],
        color: _baseColors[i],
        iconLocation: Icons.cake,
        units: _retrieveUnitList(_categoryNames[i]),

      ));
      if(i==0)
        {
          defaultCategory=ctgry;
        }
      categories.add(ctgry);
    }
  }
*//*



  /// Makes the correct number of rows for the list view.
  ///
  // TODO: Use a GridView for landscape mode, passing in the device orientation
  /// Makes the correct number of rows for the list view, based on whether the
  /// device is portrait or landscape.
  ///
  /// For portrait, we use a [ListView]. For landscape, we use a [GridView].
  /// For portrait, we use a [ListView].
  Widget buildCategoryWidgets(Orientation deviceOrien)
{
  if(deviceOrien==Orientation.portrait) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CategoryTile(
          category: categories[index],
          onTap: _onCategoryTap,
        );
      },
      itemCount: categories.length,
    );
  }
  else{
    return GridView.count(crossAxisCount: 2,
    childAspectRatio:3,
    children: categories.map((Category c){
      return CategoryTile(category: c, onTap: _onCategoryTap,);
    }).toList(),
    );
  }

}

  /// Returns a list of mock [Unit]s.
*/
/*
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }
*//*



@override
Widget build(BuildContext context) {
// from above. Use a placeholder icon, such as `Icons.cake` for each
// Category. We'll add custom icons later.

  // TODO: Import and use the Backdrop widget





 */
/* final listView = Container(
    color: Colors.transparent,
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    child: buildCategoryWidgets(MediaQuery.of(context).orientation),
  );
*//*

  */
/*
// TODO: Create a list view of the Categories
final listView = Container(
  child: Column(
    children: <Widget>[
      Category(
        color:_baseColors[0] ,
        icon: Icons.cake,

        name: _categoryNames[0],
      ),
      Category(
        color:_baseColors[1] ,
        icon: Icons.cake ,
        name: _categoryNames[1],
      ),
      Category(
        color:_baseColors[2] ,
        icon: Icons.cake ,
        name: _categoryNames[2],
      ),
      Category(
        color:_baseColors[3] ,
        icon: Icons.cake,
        name: _categoryNames[3],
      ),
      Category(
        color:_baseColors[4] ,
        icon: Icons.cake ,
        name: _categoryNames[4],
      ),
      Category(
        color:_baseColors[5] ,
        icon: Icons.cake ,
        name: _categoryNames[5],
      ),

    ],
  ),
);
*//*

// TODO: Create an App Bar
*/
/*
final appBar = AppBar(
  elevation: 0.0,
      title:Text(
    "Unit Converter",
  style: TextStyle(
    color: Colors.deepPurple,
    fontSize: 30,
  ),

),
  centerTitle: true,
  backgroundColor:Colors.amber,
);
*//*

  if (categories.isEmpty) {
    return Center(
      child: Container(
        height: 180.0,
        width: 180.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
*/
/*return Scaffold(
appBar: appBar,
body: listView,
);*//*

  // Based on the device size, figure out how to best lay out the list
  // You can also use MediaQuery.of(context).size to calculate the orientation
  assert(debugCheckHasMediaQuery(context));
  final listView = Padding(
    padding: EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      bottom: 48.0,
    ),
    child: buildCategoryWidgets(MediaQuery.of(context).orientation),
  );

return Backdrop(
  currentCategory:currentCategory==null?defaultCategory:currentCategory ,
  frontPanel: currentCategory==null?UnitConverter(category: defaultCategory,):UnitConverter(category: currentCategory
    ,)
    ,
  backPanel: listView,
  frontTitle: Text('Unit Converter'),
  backTitle: Text("Select a Category"),
);

}

 // @override
  CategoryRouteState createState() =>
    CategoryRouteState();

}

*/
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'api.dart';
import 'backdrop.dart';
import 'category.dart';
import 'category_tile.dart';
import 'unit.dart';
import 'unit_converter.dart';

/// Loads in unit conversion data, and displays the data.
///
/// This is the main screen to our app. It retrieves conversion data from a
/// JSON asset and from an API. It displays the [Categories] in the back panel
/// of a [Backdrop] widget and shows the [UnitConverter] in the front panel.
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  Category _defaultCategory;
  Category _currentCategory;
  // Widgets are supposed to be deeply immutable objects. We can update and edit
  // _categories as we build our app, and when we pass it into a widget's
  // `children` property, we call .toList() on it.
  // For more details, see https://github.com/dart-lang/sdk/issues/27755
  final _categories = <Category>[];
  static const _baseColors = <ColorSwatch>[
    ColorSwatch(0xFF6AB7A8, {
      'highlight': Color(0xFF6AB7A8),
      'splash': Color(0xFF0ABC9B),
    }),
    ColorSwatch(0xFFFFD28E, {
      'highlight': Color(0xFFFFD28E),
      'splash': Color(0xFFFFA41C),
    }),
    ColorSwatch(0xFFFFB7DE, {
      'highlight': Color(0xFFFFB7DE),
      'splash': Color(0xFFF94CBF),
    }),
    ColorSwatch(0xFF8899A8, {
      'highlight': Color(0xFF8899A8),
      'splash': Color(0xFFA9CAE8),
    }),
    ColorSwatch(0xFFEAD37E, {
      'highlight': Color(0xFFEAD37E),
      'splash': Color(0xFFFFE070),
    }),
    ColorSwatch(0xFF81A56F, {
      'highlight': Color(0xFF81A56F),
      'splash': Color(0xFF7CC159),
    }),
    ColorSwatch(0xFFD7C0E2, {
      'highlight': Color(0xFFD7C0E2),
      'splash': Color(0xFFCA90E5),
    }),
    ColorSwatch(0xFFCE9A9A, {
      'highlight': Color(0xFFCE9A9A),
      'splash': Color(0xFFF94D56),
      'error': Color(0xFF912D2D),
    }),
  ];
  static const _icons = <String>[
    'assets/icons/length.png',
    'assets/icons/area.png',
    'assets/icons/volume.png',
    'assets/icons/mass.png',
    'assets/icons/time.png',
    'assets/icons/digital_storage.png',
    'assets/icons/power.png',
    'assets/icons/currency.png',
  ];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    // We have static unit conversions located in our
    // assets/data/regular_units.json
    // and we want to also obtain up-to-date Currency conversions from the web
    // We only want to load our data in once
    if (_categories.isEmpty) {
      await _retrieveLocalCategories();
      await _retrieveApiCategory();
    }
  }

  /// Retrieves a list of [Categories] and their [Unit]s
  Future<void> _retrieveLocalCategories() async {
    // Consider omitting the types for local variables. For more details on Effective
    // Dart Usage, see https://www.dartlang.org/guides/language/effective-dart/usage
    final json = DefaultAssetBundle
        .of(context)
        .loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }
    var categoryIndex = 0;
    data.keys.forEach((key) {
      final List<Unit> units =
      data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
        name: key,
        units: units,
        color: _baseColors[categoryIndex],
        iconLocation: _icons[categoryIndex],
      );
      setState(() {
        if (categoryIndex == 0) {
          _defaultCategory = category;
        }
        _categories.add(category);
      });
      categoryIndex += 1;
    });
  }

  /// Retrieves a [Category] and its [Unit]s from an API on the web
  Future<void> _retrieveApiCategory() async {
    // Add a placeholder while we fetch the Currency category using the API
    setState(() {
      _categories.add(Category(
        name: apiCategory['name'],
        units: [],
        color: _baseColors.last,
        iconLocation: _icons.last,
      ));
    });
    final api = Api();
    final jsonUnits = await api.getUnits(apiCategory['route']);
    // If the API errors out or we have no internet connection, this category
    // remains in placeholder mode (disabled)
    if (jsonUnits != null) {
      final units = <Unit>[];
      for (var unit in jsonUnits) {
        units.add(Unit.fromJson(unit));
      }
      setState(() {
        _categories.removeLast();
        _categories.add(Category(
          name: apiCategory['name'],
          units: units,
          color: _baseColors.last,
          iconLocation: _icons.last,
        ));
      });
    }
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  /// Makes the correct number of rows for the list view, based on whether the
  /// device is portrait or landscape.
  ///
  /// For portrait, we use a [ListView]. For landscape, we use a [GridView].
  Widget _buildCategoryWidgets(Orientation deviceOrientation) {
    if (deviceOrientation == Orientation.portrait) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          // TODO: You may want to make the Currency [Category] not tappable
          // while it is loading, or if there an error.

          /*  category: _categories[index],
            onTap: _onCategoryTap,*/
          var _category = _categories[index];
          return CategoryTile(
          category: _category,
          onTap:
          _category.name == apiCategory['name'] && _category.units.isEmpty
          ? null
          : _onCategoryTap,
          );
        },
        itemCount: _categories.length,
      );
    } else {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3.0,
        children: _categories.map((Category c) {
          return CategoryTile(
            category: c,
            onTap: _onCategoryTap,
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_categories.isEmpty) {
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Based on the device size, figure out how to best lay out the list
    // You can also use MediaQuery.of(context).size to calculate the orientation
    assert(debugCheckHasMediaQuery(context));
    final listView = Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 48.0,
      ),
      child: _buildCategoryWidgets(MediaQuery.of(context).orientation),
    );
    return Backdrop(
      currentCategory:
      _currentCategory == null ? _defaultCategory : _currentCategory,
      frontPanel: _currentCategory == null
          ? UnitConverter(category: _defaultCategory)
          : UnitConverter(category: _currentCategory),
      backPanel: listView,
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a Category'),
    );
  }
}