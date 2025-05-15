

import 'dart:convert';

import 'package:first_project/quote/quote.dart';
import 'package:http/http.dart' as http ;

Future <List<Quote>> fetchQuote() async{

   final response = await http.get(Uri.parse("https://api.api-ninjas.com/v1/quotes"),

     headers: { 'X-Api-Key': 'qi/KILqv/LHDNPfb0Sqc+g==cUq8gosBL8uAigRg'},

   );

   if (response.statusCode == 200){

     List<dynamic> data = jsonDecode(response.body);

     return data.map((json) => Quote.fromJeson(json)).toList();

   }

   throw Exception("Faild to load data");

}