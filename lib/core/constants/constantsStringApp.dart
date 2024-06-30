
const String apiBaseUrl="https://projects-management-system.onrender.com/api/v1";

//Authentication VARIABLES
final List<String> rolrItem = [
  'USER',
  'ADMIN'
];
const String apiRegister='/auth/register';
const String apiLogin='/auth/login';
const String apiLogout='/auth/logout';
const String firstname='Firstname';
const String  lastname='Lastname';
const String  email='Email';
const String password ='Password';
const String selectRole ='Select Role';
const String signUp='Sign Up';
const String rememberMe='Remember me';
const String AlreadyHaveAccount='Already have an account ? ';
const String dontHaveAccount='You don\'t have an account ? ';
const String login='Login ';
const String error="Error";


//CREATE&JOIN_PAGE VARIABLES
const String create='Create';


//Management_PROJECT_PAGE VARIABLES
const String projectName='Project name';
const String projectScript='Project script';
const String createProject=create;
const String apiCreateProject='/projects';
const String apiGetProject='/projects/';
final List<String> options = [
  'Delete',
  'Edit'
];
const String sureDelete='Are you sure you want to delete this project ?';
const String iAmSure="Yes, i sure ";


//Management_TASK_PAGE VARIABLES
const String taskss='Tasks';
const String createTask=create;
const String intialListText="There is not TASKS yet , \ntry add tasks to this project";
const String apiAddTask='/tasks';
const String apiGetTask='/tasks/tasks-by-project/';
const String taskDescription ="task Description";
const String cancel='Cancel';
const String add='Add';


