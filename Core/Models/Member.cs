﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Member
    {
        public Member()
        {
            User = new HashSet<User>();
        }

        [Key]
        public long idParty { get; set; }
        [Required]
        [StringLength(100)]
        public string userID { get; set; }
        [Required]
        [StringLength(20)]
        public string userPWD { get; set; }
        [Required]
        [StringLength(100)]
        public string nickname { get; set; }
        [StringLength(200)]
        public string imageProfile { get; set; }

        [ForeignKey(nameof(idParty))]
        [InverseProperty(nameof(Party.Member))]
        public virtual Party idPartyNavigation { get; set; }
        [InverseProperty("idPartyNavigation")]
        public virtual ICollection<User> User { get; set; }
    }
}