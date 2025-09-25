import '../database.dart';

class DonationCampaignsTable extends SupabaseTable<DonationCampaignsRow> {
  @override
  String get tableName => 'donation_campaigns';

  @override
  DonationCampaignsRow createRow(Map<String, dynamic> data) =>
      DonationCampaignsRow(data);
}

class DonationCampaignsRow extends SupabaseDataRow {
  DonationCampaignsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DonationCampaignsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get goalAmount => getField<double>('goal_amount');
  set goalAmount(double? value) => setField<double>('goal_amount', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
