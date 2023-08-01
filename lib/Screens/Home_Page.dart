import 'package:flutter/material.dart';
import 'package:last/models/weathermodel.dart';
import 'package:last/provider/Weather_provider.dart';
import 'package:provider/provider.dart';

import 'Searchpage.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchPage();
            }));
          }, icon: Icon(Icons.search))
        ],
        title: Center(child: Text('Weather App')),
      ),
      body:Provider.of<Weatherprovider>(context).weatherdata==null ?  
       Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("there is no weather start",
              style: TextStyle(
                fontSize: 20
              ),
              ),
              Text("searching now",
              style: TextStyle(
                fontSize: 20
              ),
              )
            ],
          ),
        ),
      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherdata!.getthemcolor(),
              weatherdata!.getthemcolor()[300]!,
               weatherdata!.getthemcolor()[100]!,
              
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherdata!.name,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            
            ),
            ),
            Text(weatherdata!.data.toString(),

            style: TextStyle(
              fontSize: 22),
              
            ),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherdata!.getiamge()),
                Text(weatherdata!.temp.toString(),

            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold),
              
            ),
            Column(
              children: [
                Text('mintemp is:${weatherdata!.mintemp.toString()}'),
                Text('maxtemp is:${weatherdata!.maxtemp.toString()}')
              ],
            )

              ],
            ),
            SizedBox(height: 35,),
            Text(weatherdata!.weatherstatname.toString(),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            
            ),
            )
            
          ],
        ),
      ),
    );
  }
}