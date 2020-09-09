import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/shared/models/character.dart';
import 'package:marvel_app/app/shared/models/thumbnail.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final Function(Character character) onTap;

  const CharacterTile({Key key, this.character, this.onTap})
      : assert(character != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(character),
      leading: _avatarImage(),
      title: _title(),
      subtitle: _subtitle(),
    );
  }

  Widget _avatarImage() {
    Thumbnail thumb = character.thumbnail;
    return Hero(
      tag: "${character.id}",
      child: CircleAvatar(
        backgroundImage: NetworkImage("${thumb.path}.${thumb.extension}"),
      ),
    );
  }

  Widget _title() {
    return Text(character.name);
  }

  Widget _subtitle() {
    return Text(
      character.description,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
