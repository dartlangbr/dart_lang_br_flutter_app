class UrlMetaData {
  String title;
  String description;
  String twitterTitle;
  String twitterDescription;
  String twitterImageSrc;
  String twitterImage;
  String link;

  UrlMetaData(
      {
        this.title,
        this.description,
        this.twitterTitle,
        this.twitterDescription,
        this.twitterImageSrc,
        this.twitterImage,
        });

  UrlMetaData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    twitterTitle = json['twitter:title'];
    twitterDescription = json['twitter:description'];
    twitterImageSrc = json['twitter:image:src'];
    twitterImage = json['twitter:image'];
  }

  @override
  String toString() {
    return 'MetaData{title: $title, description: $description, twitterTitle: $twitterTitle, twitterDescription: $twitterDescription, twitterImageSrc: $twitterImageSrc, twitterImage: $twitterImage, link: $link}';
  }


  String getTitte(){
    if(title != null){
      return title;
    }else{
      return twitterTitle ?? "";
    }
  }

  String getDescription(){
    if(description != null){
      return description;
    }else{
      return twitterDescription ?? "";
    }
  }

  String getImg(){
    if(twitterImage != null){
      return twitterImage;
    }else{
      return twitterImageSrc ?? "";
    }
  }

  bool isEmpty(){
    return getTitte().isEmpty && getDescription().isEmpty && getImg().isEmpty;
  }
}