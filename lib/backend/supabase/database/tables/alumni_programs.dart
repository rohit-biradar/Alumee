import '../database.dart';

class AlumniProgramsTable extends SupabaseTable<AlumniProgramsRow> {
  @override
  String get tableName => 'alumni_programs';

  @override
  AlumniProgramsRow createRow(Map<String, dynamic> data) =>
      AlumniProgramsRow(data);
}

class AlumniProgramsRow extends SupabaseDataRow {
  AlumniProgramsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlumniProgramsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get programDate => getField<DateTime>('program_date');
  set programDate(DateTime? value) => setField<DateTime>('program_date', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
