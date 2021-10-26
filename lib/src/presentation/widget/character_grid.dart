import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/bloc/bloc_interface.dart';
import '../../core/util/numbers_constants.dart';
import '../../data/model/general_character.dart';
import 'character_card.dart';

class CharacterGrid extends StatefulWidget {
  CharacterGrid({
    required this.characterData,
    required this.characterBloc,
  });

  final GeneralCharacter characterData;
  final BlocInterface characterBloc;

  @override
  _CharacterGridState createState() => _CharacterGridState();
}

class _CharacterGridState extends State<CharacterGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount:
          widget.characterData.results.length + NumbersConstants.valueAdded,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: NumbersConstants.crossAxisCountNumber,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index == widget.characterData.results.length) {
          if (widget.characterBloc.nextPageCharacter != null) {
            widget.characterBloc.fetchCharactersNextPage(
                widget.characterBloc.nextPageCharacter!);
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.greenAccent,
              color: Colors.teal,
            ),
          );
        } else {
          return CharacterCard(
            nameCharacter: widget.characterData.results[index].name,
            imageCharacter: widget.characterData.results[index].image,
          );
        }
      },
    );
  }
}
