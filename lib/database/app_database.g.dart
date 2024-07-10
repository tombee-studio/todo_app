// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DbAccountTableTable extends DbAccountTable
    with TableInfo<$DbAccountTableTable, DbAccountTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbAccountTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _purposeMeta =
      const VerificationMeta('purpose');
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
      'purpose', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, purpose];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_account_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbAccountTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta));
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbAccountTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbAccountTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      purpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purpose'])!,
    );
  }

  @override
  $DbAccountTableTable createAlias(String alias) {
    return $DbAccountTableTable(attachedDatabase, alias);
  }
}

class DbAccountTableData extends DataClass
    implements Insertable<DbAccountTableData> {
  final int id;
  final String name;
  final String purpose;
  const DbAccountTableData(
      {required this.id, required this.name, required this.purpose});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['purpose'] = Variable<String>(purpose);
    return map;
  }

  DbAccountTableCompanion toCompanion(bool nullToAbsent) {
    return DbAccountTableCompanion(
      id: Value(id),
      name: Value(name),
      purpose: Value(purpose),
    );
  }

  factory DbAccountTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbAccountTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      purpose: serializer.fromJson<String>(json['purpose']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'purpose': serializer.toJson<String>(purpose),
    };
  }

  DbAccountTableData copyWith({int? id, String? name, String? purpose}) =>
      DbAccountTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        purpose: purpose ?? this.purpose,
      );
  @override
  String toString() {
    return (StringBuffer('DbAccountTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('purpose: $purpose')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, purpose);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbAccountTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.purpose == this.purpose);
}

class DbAccountTableCompanion extends UpdateCompanion<DbAccountTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> purpose;
  const DbAccountTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.purpose = const Value.absent(),
  });
  DbAccountTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String purpose,
  })  : name = Value(name),
        purpose = Value(purpose);
  static Insertable<DbAccountTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? purpose,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (purpose != null) 'purpose': purpose,
    });
  }

  DbAccountTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? purpose}) {
    return DbAccountTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      purpose: purpose ?? this.purpose,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbAccountTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('purpose: $purpose')
          ..write(')'))
        .toString();
  }
}

class $DbTaskTableTable extends DbTaskTable
    with TableInfo<$DbTaskTableTable, DbTaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbTaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
      'account', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _projectMeta =
      const VerificationMeta('project');
  @override
  late final GeneratedColumn<int> project = GeneratedColumn<int>(
      'project', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        account,
        name,
        description,
        project,
        createdAt,
        deadline,
        completedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_task_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbTaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('project')) {
      context.handle(_projectMeta,
          project.isAcceptableOrUnknown(data['project']!, _projectMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbTaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbTaskTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      project: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
    );
  }

  @override
  $DbTaskTableTable createAlias(String alias) {
    return $DbTaskTableTable(attachedDatabase, alias);
  }
}

