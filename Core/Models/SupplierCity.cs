﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class SupplierCity
    {
        [Key]
        public long idSupplier { get; set; }
        [Key]
        public long idCity { get; set; }

        [ForeignKey(nameof(idCity))]
        [InverseProperty(nameof(City.SupplierCity))]
        public virtual City idCityNavigation { get; set; }
        [ForeignKey(nameof(idSupplier))]
        [InverseProperty(nameof(Supplier.SupplierCity))]
        public virtual Supplier idSupplierNavigation { get; set; }
    }
}