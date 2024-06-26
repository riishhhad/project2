import 'dart:convert';


import 'package:http/http.dart';
import 'package:project2/repository/Modelclass/Rishad.dart';

import 'Client.dart';






class Animeapi {
  ApiClient apiClient = ApiClient();


  Future<Rishad> getAnime() async {
    String trendingpath ="https://anime-db.p.rapidapi.com/anime?page=1&size=10&search=Fullmetal&genres=Fantasy%2CDrama&sortBy=ranking&sortOrder=asc";
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Rishad.fromJson(jsonDecode(response.body));
  }
}