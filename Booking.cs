using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    public class Booking
    {
        private string user_email;
        private int num_people;
        private decimal price;
        private int num_rooms;
        private string check_in;
        private string check_out;
        public Booking() { }

        public Booking(string user_email,int num_people, decimal price,int num_rooms,string check_in, string check_out) { 
            this.user_email = user_email;
            this.num_people = num_people;
            this.price = price;
            this.num_rooms = num_rooms;
            this.check_in = check_in;
            this.check_out = check_out;
        }

        public string generateUnique()
        {
            String code = "";
            return code;
        }
    }
}