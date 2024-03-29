﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class ProductTag
    {
        [Key]
        public long idProduct { get; set; }
        [Key]
        [StringLength(4)]
        public string typeTag { get; set; }
        [Key]
        [StringLength(100)]
        public string tag { get; set; }

        [ForeignKey(nameof(idProduct))]
        [InverseProperty(nameof(Product.ProductTag))]
        public virtual Product idProductNavigation { get; set; }
    }
}