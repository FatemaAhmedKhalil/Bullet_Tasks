## Task_1: User Registration Application (Sign-Up)

#### **Project Requirements:**
The task is to create a simple user registration application that allows users to register by providing their name and age. This information will be stored in a custom type and stored in a dynamic array (vector). Additionally, the system will allow users to fetch their records using a unique user ID.

#### **Steps to Complete the Activity:**

1. **Include Necessary Headers:**
   Start by including the standard headers required for the application.

2. **Define the `Person` Class:**
   Create a class called `Person` with two attributes: `name` (a string) and `age` (an integer). This class will represent a user record.

3. **Declare a Vector to Store Records:**
   Define a vector to hold `Person` objects, which will store the user records dynamically without needing a fixed array size.

4. **Implement Add Record Function:**
   Create a function called `AddRecord` that takes `name` and `age` as parameters, creates a `Person` object, and adds it to the vector.

5. **Implement Fetch Record Function:**
   Create a function called `FetchRecord` that takes a user ID (index) as input and fetches the user’s record from the vector.

6. **Main Function:**
   Implement the main loop of the application, offering the user three options:
   - **Add Record**: Collect user name and age, then call `AddRecord`.
   - **Fetch Record**: Collect a user ID and call `FetchRecord` to display the user's record.
   - **Quit**: Exit the program.

7. **Program Logic:**
   Use a switch statement to handle user input and call the appropriate function for each option.
