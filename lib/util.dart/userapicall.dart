import 'dart:convert';

import 'package:fabcurate/modul/category%20.dart';
import 'package:fabcurate/modul/mainmodule.dart';
import 'package:http/http.dart' as http;

class Userapi {
  static Future<Module?> getModulData(context) async {
    List? homepagemodule = [];
    Module? _module;

    const String apitop = "https://fabcurate.easternts.in/top.json";
    const String apimiddle = "https://fabcurate.easternts.in/middle.json";
    const String apibottom = "https://fabcurate.easternts.in/bottom.json";

    try {
      List<http.Response> result = await Future.wait([
        http.get(Uri.parse(apitop)),
        http.get(Uri.parse(apimiddle)),
        http.get(Uri.parse(apibottom)),
      ]);

      var bodytop = jsonDecode(result[0].body);
      var bodymiddle = jsonDecode(result[1].body);
      var bodybottom = jsonDecode(result[2].body);

      if (result[0].statusCode == 200 &&
          result[1].statusCode == 200 &&
          result[2].statusCode == 200) {
        homepagemodule.add(bodytop);
        homepagemodule.add(bodymiddle);
        homepagemodule.add(bodybottom);

        Map<String, dynamic> data = {"main_modul": homepagemodule};

        _module = Module.fromJson(data);
      } else {
        print(
            result[0].statusCode + result[1].statusCode + result[2].statusCode);
      }
    } catch (e) {
      print(e);
    }
    return _module;
  }

  static Future<CategoryM?> getCategory(context) async {
    CategoryM? category;
    const String apicategory = "https://fabcurate.easternts.in/category.json";

    http.Response response;
    try {
      response = await http.get(Uri.parse(apicategory));
      var bodycategory = jsonDecode(response.body);

      if (response.statusCode == 200) {
        category =  CategoryM.fromJson(bodycategory);
      }
    } catch (e) {
      print(e);
    }
   
    return category;
  }
}
