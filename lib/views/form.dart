import 'package:flutter/material.dart';
import 'package:newsappproject/views/home.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  int group=1;
  bool checkBoxValue1=false;
  bool checkBoxValue2=false;
  bool checkBoxValue3=false;
  bool checkBoxValue4=false;
  bool checkBoxValue5=false;
  bool checkBoxValue6=false;

  /*setSelectedRadio(int val ){
    setState(() {
      _gender=val;
    });

  }*/

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 25,
      validator: (String value){
        if(value.isEmpty){
          return 'Name is required';
        }
      },
      onSaved: (String value){
        _name=value;
      },
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value){
        if(value.isEmpty){
          return 'Email address is required';
        }
      },
      onSaved: (String value){
        _email=value;
      },

    );
  }

  Widget _buildPassword(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Paassword'),
      keyboardType: TextInputType.visiblePassword,
      validator:(String value){
        if(value.isEmpty){
          return 'Password is required';
        }
      },
      onSaved: (String value){
        _password=value;
      },
    );
  }
  Widget _buildRadio(){
    return Row(
      children: <Widget>[
        Text('Gender'),
        Radio(value:1,groupValue:group ,onChanged:(T){
          print(T);
          setState(() {
            group=T;
          });
        },),
        Text('Male',style: TextStyle(fontSize: 10),),
        Radio(value:2,groupValue: group,onChanged: (T){
          print(T);
          setState(() {
            group=T;
          });
        },),
        Text('Female',style: TextStyle(fontSize: 10.0,),)
      ],
    );
  }
  Widget _buildCheckBox(){
    return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text('Area of Interest')),
              Checkbox(
                value:checkBoxValue1,
                onChanged: (bool value){
                  print(value);

                  setState(() {
                    checkBoxValue1=value;
                  });
                },

              ),
              Text('Cancer',style: TextStyle(fontSize: 10.0),),
              Checkbox(
                value:checkBoxValue2,
                onChanged: (bool value){
                  print(value);

                  setState(() {
                    checkBoxValue2=value;
                  });
                },

              ),
              Text('Body System',style: TextStyle(fontSize: 10.0),),
              Checkbox(
                value:checkBoxValue3,
                onChanged: (bool value){
                  print(value);

                  setState(() {
                    checkBoxValue3=value;
                  });
                },

              ),
              Text('Fitness',style: TextStyle(fontSize: 10.0),),

            ],
          ),
          Row(
            children: <Widget>[

              Checkbox(
                value:checkBoxValue4,
                onChanged: (bool value){
                  setState(() {
                    checkBoxValue4=value;
                  });
                },



              ),
              Text('Covid-19',style: TextStyle(fontSize: 10.0),),
              Checkbox(
                value:checkBoxValue5,
                onChanged: (bool value){
                  setState(() {
                    checkBoxValue5=value;
                  });
                },

              ),
              Text('Depression',style: TextStyle(fontSize: 10.0),),
              Checkbox(
                value:checkBoxValue6,
                onChanged: (bool value){
                  setState(() {
                    checkBoxValue6=value;
                  });

                },

              ),
              Text('Diabetes',style: TextStyle(fontSize: 10.0),),
            ],
          ),]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("NewsApp")),
        body:Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formkey,
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    _buildEmail(),
                    _buildPassword(),
                    _buildRadio(),
                    SizedBox(height: 10.0,),
                    _buildCheckBox(),
                    SizedBox(height: 100,),
                    FlatButton(
                      child:Text(
                          'Submit',
                          style:TextStyle(color:Colors.blue,fontSize: 16)
                      ),
                      onPressed: (){
                        if(!_formkey.currentState.validate()){
                          return Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>Home(


                              )
                          ));
                        }
                        _formkey.currentState.save();
                      },
                    )

                  ],
                ),
              ],
            )
            ),
          ),
        );

  }
}
