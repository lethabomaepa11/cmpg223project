using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cmpg223project
{
    public class LostFound
    {
        private int item_id;
        private string description;
        private string found_date;
        private int room_id;
        public LostFound() { }
        public LostFound(int item_id, string description, string found_date, int room_id)
        {
            this.item_id = item_id;
            this.description = description;
            this.found_date = found_date;
            this.room_id = room_id;
        }
    }
}