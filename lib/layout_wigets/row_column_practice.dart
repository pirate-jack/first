import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String Data =
        'In a large bowl, whisk together the flour, sugar, baking powder, and salt.In a separate bowl, whisk together the milk, egg, melted butter, and vanilla extract.Pour the wet ingredients into the dry ingredients and stir until just combined. Its okay if there are a few lumps in the batter.Heat a non-stick skillet or griddle over medium heat and lightly grease with butter or cooking spray.Pour 1/4 cup of batter onto the skillet for each pancake. Cook until bubbles form on the surface, then flip and cook for another 1-2minutes, until golden brown.Serve the pancakes warm with your favorite toppings, such as maple syrup, fresh fruit, or whipped cream.';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Row Column practice',
      home: Scaffold(
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10,top: 5),
            // color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/cake.png'),
                SizedBox(
                  height: 10,
                ),
                Text(Data),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                    Icon(Icons.star_border),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Reviews 180'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.roundabout_right),
                        Text('Route'),
                        Text('25 min')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(Icons.timelapse_outlined),
                        Text('cook  '),
                        Text('1 hr')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Icon(Icons.dining_outlined),
                        Text('FEED'),
                        Text('4-6')
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Text('Pre')),
                    ElevatedButton(onPressed: (){}, child: Text('Next'),),
                  ],
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'PANCAKE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
