
class GeminiTalkEntity {
  List<CandidateEntity> candidates;
  UsageMetadataEntity usageMetadata;

  GeminiTalkEntity({
    required this.candidates,
    required this.usageMetadata,
  });
}

class CandidateEntity {
  ContentEntity content;
  String finishReason;
  int index;
  List<SafetyRatingEntity> safetyRatings;

  CandidateEntity({
    required this.content,
    required this.finishReason,
    required this.index,
    required this.safetyRatings,
  });
}

class ContentEntity {
  List<PartEntity> parts;
  String role;

  ContentEntity({
    required this.parts,
    required this.role,
  });
}

class PartEntity {
  String text;

  PartEntity({
    required this.text,
  });
}

class SafetyRatingEntity {
  String category;
  String probability;

  SafetyRatingEntity({
    required this.category,
    required this.probability,
  });
}

class UsageMetadataEntity {
  int promptTokenCount;
  int candidatesTokenCount;
  int totalTokenCount;

  UsageMetadataEntity({
    required this.promptTokenCount,
    required this.candidatesTokenCount,
    required this.totalTokenCount,
  });
}
