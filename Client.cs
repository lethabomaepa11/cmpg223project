using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    public class Client
    {
        public string email;
        public string password = null;
        public string name;
        public string surname;
        public string cell_number;
        public string age;
        public string client_type;//a: admin; b: member; c: once-off
        public Client() { }
        //creating an account
        public Client(string email, string name, string surname, string cell_number, string age, string password)
        {
            this.email = email.Replace(" ","");
            this.password = password;
            this.name = name;
            this.surname = surname;
            this.cell_number = cell_number.Replace(" ", ""); ;
            this.age = age;
        }
        //once-off user
        public Client(string email, string name, string surname, string cell_number)
        {
            this.email = email;
            this.name = name;
            this.surname = surname;
            this.cell_number = cell_number;
        }
        //login
        public Client(string email,string password)
        {
            this.email = email;
            this.password = password;
        }
    }
}