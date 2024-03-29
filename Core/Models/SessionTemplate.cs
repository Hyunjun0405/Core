﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class SessionTemplate
    {
        public SessionTemplate()
        {
            ProductSession = new HashSet<ProductSession>();
            SessionTemplateWeek = new HashSet<SessionTemplateWeek>();
        }

        [Key]
        public long id { get; set; }
        public long idProduct { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime datetimeStart { get; set; }
        public short minuteDuration { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime datetimeFinish { get; set; }
        [Required]
        [StringLength(4)]
        public string timetypeRepeat { get; set; }
        public short valueRepeat { get; set; }
        [Column(TypeName = "date")]
        public DateTime dateRepeatStart { get; set; }
        [Column(TypeName = "date")]
        public DateTime dateRepeatEnd { get; set; }

        [ForeignKey(nameof(idProduct))]
        [InverseProperty(nameof(Product.SessionTemplate))]
        public virtual Product idProductNavigation { get; set; }
        [InverseProperty("idTemplateNavigation")]
        public virtual ICollection<ProductSession> ProductSession { get; set; }
        [InverseProperty("idTemplateNavigation")]
        public virtual ICollection<SessionTemplateWeek> SessionTemplateWeek { get; set; }
    }
}