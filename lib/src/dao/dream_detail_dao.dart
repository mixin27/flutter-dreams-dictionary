import 'package:dreams_dictionary/src/common/base_dao.dart';
import 'package:dreams_dictionary/src/models/dream_detail.dart';
import 'package:floor/floor.dart';

abstract class DreamDetailDao extends BaseDao<DreamDetail> {
  @Query('SELECT * FROM DreamDetail WHERE id = :id')
  Stream<DreamDetail?> findDreamDetailByIdAsStream(int id);

  @Query('SELECT * FROM DreamDetail')
  Stream<List<DreamDetail>> findAllDreamDetailAsStream();

  @Query('SELECT * FROM DreamDetail WHERE headerId := headerId')
  Stream<List<DreamDetail>> findAllDreamDetailByHeaderId(int headerId);

  @Query('SELECT * FROM DreamDetail WHERE content LIKE :keyword')
  Future<List<DreamDetail>> findDreamDetailWithHeaderLike(String keyword);

  @Query('SELECT * FROM DreamDetail WHERE content LIKE :keyword')
  Stream<List<DreamDetail>> findDreamDetailWithHeaderLikeStream(String keyword);
}
