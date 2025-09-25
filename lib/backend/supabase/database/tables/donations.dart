import '../database.dart';

class DonationsTable extends SupabaseTable<DonationsRow> {
  @override
  String get tableName => 'donations';

  @override
  DonationsRow createRow(Map<String, dynamic> data) => DonationsRow(data);
}

class DonationsRow extends SupabaseDataRow {
  DonationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DonationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  int? get campaignId => getField<int>('campaign_id');
  set campaignId(int? value) => setField<int>('campaign_id', value);

  String? get donorId => getField<String>('donor_id');
  set donorId(String? value) => setField<String>('donor_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
