import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_store_app/Cubits/My_Get_Category_Cubit/my_get_category_cubit.dart';
import 'package:my_store_app/Screens/my_category_you_choose_page.dart';

class MySearchTextFieLd extends StatelessWidget {
  const MySearchTextFieLd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) async {
        var myProductsList = await BlocProvider.of<MyGetCategoryCubit>(context)
            .myGetCategoryMethod(categoryName: value);
        if (!context.mounted) return;
        Navigator.pushNamed(context, MyCategoryYouChoosePage.id,
            arguments: myProductsList);
      },
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            MdiIcons.searchWeb,
            color: Colors.white,
          ),
        ),
        hintText: "Enter Your Category",
        hintStyle: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontFamily: "Pacifico",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
