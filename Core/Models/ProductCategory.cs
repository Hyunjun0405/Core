﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class ProductCategory
    {
        [Key]
        public long idCategory { get; set; }
        [Key]
        public long idProduct { get; set; }

        [ForeignKey(nameof(idCategory))]
        [InverseProperty(nameof(Category.ProductCategory))]
        public virtual Category idCategoryNavigation { get; set; }
        [ForeignKey(nameof(idProduct))]
        [InverseProperty(nameof(Product.ProductCategory))]
        public virtual Product idProductNavigation { get; set; }
    }
}