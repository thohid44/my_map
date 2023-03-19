import 'package:flutter/material.dart';

class StackImage extends StatefulWidget {
  const StackImage({super.key});

  @override
  State<StackImage> createState() => _StackImageState();
}

class _StackImageState extends State<StackImage> {
  bool opend = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 220, 
            decoration: BoxDecoration(
              color: Colors.amber
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,), 
                Center(
                  child: Container(
                    width: 300,
                    child: Stack(clipBehavior: Clip.none, children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                      Positioned(
                          top: -25,
                          left: 50,
                          right: 50,
                          child: Image.asset(
                            "assets/about.png",
                            height: 60,
                            width: 60,
                          )),
                      Positioned(
                          left: 50,
                          top: 40,
                          right: 50,
                          child: Center(child: Text("How was the experience"))),
                      Positioned(
                          left: 50,
                          top: 60,
                          right: 50,
                          child: Center(child: Text("How was the experience")))
                    ]),
          
                  ),
                ), 
          
               SizedBox(height: 10), 
          Container(
               width: 300,
            child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                         
                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                 
                               
                                child: Text("Cathy Ferguson", 
                                style: TextStyle(fontSize: 14, ),),
                                        ),
                                          Container(
                                  
                             
                                child: Text("Service Receiver", 
                                style: TextStyle(fontSize: 14, ),),
                                        ),
                             Container(
                                  
                               
                                child: Text("15 Jan 2023, 01:53PM", 
                                style: TextStyle(fontSize: 14, ),),
                                        ),
                              ],
                            ),
                          ),
 Container(
                                  
                               
                                child: Text("148.47", 
                                style: TextStyle(fontSize: 14, ),),
                                        ),

                        ],
                      ),
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Row(
//                 children: [
//                   Container(
//                     child: Column(
//                       children: [
//                         Container(
//                           width:300, 
                       
//                         child: Text("Cathy Ferguson", 
//                         style: TextStyle(fontSize: 14, ),),
//                                 ),
//                                   Container(
//                           width:300, 
                     
//                         child: Text("Service Receiver", 
//                         style: TextStyle(fontSize: 14, ),),
//                                 ),
//                      Container(
//                           width:300, 
                       
//                         child: Text("15 Jan 2023, 01:53PM", 
//                         style: TextStyle(fontSize: 14, ),),
//                                 ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),