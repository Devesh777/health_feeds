import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:newsappproject/helper/article.dart';
import 'package:newsappproject/helper/data.dart';
import 'package:newsappproject/helper/news.dart';
import 'package:newsappproject/recmd.dart';
import 'package:newsappproject/views/article_news.dart';
import 'package:csv/csv.dart';



class RecommendNews extends StatefulWidget {

  @override
  _RecommendNewsState createState() => _RecommendNewsState();
}

class _RecommendNewsState extends State<RecommendNews> {
  List<List<dynamic>> _data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCSV();
  }

  // This function is triggered when the floating button is pressed
  Future<void> _loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/news.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
      print(_data);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
              children: <Widget>[
                Container(
                  child:ListView.builder(
                      itemCount: _data.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Blog(
                          image: _data[index][4],
                          title:_data[index][1],
                          url: _data[index][6],
                          summary:_data[index][2],
                          desc:_data[index][5],

                        );

                      }),
                ),]),
        ),),

    );
  }
}

class Blog extends StatelessWidget {
  final String image,title,url,summary,desc;

  Blog({this.image,this.title,this.url,this.summary,this.desc});



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){


        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>ArticleNews(
            url:url,


          ),

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
            Text(summary,style: TextStyle(
                fontSize: 17,
                color: Colors.black

            ),),

          ],
        ),

      ),
    );

  }


}