// To parse this JSON data, do
//
//     final geminiTalkRes = geminiTalkResFromJson(jsonString);

import 'dart:convert';

import 'package:gemini/domain/entities/gemini_talk_entity.dart';

GeminiTalkModel geminiTalkResFromJson(String str) =>
    GeminiTalkModel.fromJson(json.decode(str));

String geminiTalkResToJson(GeminiTalkModel data) => json.encode(data.toJson());

class GeminiTalkModel extends GeminiTalkEntity {
  GeminiTalkModel({required super.candidates, required super.usageMetadata});

  factory GeminiTalkModel.fromJson(Map<String, dynamic> json) =>
      GeminiTalkModel(
        candidates: List<CandidateModel>.from(
            json["candidates"].map((x) => CandidateModel.fromJson(x))),
        usageMetadata: UsageMetadataModel.fromJson(json["usageMetadata"]),
      );

  Map<String, dynamic> toJson() => {
        "candidates": List<dynamic>.from(candidates.map((x) => x)),
        "usageMetadata": usageMetadata,
      };
}

class CandidateModel extends CandidateEntity {
  CandidateModel(
      {required super.content,
      required super.finishReason,
      required super.index,
      required super.safetyRatings});

  factory CandidateModel.fromJson(Map<String, dynamic> json) => CandidateModel(
        content: ContentModel.fromJson(json["content"]),
        finishReason: json["finishReason"],
        index: json["index"],
        safetyRatings: List<SafetyRatingModel>.from(
            json["safetyRatings"].map((x) => SafetyRatingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "finishReason": finishReason,
        "index": index,
        "safetyRatings": List<dynamic>.from(safetyRatings.map((x) => x)),
      };
}

class ContentModel extends ContentEntity {
  ContentModel({required super.parts, required super.role});

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
        parts: List<PartModel>.from(
            json["parts"].map((x) => PartModel.fromJson(x))),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "parts": List<dynamic>.from(parts.map((x) => x)),
        "role": role,
      };
}

class PartModel extends PartEntity {
  PartModel({required super.text});

  factory PartModel.fromJson(Map<String, dynamic> json) => PartModel(
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

class SafetyRatingModel extends SafetyRatingEntity {
  SafetyRatingModel({required super.category, required super.probability});

  factory SafetyRatingModel.fromJson(Map<String, dynamic> json) =>
      SafetyRatingModel(
        category: json["category"],
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "probability": probability,
      };
}

class UsageMetadataModel extends UsageMetadataEntity {
  UsageMetadataModel(
      {required super.promptTokenCount,
      required super.candidatesTokenCount,
      required super.totalTokenCount});

  factory UsageMetadataModel.fromJson(Map<String, dynamic> json) =>
      UsageMetadataModel(
        promptTokenCount: json["promptTokenCount"],
        candidatesTokenCount: json["candidatesTokenCount"],
        totalTokenCount: json["totalTokenCount"],
      );

  Map<String, dynamic> toJson() => {
        "promptTokenCount": promptTokenCount,
        "candidatesTokenCount": candidatesTokenCount,
        "totalTokenCount": totalTokenCount,
      };
}
