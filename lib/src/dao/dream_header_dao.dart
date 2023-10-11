import 'package:dreams_dictionary/src/common/base_dao.dart';
import 'package:dreams_dictionary/src/models/dream_header.dart';
import 'package:floor/floor.dart';

@dao
abstract class DreamHeaderDao extends BaseDao<DreamHeader> {
  @Query('SELECT * FROM DreamHeader WHERE id = :id')
  Stream<DreamHeader?> findDreamHeaderByIdAsStream(int id);

  @Query('SELECT * FROM DreamHeader')
  Stream<List<DreamHeader>> findAllDreamHeaderAsStream();

  @Query('SELECT * FROM DreamHeader WHERE content LIKE :keyword')
  Future<List<DreamHeader>> findDreamDetailWithHeaderLike(String keyword);

  @Query('SELECT * FROM DreamHeader WHERE title LIKE :keyword')
  Stream<List<DreamHeader>> findDreamDetailWithTitleLikeStream(String keyword);
}
