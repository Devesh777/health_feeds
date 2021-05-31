import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappproject/helper/article.dart';
import 'package:newsappproject/helper/data.dart';
import 'package:newsappproject/helper/news.dart';
import 'package:newsappproject/recmd.dart';
import 'package:newsappproject/views/article_news.dart';
import 'country_news.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

enum MenuOption{Recommendation_news}
class _HomeState extends State<Home> {
  String country;
  List<Article> article=new List<Article>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  Future<void> getNews() async{
    News newsapp=News();
    await newsapp.getnews();
    article=newsapp.news;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Feed'),
        actions: [
          PopupMenuButton(
            onSelected: (value){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>CheckBox()
              ));
            },
              itemBuilder:(BuildContext context){
                return <PopupMenuEntry>[
                  PopupMenuItem(child:Text('Recommendation News'),
                  value: MenuOption.Recommendation_news,),

                ];
              }),
        ]


      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Container(

                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0,),
                      Container(
                        width:325,
                        margin: EdgeInsets.only(right: 130.0),


                        child:TextFormField(

                          style: TextStyle(
                              color:Colors.black
                          ),
                          decoration: InputDecoration(
                              hintText: 'Enter the Country Name'
                          ),
                          onChanged: (value){
                            country=value;
                          },

                        ),
                      ),
                      FlatButton(
                        color: Colors.green[600],
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>Country(
                                country: country,

                              )
                          ));


                        },
                        child:Text('Search',
                            style:TextStyle(
                                color: Colors.black
                            )
                        ),
                      ),
                      SizedBox(height: 8,),
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
              child: Image.network(image)),
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


