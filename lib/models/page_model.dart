import 'package:flutter/cupertino.dart';

class PageModel {
  String _title;
  String _description;
  IconData _icon;

  PageModel(
    this._title,
    this._description,
    this._icon,
  );

  String get title => _title;

  String get description => _description;

  IconData get icon => _icon;
}
