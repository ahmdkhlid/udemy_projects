// @dart=2.9
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

//import 'package:sqflite/sqflite.dart';
// import 'package:udemy_projects/modules/archived_tasks/archived_tasks_screen.dart';
// import 'package:udemy_projects/modules/done_tasks/done_tasks_screen.dart';
// import 'package:udemy_projects/modules/new_tasks/new_tasks_screen.dart';
import 'package:udemy_projects/shared/components/components.dart';

// import 'package:udemy_projects/shared/components/constants.dart';
import 'package:udemy_projects/shared/cubit/cubit.dart';
import 'package:udemy_projects/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formdKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            key: scaffoldKey,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.indigo.shade300,
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppCreateDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.indigo,
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formdKey.currentState.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[100],
                          padding: EdgeInsets.all(
                            20.0,
                          ),
                          child: Form(
                            key: formdKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaultTextField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value.format(context).toString();
                                    }).catchError((error) {});
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'time must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                defaultTextField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  label: 'Task Date',
                                  prefix: Icons.calendar_today,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2025-05-03'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value);
                                    }).catchError((error) {});
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        elevation: 5.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
              elevation: 3.0,
              tooltip: 'Add New Task',
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 4.0,
              elevation: 2.0,
              color: Colors.indigo.shade100,
              child: Container(
                padding: EdgeInsets.only(top: 17.0),
                height: 85,
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeIndex(index);
                  },
                  selectedItemColor: Colors.indigo,
                  iconSize: 25.0,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.menu_rounded,
                        ),
                        label: "Tasks"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.check_circle_outline,
                        ),
                        label: "Done"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.archive_outlined,
                        ),
                        label: "Archived"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
