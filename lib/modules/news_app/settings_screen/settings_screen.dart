// //@dart=2.9
// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:udemy_projects/layout/shop_app/cubit/cubit.dart';
// import 'package:udemy_projects/layout/shop_app/cubit/states.dart';
// import 'package:udemy_projects/shared/components/components.dart';
// import 'package:udemy_projects/shared/components/constants.dart';
//
// class SettingsScreen extends StatelessWidget {
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopAppCubit, ShopAppStates>(
//       listener: (context, index) {},
//       builder: (context, index) {
//         var model = ShopAppCubit.get(context).userModel;
//         nameController.text = model.data.name;
//         emailController.text = model.data.email;
//         phoneController.text = model.data.phone;
//
//         return ConditionalBuilder(
//           condition: ShopAppCubit.get(context).userModel != null,
//           builder: (context) => Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 defaultTextField(
//                   controller: nameController,
//                   type: TextInputType.text,
//                   label: 'Name',
//                   prefix: Icons.person_outline,
//                   validate: (String value) {
//                     if (value.isEmpty) {
//                       return 'name must not be empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20.0),
//                 defaultTextField(
//                   controller: emailController,
//                   type: TextInputType.emailAddress,
//                   label: 'Name',
//                   prefix: Icons.mail_outline,
//                   validate: (String value) {
//                     if (value.isEmpty) {
//                       return 'email must not be empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20.0),
//                 defaultTextField(
//                   controller: phoneController,
//                   type: TextInputType.phone,
//                   label: 'Phone',
//                   prefix: Icons.phone_outlined,
//                   validate: (String value) {
//                     if (value.isEmpty) {
//                       return 'phone number must not be empty';
//                     }
//                     return null;
//                   },
//                 ),
//                 Spacer(),
//                 defaultButton(
//                     text: 'logout',
//                     function: () {
//                       signOut(context);
//                     }),
//               ],
//             ),
//           ),
//           fallback: (context) => Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }
// }
