import 'package:bloc/bloc.dart';
import 'package:bussy/domains/model/company_model.dart';
import 'package:bussy/injector/main_injector.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/business_repository.dart';

part 'company_detail_state.dart';

class CompanyDetailCubit extends Cubit<CompanyDetailState> {
  final BusinessRepository businessRepository;

  CompanyDetailCubit(this.businessRepository)
      : super(const CompanyDetailInitial());

  factory CompanyDetailCubit.create(String id) =>
      CompanyDetailCubit(getIt.get())..onGetCompanyById(id);

  void onGetCompanyById(String id) async {
    try {
      emit(const CompanyDetailLoading());
      final company = await businessRepository.getCompanyById(id);
      emit(CompanyDetailSuccess(company));
    } catch (e) {
      emit(const CompanyDetailException());
    }
  }
}
