class Repo{
  final String name;
  final String full_name;
  final String description;

  Repo(this.name,this.full_name,this.description);

  Repo.fromJson(Map<String,dynamic> json)
      :full_name = json['full_name'],
        description = json['description'],
        name = json['name'];

  Map<String,dynamic> toJson() => <String,dynamic>{
    'name':name,
    'full_name':full_name,
    'description':description
  };
}