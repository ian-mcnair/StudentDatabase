import java.util.Scanner;

public class MainApp {
    public static void main(String[] args) {
        //runs the main functions of the database ops
        Connect runSQL = new Connect();
        runSQL.updateUsers("id", "100","900");

        //Keeps track of when teh program is "on" or "off"
        boolean programStatus = true;

        //Used just for login since it needs to happen once, but can loop a few times if username and password are wrong
        boolean loginFlag = true;
        Scanner in = new Scanner(System.in);

        System.out.println("Welcome to this simple School Management Database");
        System.out.println();
        System.out.println(">This system works by having you select numerical choices to choose your database operation.\n>Some operations require you to type precisely what is listed, so be sure to take care when prompted to do so!");
        System.out.println();
        System.out.println("--Login Menu--");
        //Start of main loop
        while(programStatus){

            //Login Loop
            while(loginFlag){
                System.out.print("Please enter your username: ");
                String username = in.nextLine();
                System.out.println();
                System.out.print("Please enter your password: ");
                String password = in.nextLine();
                //bypassing login for now
                boolean log = runSQL.checkLogin(username, password);
                if(log) {
                    loginFlag = false;
                    System.out.println("Login Successful\n");
                }
                else{
                    System.out.println("Username or Password does not match! Please try again.");
                }
            }

            //Main Menu Loop
            System.out.println("--Main Menu--");
            while(programStatus){
                System.out.println();
                System.out.println("Select what you would like to do below and press enter.\n");
                System.out.println( "1: View Reports\n" +
                                    "2: Insert New User\n" +
                                    "3: Update User Records\n" +
                                    "4: Delete Records\n" +
                                    "5: Logout\n");
                System.out.print("Enter Numerical Choice: ");
                int choice = in.nextInt();
                in.nextLine();

                //View Records Loop
                if(choice == 1){
                    //Student/Staff Lookup
                    //Display List of Students
                    //Display List of Teachers
                    //Display Schedule
                    //Display Grade Report
                    System.out.println("What would you like to view?");
                    System.out.println( "1: Student/Staff Look Up\n" +
                                        "2: Display List of Students\n" +
                                        "3: Display List of Teachers\n"+
                                        "4: Display Student/Teacher Schedules\n" +
                                        "5: Display Grade Reports\n" +
                                        "0: Main Menu\n");
                    System.out.print("Enter Numerical Choice: ");
                    int viewChoice = in.nextInt();
                    in.nextLine();
                    System.out.println();
                    if(viewChoice == 1){
                        System.out.print("Please type out the ID of the person you'd like to look up:");
                        String id = in.nextLine();
                        runSQL.viewBasicInfo(id);
                    }else if(viewChoice == 2){
                        runSQL.viewStudentList();
                    }else if(viewChoice == 3){
                        runSQL.viewTeacherList();
                    }else if(viewChoice == 4){
                        System.out.print("Please type out the ID of who you are trying to look up:");
                        String id = in.nextLine();
                        runSQL.viewSchedule(id);
                    }else if (viewChoice == 5){
                        System.out.print("Please type out the ID of the student whose grades you would like to view:");
                        String id = in.nextLine();
                        runSQL.viewGradeReport(id);
                    }else if(viewChoice == 0) System.out.println("Entering Main Menu");
                    else System.out.println("Invalid choice, entering main menu");

                }//Insert Records Loop
                else if(choice == 2){
                    System.out.println("To insert new person into database, please follow prompts below\n");
                    System.out.print("Please enter ID:");
                    String id = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter username:");
                    String un = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter password:");
                    String pw = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter First Name:");
                    String fn = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter Last Name:");
                    String ln = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter Gender (M or F):");
                    String gd = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter Address:");
                    String address = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter City:");
                    String city = in.nextLine();
                    System.out.println();
                    System.out.print("Please enter Status:");
                    String status = in.nextLine();
                    System.out.println();
                    runSQL.insertNewPerson(id,un,pw,fn,ln,gd,address,city,status);

                }//Update Records Loop
                else if(choice == 3){
                    System.out.println("What would you like to update?");
                    System.out.println( "1: Update Users\n" +
                                        "2: Update Staff\n" +
                                        "3: Update Student Graduation Date\n" +
                                        "4: Update Enrollment(Class and Grades)\n" +
                                        "0: Main Menu");
                    System.out.print("Enter Numerical Choice: ");
                    int updateChoice = in.nextInt();
                    in.nextLine();
                    if(updateChoice == 1){
                        System.out.println("Which attribute would you like to update?");
                        System.out.println( "-- ID\n" +
                                            "-- Username\n" +
                                            "-- Password\n" +
                                            "-- Fname\n" +
                                            "-- LName\n" +
                                            "-- Gender\n" +
                                            "-- Address\n" +
                                            "-- City\n" +
                                            "-- Status\n");
                        System.out.print("Please type out attribute you would like to change: ");
                        String attributeChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out ID of user: ");
                        String idChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out updated value: ");
                        String tupleChoice = in.nextLine();
                        System.out.println();

                        runSQL.updateUsers(attributeChoice, tupleChoice, idChoice);

                    }else if(updateChoice == 2){
                        System.out.println("Which attribute would you like to update?");
                        System.out.println( "-- Department\n" +
                                            "-- Title\n" +
                                            "-- Salary\n");

                        System.out.print("Please type out attribute you would like to change: ");
                        String attributeChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out ID of user: ");
                        String idChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out updated value: ");
                        String tupleChoice = in.nextLine();
                        System.out.println();

                        runSQL.updateStaff(attributeChoice, tupleChoice, idChoice);

                    }else if(updateChoice == 3){
                        System.out.print("Please type out new graduation year: ");
                        String tupleChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out ID of user: ");
                        String idChoice = in.nextLine();
                        System.out.println();

                        runSQL.updateStudent("graddate", tupleChoice, idChoice);

                    }else if(updateChoice == 4){
                        System.out.println("Which attribute would you like to update?");
                        System.out.println( "-- CourseID\n" +
                                            "-- Period\n" +
                                            "-- Grade\n");
                        System.out.print("Please type out attribute you would like to change: ");
                        String attributeChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out ID of user: ");
                        String idChoice = in.nextLine();
                        System.out.println();
                        System.out.print("Please type out updated value: ");
                        String tupleChoice = in.nextLine();
                        System.out.println();

                        runSQL.updateEnrollment(attributeChoice, tupleChoice, idChoice);
                    }else if(updateChoice == 0) System.out.println("Entering Main Menu");
                    else System.out.println("Invalid choice, entering main menu");

                }//Delete records Loop
                else if(choice == 4){
                    System.out.println(">To remove a person from the system, you must use their ID. \n>Remember that removing a user from the system permanently deletes all data about them");
                    System.out.println();
                    System.out.println(">If you'd like to go back to the Main Menu, type 0 and press enter.");
                    System.out.println();
                    System.out.print("Type in the ID of the person you would like to delete: ");
                    runSQL.removeUser(in.nextLine());

                }else if(choice == 5){
                    programStatus =false;
                }else System.out.println("The option you have chosen is not listed above. Please try again.\n");
                System.out.println("**********************");
            }
            //Making sure infinite loop doesn't happen
            programStatus = false;
            System.out.println("Exiting Program");
        }
    }
}