class DbTaskTableData extends DataClass implements Insertable<DbTaskTableData> {
  final int id;
  final int account;
  final String name;
  final String description;
  final int? project;
  final DateTime createdAt;
  final DateTime deadline;
  final DateTime? completedAt;
  const DbTaskTableData(
      {required this.id,
      required this.account,
      required this.name,
      required this.description,
      this.project,
      required this.createdAt,
      required this.deadline,
      this.completedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account'] = Variable<int>(account);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || project != null) {
      map['project'] = Variable<int>(project);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['deadline'] = Variable<DateTime>(deadline);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  DbTaskTableCompanion toCompanion(bool nullToAbsent) {
    return DbTaskTableCompanion(
      id: Value(id),
      account: Value(account),
      name: Value(name),
      description: Value(description),
      project: project == null && nullToAbsent
          ? const Value.absent()
          : Value(project),
      createdAt: Value(createdAt),
      deadline: Value(deadline),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory DbTaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbTaskTableData(
      id: serializer.fromJson<int>(json['id']),
      account: serializer.fromJson<int>(json['account']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      project: serializer.fromJson<int?>(json['project']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'account': serializer.toJson<int>(account),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'project': serializer.toJson<int?>(project),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'deadline': serializer.toJson<DateTime>(deadline),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  DbTaskTableData copyWith(
          {int? id,
          int? account,
          String? name,
          String? description,
          Value<int?> project = const Value.absent(),
          DateTime? createdAt,
          DateTime? deadline,
          Value<DateTime?> completedAt = const Value.absent()}) =>
      DbTaskTableData(
        id: id ?? this.id,
        account: account ?? this.account,
        name: name ?? this.name,
        description: description ?? this.description,
        project: project.present ? project.value : this.project,
        createdAt: createdAt ?? this.createdAt,
        deadline: deadline ?? this.deadline,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbTaskTableData(')
          ..write('id: $id, ')
          ..write('account: $account, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('project: $project, ')
          ..write('createdAt: $createdAt, ')
          ..write('deadline: $deadline, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, account, name, description, project,
      createdAt, deadline, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbTaskTableData &&
          other.id == this.id &&
          other.account == this.account &&
          other.name == this.name &&
          other.description == this.description &&
          other.project == this.project &&
          other.createdAt == this.createdAt &&
          other.deadline == this.deadline &&
          other.completedAt == this.completedAt);
}

class DbTaskTableCompanion extends UpdateCompanion<DbTaskTableData> {
  final Value<int> id;
  final Value<int> account;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> project;
  final Value<DateTime> createdAt;
  final Value<DateTime> deadline;
  final Value<DateTime?> completedAt;
  const DbTaskTableCompanion({
    this.id = const Value.absent(),
    this.account = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.project = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deadline = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  DbTaskTableCompanion.insert({
    this.id = const Value.absent(),
    required int account,
    required String name,
    required String description,
    this.project = const Value.absent(),
    required DateTime createdAt,
    required DateTime deadline,
    this.completedAt = const Value.absent(),
  })  : account = Value(account),
        name = Value(name),
        description = Value(description),
        createdAt = Value(createdAt),
        deadline = Value(deadline);
  static Insertable<DbTaskTableData> custom({
    Expression<int>? id,
    Expression<int>? account,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? project,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? deadline,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (account != null) 'account': account,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (project != null) 'project': project,
      if (createdAt != null) 'created_at': createdAt,
      if (deadline != null) 'deadline': deadline,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  DbTaskTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? account,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? project,
      Value<DateTime>? createdAt,
      Value<DateTime>? deadline,
      Value<DateTime?>? completedAt}) {
    return DbTaskTableCompanion(
      id: id ?? this.id,
      account: account ?? this.account,
      name: name ?? this.name,
      description: description ?? this.description,
      project: project ?? this.project,
      createdAt: createdAt ?? this.createdAt,
      deadline: deadline ?? this.deadline,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (project.present) {
      map['project'] = Variable<int>(project.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbTaskTableCompanion(')
          ..write('id: $id, ')
          ..write('account: $account, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('project: $project, ')
          ..write('createdAt: $createdAt, ')
          ..write('deadline: $deadline, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $DbProjectTableTable extends DbProjectTable
    with TableInfo<$DbProjectTableTable, DbProjectTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbProjectTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
      'account', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentMeta = const VerificationMeta('parent');
  @override
  late final GeneratedColumn<int> parent = GeneratedColumn<int>(
      'parent', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deadlineMeta =
      const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, account, name, parent, createdAt, deadline, completedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_project_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbProjectTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent')) {
      context.handle(_parentMeta,
          parent.isAcceptableOrUnknown(data['parent']!, _parentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    } else if (isInserting) {
      context.missing(_deadlineMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbProjectTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProjectTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      deadline: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline'])!,
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
    );
  }

  @override
  $DbProjectTableTable createAlias(String alias) {
    return $DbProjectTableTable(attachedDatabase, alias);
  }
}

class DbProjectTableData extends DataClass
    implements Insertable<DbProjectTableData> {
  final int id;
  final int account;
  final String name;
  final int? parent;
  final DateTime createdAt;
  final DateTime deadline;
  final DateTime? completedAt;
  const DbProjectTableData(
      {required this.id,
      required this.account,
      required this.name,
      this.parent,
      required this.createdAt,
      required this.deadline,
      this.completedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account'] = Variable<int>(account);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || parent != null) {
      map['parent'] = Variable<int>(parent);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['deadline'] = Variable<DateTime>(deadline);
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    return map;
  }

  DbProjectTableCompanion toCompanion(bool nullToAbsent) {
    return DbProjectTableCompanion(
      id: Value(id),
      account: Value(account),
      name: Value(name),
      parent:
          parent == null && nullToAbsent ? const Value.absent() : Value(parent),
      createdAt: Value(createdAt),
      deadline: Value(deadline),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
    );
  }

  factory DbProjectTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProjectTableData(
      id: serializer.fromJson<int>(json['id']),
      account: serializer.fromJson<int>(json['account']),
      name: serializer.fromJson<String>(json['name']),
      parent: serializer.fromJson<int?>(json['parent']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      deadline: serializer.fromJson<DateTime>(json['deadline']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'account': serializer.toJson<int>(account),
      'name': serializer.toJson<String>(name),
      'parent': serializer.toJson<int?>(parent),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'deadline': serializer.toJson<DateTime>(deadline),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
    };
  }

  DbProjectTableData copyWith(
          {int? id,
          int? account,
          String? name,
          Value<int?> parent = const Value.absent(),
          DateTime? createdAt,
          DateTime? deadline,
          Value<DateTime?> completedAt = const Value.absent()}) =>
      DbProjectTableData(
        id: id ?? this.id,
        account: account ?? this.account,
        name: name ?? this.name,
        parent: parent.present ? parent.value : this.parent,
        createdAt: createdAt ?? this.createdAt,
        deadline: deadline ?? this.deadline,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbProjectTableData(')
          ..write('id: $id, ')
          ..write('account: $account, ')
          ..write('name: $name, ')
          ..write('parent: $parent, ')
          ..write('createdAt: $createdAt, ')
          ..write('deadline: $deadline, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, account, name, parent, createdAt, deadline, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProjectTableData &&
          other.id == this.id &&
          other.account == this.account &&
          other.name == this.name &&
          other.parent == this.parent &&
          other.createdAt == this.createdAt &&
          other.deadline == this.deadline &&
          other.completedAt == this.completedAt);
}

class DbProjectTableCompanion extends UpdateCompanion<DbProjectTableData> {
  final Value<int> id;
  final Value<int> account;
  final Value<String> name;
  final Value<int?> parent;
  final Value<DateTime> createdAt;
  final Value<DateTime> deadline;
  final Value<DateTime?> completedAt;
  const DbProjectTableCompanion({
    this.id = const Value.absent(),
    this.account = const Value.absent(),
    this.name = const Value.absent(),
    this.parent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deadline = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  DbProjectTableCompanion.insert({
    this.id = const Value.absent(),
    required int account,
    required String name,
    this.parent = const Value.absent(),
    required DateTime createdAt,
    required DateTime deadline,
    this.completedAt = const Value.absent(),
  })  : account = Value(account),
        name = Value(name),
        createdAt = Value(createdAt),
        deadline = Value(deadline);
  static Insertable<DbProjectTableData> custom({
    Expression<int>? id,
    Expression<int>? account,
    Expression<String>? name,
    Expression<int>? parent,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? deadline,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (account != null) 'account': account,
      if (name != null) 'name': name,
      if (parent != null) 'parent': parent,
      if (createdAt != null) 'created_at': createdAt,
      if (deadline != null) 'deadline': deadline,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  DbProjectTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? account,
      Value<String>? name,
      Value<int?>? parent,
      Value<DateTime>? createdAt,
      Value<DateTime>? deadline,
      Value<DateTime?>? completedAt}) {
    return DbProjectTableCompanion(
      id: id ?? this.id,
      account: account ?? this.account,
      name: name ?? this.name,
      parent: parent ?? this.parent,
      createdAt: createdAt ?? this.createdAt,
      deadline: deadline ?? this.deadline,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parent.present) {
      map['parent'] = Variable<int>(parent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbProjectTableCompanion(')
          ..write('id: $id, ')
          ..write('account: $account, ')
          ..write('name: $name, ')
          ..write('parent: $parent, ')
          ..write('createdAt: $createdAt, ')
          ..write('deadline: $deadline, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $DbAccountTableTable dbAccountTable = $DbAccountTableTable(this);
  late final $DbTaskTableTable dbTaskTable = $DbTaskTableTable(this);
  late final $DbProjectTableTable dbProjectTable = $DbProjectTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbAccountTable, dbTaskTable, dbProjectTable];
}

typedef $$DbAccountTableTableInsertCompanionBuilder = DbAccountTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String purpose,
});
typedef $$DbAccountTableTableUpdateCompanionBuilder = DbAccountTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> purpose,
});

class $$DbAccountTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DbAccountTableTable,
    DbAccountTableData,
    $$DbAccountTableTableFilterComposer,
    $$DbAccountTableTableOrderingComposer,
    $$DbAccountTableTableProcessedTableManager,
    $$DbAccountTableTableInsertCompanionBuilder,
    $$DbAccountTableTableUpdateCompanionBuilder> {
  $$DbAccountTableTableTableManager(
      _$AppDatabase db, $DbAccountTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DbAccountTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DbAccountTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DbAccountTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> purpose = const Value.absent(),
          }) =>
              DbAccountTableCompanion(
            id: id,
            name: name,
            purpose: purpose,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String purpose,
          }) =>
              DbAccountTableCompanion.insert(
            id: id,
            name: name,
            purpose: purpose,
          ),
        ));
}

class $$DbAccountTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $DbAccountTableTable,
    DbAccountTableData,
    $$DbAccountTableTableFilterComposer,
    $$DbAccountTableTableOrderingComposer,
    $$DbAccountTableTableProcessedTableManager,
    $$DbAccountTableTableInsertCompanionBuilder,
    $$DbAccountTableTableUpdateCompanionBuilder> {
  $$DbAccountTableTableProcessedTableManager(super.$state);
}

class $$DbAccountTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DbAccountTableTable> {
  $$DbAccountTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get purpose => $state.composableBuilder(
      column: $state.table.purpose,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DbAccountTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DbAccountTableTable> {
  $$DbAccountTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get purpose => $state.composableBuilder(
      column: $state.table.purpose,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DbTaskTableTableInsertCompanionBuilder = DbTaskTableCompanion
    Function({
  Value<int> id,
  required int account,
  required String name,
  required String description,
  Value<int?> project,
  required DateTime createdAt,
  required DateTime deadline,
  Value<DateTime?> completedAt,
});
typedef $$DbTaskTableTableUpdateCompanionBuilder = DbTaskTableCompanion
    Function({
  Value<int> id,
  Value<int> account,
  Value<String> name,
  Value<String> description,
  Value<int?> project,
  Value<DateTime> createdAt,
  Value<DateTime> deadline,
  Value<DateTime?> completedAt,
});

class $$DbTaskTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DbTaskTableTable,
    DbTaskTableData,
    $$DbTaskTableTableFilterComposer,
    $$DbTaskTableTableOrderingComposer,
    $$DbTaskTableTableProcessedTableManager,
    $$DbTaskTableTableInsertCompanionBuilder,
    $$DbTaskTableTableUpdateCompanionBuilder> {
  $$DbTaskTableTableTableManager(_$AppDatabase db, $DbTaskTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DbTaskTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DbTaskTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DbTaskTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> account = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int?> project = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> deadline = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
          }) =>
              DbTaskTableCompanion(
            id: id,
            account: account,
            name: name,
            description: description,
            project: project,
            createdAt: createdAt,
            deadline: deadline,
            completedAt: completedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int account,
            required String name,
            required String description,
            Value<int?> project = const Value.absent(),
            required DateTime createdAt,
            required DateTime deadline,
            Value<DateTime?> completedAt = const Value.absent(),
          }) =>
              DbTaskTableCompanion.insert(
            id: id,
            account: account,
            name: name,
            description: description,
            project: project,
            createdAt: createdAt,
            deadline: deadline,
            completedAt: completedAt,
          ),
        ));
}

class $$DbTaskTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $DbTaskTableTable,
    DbTaskTableData,
    $$DbTaskTableTableFilterComposer,
    $$DbTaskTableTableOrderingComposer,
    $$DbTaskTableTableProcessedTableManager,
    $$DbTaskTableTableInsertCompanionBuilder,
    $$DbTaskTableTableUpdateCompanionBuilder> {
  $$DbTaskTableTableProcessedTableManager(super.$state);
}

class $$DbTaskTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DbTaskTableTable> {
  $$DbTaskTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get account => $state.composableBuilder(
      column: $state.table.account,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get project => $state.composableBuilder(
      column: $state.table.project,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DbTaskTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DbTaskTableTable> {
  $$DbTaskTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get account => $state.composableBuilder(
      column: $state.table.account,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get project => $state.composableBuilder(
      column: $state.table.project,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DbProjectTableTableInsertCompanionBuilder = DbProjectTableCompanion
    Function({
  Value<int> id,
  required int account,
  required String name,
  Value<int?> parent,
  required DateTime createdAt,
  required DateTime deadline,
  Value<DateTime?> completedAt,
});
typedef $$DbProjectTableTableUpdateCompanionBuilder = DbProjectTableCompanion
    Function({
  Value<int> id,
  Value<int> account,
  Value<String> name,
  Value<int?> parent,
  Value<DateTime> createdAt,
  Value<DateTime> deadline,
  Value<DateTime?> completedAt,
});

class $$DbProjectTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DbProjectTableTable,
    DbProjectTableData,
    $$DbProjectTableTableFilterComposer,
    $$DbProjectTableTableOrderingComposer,
    $$DbProjectTableTableProcessedTableManager,
    $$DbProjectTableTableInsertCompanionBuilder,
    $$DbProjectTableTableUpdateCompanionBuilder> {
  $$DbProjectTableTableTableManager(
      _$AppDatabase db, $DbProjectTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DbProjectTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DbProjectTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$DbProjectTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> account = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> parent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> deadline = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
          }) =>
              DbProjectTableCompanion(
            id: id,
            account: account,
            name: name,
            parent: parent,
            createdAt: createdAt,
            deadline: deadline,
            completedAt: completedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int account,
            required String name,
            Value<int?> parent = const Value.absent(),
            required DateTime createdAt,
            required DateTime deadline,
            Value<DateTime?> completedAt = const Value.absent(),
          }) =>
              DbProjectTableCompanion.insert(
            id: id,
            account: account,
            name: name,
            parent: parent,
            createdAt: createdAt,
            deadline: deadline,
            completedAt: completedAt,
          ),
        ));
}

class $$DbProjectTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $DbProjectTableTable,
    DbProjectTableData,
    $$DbProjectTableTableFilterComposer,
    $$DbProjectTableTableOrderingComposer,
    $$DbProjectTableTableProcessedTableManager,
    $$DbProjectTableTableInsertCompanionBuilder,
    $$DbProjectTableTableUpdateCompanionBuilder> {
  $$DbProjectTableTableProcessedTableManager(super.$state);
}

class $$DbProjectTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DbProjectTableTable> {
  $$DbProjectTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get account => $state.composableBuilder(
      column: $state.table.account,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get parent => $state.composableBuilder(
      column: $state.table.parent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DbProjectTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DbProjectTableTable> {
  $$DbProjectTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get account => $state.composableBuilder(
      column: $state.table.account,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get parent => $state.composableBuilder(
      column: $state.table.parent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deadline => $state.composableBuilder(
      column: $state.table.deadline,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get completedAt => $state.composableBuilder(
      column: $state.table.completedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$DbAccountTableTableTableManager get dbAccountTable =>
      $$DbAccountTableTableTableManager(_db, _db.dbAccountTable);
  $$DbTaskTableTableTableManager get dbTaskTable =>
      $$DbTaskTableTableTableManager(_db, _db.dbTaskTable);
  $$DbProjectTableTableTableManager get dbProjectTable =>
      $$DbProjectTableTableTableManager(_db, _db.dbProjectTable);
}
