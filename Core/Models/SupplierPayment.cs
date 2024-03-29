﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class SupplierPayment
    {
        [Key]
        public long idSupplier { get; set; }
        [Key]
        [StringLength(4)]
        public string typePayment { get; set; }

        [ForeignKey(nameof(idSupplier))]
        [InverseProperty(nameof(Supplier.SupplierPayment))]
        public virtual Supplier idSupplierNavigation { get; set; }
    }
}