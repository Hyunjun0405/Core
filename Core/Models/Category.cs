﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Category
    {
        public Category()
        {
            ProductCategory = new HashSet<ProductCategory>();
        }

        [Key]
        public long id { get; set; }
        public long idSupplier { get; set; }
        [Required]
        [StringLength(100)]
        public string name { get; set; }
        [StringLength(1000)]
        public string description { get; set; }
        [Required]
        public bool? isShow { get; set; }

        [InverseProperty("idCategoryNavigation")]
        public virtual ICollection<ProductCategory> ProductCategory { get; set; }
    }
}