// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _motivationMeta =
      const VerificationMeta('motivation');
  @override
  late final GeneratedColumn<String> motivation = GeneratedColumn<String>(
      'motivation', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, motivation, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(Insertable<Habit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('motivation')) {
      context.handle(
          _motivationMeta,
          motivation.isAcceptableOrUnknown(
              data['motivation']!, _motivationMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      motivation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}motivation']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }
}

class Habit extends DataClass implements Insertable<Habit> {
  final int id;
  final String title;
  final String? motivation;
  final DateTime createdAt;
  const Habit(
      {required this.id,
      required this.title,
      this.motivation,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || motivation != null) {
      map['motivation'] = Variable<String>(motivation);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      title: Value(title),
      motivation: motivation == null && nullToAbsent
          ? const Value.absent()
          : Value(motivation),
      createdAt: Value(createdAt),
    );
  }

  factory Habit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      motivation: serializer.fromJson<String?>(json['motivation']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'motivation': serializer.toJson<String?>(motivation),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Habit copyWith(
          {int? id,
          String? title,
          Value<String?> motivation = const Value.absent(),
          DateTime? createdAt}) =>
      Habit(
        id: id ?? this.id,
        title: title ?? this.title,
        motivation: motivation.present ? motivation.value : this.motivation,
        createdAt: createdAt ?? this.createdAt,
      );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      motivation:
          data.motivation.present ? data.motivation.value : this.motivation,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('motivation: $motivation, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, motivation, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.title == this.title &&
          other.motivation == this.motivation &&
          other.createdAt == this.createdAt);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> motivation;
  final Value<DateTime> createdAt;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.motivation = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.motivation = const Value.absent(),
    required DateTime createdAt,
  })  : title = Value(title),
        createdAt = Value(createdAt);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? motivation,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (motivation != null) 'motivation': motivation,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HabitsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? motivation,
      Value<DateTime>? createdAt}) {
    return HabitsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      motivation: motivation ?? this.motivation,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (motivation.present) {
      map['motivation'] = Variable<String>(motivation.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('motivation: $motivation, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HabitHistoryEntriesTable extends HabitHistoryEntries
    with TableInfo<$HabitHistoryEntriesTable, HabitHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _habitMeta = const VerificationMeta('habit');
  @override
  late final GeneratedColumn<int> habit = GeneratedColumn<int>(
      'habit', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES habits (id)'));
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, habit, completedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habit_history_entries';
  @override
  VerificationContext validateIntegrity(Insertable<HabitHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit')) {
      context.handle(
          _habitMeta, habit.isAcceptableOrUnknown(data['habit']!, _habitMeta));
    } else if (isInserting) {
      context.missing(_habitMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HabitHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HabitHistoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      habit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}habit'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at'])!,
    );
  }

  @override
  $HabitHistoryEntriesTable createAlias(String alias) {
    return $HabitHistoryEntriesTable(attachedDatabase, alias);
  }
}

class HabitHistoryEntry extends DataClass
    implements Insertable<HabitHistoryEntry> {
  final int id;
  final int habit;
  final DateTime completedAt;
  const HabitHistoryEntry(
      {required this.id, required this.habit, required this.completedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit'] = Variable<int>(habit);
    map['completed_at'] = Variable<DateTime>(completedAt);
    return map;
  }

  HabitHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return HabitHistoryEntriesCompanion(
      id: Value(id),
      habit: Value(habit),
      completedAt: Value(completedAt),
    );
  }

  factory HabitHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HabitHistoryEntry(
      id: serializer.fromJson<int>(json['id']),
      habit: serializer.fromJson<int>(json['habit']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habit': serializer.toJson<int>(habit),
      'completedAt': serializer.toJson<DateTime>(completedAt),
    };
  }

  HabitHistoryEntry copyWith({int? id, int? habit, DateTime? completedAt}) =>
      HabitHistoryEntry(
        id: id ?? this.id,
        habit: habit ?? this.habit,
        completedAt: completedAt ?? this.completedAt,
      );
  HabitHistoryEntry copyWithCompanion(HabitHistoryEntriesCompanion data) {
    return HabitHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      habit: data.habit.present ? data.habit.value : this.habit,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HabitHistoryEntry(')
          ..write('id: $id, ')
          ..write('habit: $habit, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habit, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HabitHistoryEntry &&
          other.id == this.id &&
          other.habit == this.habit &&
          other.completedAt == this.completedAt);
}

class HabitHistoryEntriesCompanion extends UpdateCompanion<HabitHistoryEntry> {
  final Value<int> id;
  final Value<int> habit;
  final Value<DateTime> completedAt;
  const HabitHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.habit = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  HabitHistoryEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int habit,
    required DateTime completedAt,
  })  : habit = Value(habit),
        completedAt = Value(completedAt);
  static Insertable<HabitHistoryEntry> custom({
    Expression<int>? id,
    Expression<int>? habit,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habit != null) 'habit': habit,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  HabitHistoryEntriesCompanion copyWith(
      {Value<int>? id, Value<int>? habit, Value<DateTime>? completedAt}) {
    return HabitHistoryEntriesCompanion(
      id: id ?? this.id,
      habit: habit ?? this.habit,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habit.present) {
      map['habit'] = Variable<int>(habit.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('habit: $habit, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $HabitHistoryEntriesTable habitHistoryEntries =
      $HabitHistoryEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [habits, habitHistoryEntries];
}

typedef $$HabitsTableCreateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> motivation,
  required DateTime createdAt,
});
typedef $$HabitsTableUpdateCompanionBuilder = HabitsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> motivation,
  Value<DateTime> createdAt,
});

final class $$HabitsTableReferences
    extends BaseReferences<_$AppDatabase, $HabitsTable, Habit> {
  $$HabitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HabitHistoryEntriesTable, List<HabitHistoryEntry>>
      _habitHistoryEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.habitHistoryEntries,
              aliasName: $_aliasNameGenerator(
                  db.habits.id, db.habitHistoryEntries.habit));

  $$HabitHistoryEntriesTableProcessedTableManager get habitHistoryEntriesRefs {
    final manager =
        $$HabitHistoryEntriesTableTableManager($_db, $_db.habitHistoryEntries)
            .filter((f) => f.habit.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_habitHistoryEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get motivation => $composableBuilder(
      column: $table.motivation, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> habitHistoryEntriesRefs(
      Expression<bool> Function($$HabitHistoryEntriesTableFilterComposer f) f) {
    final $$HabitHistoryEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.habitHistoryEntries,
        getReferencedColumn: (t) => t.habit,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitHistoryEntriesTableFilterComposer(
              $db: $db,
              $table: $db.habitHistoryEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motivation => $composableBuilder(
      column: $table.motivation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get motivation => $composableBuilder(
      column: $table.motivation, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> habitHistoryEntriesRefs<T extends Object>(
      Expression<T> Function($$HabitHistoryEntriesTableAnnotationComposer a)
          f) {
    final $$HabitHistoryEntriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.habitHistoryEntries,
            getReferencedColumn: (t) => t.habit,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$HabitHistoryEntriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.habitHistoryEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$HabitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, $$HabitsTableReferences),
    Habit,
    PrefetchHooks Function({bool habitHistoryEntriesRefs})> {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> motivation = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              HabitsCompanion(
            id: id,
            title: title,
            motivation: motivation,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> motivation = const Value.absent(),
            required DateTime createdAt,
          }) =>
              HabitsCompanion.insert(
            id: id,
            title: title,
            motivation: motivation,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$HabitsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({habitHistoryEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (habitHistoryEntriesRefs) db.habitHistoryEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (habitHistoryEntriesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$HabitsTableReferences
                            ._habitHistoryEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$HabitsTableReferences(db, table, p0)
                                .habitHistoryEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.habit == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$HabitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitsTable,
    Habit,
    $$HabitsTableFilterComposer,
    $$HabitsTableOrderingComposer,
    $$HabitsTableAnnotationComposer,
    $$HabitsTableCreateCompanionBuilder,
    $$HabitsTableUpdateCompanionBuilder,
    (Habit, $$HabitsTableReferences),
    Habit,
    PrefetchHooks Function({bool habitHistoryEntriesRefs})>;
typedef $$HabitHistoryEntriesTableCreateCompanionBuilder
    = HabitHistoryEntriesCompanion Function({
  Value<int> id,
  required int habit,
  required DateTime completedAt,
});
typedef $$HabitHistoryEntriesTableUpdateCompanionBuilder
    = HabitHistoryEntriesCompanion Function({
  Value<int> id,
  Value<int> habit,
  Value<DateTime> completedAt,
});

final class $$HabitHistoryEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $HabitHistoryEntriesTable, HabitHistoryEntry> {
  $$HabitHistoryEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $HabitsTable _habitTable(_$AppDatabase db) => db.habits.createAlias(
      $_aliasNameGenerator(db.habitHistoryEntries.habit, db.habits.id));

  $$HabitsTableProcessedTableManager? get habit {
    if ($_item.habit == null) return null;
    final manager = $$HabitsTableTableManager($_db, $_db.habits)
        .filter((f) => f.id($_item.habit!));
    final item = $_typedResult.readTableOrNull(_habitTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HabitHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $HabitHistoryEntriesTable> {
  $$HabitHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  $$HabitsTableFilterComposer get habit {
    final $$HabitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habit,
        referencedTable: $db.habits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitsTableFilterComposer(
              $db: $db,
              $table: $db.habits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HabitHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitHistoryEntriesTable> {
  $$HabitHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  $$HabitsTableOrderingComposer get habit {
    final $$HabitsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habit,
        referencedTable: $db.habits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitsTableOrderingComposer(
              $db: $db,
              $table: $db.habits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HabitHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitHistoryEntriesTable> {
  $$HabitHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  $$HabitsTableAnnotationComposer get habit {
    final $$HabitsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.habit,
        referencedTable: $db.habits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HabitsTableAnnotationComposer(
              $db: $db,
              $table: $db.habits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HabitHistoryEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HabitHistoryEntriesTable,
    HabitHistoryEntry,
    $$HabitHistoryEntriesTableFilterComposer,
    $$HabitHistoryEntriesTableOrderingComposer,
    $$HabitHistoryEntriesTableAnnotationComposer,
    $$HabitHistoryEntriesTableCreateCompanionBuilder,
    $$HabitHistoryEntriesTableUpdateCompanionBuilder,
    (HabitHistoryEntry, $$HabitHistoryEntriesTableReferences),
    HabitHistoryEntry,
    PrefetchHooks Function({bool habit})> {
  $$HabitHistoryEntriesTableTableManager(
      _$AppDatabase db, $HabitHistoryEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitHistoryEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitHistoryEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> habit = const Value.absent(),
            Value<DateTime> completedAt = const Value.absent(),
          }) =>
              HabitHistoryEntriesCompanion(
            id: id,
            habit: habit,
            completedAt: completedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int habit,
            required DateTime completedAt,
          }) =>
              HabitHistoryEntriesCompanion.insert(
            id: id,
            habit: habit,
            completedAt: completedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HabitHistoryEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({habit = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (habit) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.habit,
                    referencedTable:
                        $$HabitHistoryEntriesTableReferences._habitTable(db),
                    referencedColumn:
                        $$HabitHistoryEntriesTableReferences._habitTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HabitHistoryEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HabitHistoryEntriesTable,
    HabitHistoryEntry,
    $$HabitHistoryEntriesTableFilterComposer,
    $$HabitHistoryEntriesTableOrderingComposer,
    $$HabitHistoryEntriesTableAnnotationComposer,
    $$HabitHistoryEntriesTableCreateCompanionBuilder,
    $$HabitHistoryEntriesTableUpdateCompanionBuilder,
    (HabitHistoryEntry, $$HabitHistoryEntriesTableReferences),
    HabitHistoryEntry,
    PrefetchHooks Function({bool habit})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$HabitHistoryEntriesTableTableManager get habitHistoryEntries =>
      $$HabitHistoryEntriesTableTableManager(_db, _db.habitHistoryEntries);
}
