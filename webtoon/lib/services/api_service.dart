// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_episode_model.dart';

///pub.dev http 패키지 다운 or pubspec.yaml(환경파일) set http: ^0.13.5
import 'package:webtoon/models/webtoon_model.dart';

import '../models/webtoon_detail_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];

    /// API에 HTTP 요청
    final url = Uri.parse('$baseUrl/$today');

    ///hittp.get 함수는 future 타입을 반환, future 타입은 즉각 반환 값이 아니기 때문에 작업이 완료 될 떄 까지 기다려야함(비동기 )
    /// await 비동기 함수(async)에서만 사용가능
    final response = await http.get(url);

    /// response 성공여부 확인
    if (response.statusCode == 200) {
      //print(response.body);
      /// response body를 string 에서 json으로 형변환 (bc 원래 응답 포맷이 json)
      /// List<dynamic> 을 명시하여 json이 dynamic값으로 이뤄진것을 상기
      final List<dynamic> webtoons = jsonDecode(response.body);

      /// List webtoons 들을 named constructor를 사용해서 fromjson 값을 각각의 webtoonsModel instance로 생성
      for (var webtoon in webtoons) {
        //print(webtoon);
        // final toon = WebtoonModel.fromJson(webtoon);
        //print(toon.title);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      /// webtoonsModel instance 반환
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        //WebtoonEpisodeModel.fromJson(episode);
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
