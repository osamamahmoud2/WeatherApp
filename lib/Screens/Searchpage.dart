import 'package:flutter/material.dart';
import 'package:last/Service/WatherServices.dart';
import 'package:last/models/weathermodel.dart';
import 'package:last/provider/Weather_provider.dart';
import 'package:provider/provider.dart';

String? name;

class SearchPage extends StatelessWidget {
  SearchPage({this.cityName});
  String? cityName;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Enter the name of City',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "this feild is requied";
                      }
                    },
                    // onChanged: (data) {
                    //   print(data);
                    // },
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    color: Colors.blue,
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        WeartherServices services = WeartherServices();
                        weathermodel weather =
                            await services.GetWeather(CityName: name!);
                        weatherdata = weather;
                        Provider.of<Weatherprovider>(context, listen: false)
                            .weatherdata = weather;
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

weathermodel? weatherdata;
