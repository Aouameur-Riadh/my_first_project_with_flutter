import 'package:my_first_project_with_flutter/constants/app_constants.dart';
import 'package:my_first_project_with_flutter/widgets/left_bar.dart';
import 'package:my_first_project_with_flutter/widgets/right_bar.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _masstController = TextEditingController();
  double _result = 0;
  String _txtResult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "BMI CALCULATOR",
          style: TextStyle(color: accentHexColor,fontWeight:  FontWeight.w300),
        ) ,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8)

                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _masstController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "MASS",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8)

                      )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                 double _h = double.parse(_heightController.text);
                 double _m = double.parse(_masstController.text);
                 setState(() {
                   _result = (_m /(_h * _h));
                   if(_result>25){
                     _txtResult="You\'re over weight".toUpperCase();
                   }else if (_result>=  18.5&& _result<=25){
                     _txtResult="You have normal weight".toUpperCase();
                   }else{
                     _txtResult="You\'re under weight".toUpperCase();
                   }

                 });

              },
              child: Container(
                child: Text("CALCULATE",style: TextStyle (fontSize: 22 ,fontWeight: FontWeight.bold,color: accentHexColor),),

              ),
            ),

            SizedBox(height: 50,),
            Container(
              child: Text(_result.toStringAsFixed(2),style: TextStyle (fontSize: 90 ,fontWeight: FontWeight.w400,color: accentHexColor),),
            ),
            SizedBox(height: 30,),
       Visibility(visible: _txtResult.isNotEmpty,
         child:      Container(
         child: Text(_txtResult,style: TextStyle (fontSize: 28 ,fontWeight: FontWeight.w400,color: accentHexColor),),
       ),),
            SizedBox(height: 10,),
            LeftBar(barWidth: 40),
            SizedBox(height: 10,),
            LeftBar(barWidth: 80),
            SizedBox(height: 10,),
            LeftBar(barWidth: 60),
            RightBar(barWidth: 60),
            SizedBox(height: 40,),
            RightBar(barWidth: 60),




          ],
        ) ,
      ),
    );

  }
}