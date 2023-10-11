import 'package:floor/floor.dart';

abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertItem(T item);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertAll(List<T> items);

  @update
  Future<void> updateItem(T item);

  @update
  Future<int> updateAll(List<T> item);

  @delete
  Future<void> deleteItem(T item);

  @delete
  Future<int> deleteAll(List<T> items);

  @transaction
  Future<void> replaceItems(List<T> items) async {
    await deleteAll(items);
    await insertAll(items);
  }
}
