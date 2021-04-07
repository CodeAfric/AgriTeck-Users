class Tips {
  String tipDate, tipCategory, tipTitle, tipDescriptions, tipImage;

  Tips(
      {this.tipDate,
      this.tipCategory,
      this.tipTitle,
      this.tipDescriptions,
      this.tipImage});
  // Convert a tips object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['tipDate'] = tipDate;
    map['tipCategory'] = tipCategory;
    map['tipTitle'] = tipTitle;
    map['tipDescriptions'] = tipDescriptions;
    map['tipImage'] = tipImage;
    return map;
  }

  Tips.fromMapObject(Map<String, dynamic> map) {
    this.tipDate = map['tipDate'];
    this.tipCategory = map['tipCategory'];
    this.tipTitle = map['tipTitle'];
    this.tipDescriptions = map['tipDescriptions'];
    this.tipImage = map['tipImage'];
  }

  static List<Tips> testTips() {
    List<Tips> data = [
      Tips(
          tipCategory: 'Health',
          tipDate: '10 Jan, 2021',
          tipDescriptions:
              'Premium Elements themes include professional design options.'
                  ' Plus, the Word business letter template features go beyond '
                  'the free Microsoft Word templates available around the web.'
                  'Elements is intuitive and easy to use. Its the perfect tool '
                  'for making a statement with your business letters in 2021. '
                  'It includes hundreds of business letterhead templates for Word.',
        tipImage:"assets/images/health.png",
        tipTitle: "Emergency on the Farm",
      )
    ];
    return data;
  }
}
