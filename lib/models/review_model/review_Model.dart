class ReviewModel {
  String? name;
  String? dateTime;
  String? image;
  String? text;
  String? userId;

  ReviewModel({required this.name, required this.dateTime, required this.text,required this.userId,required this.image});
  ReviewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    userId = json['userId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'dateTime': dateTime,
      'text': text,
      'userId':userId,
    };
  }
}