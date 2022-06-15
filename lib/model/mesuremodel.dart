class Mesurements {
  String? Neck;
  String? Shoulderwidth;
  String? ArmholeDepth;
  String? Elbow;
  String? Wrist;
  String? ArmLength;
  String? Chest;
  String? Waist;
  String? Hip;
  String? Frontwaist;
  String? Backwaist;

  Mesurements({
    this.Neck,
    this.Shoulderwidth,
    this.ArmholeDepth,
    this.Elbow,
    this.Wrist,
    this.ArmLength,
    this.Chest,
    this.Waist,
    this.Hip,
    this.Frontwaist,
    this.Backwaist,
  });

  factory Mesurements.fromMap(map) {
    return Mesurements(
      Neck: map['neck'],
      Shoulderwidth: map['shoulderw'],
      ArmholeDepth: map['armholedepth'],
      Elbow: map['elbow'],
      Wrist: map['wrist'],
      ArmLength: map['armlength'],
      Chest: map['chest'],
      Waist: map['waist'],
      Hip: map['hip'],
      Frontwaist: map['frontwaist'],
      Backwaist: map['backwaist'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'neck': Neck,
      'shoulderw': Shoulderwidth,
      'armholedepth': ArmholeDepth,
      'elbow': Elbow,
      'wrist': Wrist,
      'armlength': ArmLength,
      'chest': Chest,
      'waist': Waist,
      'hip': Hip,
      'frontwaist': Frontwaist,
      'backwaist': Backwaist,
    };
  }
}
