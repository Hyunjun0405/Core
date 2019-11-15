﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class PartyContact
    {
        [Key]
        public long idParty { get; set; }
        [Key]
        [StringLength(4)]
        public string typeContact { get; set; }
        [Required]
        [StringLength(200)]
        public string contact { get; set; }

        [ForeignKey(nameof(idParty))]
        [InverseProperty(nameof(Party.PartyContact))]
        public virtual Party idPartyNavigation { get; set; }
    }
}