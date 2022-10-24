import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whatwatch/home/model/movieModel.dart';
import 'package:whatwatch/constants.dart';


 
class Services  {
  static Future<List<movieModel>> fetchHomeData(Uri urljson) async {
    final response = await http.get(urljson);
    try {
      if (response.statusCode == 200) {
        List<movieModel> list = parsePostsForHome(response.body);
        return list;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(MESSAGES.INTERNET_ERROR);
    }
  }
 
  static List<movieModel> parsePostsForHome(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<movieModel>((json) => movieModel.fromJson(json)).toList();
  }




  
}