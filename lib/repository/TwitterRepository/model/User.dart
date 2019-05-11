class User {
  int id;
  String idStr;
  String name;
  String screenName;
  String location;
  String description;
  bool protected;
  int followersCount;
  int friendsCount;
  int listedCount;
  String createdAt;
  int favouritesCount;
  bool geoEnabled;
  bool verified;
  int statusesCount;
  String lang;
  bool contributorsEnabled;
  bool isTranslator;
  bool isTranslationEnabled;
  String profileBackgroundColor;
  String profileBackgroundImageUrl;
  String profileBackgroundImageUrlHttps;
  bool profileBackgroundTile;
  String profileImageUrl;
  String profileImageUrlHttps;
  String profileLinkColor;
  String profileSidebarBorderColor;
  String profileSidebarFillColor;
  String profileTextColor;
  bool profileUseBackgroundImage;
  bool hasExtendedProfile;
  bool defaultProfile;
  bool defaultProfileImage;
  bool following;
  bool followRequestSent;
  bool notifications;
  String translatorType;

  User(
      {this.id,
        this.idStr,
        this.name,
        this.screenName,
        this.location,
        this.description,
        this.protected,
        this.followersCount,
        this.friendsCount,
        this.listedCount,
        this.createdAt,
        this.favouritesCount,
        this.geoEnabled,
        this.verified,
        this.statusesCount,
        this.lang,
        this.contributorsEnabled,
        this.isTranslator,
        this.isTranslationEnabled,
        this.profileBackgroundColor,
        this.profileBackgroundImageUrl,
        this.profileBackgroundImageUrlHttps,
        this.profileBackgroundTile,
        this.profileImageUrl,
        this.profileImageUrlHttps,
        this.profileLinkColor,
        this.profileSidebarBorderColor,
        this.profileSidebarFillColor,
        this.profileTextColor,
        this.profileUseBackgroundImage,
        this.hasExtendedProfile,
        this.defaultProfile,
        this.defaultProfileImage,
        this.following,
        this.followRequestSent,
        this.notifications,
        this.translatorType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idStr = json['id_str'];
    name = json['name'];
    screenName = json['screen_name'];
    location = json['location'];
    description = json['description'];
    protected = json['protected'];
    followersCount = json['followers_count'];
    friendsCount = json['friends_count'];
    listedCount = json['listed_count'];
    createdAt = json['created_at'];
    favouritesCount = json['favourites_count'];
    geoEnabled = json['geo_enabled'];
    verified = json['verified'];
    statusesCount = json['statuses_count'];
    lang = json['lang'];
    contributorsEnabled = json['contributors_enabled'];
    isTranslator = json['is_translator'];
    isTranslationEnabled = json['is_translation_enabled'];
    profileBackgroundColor = json['profile_background_color'];
    profileBackgroundImageUrl = json['profile_background_image_url'];
    profileBackgroundImageUrlHttps = json['profile_background_image_url_https'];
    profileBackgroundTile = json['profile_background_tile'];
    profileImageUrl = json['profile_image_url'];
    profileImageUrlHttps = json['profile_image_url_https'];
    profileLinkColor = json['profile_link_color'];
    profileSidebarBorderColor = json['profile_sidebar_border_color'];
    profileSidebarFillColor = json['profile_sidebar_fill_color'];
    profileTextColor = json['profile_text_color'];
    profileUseBackgroundImage = json['profile_use_background_image'];
    hasExtendedProfile = json['has_extended_profile'];
    defaultProfile = json['default_profile'];
    defaultProfileImage = json['default_profile_image'];
    following = json['following'];
    followRequestSent = json['follow_request_sent'];
    notifications = json['notifications'];
    translatorType = json['translator_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_str'] = this.idStr;
    data['name'] = this.name;
    data['screen_name'] = this.screenName;
    data['location'] = this.location;
    data['description'] = this.description;
    data['protected'] = this.protected;
    data['followers_count'] = this.followersCount;
    data['friends_count'] = this.friendsCount;
    data['listed_count'] = this.listedCount;
    data['created_at'] = this.createdAt;
    data['favourites_count'] = this.favouritesCount;
    data['geo_enabled'] = this.geoEnabled;
    data['verified'] = this.verified;
    data['statuses_count'] = this.statusesCount;
    data['lang'] = this.lang;
    data['contributors_enabled'] = this.contributorsEnabled;
    data['is_translator'] = this.isTranslator;
    data['is_translation_enabled'] = this.isTranslationEnabled;
    data['profile_background_color'] = this.profileBackgroundColor;
    data['profile_background_image_url'] = this.profileBackgroundImageUrl;
    data['profile_background_image_url_https'] =
        this.profileBackgroundImageUrlHttps;
    data['profile_background_tile'] = this.profileBackgroundTile;
    data['profile_image_url'] = this.profileImageUrl;
    data['profile_image_url_https'] = this.profileImageUrlHttps;
    data['profile_link_color'] = this.profileLinkColor;
    data['profile_sidebar_border_color'] = this.profileSidebarBorderColor;
    data['profile_sidebar_fill_color'] = this.profileSidebarFillColor;
    data['profile_text_color'] = this.profileTextColor;
    data['profile_use_background_image'] = this.profileUseBackgroundImage;
    data['has_extended_profile'] = this.hasExtendedProfile;
    data['default_profile'] = this.defaultProfile;
    data['default_profile_image'] = this.defaultProfileImage;
    data['following'] = this.following;
    data['follow_request_sent'] = this.followRequestSent;
    data['notifications'] = this.notifications;
    data['translator_type'] = this.translatorType;
    return data;
  }
}