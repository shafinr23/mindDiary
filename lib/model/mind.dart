class Mind {
  Mind(
      {this.id,
      this.time,
      this.cause,
      this.emotion,
      this.thinking,
      this.physical});
  final String time;
  final String cause;
  final String emotion;
  final String thinking;
  final String physical;
  final String id;

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'cause': cause,
      'emotion': emotion,
      'thinking': thinking,
      'physical': physical,
    };
  }

  factory Mind.frommap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    final String time = data['time'];
    final String cause = data['cause'];
    final String emotion = data['emotion'];
    final String thinking = data['thinking'];
    final String physical = data['physical'];

    return Mind(
        time: time,
        cause: cause,
        emotion: emotion,
        thinking: thinking,
        physical: physical,
        id: documentId);
  }
}
