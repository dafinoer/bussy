part of 'company_detail_cubit.dart';

abstract class CompanyDetailState extends Equatable {
  const CompanyDetailState();
}

class CompanyDetailInitial extends CompanyDetailState {
  const CompanyDetailInitial();

  @override
  List<Object> get props => [];
}

class CompanyDetailLoading extends CompanyDetailState {
  const CompanyDetailLoading();

  @override
  List<Object> get props => [];
}

class CompanyDetailSuccess extends CompanyDetailState {
  final CompanyModel companyModel;

  const CompanyDetailSuccess(this.companyModel);

  @override
  List<Object> get props => [companyModel];
}

class CompanyDetailException extends CompanyDetailState {
  const CompanyDetailException();

  @override
  List<Object> get props => [];
}
