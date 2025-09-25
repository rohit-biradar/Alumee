import '../database.dart';

class OpportunitiesTable extends SupabaseTable<OpportunitiesRow> {
  @override
  String get tableName => 'opportunities';

  @override
  OpportunitiesRow createRow(Map<String, dynamic> data) =>
      OpportunitiesRow(data);
}

class OpportunitiesRow extends SupabaseDataRow {
  OpportunitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OpportunitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get company => getField<String>('company');
  set company(String? value) => setField<String>('company', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
