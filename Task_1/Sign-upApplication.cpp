#include "iostream"
#include "vector"
#include "string"

using namespace std;

vector<vector<string>> User;

class Sign_upApplication {
    private:
        string Name;
        int Age;
        int ID;
    public:
        void AddRecord(string personName, int personAge);
        string FetchRecord(int personID);
};

void Sign_upApplication::AddRecord(string personName, int personAge) {
   Name = personName;
   Age = personAge;

   User.push_back({Name, to_string(Age)}); // push the record into 2d vector 
}

string Sign_upApplication::FetchRecord(int personID) {
    ID = personID;
    if (personID >= 0 && personID <= User.size()) { // check on the ID
        return "Name: " + User[personID][0] + ", Age: " + User[personID][1]; // return the record in string type
    }
    else {
        return "Error! Wrong ID.\n";
    }

}

int main() {
    bool Running = true; // running condition

    while (Running) {
        cout << "Please Select an Option: \n";
        cout << "1. Add Record \n2. Fetch Record \n3. Quit \n";
        char Option;
        cin >> Option;

        Sign_upApplication Person;
        string Name;
        int Age;
        int ID;

        switch (Option) {
            case '1':
                cout << "Please Enter User name and Age \n";
                cout << "Name: ";
                cin >> Name;

                cout << "Age: ";
                cin >> Age;
                Person.AddRecord(Name, Age);
                break;

            case '2':
                cout << "Please Enter User ID \n";
                cout << "User ID : ";
                cin >> ID;
                cout << Person.FetchRecord(ID) << "\n";
                break;

            case '3':
                Running = false; // convert running condtion to false to end the loop and close the program
                break;
            
            default:

                cout << "Error! Wrong Option.\n";
                break;
        }
    }
    return 0;
}