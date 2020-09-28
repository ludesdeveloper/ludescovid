import 'dart:convert';
//import libs
import 'package:http/http.dart' as http;
//import models
import 'package:ludescovid/models/covid_models.dart';

class CovidApi {
  Future<List<Feature>> fetchCovidData() async {
    final response = await http.get(
        'https://services5.arcgis.com/VS6HdKS0VfIhv8Ct/arcgis/rest/services/COVID19_Indonesia_per_Provinsi/FeatureServer/0/query?where=1%3D1&outFields=Provinsi,Kasus_Posi,Kasus_Meni,Kasus_Semb&outSR=4326&f=json');

    if (response.statusCode == 200) {
      var result1 = CovidModel.fromJson(json.decode(response.body));
      var features = result1.features;
      // for (var item in features) {
      //   int value = item.attributes.kasusMeni;
      //   print(value);
      // }
      return features;
    } else {
      throw Exception('Failed to load Covid data');
    }
  }

  Future<List<int>> fetchCovidTotal() async {
    final response = await http.get(
        'https://services5.arcgis.com/VS6HdKS0VfIhv8Ct/arcgis/rest/services/COVID19_Indonesia_per_Provinsi/FeatureServer/0/query?where=1%3D1&outFields=Provinsi,Kasus_Posi,Kasus_Meni,Kasus_Semb&outSR=4326&f=json');

    if (response.statusCode == 200) {
      var result1 = CovidModel.fromJson(json.decode(response.body));
      var features = result1.features;
      List<int> totalTotal = [];
      int totalPositif = 0;
      int totalSembuh = 0;
      int totalMeninggal = 0;
      for (var item in features) {
        totalPositif = totalPositif + item.attributes.kasusPosi;
        totalSembuh = totalSembuh + item.attributes.kasusSemb;
        totalMeninggal = totalMeninggal + item.attributes.kasusMeni;
      }
      totalTotal.add(totalPositif);
      totalTotal.add(totalSembuh);
      totalTotal.add(totalMeninggal);
      return totalTotal;
    } else {
      throw Exception('Failed to load Covid data');
    }
  }
}
