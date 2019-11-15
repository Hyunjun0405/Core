﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class NegotiatedRate
    {
        public NegotiatedRate()
        {
            ProductNego = new HashSet<ProductNego>();
        }

        [Key]
        [StringLength(100)]
        public string name { get; set; }
        [Key]
        public long idSupplier { get; set; }

        [InverseProperty("NegotiatedRate")]
        public virtual ICollection<ProductNego> ProductNego { get; set; }
    }
}