import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherprovider/weatherinfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Provider Demo",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(title: Text("Provider")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySpecialHeading(),
            ],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperaturetype == "celcius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    // var weatherInfo = Provider.of<WeatherInfo>(context);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Consumer<WeatherInfo>(
          builder: (context, weatherInfo, _) => Text(
                weatherInfo.temperaturetype,
                style: TextStyle(fontSize: 25, color: decideColor(weatherInfo)),
              )),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  Color decideColor(WeatherInfo info) {
    return info.temperaturetype == "celcius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      onPressed: () {
        String newWeatherType =
            weatherInfo.temperaturetype == "celcius" ? "far" : "celcius";
        weatherInfo.temperatureType = newWeatherType;
      },
      tooltip: 'Change Type',
      child: Icon(Icons.change_history),
    );
  }
}
