import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String personIMG = 'assets/p1.png';
    String data = 'We are committed to providing access to affordable and innovative medicines, driven by our purpose of ‘Good Health Can’t Wait’.Our products and services are spread across our core businesses of Active Pharmaceutical Ingredients (API), generics, branded generics, biosimilars and over-the-counter pharmaceutical products around the world. We work towards meeting unmet patients needs in the areas of gastro-enterology, cardiovascular, diabetology, oncology, pain management and dermatology. We are investing in businesses of the future including drug discovery, clinically-differentiated assets and digital healthcare.';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text(''),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 180,
                        height: 210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Colors.orange.shade600,
                          image: DecorationImage(
                              image: AssetImage(personIMG), fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        ),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              "Dr. reddy's ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Text(
                              "laboratories",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Text(
                              "Heart Speallist",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: const Icon(Icons.mail,color: Colors.orange,),
                                  )
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: const Icon(Icons.call,color: Colors.red,),
                                  )
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: const Icon(Icons.video_call_outlined,color: Colors.green,),
                                  )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('About',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                    child: Text(data,style: const TextStyle(fontSize: 17),),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
