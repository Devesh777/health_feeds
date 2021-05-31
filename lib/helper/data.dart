import 'package:http/http.dart' as http;
import 'article.dart';
import 'dart:convert';

class CountryNews {
  List<Article> news = [];


  Future<void> getNewsCountryWise(String country) async {
    print(country);
    if(country=='Germany'||country=='germany'){
      country='gr';
    }
    else if(country=='Switzerland'||country=='switzerland'){
      country='ch';
    }
    else if(country=='NewZealand'|| country=='newzealand'||country=='New Zealand'|| country=='new zealand'|| country=='Newzealand'){
      country='nz';

    }
    else if(country=='Japan'|| country=='japan'){
      country='jp';
    }
    else if(country=='Singapore'||country=='singapore'){
      country='sg';
    }
    else{
      country = country.toLowerCase().substring(0, 2);
    }
    print(country);
//    String url = 'https://newsapi.org/v2/top-headlines?country=$country&category=health&apiKey=1c828381d489423bb43df84173fc5bc4';
    String url = 'https://newsapi.org/v2/top-headlines?country=$country&pageSize=100&category=health&apiKey=1c828381d489423bb43df84173fc5bc4';
    //String url='https://gnews.io/api/v4/top-headlines?q=health&country=$country&lang=en&max=15&token=b2763382dd68f4d68ee9a579baef970e';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urltoImage: element['urlToImage'],
              content: element['content']
          );
          news.add(article);
        }
      });
    }
  }
}