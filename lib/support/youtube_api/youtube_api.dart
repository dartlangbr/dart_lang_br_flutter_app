import 'dart:async';
import 'dart:convert';
import 'package:dart_lang_br_flutter_app/support/youtube_api/_api.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class YoutubeAPI {
  static const MethodChannel _channel = const MethodChannel('youtube_api');
  String key;
  String type;
  String query;
  String prevPageToken;
  String nextPageToken;
  int maxResults;
  API api;
  int page;

//  Constructor
  YoutubeAPI(this.key, {String type, int maxResults: 10}) {
    page = 0;
    this.type = type;
    this.maxResults = maxResults;
    api = new API(key: this.key, maxResults: this.maxResults, type: this.type);
  }

//  For Searching on YouTube
  Future<List> search(String query, {String type}) async {
    this.query = query;
    Uri url = api.searchUri(query, type: type);
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var jsonData = json.decode(res.body);
    if (jsonData['error'] != null){
      print(jsonData['error']);
      return [];
    }
    if (jsonData['pageInfo']['totalResults'] == null) return [];
    List<YT_API> result = _getResultFromJson(jsonData);
    return result;
  }

// For getting all videos from youtube channel
  Future<List> channel(String channelId, {String order}) async {
    Uri url = api.channelUri(channelId, order);
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var jsonData = json.decode(res.body);
    List<YT_API> result = _getResultFromJson(jsonData);
    return result;
  }

  List<YT_API> _getResultFromJson(jsonData) {
    List<YT_API> result = [];
    if (jsonData == null) return [];

    nextPageToken = jsonData['nextPageToken'];
    api.setNextPageToken(nextPageToken);
    int total = jsonData['pageInfo']['totalResults'] <
        jsonData['pageInfo']['resultsPerPage']
        ? jsonData['pageInfo']['totalResults']
        : jsonData['pageInfo']['resultsPerPage'];
    for (int i = 0; i < total; i++) {
      result.add(new YT_API(jsonData['items'][i]));
    }
    page = 1;
    return result;
  }

// To go on Next Page
  Future<List> nextPage() async {
    List<YT_API> result = [];
    Uri url = api.nextPageUri();
    print(url);
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var jsonData = json.decode(res.body);

    if (jsonData['pageInfo']['totalResults'] == null) return [];

    if (jsonData == null) return [];

    nextPageToken = jsonData['nextPageToken'];
    prevPageToken = jsonData['prevPageToken'];
    api.setNextPageToken(nextPageToken);
    api.setPrevPageToken(prevPageToken);
    int total = jsonData['pageInfo']['totalResults'] <
        jsonData['pageInfo']['resultsPerPage']
        ? jsonData['pageInfo']['totalResults']
        : jsonData['pageInfo']['resultsPerPage'];
    for (int i = 0; i < total; i++) {
      result.add(new YT_API(jsonData['items'][i]));
    }
    page++;
    if (total == 0) {
      return null;
    }
    return result;
  }

  Future<List> prevPage() async {
    List<YT_API> result = [];
    Uri url = api.nextPageUri();
    print(url);
    var res = await http.get(url, headers: {"Accept": "application/json"});
    var jsonData = json.decode(res.body);

    if (jsonData['pageInfo']['totalResults'] == null) return [];

    if (jsonData == null) return [];

    nextPageToken = jsonData['nextPageToken'];
    prevPageToken = jsonData['prevPageToken'];
    api.setNextPageToken(nextPageToken);
    api.setPrevPageToken(prevPageToken);
    int total = jsonData['pageInfo']['totalResults'] <
        jsonData['pageInfo']['resultsPerPage']
        ? jsonData['pageInfo']['totalResults']
        : jsonData['pageInfo']['resultsPerPage'];
    for (int i = 0; i < total; i++) {
      result.add(new YT_API(jsonData['items'][i]));
    }
    if (total == 0) {
      return null;
    }
    page--;
    return result;
  }

//  Get Current Page
  int get getPage => page;

//  Getter and Setter for Max Result Per page
  set setmaxResults(int maxResults) => this.maxResults = maxResults;

  get getmaxResults => this.maxResults;

//  Getter and Setter Key
  set setKey(String key) => api.key = key;

  String get getKey => api.key;

//  Getter and Setter for query
  set setQuery(String query) => api.query = query;

  String get getQuery => api.query;

//  Getter and Setter for type
  set setType(String type) => api.type = type;

  String get getType => api.type;
}

//To Reduce import
// I added this here
class YT_API {
  dynamic thumbnail;
  String kind,
      id,
      publishedAt,
      channelId,
      channelurl,
      title,
      description,
      channelTitle,
      url;

  YT_API(dynamic data) {
    thumbnail = {
      'default': data['snippet']['thumbnails']['default'],
      'medium': data['snippet']['thumbnails']['medium'],
      'high': data['snippet']['thumbnails']['high']
    };
    kind = data['id']['kind'].substring(8);
    id = data['id'][data['id'].keys.elementAt(1)];
    print(data['id'].keys.elementAt(1));
    print(id);
    url = getURL(kind, id);
    publishedAt = data['snippet']['publishedAt'];
    channelId = data['snippet']['channelId'];
    channelurl = "https://www.youtube.com/channel/$channelId";
    title = data['snippet']['title'];
    description = data['snippet']['description'];
    channelTitle = data['snippet']['channelTitle'];
  }

  String getURL(String kind, String id) {
    String baseURL = "https://www.youtube.com/";
    switch (kind) {
      case 'channel':
        return "${baseURL}watch?v=$id";
        break;
      case 'video':
        return "${baseURL}watch?v=$id";
        break;
      case 'playlist':
        return "${baseURL}watch?v=$id";
        break;
    }
    return baseURL;
  }
}