using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    public class Client
    {
        private string email;
        private string password = null;
        private string name;
        private string surname;
        private string cell_number;
        private string age;
        private string client_type;
        public Client() { }
        //creating an account
        public Client(string email, string name, string surname, string cell_number, string age, string client_type, string password)
        {
            this.email = email;
            this.password = password;
            this.name = name;
            this.surname = surname;
            this.cell_number = cell_number;
            this.age = age;
            this.client_type = client_type;
        }
        //once-off user
        public Client(string email, string name, string surname, string cell_number, string age, string client_type)
        {
            this.email = email;
            this.name = name;
            this.surname = surname;
            this.cell_number = cell_number;
            this.age = age;
            this.client_type = client_type;
        }
        //login
        public Client(string email,string password)
        {
            this.email = email;
            this.password = password;
        }
    }
}