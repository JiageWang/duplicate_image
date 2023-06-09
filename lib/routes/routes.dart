import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../views/image_dtal_view.dart';

Map routes = {
  "/": (context) => const HomePage(),
  "/photo_view": (context, {arguments}) => ImageDtalView(args: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name; //  /news 或者 /search
  final Function? pageContentBuilder =
      routes[name]; //  Function = (contxt) { return const NewsPage()}

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
