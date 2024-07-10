// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../core/theme.dart';
import 'project_tile_widget.dart';

class ProjectListWidget extends StatelessWidget {
  ProjectListWidget({super.key, required this.projects});
  var projects;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            'Welcome, Ashraf',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const Text(
            'Here\'re your projects, Ashraf',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectTile(
                  text: projects[index].projectName!,
                  date: projects[index].createdAt,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
