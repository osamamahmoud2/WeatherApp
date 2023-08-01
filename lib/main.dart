import 'package:flutter/material.dart';
import 'package:last/models/weathermodel.dart';
import 'package:last/provider/Weather_provider.dart';
import 'package:provider/provider.dart';
import 'Screens/Home_Page.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create: (context) {
        return  Weatherprovider();
      }, 
    child: WeartherApp()));
}
class WeartherApp extends StatelessWidget {

weathermodel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        primarySwatch: Provider.of<Weatherprovider>(context).weatherdata?.getthemcolor()
      ),
      debugShowCheckedModeBanner: debugDisableShadows=false,
      home: HomePage(),
    );
  }
}