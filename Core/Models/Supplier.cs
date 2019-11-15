﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            Message = new HashSet<Message>();
            SupplierCity = new HashSet<SupplierCity>();
            SupplierPayment = new HashSet<SupplierPayment>();
            Surcharge = new HashSet<Surcharge>();
            User = new HashSet<User>();
        }

        [Key]
        public long idSupplier { get; set; }
        [Required]
        [StringLength(100)]
        public string name { get; set; }
        [StringLength(200)]
        public string urlWebsite { get; set; }
        [StringLength(200)]
        public string urlHost { get; set; }
        [StringLength(4)]
        public string typeBusiness { get; set; }
        public string listCity { get; set; }
        [Required]
        [StringLength(100)]
        public string firstName { get; set; }
        [Required]
        [StringLength(100)]
        public string lastName { get; set; }
        [Required]
        [StringLength(200)]
        public string email { get; set; }
        [StringLength(20)]
        public string phone { get; set; }
        [StringLength(20)]
        public string mobile { get; set; }
        [StringLength(20)]
        public string fax { get; set; }
        [StringLength(1000)]
        public string openingHours { get; set; }
        [StringLength(20)]
        public string businessNumber { get; set; }
        [StringLength(2000)]
        public string description { get; set; }
        [StringLength(200)]
        public string urlLogo { get; set; }
        [StringLength(100)]
        public string youtubeID { get; set; }
        [StringLength(100)]
        public string continent { get; set; }
        [StringLength(100)]
        public string country { get; set; }
        [StringLength(100)]
        public string city { get; set; }
        [StringLength(10)]
        public string postcode { get; set; }
        [StringLength(20)]
        public string latitude { get; set; }
        [StringLength(20)]
        public string longitude { get; set; }
        [StringLength(200)]
        public string urlFacebook { get; set; }
        [StringLength(200)]
        public string urlTwitter { get; set; }
        [StringLength(200)]
        public string urlYoutube { get; set; }
        [StringLength(200)]
        public string urlGoogle { get; set; }
        [StringLength(200)]
        public string urlInstagram { get; set; }
        [StringLength(200)]
        public string urlPinterest { get; set; }
        [StringLength(200)]
        public string urlTripadvisor { get; set; }
        [StringLength(4)]
        public string typeDepoist { get; set; }
        public string term { get; set; }
        public string privacyPolicy { get; set; }
        [Required]
        public bool? isExplicitConsent { get; set; }
        [StringLength(4)]
        public string language { get; set; }
        [StringLength(4)]
        public string timezone { get; set; }
        public short weekStartNo { get; set; }
        [StringLength(4)]
        public string currency { get; set; }
        public string listTypePayment { get; set; }
        [Required]
        public bool? isIncludeOrderFee { get; set; }
        [Column(TypeName = "numeric(12, 2)")]
        public decimal rateDeposit { get; set; }
        [Required]
        public bool? isPaymentFull { get; set; }
        [Required]
        public bool? isMinPayment { get; set; }
        public short dayMinPayment { get; set; }

        [ForeignKey(nameof(idSupplier))]
        [InverseProperty(nameof(Party.Supplier))]
        public virtual Party idSupplierNavigation { get; set; }
        [InverseProperty("idSupplierNavigation")]
        public virtual MessageTemplate MessageTemplate { get; set; }
        [InverseProperty("idSupplierNavigation")]
        public virtual ICollection<Message> Message { get; set; }
        [InverseProperty("idSupplierNavigation")]
        public virtual ICollection<SupplierCity> SupplierCity { get; set; }
        [InverseProperty("idSupplierNavigation")]
        public virtual ICollection<SupplierPayment> SupplierPayment { get; set; }
        [InverseProperty("idSupplierNavigation")]
        public virtual ICollection<Surcharge> Surcharge { get; set; }
        [InverseProperty("idSupplierNavigation")]
        public virtual ICollection<User> User { get; set; }
    }
}