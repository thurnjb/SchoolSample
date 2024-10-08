﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*Jay Thurn, Ryan Booth, John Lee
Our submission of this assignment indicates that we have neither received nor given unauthorized assistance in writing this program. All design and coding is our own work.*/

namespace Lab3
{
    public class Customer
    {
        //Data Fields
        private String name;
        private String email;
        private String phone;
        private String address;
        public int customerID { get; set; }

        private static int nextID = 5;

        //Constructors
        public Customer(String name, String email, String phone, String address)
        {
            this.name = name;
            this.email = email;
            this.phone = phone;
            this.address = address;
            this.customerID = nextID++;
        }

        //Methods 
        //Properties

        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                this.name = value;
            }
        }

        public string Email
        {
            get
            {
                return this.email;
            }
            set
            {
                this.email = value;
            }
        }

        public string Phone
        {
            get
            {
                return this.phone;
            }
            set
            {
                this.phone = value;
            }
        }
        public string Address
        {
            get
            {
                return this.address;
            }
            set
            {
                this.address = value;
            }
        }
    }
}