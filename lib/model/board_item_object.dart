class BoardItemObject {
  String id;
  String name;
  String phone;
  String course;
  String city;


  BoardItemObject({
    this.id,
    this.name,
    this.phone,
    this.course,
    this.city
  }) {
    if (this.id == null) {
      this.id = "";
    }
    if (this.name == null) {
      this.name = "";
    }
    if (this.phone == null) {
      this.phone = "";
    }
    if (this.course == null) {
      this.course = "";
    }
    if (this.city == null) {
      this.city = "";
    }
  }
}
