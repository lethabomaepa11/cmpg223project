using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace cmpg223project
{
    
    public class Database
    {
        public String connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\USER\Source\Repos\lethabomaepa11\cmpg223project\PotchStream.mdf;Integrated Security=True;Connect Timeout=30";
        SqlDataAdapter adapter;
        SqlConnection connection;
        SqlCommand command;
        SqlDataReader reader;
        public DataTable clientData = new DataTable();
        public DataTable lostFoundData = new DataTable();
        public DataTable bookingData = new DataTable();
        private String sql = null;
        public Database()
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
        }
        public void close()
        {
            connection.Close();
        }
        public bool emailExists(String email)
        {
            //used to check if the given email exists in the clients database.
            String condition = "Where email = '+"+email + "'";
            selectClients(condition);
            return true;
        }
        //Client CRUD methods
        public bool insertClients(Client client)
        {
            //to insert client, just pass the client object 
            int rowsAffected = 0;
            try
            {
                if (!selectClients("Where email ='" + client.email + "'"))
                {
                    //Console.WriteLine(client.email);
                    if (client.password is null)
                    {
                        //once-off user
                        client.client_type = "c";
                        sql = "INSERT INTO Clients(email,name,surname,cell_number,client_type) VALUES('" + client.email + "','" + client.name + "','" + client.surname + "','" + client.cell_number + "','" + client.client_type + "')";
                    }
                    else
                    {
                        client.client_type = "b";
                        sql = "INSERT INTO Clients(email,name,surname,cell_number,age,client_type) VALUES('admin@potchstream.com','Admin','Man','1234567890','31','a')";
                        //select all where email equal this email if not exists then insert  
                    }

                    command = new SqlCommand(sql, connection);
                    rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected>0;

                }
                else if(selectClients("Where client_type = 'c'") && client.password != null)
                {
                    //update that client
                    return updateClients(client.email, "client_type='b',password = '" + client.password + "'," +
                        "age = '" + client.age + "'");
                }
            }catch (Exception ex)
            {
                throw new Exception(ex.Message + " \n" + ex.Source);
            }
            return rowsAffected>0;

        }
        public bool updateClients(String email,String set)
        {
            String s = "UPDATE CLIENTS SET " + set + " WHERE email= '" + email + "';";
            command = new SqlCommand(s, connection);
            //adapter = new SqlDataAdapter();
            //adapter.UpdateCommand = command;
            int rowsAffected = command.ExecuteNonQuery();
            return rowsAffected > 0;
        }
        public bool delete(String table,String condition)
        {
            //used for deleting a specific item or items of any entity
            //prove the name of the table and provide the sql code the follows WHERE 
            //for example, table = "clients" and condition = "email='123@mail.com'"
            //the above example will delete the client record that has email of 123@mail.com
            if(table.ToLower() == "clients" || table.ToLower() == "bookings" || table.ToLower() == "lostfounditems" || table.ToLower() == "rooms")
            {
                sql = "Delete from " + table + " where " + condition + ";";
                command = new SqlCommand(sql, connection);
                int rowsAffected = command.ExecuteNonQuery();
                return rowsAffected > 0;//true if it worked
            }else
            {
                throw new Exception("Enter Clients or Bookings or LostFoundItems or Rooms in the parameter \"table\"!!");
            }
             
        }
        public bool selectClients(String condition = "")
        {
            clientData.Rows.Clear();
            String s = "SELECT * FROM Clients " + condition + ";";
            command = new SqlCommand(s, connection);
            adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            //reader = adapter.SelectCommand.ExecuteReader();
            adapter.Fill(clientData);
            return clientData.Rows.Count > 0;
            //you must access the clientData if this returns true
            /**
             * To select all, leave blank like such db.selectClients();
             * Example using GRIDVIEW
             * Database db = new Database();
             * if(db.selectClients("WHERE condition"){
             *      GridView.DataSource = db.clientData;
             *    }
             *    
             * Example in LOGIN
             * Database db = new Database();
             * if(db.selectClients("email = 'WHERE email' AND password = 'password'){
                    //show a successfully logged in message and redirect page
                }
             */
        }

        //Lost and found
        public bool insertLostFound(LostFound lostFound)
        {
            sql = "INSERT INTO LostFoundItems(description,found_date,room_id) VALUES(@description,@found_date,room_id);";
            command = new SqlCommand(sql,connection);
            command.Parameters.AddWithValue("@description", lostFound.description);
            command.Parameters.AddWithValue("@found_date", lostFound.found_date);
            command.Parameters.AddWithValue("@room_id", lostFound.room_id);
            int rowsAffected = command.ExecuteNonQuery();
            return rowsAffected > 0;
        }
        public bool updateLostFound(String id, String set)
        {
            String s = "UPDATE LostFoundItems SET " + set + " WHERE item_id= '" + id + "';";
            command = new SqlCommand(s, connection);
            //adapter = new SqlDataAdapter();
            //adapter.UpdateCommand = command;
            int rowsAffected = command.ExecuteNonQuery();
            return rowsAffected > 0;
        }
        public bool selectLostFound(String condition= "")
        {
            lostFoundData.Rows.Clear();
            String s = "SELECT * FROM LostFoundItems " + condition + ";";
            command = new SqlCommand(s, connection);
            adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            //reader = adapter.SelectCommand.ExecuteReader();
            adapter.Fill(lostFoundData);
            return lostFoundData.Rows.Count > 0;
        }

        //bookings
        public bool insertBookings(Booking booking)
        {
            try
            {
                sql = "INSERT INTO Bookings(reservation_code, user_email, num_people, price, num_rooms, check_in, check_out) Values('" + booking.res_code + "', '" + booking.user_email + "', '" + booking.num_people + "', '" + booking.price + "', '" + booking.num_rooms + "', '" + booking.check_in + "', '" + booking.check_out + "');";
                command = new SqlCommand(sql, connection);
                int rowsAffected = command.ExecuteNonQuery();
                return rowsAffected > 0;
            }catch  (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            
        }
        public bool updateBookings(String reservation_code, String set)
        {
            String s = "UPDATE Bookings SET " + set + " WHERE reservation_code = '" + reservation_code + "';";
            command = new SqlCommand(s, connection);
            //adapter = new SqlDataAdapter();
            //adapter.UpdateCommand = command;
            int rowsAffected = command.ExecuteNonQuery();
            return rowsAffected > 0;
        }

        public bool selectBookings(String condition = "")
        {
            bookingData.Rows.Clear();
            String s = "SELECT * FROM Bookings " + condition + ";";
            command = new SqlCommand(s, connection);
            adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            //reader = adapter.SelectCommand.ExecuteReader();
            adapter.Fill(bookingData);
            return bookingData.Rows.Count > 0;
        }

        //room
        public bool insertRooms(string reservation_code,int roomID)
        {
            //bool r = true;
            try
            {
                sql = "INSERT INTO ASSIGNED_ROOMS(reservation_code, room_id) Values('" + reservation_code + "', '" + roomID + "');";
                command = new SqlCommand(sql, connection);
                command.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
            
        }
        public void updateRooms()
        {

        }
        
        public void selectRooms()
        {

        }
        public string generateRandom(int length)
        {
            //used to generate random and unique ID with the given length, time complexity O(n)
            var random = new Random(); 
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            string result = "";
            for (int i = 0; i < length; i++)
            {
                string c = ""+chars[random.Next(chars.Length)];
                if (random.Next(4) == 1)
                {
                    c = c.ToLower();
                }
                else if(random.Next(4) == 2)
                {
                    c = ""+random.Next(10);
                }
                result += c;
            }
            return result;
        }
        
        public bool checkLostFound(string reservation_code)
        {
            sql = $"SELECT room_id FROM Assigned_Rooms WHERE reservation_code = '{reservation_code}';";
            command = new SqlCommand(sql, connection);
            object result = command.ExecuteScalar();
            if (result != null)
            {
                checkOutDate = result.ToString();
                sql = $"SELECT check_out FROM Bookings WHERE reservation_code = '{reservation_code}';";
                command = new SqlCommand(sql, connection);
                result = command.ExecuteScalar();
                if (result != null)
                {
                    DateTime date = Convert.ToDateTime(result.ToString());
                    sql = $"SELECT * FROM LostFoundItems WHERE found_date = '{date.AddDays(1)}' AND description NOT LIKE '%claimed by%';";
                    checkOutDate = sql;
                    command = new SqlCommand(sql, connection);
                    adapter = new SqlDataAdapter();
                    adapter.SelectCommand = command;
                    adapter.SelectCommand.ExecuteNonQuery();
                    adapter.Fill(lostFoundData);
                    
                    if(lostFoundData.Rows.Count > 0)
                    {
                        return true;
                    }
                    else
                        return false;
                }
                else
                    return false;
            }
            else
                return false;
            //DataTable roomID = new DataTable();
            //adapter.Fill(roomID);
            //
            //adapter.SelectCommand = command;
            //adapter.Fill(check_out);
            //string check_out_date = check_out.ToString();

            
        }
        public string checkOutDate;

    }




    
}