
class GridData {
    String? iconName;
    String? name;

    GridData({
        this.iconName,
        this.name,
    });

    factory GridData.fromJson(Map<String, dynamic> json) => GridData(
        iconName: json["iconName"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "iconName": iconName,
        "name": name,
    };
}
