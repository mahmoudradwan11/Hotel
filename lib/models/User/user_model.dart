class UserData
{
String? name;
String? email;
String? phone;
String? uid;
String? address;
String? photo;
UserData({
  this.name,
  this.email,
  this.phone,
  this.uid,
  this.address,
  this.photo
});
UserData.fromJson(Map<String,dynamic>json)
{
name = json['name'];
email = json['email'];
phone = json['phone'];
uid = json['uid'];
address = json['address'];
photo = json['photo'];
}
Map<String,dynamic> toMap()
{
  return {
    'name':name,
    'email':email,
    'phone':phone,
    'uid':uid,
    'address':address,
    'photo':photo
  };
}
}