import 'package:flutter/material.dart';
import 'package:zmzm_cashes/app/core/theme.dart';
import 'package:zmzm_cashes/app/models/project/project_response.dart';
import 'package:zmzm_cashes/app/views/home/project_list_widget.dart';
import '../../core/api/project_api.dart';
import '../../widget/custom_btn.dart';
import '../../widget/custom_textfield.dart';
import 'project_tile_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<ProjectResponse?>(
          future: ProjectApi.getAllProjectsByUserId(2),
          builder: (context, snapshot) {
            // Case 1: Loading Status
            // Case 2: From my code error Or user error (Network error)
            // Case 3: Server Status
            // Case 3.1: Server Error Status
            // Case 3.1: Server Success Status
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: AppTheme.primaryColor),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Text('Something Went Wrong!'),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ProjectApi.getAllProjectsByUserId(2);
                        });
                      },
                      child: const Text('Try Again!'))
                ],
              );
            } else {
              if (snapshot.data?.message != 'ok') {
                return Column(children: [
                  Text(snapshot.data?.message ??
                      "Server Error, Please try later."),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ProjectApi.getAllProjectsByUserId(2);
                        });
                      },
                      child: const Text('Try Again!'))
                ]);
              } else {
                var projects = snapshot.data!.data ?? [];
                return ProjectListWidget(projects: projects);
              }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.white,
          onPressed: () {
            // ProjectApi.getAllProjectsByUserId(2);
            // ProjectApi.getProjectByUserId(1);
            // ProjectApi.storeProjectByUserId(1);
            // ProjectApi.updateProjectById(7);
            // ProjectApi.deleteProjectById(7);
            // InvoiceApi.getAllInvoicesByProjectId(2);
            // InvoiceApi.getInvoiceById(2);
            // InvoiceApi.storeInvoiceByProjectId(5);
            // InvoiceApi.updateInvoiceById(2);
            // InvoiceApi.deleteInvoiceById(2);
            

            void _showFormDialog(BuildContext context) {
              GlobalKey<FormState> _formKey = GlobalKey<FormState>();
              final _nameController = TextEditingController();
              final _descriptionController = TextEditingController();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppTheme.white,
                    title: const Text(
                      'Project Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextFormField(
                                  controller: _nameController,
                                  text: 'Project Name',
                                  keyboardType: TextInputType.text,
                                  hasIcon: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter project name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                CustomTextFormField(
                                  controller: _descriptionController,
                                  text: 'Project Description',
                                  keyboardType: TextInputType.text,
                                  hasIcon: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter project desc';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                CustomBtn(
                                  text: 'Add Project',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      print(_nameController.text);
                                      print(_descriptionController.text);
                                      ProjectApi.storeProjectByUserId(
                                          id: 2,
                                          project_name: _nameController.text,
                                          project_description:
                                              _descriptionController.text);
                                      _nameController.clear();
                                      _descriptionController.clear();
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Added successfully!'),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                      setState(() {});
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            _showFormDialog(context);
          },
          child: const Icon(Icons.add, color: AppTheme.primaryColor),
        ),
      ),
    );
  }
}
