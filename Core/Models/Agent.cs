﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Agent
    {
        public Agent()
        {
            ProductNego = new HashSet<ProductNego>();
        }

        [Key]
        public long idAgent { get; set; }
        [Required]
        public bool? isPrivate { get; set; }
        [StringLength(100)]
        public string nameAgent { get; set; }
        [StringLength(100)]
        public string codeAgent { get; set; }
        [StringLength(100)]
        public string nameFirst { get; set; }
        [StringLength(100)]
        public string nameLast { get; set; }
        [StringLength(200)]
        public string email { get; set; }
        [StringLength(100)]
        public string tel { get; set; }
        [StringLength(200)]
        public string website { get; set; }
        [StringLength(4)]
        public string typeAgent { get; set; }
        public string address { get; set; }
        public short rateComm { get; set; }
        [StringLength(4)]
        public string typePayment { get; set; }
        [StringLength(200)]
        public string emailBilling { get; set; }
        [StringLength(1000)]
        public string noteBill { get; set; }
        [StringLength(100)]
        public string companyBilling { get; set; }
        [StringLength(100)]
        public string userBilling { get; set; }
        [Required]
        public bool? isEditOrder { get; set; }
        [Required]
        public bool? isEditOrderPrice { get; set; }
        public long? idSupplier { get; set; }

        [ForeignKey(nameof(idAgent))]
        [InverseProperty(nameof(Party.Agent))]
        public virtual Party idAgentNavigation { get; set; }
        [InverseProperty("idAgentNavigation")]
        public virtual ICollection<ProductNego> ProductNego { get; set; }
    }
}