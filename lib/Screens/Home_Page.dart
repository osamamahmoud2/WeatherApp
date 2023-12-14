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
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Center(child: Text('Weather App')),
      ),
      body: Provider.of<Weatherprovider>(context).weatherdata == null
          ? Container(
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "there is no weather now",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "searching now",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherdata!.getthemcolor(),
                weatherdata!.getthemcolor()[200]!,
                weatherdata!.getthemcolor()[100]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherdata!.name,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35),
                    child: Text(
                      weatherdata!.data.toString(),
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherdata!.getiamge()),
                      Text(
                        weatherdata!.temp.toString(),
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'mintemp is:${weatherdata!.mintemp.toString()}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text('maxtemp is:${weatherdata!.maxtemp.toString()}',
                              style: const TextStyle(fontSize: 15))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    weatherdata!.weatherstatname.toString(),
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
