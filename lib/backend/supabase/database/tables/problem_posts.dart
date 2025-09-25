import '../database.dart';

class ProblemPostsTable extends SupabaseTable<ProblemPostsRow> {
  @override
  String get tableName => 'problem_posts';

  @override
  ProblemPostsRow createRow(Map<String, dynamic> data) => ProblemPostsRow(data);
}

class ProblemPostsRow extends SupabaseDataRow {
  ProblemPostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProblemPostsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);
}
