import 'package:flutter/material.dart';
import '../../core/util/colors_constants.dart';
import '../../data/model/general_character.dart';
import '../widget/character_grid.dart';
import '../../core/bloc/bloc_interface.dart';
import '../bloc/character_bloc.dart';

class CharacterPage extends StatefulWidget {
  CharacterPage({
    required this.title,
  });

  final String title;

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final BlocInterface _characterBloc = CharacterBloc();

  @override
  void initState() {
    super.initState();
    _characterBloc.initialize();
    _characterBloc.fetchFirstCharacters();
  }

  @override
  void dispose() {
    _characterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<GeneralCharacter?>(
          stream: _characterBloc.characterStream,
          builder: (
            context,
            AsyncSnapshot<GeneralCharacter?> snapshot,
          ) {
            return snapshot.hasData
                ? CharacterGrid(
                    characterData: snapshot.data!,
                    characterBloc: _characterBloc,
                  )
                : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.greenAccent,
                      color: Colors.teal,
                    ),
                  );
          }),
      backgroundColor: ColorsConstants.style,
    );
  }
}
