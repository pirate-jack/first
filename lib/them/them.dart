import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.red,
            accentColor: Colors.indigo,
            primarySwatch: Colors.amber,cardColor: Colors.deepPurple),
      ),
      title: 'Material App',
      home: theme(),
    );
  }
}

class theme extends StatefulWidget {
  const theme({super.key});

  @override
  State<theme> createState() => _themeState();
}

class _themeState extends State<theme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Them'),
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: [
            Text(
              "DisplayLarge",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "Headline",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              "TitleLarge",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text("LabelLarge", style: Theme.of(context).textTheme.labelLarge),
            Text("BodyText1", style: Theme.of(context).textTheme.bodyText1),
            Text("BodyText2", style: Theme.of(context).textTheme.bodyText2),
            Text("Button", style: Theme.of(context).textTheme.button),
            Text("caption", style: Theme.of(context).textTheme.caption),
            Text("headline1", style: Theme.of(context).textTheme.headline1),
            Text("headline6", style: Theme.of(context).textTheme.headline6),
            Text("Overline", style: Theme.of(context).textTheme.overline),
            Text("Subtitle1", style: Theme.of(context).textTheme.subtitle1),
            Text("Subtitle2", style: Theme.of(context).textTheme.subtitle2),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Click Me'),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: Card(
                child: Center(child: Text('Card')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
