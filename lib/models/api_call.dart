import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/news_modal.dart';
import 'package:http/http.dart' as http;

Future<NewsModal> getNewsApi() async {
  try {
    final response = await http.get(Uri.parse(
        '${dotenv.env['ENDPOINT']}top-headlines?country=us&category=technology&apiKey=${dotenv.env['APIKEY']}'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('The data from API file: $data');

      return NewsModal.fromJson(data);
    } else {
      print('Failed to load news: ${response.statusCode}');
      throw Exception('Failed to load news');
    }
  } catch (e) {
    print('Error fetching news: $e');
    throw Exception('Failed to load news');
  }
}
