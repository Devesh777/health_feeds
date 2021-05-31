import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsappproject/rcmdnews.dart';
class CheckBox extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  bool checkBoxValue4 = false;
  bool checkBoxValue5 = false;
  bool checkBoxValue6 = false;
  bool checkBoxValue7 = false;
  bool checkBoxValue8 = false;
  bool checkBoxValue9 = false;
  bool checkBoxValue10 = false;
  bool checkBoxValue11 = false;
  bool checkBoxValue12 = false;
  bool checkBoxValue13 = false;
  bool checkBoxValue14 = false;
  bool checkBoxValue15 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Feed',),
          backgroundColor: Colors.green[600],

        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Center(

                child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0,),
                      Center(child: Text('Area of Interest',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[

                          Checkbox(
                            value: checkBoxValue1,
                            onChanged: (bool value) {
                              print(value);

                              setState(() {
                                checkBoxValue1 = value;
                              });
                            },

                          ),
                          Text('Cancer', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue2,
                            onChanged: (bool value) {
                              print(value);

                              setState(() {
                                checkBoxValue2 = value;
                              });
                            },

                          ),
                          SizedBox(width: 10.0,),
                          Text('Coronavirus', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue3,
                            onChanged: (bool value) {
                              print(value);

                              setState(() {
                                checkBoxValue3 = value;
                              });
                            },

                          ),
                          SizedBox(width: 10.0,),
                          Text('Abortion', style: TextStyle(fontSize: 17.0),),

                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[

                          Checkbox(
                            value: checkBoxValue4,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue4 = value;
                              });
                            },


                          ),
                          Text('Dengue', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue5,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue5 = value;
                              });
                            },

                          ),
                          Text('Depression', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue6,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue6 = value;
                              });
                            },

                          ),
                          Text('Diabetes', style: TextStyle(fontSize: 17.0),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[

                          Checkbox(
                            value: checkBoxValue7,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue7 = value;
                              });
                            },


                          ),
                          Text('Hepatitis', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue8,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue8 = value;
                              });
                            },

                          ),
                          Text('Medicines', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue9,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue9 = value;
                              });
                            },

                          ),
                          Text('Fitness', style: TextStyle(fontSize: 17.0),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[

                          Checkbox(
                            value: checkBoxValue10,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue10 = value;
                              });
                            },


                          ),
                          Text('Nutrition', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue11,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue11 = value;
                              });
                            },

                          ),
                          Text('Skin', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue12,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue12 = value;
                              });
                            },

                          ),
                          Text('Obesity', style: TextStyle(fontSize: 17.0),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[

                          Checkbox(
                            value: checkBoxValue13,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue13 = value;
                              });
                            },


                          ),
                          Text('Diet', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue14,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue14 = value;
                              });
                            },

                          ),
                          Text('Deafness', style: TextStyle(fontSize: 17.0),),
                          Checkbox(
                            value: checkBoxValue15,
                            onChanged: (bool value) {
                              setState(() {
                                checkBoxValue15 = value;
                              });
                            },

                          ),
                          Text('Kidney', style: TextStyle(fontSize: 17.0),),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      FlatButton(
                        color: Colors.green[600],
                        child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.black, fontSize: 16,)
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  RecommendNews()
                          ));
                        },
                      )
                    ]
                ),

            ),
          ),
        ),
        ),

      );

  }

}