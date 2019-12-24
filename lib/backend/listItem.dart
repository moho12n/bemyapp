import 'package:flutter/material.dart';
import 'dart:convert';

class ProjectItem {
  int id;
  String title;
  String description;
  String created_at;
  String updated_at;
  int user_id;
  String startDate;
  String duration;
  String budget;
  String type;

  ProjectItem(
    this.id,
    this.title,
    this.description,
    this.created_at,
    this.updated_at,
    this.user_id,
    this.startDate,
    this.duration,
    this.budget,
    this.type,
  );

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      json['id'] as int,
      json['title'] as String,
      json['description'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['user_id'] as int,
      json['start_date'] as String,
      json['duration'] as String,
      json['budget'] as String,
      json['type'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.title}, ${this.description},${this.type},${this.startDate},${this.duration},${this.budget} }';
  }
}

class PollItem {
  String id;
  String title;
  String description;
  String type;
  String startDate;
  String duration;
  String budget;
  PollItem(this.id, this.title, this.description, this.type, this.startDate,
      this.budget, this.duration);

  factory PollItem.fromJson(dynamic json) {
    final map = jsonDecode(json) as Map<String, dynamic>;
    return PollItem(
        json['id'] as String,
        json['title'] as String,
        json['description'] as String,
        json['type'] as String,
        json['start_date'] as String,
        json['duration'] as String,
        json['budget'] as String);
  }

  @override
  String toString() {
    return '{ ${this.title}, ${this.description},${this.type},${this.startDate},${this.duration},${this.budget} }';
  }
}
