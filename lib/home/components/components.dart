import 'package:flutter/material.dart';
import 'package:whatwatch/constants.dart';


class ComComp {

static GestureDetector internetErrorText(VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Center(
        child: Text(MESSAGES.INTERNET_ERROR),
      ),
    );
  }

static Padding text(String text, FontWeight fontWeight, double fontSize,
      List padding, Color color, TextOverflow overflow) {
    return Padding(
      padding: new EdgeInsets.only(
          left: padding[0],
          right: padding[1],
          top: padding[2],
          bottom: padding[3]),
      child: Text(
        text,
        textAlign: TextAlign.left,
        overflow: overflow,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );
  }

/*
static Padding homeGrid(
      AsyncSnapshot<List<movieModel>> snapshot, ) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 30.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: snapshot.data?.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: listFilms(snapshot.data![index]),
           // onTap: (), // => gridClicked(context, snapshot.data![index]),
          );
        },
      ),
    );
  }
*/
   static CircularProgressIndicator circularProgress() {
    return CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(COLORS.APP_THEME_COLOR),
    );
  }

    static TextButton retryButton(Function fetch) {
    return TextButton(
      child: Text(
        MESSAGES.INTERNET_ERROR_RETRY,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
      onPressed: () => fetch(),
    );
  }


/*
  Future<List<movieModel>> getData(http.Client client) async {
    String link =
          "https://api.themoviedb.org/3/movie/273895?api_key=aee625b964853feedc62a5fa19de554f&language=fr-FR";
  List<movieModel> list;

   final res = await client
      .get(Uri.parse('https://api.themoviedb.org/3/movie/273895?api_key=aee625b964853feedc62a5fa19de554f&language=fr-FR'));
    
  
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
       // var rest = data["movieModel"] as List;
        print(data);        
      }

      list = jsonDecode(res.body).castList<movieModel>();
      return list;
  }
  */

}