import 'package:marvel_max/bean/character_data_entity.dart';
import 'package:marvel_max/bean/character_entity.dart';
import 'package:marvel_max/bean/comic_data_entity.dart';
import 'package:marvel_max/bean/comic_entity.dart';
import 'package:marvel_max/bean/creator_data_entity.dart';
import 'package:marvel_max/bean/creator_entity.dart';
import 'package:marvel_max/bean/detail_character_event_entity.dart';
import 'package:marvel_max/bean/detail_comic_character_entity.dart';
import 'package:marvel_max/bean/detail_comic_series_entity.dart';
import 'package:marvel_max/bean/detail_event_character_entity.dart';
import 'package:marvel_max/bean/detail_event_comic_entity.dart';
import 'package:marvel_max/bean/detail_event_series_entity.dart';
import 'package:marvel_max/bean/detail_series_character_entity.dart';
import 'package:marvel_max/bean/detail_series_comic_entity.dart';
import 'package:marvel_max/bean/event_data_entity.dart';
import 'package:marvel_max/bean/event_entity.dart';
import 'package:marvel_max/bean/series_data_entity.dart';
import 'package:marvel_max/bean/series_entity.dart';
import 'package:marvel_max/bean/stories_data_entity.dart';
import 'package:marvel_max/bean/stories_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CharacterDataEntity") {
      return CharacterDataEntity.fromJson(json) as T;
    } else if (T.toString() == "CharacterEntity") {
      return CharacterEntity.fromJson(json) as T;
    } else if (T.toString() == "ComicDataEntity") {
      return ComicDataEntity.fromJson(json) as T;
    } else if (T.toString() == "ComicEntity") {
      return ComicEntity.fromJson(json) as T;
    } else if (T.toString() == "CreatorDataEntity") {
      return CreatorDataEntity.fromJson(json) as T;
    } else if (T.toString() == "CreatorEntity") {
      return CreatorEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailCharacterEventEntity") {
      return DetailCharacterEventEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailComicCharacterEntity") {
      return DetailComicCharacterEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailComicSeriesEntity") {
      return DetailComicSeriesEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailEventCharacterEntity") {
      return DetailEventCharacterEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailEventComicEntity") {
      return DetailEventComicEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailEventSeriesEntity") {
      return DetailEventSeriesEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailSeriesCharacterEntity") {
      return DetailSeriesCharacterEntity.fromJson(json) as T;
    } else if (T.toString() == "DetailSeriesComicEntity") {
      return DetailSeriesComicEntity.fromJson(json) as T;
    } else if (T.toString() == "EventDataEntity") {
      return EventDataEntity.fromJson(json) as T;
    } else if (T.toString() == "EventEntity") {
      return EventEntity.fromJson(json) as T;
    } else if (T.toString() == "SeriesDataEntity") {
      return SeriesDataEntity.fromJson(json) as T;
    } else if (T.toString() == "SeriesEntity") {
      return SeriesEntity.fromJson(json) as T;
    } else if (T.toString() == "StoriesDataEntity") {
      return StoriesDataEntity.fromJson(json) as T;
    } else if (T.toString() == "StoriesEntity") {
      return StoriesEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}