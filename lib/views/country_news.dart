import 'package:flutter/material.dart';
import 'package:newsappproject/helper/article.dart';
import 'package:newsappproject/helper/data.dart';

import 'article_news.dart';

class Country extends StatefulWidget {
  String country;
  Country({this.country});
  @override
  _CountryState createState() => _CountryState();
}



class _CountryState extends State<Country> {

  List<Article> article=new List<Article>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }
  Future<void> getNews() async{
    CountryNews news=CountryNews();
    await news.getNewsCountryWise(widget.country);
    article=news.news;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        title: Text('News App'),

    ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: ListView.builder(
                    itemCount: article.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Blog(
                        image: article[index].urltoImage,
                        title: article[index].title,
                        desc: article[index].description,
                        url: article[index].url,
                      );

                    }),
              )

            ],
          ),
        ),
      ),


    );
  }
}

class Blog extends StatelessWidget {
  final String image,title,desc,url;
  Blog({this.image,this.title,this.desc,this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>ArticleNews(
                url:url

            )
        ));
      },
      child: Container(
        padding:EdgeInsets.only(bottom: 15) ,
        child: Column(
          children: <Widget>[
            ClipRRect(borderRadius:BorderRadius.circular(5),
                child: Image.network(image),),
            SizedBox(height: 8.0,),
            Text(title,style: TextStyle(
                fontSize: 17,
                color: Colors.black

            ),),
            SizedBox(height: 8.0,),
            Text(desc,style: TextStyle(
                color: Colors.black54
            ),)
          ],
        ),

      ),
    );
  }
}
