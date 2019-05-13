import 'package:dart_lang_br_flutter_app/repository/MetaDataRepository/model/UrlMetaData.dart';
import 'package:dart_lang_br_flutter_app/repository/TwitterRepository/model/User.dart';

class TwitterModel {
  String createdAt;
  int id;
  String idStr;
  String text;
  bool truncated;
  String source;
  Null inReplyToStatusId;
  Null inReplyToStatusIdStr;
  Null inReplyToUserId;
  Null inReplyToUserIdStr;
  Null inReplyToScreenName;
  User user;
  Null geo;
  Null coordinates;
  Null place;
  Null contributors;
  bool isQuoteStatus;
  int retweetCount;
  int favoriteCount;
  bool favorited;
  bool retweeted;
  bool possiblySensitive;
  String lang;
  UrlMetaData metaData;

  TwitterModel(
      {this.createdAt,
        this.id,
        this.idStr,
        this.text,
        this.truncated,
        this.source,
        this.inReplyToStatusId,
        this.inReplyToStatusIdStr,
        this.inReplyToUserId,
        this.inReplyToUserIdStr,
        this.inReplyToScreenName,
        this.user,
        this.geo,
        this.coordinates,
        this.place,
        this.contributors,
        this.isQuoteStatus,
        this.retweetCount,
        this.favoriteCount,
        this.favorited,
        this.retweeted,
        this.possiblySensitive,
        this.lang});

  TwitterModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    idStr = json['id_str'];
    text = json['text'];
    truncated = json['truncated'];
    source = json['source'];
    inReplyToStatusId = json['in_reply_to_status_id'];
    inReplyToStatusIdStr = json['in_reply_to_status_id_str'];
    inReplyToUserId = json['in_reply_to_user_id'];
    inReplyToUserIdStr = json['in_reply_to_user_id_str'];
    inReplyToScreenName = json['in_reply_to_screen_name'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    geo = json['geo'];
    coordinates = json['coordinates'];
    place = json['place'];
    contributors = json['contributors'];
    isQuoteStatus = json['is_quote_status'];
    retweetCount = json['retweet_count'];
    favoriteCount = json['favorite_count'];
    favorited = json['favorited'];
    retweeted = json['retweeted'];
    possiblySensitive = json['possibly_sensitive'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['id_str'] = this.idStr;
    data['text'] = this.text;
    data['truncated'] = this.truncated;
    data['source'] = this.source;
    data['in_reply_to_status_id'] = this.inReplyToStatusId;
    data['in_reply_to_status_id_str'] = this.inReplyToStatusIdStr;
    data['in_reply_to_user_id'] = this.inReplyToUserId;
    data['in_reply_to_user_id_str'] = this.inReplyToUserIdStr;
    data['in_reply_to_screen_name'] = this.inReplyToScreenName;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['geo'] = this.geo;
    data['coordinates'] = this.coordinates;
    data['place'] = this.place;
    data['contributors'] = this.contributors;
    data['is_quote_status'] = this.isQuoteStatus;
    data['retweet_count'] = this.retweetCount;
    data['favorite_count'] = this.favoriteCount;
    data['favorited'] = this.favorited;
    data['retweeted'] = this.retweeted;
    data['possibly_sensitive'] = this.possiblySensitive;
    data['lang'] = this.lang;
    return data;
  }

  @override
  String toString() {
    return 'TwitterModel{createdAt: $createdAt, id: $id, idStr: $idStr, text: $text, truncated: $truncated, source: $source, inReplyToStatusId: $inReplyToStatusId, inReplyToStatusIdStr: $inReplyToStatusIdStr, inReplyToUserId: $inReplyToUserId, inReplyToUserIdStr: $inReplyToUserIdStr, inReplyToScreenName: $inReplyToScreenName, user: $user, geo: $geo, coordinates: $coordinates, place: $place, contributors: $contributors, isQuoteStatus: $isQuoteStatus, retweetCount: $retweetCount, favoriteCount: $favoriteCount, favorited: $favorited, retweeted: $retweeted, possiblySensitive: $possiblySensitive, lang: $lang}';
  }
}