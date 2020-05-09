/*
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'unit.dart';
import 'unit_converter.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

/// A custom [Category] widget.
///
 final _rowHeight = 100.0;
  final _borderRadius = BorderRadius.circular(_rowHeight / 2);
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // TODO: You'll need the name, color, and iconLocation from main.dart
  final  String name;
  final ColorSwatch color;
  final IconData icon;
  final List<Unit> units;

  const Category(
      {
    Key key,
        @required this.name,
        @required this.color,
        @required this.icon,
        @required this.units,
}
      ):
        assert(name!=null),
        assert(color!=null),
        assert(units != null),
        assert(icon!=null),
  super(key:key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    // TODO: Using the Navigator, navigate to the [ConverterRoute]

    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterRoute(
            color: color,
            units: units,
          ),
        );
      }
    )
    );
   // Navigator.push(context,
    //MaterialPageRoute(builder:(context) => ConverterRoute(units: units,color: color,)));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,

          child: Padding(
            padding:const  EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: _borderRadius,
                highlightColor: color,
                splashColor: color,
                onTap: () {
                _navigateToConverter(context);
                print('I was tapped!'); },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                       icon,
                        size: 39.0,

                      ),
                    )
                    ,
                    Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}*//*
*/
/*




// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

import 'unit_converter.dart';
import 'unit.dart';

// We use an underscore to indicate that these variables are private.
// See https://www.dartlang.org/guides/language/effective-dart/design#libraries
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData icon;
  final List<Unit> units;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.icon,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(icon != null),
        assert(units != null),
        super(key: key);

  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: UnitConverter(
            color: color,
            units: units,
          ),
          // This prevents the attempt to resize the screen when the keyboard
          // is opened
          resizeToAvoidBottomPadding: false,
        );
      },
    ));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  // This `context` parameter describes the location of this widget in the
  // widget tree. It can be used for obtaining Theme data from the nearest
  // Theme ancestor in the tree. Below, we obtain the display1 text theme.
  // See https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,

          highlightColor: color['highlight'],
          splashColor: color['splash'],
          // We can use either the () => function() or the () { function(); }
          // syntax.
          onTap: () => _navigateToConverter(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // There are two ways to denote a list: `[]` and `List()`.
              // Prefer to use the literal syntax, i.e. `[]`, instead of `List()`.
              // You can add the type argument if you'd like, i.e. <Widget>[].
              // See https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*//*


// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

/// A [Category] keeps track of a list of [Unit]s.
class Category {
  final String name;
  final ColorSwatch color;
  final List<Unit> units;
  final String iconLocation;

  /// Information about a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), a list of its
  /// its color for the UI, units for conversions (e.g. 'Millimeter', 'Meter'),
  /// and the icon that represents it (e.g. a ruler).
  const Category({
    @required this.name,
    @required this.color,
    @required this.units,
    @required this.iconLocation,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null),
        assert(iconLocation != null);
}
*/
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// To keep your imports tidy, follow the ordering guidelines at
// https://www.dartlang.org/guides/language/effective-dart/style#ordering
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

/// A [Category] keeps track of a list of [Unit]s.
class Category {
  final String name;
  final ColorSwatch color;
  final List<Unit> units;
  final String iconLocation;

  /// Information about a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), a list of its
  /// its color for the UI, units for conversions (e.g. 'Millimeter', 'Meter'),
  /// and the icon that represents it (e.g. a ruler).
  const Category({
    @required this.name,
    @required this.color,
    @required this.units,
    @required this.iconLocation,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null),
        assert(iconLocation != null);
}