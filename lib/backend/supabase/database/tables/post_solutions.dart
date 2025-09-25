import '../database.dart';

class PostSolutionsTable extends SupabaseTable<PostSolutionsRow> {
  @override
  String get tableName => 'post_solutions';

  @override
  PostSolutionsRow createRow(Map<String, dynamic> data) =>
      PostSolutionsRow(data);
}

class PostSolutionsRow extends SupabaseDataRow {
  PostSolutionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostSolutionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get postId => getField<int>('post_id');
  set postId(int? value) => setField<int>('post_id', value);

  String? get solvedBy => getField<String>('solved_by');
  set solvedBy(String? value) => setField<String>('solved_by', value);

  String? get solutionText => getField<String>('solution_text');
  set solutionText(String? value) => setField<String>('solution_text', value);

  bool? get isAccepted => getField<bool>('is_accepted');
  set isAccepted(bool? value) => setField<bool>('is_accepted', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);
}
