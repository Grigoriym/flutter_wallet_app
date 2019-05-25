class RecordModel {
  final double sum;
  final String paymentType;
  final String category;
  final String labels;
  final String payee;
  final String date;
  final String time;
  final String status;
  final String warranty;

  RecordModel(this.labels, this.payee, this.date, this.time, this.status,
      this.warranty, this.sum, this.paymentType, this.category);
}
