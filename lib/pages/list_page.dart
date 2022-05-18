import 'package:flutter/material.dart';
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
  TextEditingController movieRatingController = TextEditingController();
  FocusNode movieNameFocus = FocusNode();
  FocusNode movieRatingFocus = FocusNode();

  List<MovieModel> movieList = [
    MovieModel(movieName: 'A Paixão de Cristo', movieRating: '5')
  ];

  addNewTransaction(
      {required String? movieName, required String? movieRating}) {
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
      pageTile: 'Filmes',
      body: SingleChildScrollView(
        child: Column(
          children: [
            IsabelaTextForm(
              focusNode: movieNameFocus,
              userInputController: movieNameController,
              label: 'Nome do Filme',
              onEditingComplete: () {
                movieRatingFocus.nextFocus();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            IsabelaTextForm(
              focusNode: movieRatingFocus,
              userInputController: movieRatingController,
              label: 'Avaliação do filme',
            ),
            const SizedBox(
              height: 5,
            ),
            IsabelaButton(
                buttonText: 'Adicionar novo filme',
                onPressed: () {
                  addNewTransaction(
                      movieName: movieNameController.text,
                      movieRating: movieRatingController.text);
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
                      rightText: 'R\$ ${movieItem.movieRating}',
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
