import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:isabela_3sit/components/isabela_button.dart';
import 'package:isabela_3sit/components/isabela_card.dart';
import 'package:isabela_3sit/components/isabela_page.dart';
import 'package:isabela_3sit/model/movie_model.dart';
import 'package:isabela_3sit/components/isabela_textform.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  TextEditingController movieNameController = TextEditingController();
  FocusNode movieNameFocus = FocusNode();

  List<MovieModel> movieList = [
    MovieModel(
        movieName: 'POC - Programação Orientada à Cebola', movieRating: '5'),
    MovieModel(movieName: 'A lista de Stateful Widgets', movieRating: '2'),
    MovieModel(
        movieName: 'UP - release na Sexta-feira altas aventuras',
        movieRating: '5'),
  ];

  addNewMovie({required String? movieName, required String? movieRating}) {
    setState(() {
      movieList.insert(
          0,
          MovieModel(
            movieName: movieName,
            movieRating: movieRating,
          ));
    });
  }

  Future<void> _showDialog({String? movieName, String? movieRating}) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(movieName!),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return IsabelaPage(
      pageTile: 'FlutterFlix',
      body: SingleChildScrollView(
        child: Column(
          children: [
            IsabelaTextForm(
              focusNode: movieNameFocus,
              userInputController: movieNameController,
              label: 'Nome do Filme',
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: RatingBar.builder(
                minRating: 1,
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {},
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            IsabelaButton(onPressed: () {
              addNewMovie(
                  movieName: movieNameController.text, movieRating: '5');
            }),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 15,
                );
              },
              shrinkWrap: true,
              itemCount: movieList.length,
              itemBuilder: ((context, index) {
                var movieItem = movieList[index];
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print(movieItem.movieName);
                    },
                    child: IsabelaCard(
                      leftText: movieItem.movieName,
                      rightText: movieItem.movieRating,
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
