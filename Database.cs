using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace cmpg223project
{
    
    public class Database
    {
        public String connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\USER\Documents\PotchStream.mdf;Integrated Security=True;Connect Timeout=30";
        SqlDataAdapter adapter;
        SqlConnection connection;
        SqlCommand command;
        SqlDataReader reader;
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
        
        //Client CRUD methods
        public void insertClients()
        {
            //adding admin, remove this code 
            sql = "INSERT INTO Clients(email,name,surname,cell_number,age,client_type) VALUES('admin@potchstream.com','Admin','Man','1234567890','31','a')";
            command = new SqlCommand(sql,connection);
            command.ExecuteNonQuery();
        }
        public void updateClients()
        {

        }
        public void removeClients()
        {

        }
        public void selectClients()
        {

        }

        //Lost and found
        public void insertLostFound()
        {
            
        }
        public void updateLostFound()
        {

        }
        public void removeLostFound()
        {

        }
        public void selectLostFound()
        {

        }

        //bookings
        public void insertBookings()
        {

        }
        public void updateBookings()
        {

        }
        public void removeBookings()
        {

        }
        public void selectBookings()
        {

        }

        //room
        public void insertRooms()
        {

        }
        public void updateRooms()
        {

        }
        public void removeRooms()
        {

        }
        public void selectRooms()
        {

        }

    }
}