import 'package:flutter/material.dart';
import '../../core/bloc/bloc_interface.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/numbers_constants.dart';
import '../../data/model/general_character.dart';

class CharacterGrid extends StatefulWidget {
  CharacterGrid({
    required this.characterData,
    required this.characterBloc,
  });

  final GeneralCharacter characterData;
  final BlocInterface characterBloc;

  @override
  _CharacterGridState createState() => _CharacterGridState(
      characterData: characterData, characterBloc: characterBloc);
}

class _CharacterGridState extends State<CharacterGrid> {
  _CharacterGridState({
    required this.characterData,
    required this.characterBloc,
  });

  final GeneralCharacter characterData;
  final BlocInterface characterBloc;
  int _pageNumber = NumbersConstants.firstPage;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: characterData.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: NumbersConstants.crossAxisCountNumber,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index >=
            characterData.results.length - NumbersConstants.constantLimit) {
          _pageNumber++;
          characterBloc.fetchAllCharacters(_pageNumber);
        }
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(
              NumbersConstants.paddingImage,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(NumbersConstants.radius),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: StringsConstants.imageDefaultLocal,
                image: characterData.results[index].image,
              ),
            ),
          ),
        );
      },
    );
  }
}
