import 'package:flutter/material.dart';
import '../../core/util/strings_constants.dart';
import '../../core/util/numbers_constants.dart';
import '../../core/util/text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.nameCharacter,
    required this.imageCharacter,
  });

  final String nameCharacter;
  final String imageCharacter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.blueGrey,
            width: NumbersConstants.borderCharacterCard),
        borderRadius: BorderRadius.circular(
          NumbersConstants.borderRadiusCharacterCard,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          NumbersConstants.paddingImage,
        ),
        child: Column(
          children: [
            Text(
              nameCharacter,
              style: TextStyles.styleCharacterName,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: NumbersConstants.sizeBoxGrid),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(NumbersConstants.radius),
                ),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                    StringsConstants.localDefaultImage,
                    width: NumbersConstants.sizeFadeInImage,
                    height: NumbersConstants.sizeFadeInImage,
                  ),
                  imageUrl: imageCharacter,
                  errorWidget: (context, url, error) => Image.asset(
                    StringsConstants.localDefaultImage,
                    width: NumbersConstants.sizeFadeInImage,
                    height: NumbersConstants.sizeFadeInImage,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
