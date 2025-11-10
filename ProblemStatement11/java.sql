package sqlPractical;

import java.sql.*;
import java.util.*;

public class Student {
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "root");
			Statement stm = con.createStatement();

			String str = "CREATE DATABASE Studentinfo";
			stm.executeUpdate(str);
			System.out.println("Database created successfully!");
			System.out.println("use Studentinfo");

			//String str1 = "CREATE TABLE Studinfo(rollno INT, Name VARCHAR(20), Address VARCHAR(20))";
			//stm.executeUpdate(str1);
			//System.out.println("Table is created!");

			Scanner sc = new Scanner(System.in);

			int rollno;
			int choice;
			String name, address;
			String str11;

			do {
				System.out.println("Choose Operation:");
				System.out.println("1. Insert");
				System.out.println("2. Update");
				System.out.println("3. Delete");
				System.out.println("4. Display");
				System.out.println("5. Exit");

				System.out.print("Enter choice: ");
				choice = sc.nextInt();

				switch (choice) {
				case 1:
					System.out.print("Enter Roll No: ");
					rollno = sc.nextInt();
					System.out.print("Enter Name: ");
					name = sc.next();
					System.out.print("Enter Address: ");
					address = sc.next();
					str11 = "INSERT INTO studinfo VALUES(" + rollno + ", '" + name + "', '" + address + "')";
					stm.executeUpdate(str11);
					System.out.println("Record Inserted!");
					break;

				case 2:
					System.out.print("Enter Roll No to Update: ");
					rollno = sc.nextInt();
					System.out.print("Enter New Name: ");
					name = sc.next();
					str11 = "UPDATE studinfo SET Name='" + name + "' WHERE rollno=" + rollno;
					stm.executeUpdate(str11);
					System.out.println("Record Updated!");
					break;

				case 3:
					System.out.print("Enter Roll No to Delete: ");
					rollno = sc.nextInt();
					str11 = "DELETE FROM studinfo WHERE rollno=" + rollno;
					stm.executeUpdate(str11);
					System.out.println("Record Deleted!");
					break;

				case 4:
					ResultSet rs = stm.executeQuery("SELECT * FROM studinfo");
					System.out.println("Roll No\tName\tAddress");
					while (rs.next()) {
						System.out.println(
								rs.getInt("rollno") + "\t" + rs.getString("Name") + "\t" + rs.getString("Address"));
					}
					rs.close();
					break;

				case 5:
					System.out.println("Exiting program...");
					break;

				default:
					System.out.println("Invalid choice!");
				}

			} while (choice != 5);

			stm.close();
			con.close();
			sc.close();
		}

		catch (Exception e) {
			System.out.println(e);
		}
	}
}
