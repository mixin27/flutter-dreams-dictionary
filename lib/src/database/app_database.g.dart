// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DreamHeaderDao? _dreamHeaderDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DreamHeader` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DreamDetail` (`id` INTEGER NOT NULL, `headerId` INTEGER NOT NULL, `content` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DreamHeaderDao get dreamHeaderDao {
    return _dreamHeaderDaoInstance ??=
        _$DreamHeaderDao(database, changeListener);
  }
}

class _$DreamHeaderDao extends DreamHeaderDao {
  _$DreamHeaderDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _dreamHeaderInsertionAdapter = InsertionAdapter(
            database,
            'DreamHeader',
            (DreamHeader item) =>
                <String, Object?>{'id': item.id, 'title': item.title},
            changeListener),
        _dreamHeaderUpdateAdapter = UpdateAdapter(
            database,
            'DreamHeader',
            ['id'],
            (DreamHeader item) =>
                <String, Object?>{'id': item.id, 'title': item.title},
            changeListener),
        _dreamHeaderDeletionAdapter = DeletionAdapter(
            database,
            'DreamHeader',
            ['id'],
            (DreamHeader item) =>
                <String, Object?>{'id': item.id, 'title': item.title},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DreamHeader> _dreamHeaderInsertionAdapter;

  final UpdateAdapter<DreamHeader> _dreamHeaderUpdateAdapter;

  final DeletionAdapter<DreamHeader> _dreamHeaderDeletionAdapter;

  @override
  Stream<DreamHeader?> findDreamHeaderByIdAsStream(int id) {
    return _queryAdapter.queryStream('SELECT * FROM DreamHeader WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            DreamHeader(id: row['id'] as int, title: row['title'] as String),
        arguments: [id],
        queryableName: 'DreamHeader',
        isView: false);
  }

  @override
  Stream<List<DreamHeader>> findAllDreamHeaderAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM DreamHeader',
        mapper: (Map<String, Object?> row) =>
            DreamHeader(id: row['id'] as int, title: row['title'] as String),
        queryableName: 'DreamHeader',
        isView: false);
  }

  @override
  Future<List<DreamHeader>> findDreamDetailWithHeaderLike(
      String keyword) async {
    return _queryAdapter.queryList(
        'SELECT * FROM DreamHeader WHERE content LIKE ?1',
        mapper: (Map<String, Object?> row) =>
            DreamHeader(id: row['id'] as int, title: row['title'] as String),
        arguments: [keyword]);
  }

  @override
  Stream<List<DreamHeader>> findDreamDetailWithTitleLikeStream(String keyword) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM DreamHeader WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) =>
            DreamHeader(id: row['id'] as int, title: row['title'] as String),
        arguments: [keyword],
        queryableName: 'DreamHeader',
        isView: false);
  }

  @override
  Future<void> insertItem(DreamHeader item) async {
    await _dreamHeaderInsertionAdapter.insert(item, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertAll(List<DreamHeader> items) {
    return _dreamHeaderInsertionAdapter.insertListAndReturnIds(
        items, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateItem(DreamHeader item) async {
    await _dreamHeaderUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateAll(List<DreamHeader> item) {
    return _dreamHeaderUpdateAdapter.updateListAndReturnChangedRows(
        item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItem(DreamHeader item) async {
    await _dreamHeaderDeletionAdapter.delete(item);
  }

  @override
  Future<int> deleteAll(List<DreamHeader> items) {
    return _dreamHeaderDeletionAdapter.deleteListAndReturnChangedRows(items);
  }

  @override
  Future<void> replaceItems(List<DreamHeader> items) async {
    if (database is sqflite.Transaction) {
      await super.replaceItems(items);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.dreamHeaderDao.replaceItems(items);
      });
    }
  }
}
