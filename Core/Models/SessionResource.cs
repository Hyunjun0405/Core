﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class SessionResource
    {
        public SessionResource()
        {
            OrderItemResource = new HashSet<OrderItemResource>();
        }

        [Key]
        public long idResource { get; set; }
        [Key]
        public long idSession { get; set; }
        public short quantityMax { get; set; }
        public short quantityUsed { get; set; }

        [ForeignKey(nameof(idResource))]
        [InverseProperty(nameof(Resource.SessionResource))]
        public virtual Resource idResourceNavigation { get; set; }
        [ForeignKey(nameof(idSession))]
        [InverseProperty(nameof(ProductSession.SessionResource))]
        public virtual ProductSession idSessionNavigation { get; set; }
        [InverseProperty("idNavigation")]
        public virtual ICollection<OrderItemResource> OrderItemResource { get; set; }
    }
}