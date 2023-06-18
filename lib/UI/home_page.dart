import 'package:flutter/material.dart';
import 'package:round2/API/callbyname.dart';
import 'package:round2/API/callbyid.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePage();
}



class _HomePage extends State<HomePage> {

  List<dynamic>? MovieData = [];
  List<dynamic>? DesiredMovieData = [];
  String? id = '';

  void fetchMovieData(BuildContext context, [bool mounted = true]) async {
    showDialog(

        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Getting Movies....')
                ],
              ),
            ),
          );
        });


    await getMovie(_TextController.text);


    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> getMovie(movie) async {
    MovieData = await MovieListAPI.call(movie);
    setState(() {

    });
  }

  void fetchGivenMovie(BuildContext context, [bool mounted = true]) async {
    showDialog(

        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Getting Movie Data...')
                ],
              ),
            ),
          );
        });


    await getDesiredMovie(id);


    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> getDesiredMovie(id) async {
    DesiredMovieData = await MovieIDAPI.call(id);
    setState(() {

    });
  }


  TextEditingController _TextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: Center(

        child: Column(
          children: [
            Container(

              margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
              color: Colors.white,

              child: TextField(
                controller: _TextController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x26a36c00),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search for movie name...',
                  hintStyle: TextStyle(color: Colors.black26),

                ),
              ),
            ),
            const SizedBox(height: 30),

            Container(
              child: ElevatedButton(
                  onPressed: () {
                    print(_TextController.text);
                    fetchMovieData(context);
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      fixedSize: Size(250, 36),
                      elevation: 22,
                      shadowColor: Colors.lightBlueAccent,
                      side: BorderSide(color: Colors.blue),
                      shape: StadiumBorder())),
            ),


            const SizedBox(height: 30),


            Expanded(
                child: ListView.builder(
                    itemCount: MovieData!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          id=MovieData![index]['imdb_id'];
                          fetchGivenMovie(context);
                          // openDialog();
                        },
                        child: ListTile(
                          title: Text(MovieData![index]['title']),
                          subtitle: Text(MovieData![index]['year'].toString()),
                        ),
                      );
                    })
            )
          ],
        ),

      ),
    );
  }

  void openDialog() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text(DesiredMovieData![0]['title']),


      );
    });
  }

}


