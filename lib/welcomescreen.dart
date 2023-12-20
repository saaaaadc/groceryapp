import 'package:flutter/material.dart';
import 'package:groceryapp/onboard_screen.dart';

bool _validPhoneNumber = false;
showBottomSheet(context){
  showModalBottomSheet(context: context,
      builder: (context)=> StatefulBuilder(
          builder: (context,StateSetter myState){
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Login",style: TextStyle(fontSize: 25),),
                    Text('Enter your phone number',style: TextStyle(fontSize: 12),),
                    SizedBox(height: 30,),
                    TextField(
                      decoration: InputDecoration(
                        prefixText: "+91",
                        labelText: "Ten Digits",
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      onChanged: (value){
                        if(value.length==10){
                          myState((){
                            _validPhoneNumber = true;
                          });
                        }else{
                          myState((){
                            _validPhoneNumber = false;
                          });
                        }

                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: AbsorbPointer(
                            absorbing: _validPhoneNumber ? false:true,
                            child: MaterialButton(
                              color: _validPhoneNumber ? Theme.of(context).primaryColor : Colors.grey,
                                onPressed: (){},
                                child: Text(_validPhoneNumber? 'Continue' : 'Enter phone number',style: TextStyle(fontSize: 12,),)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );



          },
          ),
      );

}

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
        right: 0.0,
                top: 10.0,
                child: ElevatedButton(
                    child: Text("Skip",style: TextStyle(color: Colors.deepOrangeAccent),),
                onPressed: (){}),
            ),
              Column(
                children: [
                  Expanded(
                    child: OnBoardScreen(),
                  ),
                  Text("Ready to order from your nearest shop?"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Set your Delivery location",style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Already a Customer ?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: (){
                          showBottomSheet(context);
                        },
                        child:Text("LOGIN")),
                  )


                ],
              ),

          ],
        ),
      ),
    );
  }
}
