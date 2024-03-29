﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Field
    {
        public Field()
        {
            BookingField = new HashSet<BookingField>();
            OrderField = new HashSet<OrderField>();
            OrderItemField = new HashSet<OrderItemField>();
            ProductField = new HashSet<ProductField>();
        }

        [Key]
        public long id { get; set; }
        public long? idSupplier { get; set; }
        [Required]
        [StringLength(4)]
        public string typeApply { get; set; }
        [Required]
        [StringLength(100)]
        public string name { get; set; }
        [Required]
        [StringLength(4)]
        public string dataType { get; set; }
        public string listValue { get; set; }

        [InverseProperty("idFieldNavigation")]
        public virtual ICollection<BookingField> BookingField { get; set; }
        [InverseProperty("idFieldNavigation")]
        public virtual ICollection<OrderField> OrderField { get; set; }
        [InverseProperty("idFieldNavigation")]
        public virtual ICollection<OrderItemField> OrderItemField { get; set; }
        [InverseProperty("idFieldNavigation")]
        public virtual ICollection<ProductField> ProductField { get; set; }
    }
}