using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    public class LostFound
    {
        //public int item_id;
        public string description;
        public DateTime found_date;//discuss data type
        public int room_id;
        Database db = new Database();
        public LostFound() {
            //this.item_id = db.generateRandom(10);
        }
        public LostFound(string description, DateTime found_date, int room_id)
        {
            //this.item_id = ite;
            this.description = description;
            this.found_date = found_date;
            this.room_id = room_id;
        }
    }
}