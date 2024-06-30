import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/authentication/data_layer/data_sources/auth_api_service_imp.dart';
import 'features/authentication/domain_layer/usecases/login.dart';
import 'features/authentication/domain_layer/usecases/logout.dart';
import 'features/authentication/presentation_layer/bloc/auth/bloc.dart';
import 'features/mangement_project/data_layer/data_source/project_api_service_imp.dart';
import 'features/mangement_project/data_layer/repository/project_repository_imp.dart';
import 'features/mangement_project/domain_layer/repository/project_repository.dart';
import 'features/mangement_project/domain_layer/usecases/craete_project.dart';
import 'features/mangement_project/domain_layer/usecases/delete_project.dart';
import 'features/mangement_project/domain_layer/usecases/get_project.dart';
import 'features/mangement_project/presentation_layer/bloc/project/project_bloc.dart';
import 'features/authentication/data_layer/repository/user_repository_imp.dart';
import 'features/authentication/domain_layer/repository/user_repository.dart';
import 'features/authentication/domain_layer/usecases/register.dart';
import 'features/mangement_task/data_layer/data_source/task_api_service_imp.dart';
import 'features/mangement_task/data_layer/repository/task_reopsitory_imp.dart';
import 'features/mangement_task/domain_layer/repository/task_repository.dart';
import 'features/mangement_task/domain_layer/usecases/add_task.dart';
import 'features/mangement_task/domain_layer/usecases/get_task.dart';
import 'features/mangement_task/presentation_layer/bloc/mangement_task_bloc/bloc.dart';

final sl=GetIt.instance;

Future <void> initializeDependencies()async{
  sl.registerSingleton<Dio>(Dio());

  //Authentication
  sl.registerSingleton<AuthApiServiceImp>(AuthApiServiceImp());
  sl.registerSingleton<UserRepository>(UserRepositoryImp(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase(sl()));
  sl.registerFactory<AuthBloc>(()=>AuthBloc(sl(),sl(),sl()));


  //Mangement_project
  sl.registerSingleton<ProjectApiServiceImp>(ProjectApiServiceImp());
  sl.registerSingleton<ProjectRepository>(ProjectRepositoryImp(sl()));
  sl.registerSingleton<CreateProjectUseCase>(CreateProjectUseCase(sl()));
  sl.registerSingleton<GetProjectUseCase>(GetProjectUseCase(sl()));
  sl.registerSingleton<DeleteProjectUseCase>(DeleteProjectUseCase(sl()));
  sl.registerFactory<ProjectBloc>(() =>ProjectBloc(sl(),sl(),sl()));


  //Mangement_task
  sl.registerSingleton<TaskApiServiceImp>(TaskApiServiceImp());
  sl.registerSingleton<TaskRepository>(TaskRepositoryImp(sl()));
  sl.registerSingleton<AddTaskUseCase>(AddTaskUseCase(sl()));
  sl.registerSingleton<GetTaskUseCase>(GetTaskUseCase(sl()));
  sl.registerFactory<MangementTaskBlock>(() =>MangementTaskBlock(sl(),sl()));

}