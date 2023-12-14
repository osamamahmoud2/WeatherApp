import 'package:flutter/material.dart';
import 'package:last/Service/WatherServices.dart';
import 'package:last/models/weathermodel.dart';
import 'package:last/provider/Weather_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.cityName});
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            // onChanged: (data) {
            //   print(data);
            // },
            onSubmitted: (value) async {
              cityName = value;
              WeartherServices services = WeartherServices();
              weathermodel weather =
                  await services.GetWeather(CityName: cityName!);
              weatherdata = weather;
              Provider.of<Weatherprovider>(context, listen: false).weatherdata =
                  weather;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Enter City'),
          ),
        ),
      ),
    );
  }
}

weathermodel? weatherdata;
