﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Message
    {
        [Key]
        public long idSupplier { get; set; }
        [Key]
        [StringLength(4)]
        public string typePurpose { get; set; }
        [Key]
        [StringLength(4)]
        public string typeSend { get; set; }
        [Required]
        public bool? isIntroductionText { get; set; }
        public string introductionText { get; set; }
        [Required]
        public bool? isConclusionText { get; set; }
        public string conclusionText { get; set; }
        [Required]
        public bool? isAttachFile { get; set; }
        [Required]
        public bool? isSend { get; set; }
        [StringLength(4)]
        public string timetypeSend { get; set; }
        public short valueSend { get; set; }
        [StringLength(4)]
        public string typeTimeBase { get; set; }
        [Column(TypeName = "numeric(12, 2)")]
        public decimal ratePayment { get; set; }

        [ForeignKey(nameof(idSupplier))]
        [InverseProperty(nameof(Supplier.Message))]
        public virtual Supplier idSupplierNavigation { get; set; }
    }
}