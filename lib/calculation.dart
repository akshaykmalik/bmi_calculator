class Calculation {
  Calculation({this.height, this.weight});
  final int height;
  final int weight;
  double resultValue;
  String resultString;
  String comment;
  String getResultString() {
    calculateResult();
    return resultString;
  }

  String getComment() {
    calculateResult();
    return comment;
  }

  String getResultValue() {
    calculateResult();
    return resultValue.toStringAsFixed(1);
  }

  void calculateResult() {
    resultValue = (weight * 10000) / (height * height);
    if (resultValue >= 25.0) {
      resultString = 'OVERWEIGHT';
      comment = 'Exercise more and eat good';
    } else if (resultValue > 18.5) {
      resultString = 'Normal';
      comment = 'Well done!';
    } else {
      resultString = 'UNDERWEIGHT';
      comment = 'EAT more,Eat good and exercise';
    }
  }
}
