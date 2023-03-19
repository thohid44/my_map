import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropDownVerticle extends StatefulWidget {
  const DropDownVerticle({super.key});

  @override
  State<DropDownVerticle> createState() => _DropDownVerticleState();
}

class _DropDownVerticleState extends State<DropDownVerticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
       body:   Container(
        margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        width: 200,
        child: Card(
          child: ListView(
            children: [
              
              SizedBox(height: 20),
            const  ExpansionTile(title: Text("Trip"), 
              children:  [
                ListTile(
                  title: Text("Category 1"),
                ),
                  ListTile(
                  title: Text("Category 1"),
                )
              ],
              ), 
         const     ExpansionTile(title: Text("Trip"), 
              children: [
                ListTile(
                  title: Text("Category 1"),
                ),
                  ListTile(
                  title: Text("Category 1"),
                )
              ],
              )
              ,
              
              ExpansionTile(title: Container(
                height: 40,
                child: Text("Task")), 
              children: [
                ListTile(
                  title: Text("Post a Task"),
                ),
                  ListTile(
                  title: Text("My Task"),
                ), 
                 ListTile(
                  title: Text("My Task Offers"),
                ), 
                ListTile(
                  title: Text("My Task Ratings"),
                )
              ],
              ), 
              
              ListTile(
               
                title: Text("Referral", style: TextStyle(
                  color: Colors.black, 
                ),),
              ),
               ListTile(
               
                title: Text("My Transactions", style: TextStyle(
                  color: Colors.black, 
                ),),
              ),
               ListTile(
               
                title: Text("Payment Method", style: TextStyle(
                  color: Colors.black, 
                ),),
              ),
               ListTile(
               
                title: Text("E-Wallet", style: TextStyle(
                  color: Colors.black, 
                ),),
              ), 
                ExpansionTile(title: Text("Support"), 
              children: [
                ListTile(
                  title: Text("Category 1"),
                ),
                  ListTile(
                  title: Text("Category 1"),
                )
              ],
              )
              ,
               ListTile(
               
                title: Text("Settings", style: TextStyle(
                  color: Colors.black, 
                ),),
              ),
              ListTile(
               
                title: Text("Logout", style: TextStyle(
                  color: Colors.black, 
                ),),
              )
            ],
          ),
        ),
      )
    );
  }
}