import 'package:flutter/material.dart';


class StackImage extends StatefulWidget {
  const StackImage({super.key});

  @override
  State<StackImage> createState() => _StackImageState();
}

class _StackImageState extends State<StackImage>  {
  bool opend = false; 
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
