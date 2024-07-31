using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    public class Booking
    {
        public string res_code;
        public string user_email;
        public int num_people;
        public decimal price;
        public int num_rooms;
        public String check_in;
        public String check_out;
        public Booking() { }

        public Booking(String res_code,string user_email,int num_people, decimal price,int num_rooms, String check_in, String check_out) { 
            this.res_code = res_code;
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