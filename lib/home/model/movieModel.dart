class movieModel {
  int id;
  String title;
  String plotSummary;
  //String posterpath;
 
  movieModel({required this.id, 
              required this.title, 
              required this.plotSummary
           //   ,required this.posterpath
              });
 
  factory movieModel.fromJson(Map<String, dynamic> json) {
    return movieModel(
        id: json['id'] as int,
        title: json['title'] as String,
        plotSummary: json['overview'] as String,        
       // posterpath: json['posterpath'] as String,
        );
  }
}