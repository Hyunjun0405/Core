﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class ProductNego
    {
        [Key]
        public long idSupplier { get; set; }
        [Key]
        [StringLength(100)]
        public string nameNego { get; set; }
        [Key]
        public long idProduct { get; set; }
        [Key]
        [StringLength(4)]
        public string typePriceOption { get; set; }
        [Key]
        public long idAgent { get; set; }
        [Column(TypeName = "numeric(12, 2)")]
        public decimal rateComm { get; set; }

        [ForeignKey("nameNego,idSupplier")]
        [InverseProperty("ProductNego")]
        public virtual NegotiatedRate NegotiatedRate { get; set; }
        [ForeignKey(nameof(idAgent))]
        [InverseProperty(nameof(Agent.ProductNego))]
        public virtual Agent idAgentNavigation { get; set; }
    }
}