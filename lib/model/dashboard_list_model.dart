class DashboardList {
  String? imagePath;
  String? title;

  DashboardList({this.imagePath, this.title});

  DashboardList.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['title'] = title;
    return data;
  }
}