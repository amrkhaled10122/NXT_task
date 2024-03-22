import 'package:flutter/material.dart';

/// Pushes a new view onto the navigation stack.
void pushView(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

/// Pops all existing views and pushes a new page onto the navigation stack.
void popAllAndPushPage(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (Route<dynamic> route) => false,
  );
}

/// Pops all existing views and pushes a new named route onto the navigation stack.
void popAllAndPushName(
  BuildContext context,
  String widget, {
  RoutePredicate? condition,
  Object? arguments,
}) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(widget, condition ?? (Route<dynamic> route) => false, arguments: arguments);
}

/// Pushes a named route onto the navigation stack.
Future<dynamic> pushName(BuildContext context, String route, {dynamic arguments}) {
  return Navigator.of(context).pushNamed(route, arguments: arguments);
}

/// Pushes a named route onto the navigation stack and waits for a result.
Future<dynamic> pushNameForResult(BuildContext context, String route) {
  return Navigator.of(context).pushNamed(route);
}

/// Pushes a named route onto the navigation stack with arguments and waits for a result.
Future<dynamic> pushNameWithArgumentsForResult(BuildContext context, String route, dynamic argument) {
  return Navigator.of(context).pushNamed(route, arguments: argument);
}

/// Pushes a named route onto the navigation stack with arguments.
void pushNameWithArguments(BuildContext context, String route, dynamic argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

/// Dismisses the keyboard.
void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  FocusScope.of(context).requestFocus(FocusNode());
}

/// Pushes a named route onto the navigation stack replacing the current route.
void pushNameReplacement(BuildContext context, String route, {dynamic arguments}) {
  Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}

/// Pushes a custom route onto the navigation stack.
void pushPageRoute<T>(BuildContext context, Route<T> route) {
  Navigator.of(context).push(route);
}
