import 'package:fabcurate/modul/category%20.dart';
import 'package:fabcurate/modul/mainmodule.dart';

import 'package:fabcurate/util.dart/userapicall.dart';
import 'package:flutter/material.dart';

class ModulDataProvider with ChangeNotifier {
  Module? post = Module();

  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await Userapi.getModulData(context);
    loading = false;

    notifyListeners();
  }
}

class CategoryProvider with ChangeNotifier {
  CategoryM? category = CategoryM();
  bool loading = false;
  getCategoryData(context) async {
    loading = true;
    category = await Userapi.getCategory(context);
    loading = false;

    notifyListeners();
  }
}
