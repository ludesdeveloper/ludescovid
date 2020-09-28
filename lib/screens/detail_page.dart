import 'package:flutter/material.dart';
//import models
import 'package:ludescovid/models/covid_models.dart';
//import apis
import 'package:ludescovid/apis/covid_api.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Feature>>(
        future: CovidApi().fetchCovidData(),
        builder: (context, snapshot) {
          var listResult = snapshot.data;
          if (listResult == null) {
            return Center(child: Text('Loading'));
          }
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: listResult.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Text(
                          'Provinsi : ${listResult[index].attributes.provinsi}'),
                      Text(
                          'Positive : ${listResult[index].attributes.kasusPosi}'),
                      Text(
                          'Sembuh : ${listResult[index].attributes.kasusSemb}'),
                      Text(
                          'Meninggal : ${listResult[index].attributes.kasusMeni}'),
                    ],
                  ),
                  // child: Text(
                  //     'Provinsi : ${listResult[index].attributes.provinsi}, Positive : ${listResult[index].attributes.kasusPosi}, Sembuh : ${listResult[index].attributes.kasusSemb}, Meninggal : ${listResult[index].attributes.kasusMeni}, ')
                );
              });
        },
      ),
    );
  }
}
