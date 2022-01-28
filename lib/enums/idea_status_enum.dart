import 'package:flutter/material.dart';

enum IdeaStatusEnum { AVAILABLE, INWORKING, COMPLETED }

class IdeaStatusConvertor {
  static String fromEnum(IdeaStatusEnum status) {
    return 'AVAILABLE';
  }

  static IdeaStatusEnum fromString(String status) {
    return IdeaStatusEnum.AVAILABLE;
  }
}
