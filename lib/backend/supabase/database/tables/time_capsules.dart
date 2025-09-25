import '../database.dart';

class TimeCapsulesTable extends SupabaseTable<TimeCapsulesRow> {
  @override
  String get tableName => 'time_capsules';

  @override
  TimeCapsulesRow createRow(Map<String, dynamic> data) => TimeCapsulesRow(data);
}

class TimeCapsulesRow extends SupabaseDataRow {
  TimeCapsulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TimeCapsulesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  DateTime? get unlockDate => getField<DateTime>('unlock_date');
  set unlockDate(DateTime? value) => setField<DateTime>('unlock_date', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
