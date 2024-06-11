import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String data =
        'Perhaps the defining characteristic of modern interior design is the open concept floor plan. Removing the walls that once separated the common rooms of the home further emphasizes the trends of simplicity, natural light, and openness. While bedrooms are still a private retreat, the modern home is built for families to be together while those large windows shroud the entire home in sunlight. In these open concepts the family can feel together even while the kids are playing by the television, dinner is being prepared over the stove, and emails are being sent from the dining table. These bright open interiors are incorporated into myriad Schumacher Homes floor plans and are discussed in far more';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout grind',
      home: SafeArea(
        child: Scaffold(
          // bottomSheet: Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10), color: Colors.black),
          //   // margin: EdgeInsets.only(left: 20, right: 10),
          //   height: 65,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Column(
          //         children: [
          //           Row(
          //             children: [
          //               Text(
          //                 '159\$',
          //                 style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold),
          //               ),
          //               Text(
          //                 ' + Taxes',
          //                 style: TextStyle(color: Colors.grey),
          //               )
          //             ],
          //           ),
          //           Text(
          //             'Per Night',
          //             style: TextStyle(color: Colors.grey),
          //           )
          //         ],
          //       ),
          //       ElevatedButton(
          //         onPressed: () {},
          //         child: Text(
          //           'Book Now',
          //           style: TextStyle(color: Colors.black),
          //         ),
          //         style: ElevatedButton.styleFrom(
          //             shape: ContinuousRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)),
          //             backgroundColor: Colors.blue,
          //             textStyle: TextStyle(
          //                 fontWeight: FontWeight.bold, color: Colors.grey)),
          //       )
          //     ],
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 400,
                      // width: 500,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                              image: AssetImage('assets/house1.png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                ListTile(
                  title: Text(
                    'Vacation Home',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  subtitle: Text('Vesu,Surat'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                      ),
                      Text(
                        '41',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.blue,
                          size: 35,
                        ),
                        SizedBox(height: 10,),
                        Text('Call')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.route,
                          color: Colors.blue,
                          size: 35,
                        ),
                        SizedBox(height: 10,),
                        Text('Route')
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.blue,
                          size: 35,
                        ),
                        SizedBox(height: 10,),
                        Text('Share')
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 10),
                  child: Text(
                    data,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
