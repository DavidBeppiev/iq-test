class TestsModel {
  List<Data>? data;

  TestsModel({this.data});

  TestsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  List<Questions>? questions;

  Data({this.id, this.name, this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  String? question;
  Explanation? explanation;
  String? answer;
  String? userAnswer;

  Questions({this.id, this.question, this.explanation, this.answer, this.userAnswer});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    explanation = json['explanation'] != null
        ? new Explanation.fromJson(json['explanation'])
        : null;
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.explanation != null) {
      data['explanation'] = this.explanation!.toJson();
    }
    data['answer'] = this.answer;
    return data;
  }
}

class Explanation {
  List<String>? explanationText;
  String? imagePath;

  Explanation({this.explanationText, this.imagePath});

  Explanation.fromJson(Map<String, dynamic> json) {
    explanationText = json['explanation_text'].cast<String>();
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['explanation_text'] = this.explanationText;
    data['image_path'] = this.imagePath;
    return data;
  }
}