using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    
    public class Room
    {
        public string description;
        public double price;
        public string image_url;
        public string room_type;

        public Room(string description, double price,string image_url, string room_type)
        {
            this.description = description;
            this.price = price;
            this.image_url = image_url;
            this.room_type = room_type;
        }
    }
}