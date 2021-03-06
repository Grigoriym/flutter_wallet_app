class RecordModel {
  final int id;
  final double sum;
  final String paymentType;
  final String category;
  final String labels;
  final String payee;
  final String date;
  final String time;
  final String status;
  final String warranty;

  RecordModel(
    this.id,
    this.labels,
    this.payee,
    this.date,
    this.time,
    this.status,
    this.warranty,
    this.sum,
    this.paymentType,
    this.category,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sum': sum,
      'payment_type': paymentType,
      'category': category,
      'labels': labels,
      'payee': payee,
      'date': date,
      'time': time,
      'status': status,
      'warranty': warranty
    };
  }

  String toString() {
    return '''[
    id: $id,
    sum: $sum,
    paymentType: $paymentType,
    category: $category,
    labels: $labels,
    payee: $payee,
    date: $date,
    time: $time,
    status: $status,
    warranty: $warranty
    ]''';
  }
}
