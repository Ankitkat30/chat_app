class CallData {
  final int? id;
  final String? createdAt;
  final String? senderId;
  final String? receiverId;
  final String? starttime;
  final String? endtime;


  CallData(
      {this.id,
      this.createdAt,
      this.senderId,
      this.receiverId,
      this.starttime,
      this.endtime,
     });

  factory CallData.fromJson(Map<String,dynamic> json) => CallData(
    id: json['id'],
    createdAt: json['created_at'],
    senderId: json['sender_id'],
    receiverId: json['receiver_id'],
    starttime: json['start_time'],
    endtime: json['end_time'],
   
  );
}