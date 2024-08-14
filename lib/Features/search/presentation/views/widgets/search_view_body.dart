import 'package:bookly/Features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/custom_snack_bar.dart';
import '../../../../../core/utils/style.dart';
import '../../manager/search_cubit/search_book_cubit.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            controller: controller,
            onPressed: (){
              if(controller.text.isEmpty){
                customErrorSnackBar(context,'Please, Enter book name!');
              }else{
                BlocProvider.of<SearchBooksCubit>(context).loadedBooks.clear();
                BlocProvider.of<SearchBooksCubit>(context).searchKey = controller.text;
                BlocProvider.of<SearchBooksCubit>(context)
                    .fetchSearchBook(searchKeyword: controller.text,startIndex: 0);
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: SearchListView(),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

