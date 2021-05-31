import 'dart:convert';
import 'package:kt_dart/kt.dart';
import 'package:newsappproject/helper/article.dart';
import 'package:http/http.dart' as http;

class News{
 List<Article> news=[];
 Future<void> getnews() async{

  String url="https://newsapi.org/v2/everything?q=health&from=2021-4-25&to=2021-5-15&sortBy=popularity&apiKey=1c828381d489423bb43df84173fc5bc4";

  var response=await http.get(url);

  var jsonData=jsonDecode(response.body);

  if(jsonData['status']=="ok"){
   jsonData['articles'].forEach((element){
    if(element['urlToImage']!=null && element['description']!=null){

     Article article=Article(
      author: element['author'],
      title:element['title'],
      description: element['description'],
      url:element['url'],
      urltoImage: element['urlToImage'],
      content: element['content']
     );
     //var jsonDa = '[{"author":author,titlr}]';

     //ssList uniqueList = new List(); List parsedJson = json.decode(jsonDa);
     //var records = mutableListFrom(['article']);
     //var distinct = records.distinctBy((it) => it['article']);

     news.add(article);
    }
   });
  }

}

}