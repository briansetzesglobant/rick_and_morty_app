import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/util/text_styles.dart';
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
          if (widget.characterData.info.next != null) {
            widget.characterBloc
                .fetchAllNextPage(widget.characterData.info.next);
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.greenAccent,
              color: Colors.teal,
            ),
          );
        } else {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(
                NumbersConstants.paddingImage,
              ),
              child: Column(
                children: [
                  Text(
                    widget.characterData.results[index].name,
                    style: TextStyles.styleCharacterName,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: NumbersConstants.sizeBoxGrid),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(NumbersConstants.radius),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: StringsConstants.imageDefaultLocal,
                        image: widget.characterData.results[index].image,
                        width: NumbersConstants.sizeFadeInImage,
                        height: NumbersConstants.sizeFadeInImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
