﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Core.Models
{
    public partial class Product
    {
        public Product()
        {
            BookingField = new HashSet<BookingField>();
            OrderItem = new HashSet<OrderItem>();
            PackageidProductNavigation = new HashSet<Package>();
            PackageidProductPartNavigation = new HashSet<Package>();
            PriceOption = new HashSet<PriceOption>();
            ProductCategory = new HashSet<ProductCategory>();
            ProductExtra = new HashSet<ProductExtra>();
            ProductField = new HashSet<ProductField>();
            ProductImage = new HashSet<ProductImage>();
            ProductRelatedidProduct1Navigation = new HashSet<ProductRelated>();
            ProductRelatedidProduct2Navigation = new HashSet<ProductRelated>();
            ProductSpot = new HashSet<ProductSpot>();
            ProductTag = new HashSet<ProductTag>();
            ProductVideo = new HashSet<ProductVideo>();
            Promotion = new HashSet<Promotion>();
            SessionTemplate = new HashSet<SessionTemplate>();
        }

        [Key]
        public long id { get; set; }
        public long idSupplier { get; set; }
        [Required]
        [StringLength(4)]
        public string typeProduct { get; set; }
        [Required]
        public bool? isPart { get; set; }
        [Required]
        [StringLength(100)]
        public string name { get; set; }
        [Required]
        [StringLength(20)]
        public string codeProduct { get; set; }
        public long priceAdvertise { get; set; }
        public short quantityMinSession { get; set; }
        public short quantityMinOrder { get; set; }
        public short quantityMaxOrder { get; set; }
        [Required]
        [StringLength(100)]
        public string quantityLabel { get; set; }
        [Required]
        [StringLength(100)]
        public string quantityLabelPlural { get; set; }
        [Required]
        [StringLength(1000)]
        public string descriptionShort { get; set; }
        [Required]
        [StringLength(4000)]
        public string descriptionLong { get; set; }
        [Required]
        public bool? isSpecialPayment { get; set; }
        [StringLength(4)]
        public string typeDepoist { get; set; }
        [Column(TypeName = "numeric(12, 2)")]
        public decimal rateDeposit { get; set; }
        [Required]
        public bool? isPaymentFull { get; set; }
        [Required]
        public bool? isMinPayment { get; set; }
        public short dayMinPayment { get; set; }
        [Required]
        public bool? isSpecialRule { get; set; }
        public string valueSpecialRule { get; set; }
        [Required]
        [StringLength(4)]
        public string typeSessionSchedule { get; set; }
        public string listTime { get; set; }
        [StringLength(4)]
        public string typeInventory { get; set; }
        [Required]
        public bool? isAllowWaiting { get; set; }
        [Required]
        public bool? isShowSeat { get; set; }
        [Required]
        [StringLength(4)]
        public string typeConfirm { get; set; }
        public short quantityAfter { get; set; }
        [Required]
        [StringLength(4)]
        public string timeTypeMiniumNotice { get; set; }
        public short valueMiniumNotice { get; set; }
        [Required]
        [StringLength(4)]
        public string timeTypeDuration { get; set; }
        public short valueDuration { get; set; }
        [Required]
        public bool? isAllday { get; set; }
        [Required]
        [StringLength(10)]
        public string productColor { get; set; }
        public long idSpotStart { get; set; }
        public long idSpotFinish { get; set; }
        public string listCity { get; set; }
        public string listSpot { get; set; }
        [StringLength(1000)]
        public string note { get; set; }
        public long? idPickup { get; set; }
        [Required]
        public bool? isIncludeExtra { get; set; }

        [ForeignKey(nameof(idPickup))]
        [InverseProperty(nameof(Pickup.Product))]
        public virtual Pickup idPickupNavigation { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ProductSurcharge ProductSurcharge { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<BookingField> BookingField { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<OrderItem> OrderItem { get; set; }
        [InverseProperty(nameof(Package.idProductNavigation))]
        public virtual ICollection<Package> PackageidProductNavigation { get; set; }
        [InverseProperty(nameof(Package.idProductPartNavigation))]
        public virtual ICollection<Package> PackageidProductPartNavigation { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<PriceOption> PriceOption { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductCategory> ProductCategory { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductExtra> ProductExtra { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductField> ProductField { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductImage> ProductImage { get; set; }
        [InverseProperty(nameof(ProductRelated.idProduct1Navigation))]
        public virtual ICollection<ProductRelated> ProductRelatedidProduct1Navigation { get; set; }
        [InverseProperty(nameof(ProductRelated.idProduct2Navigation))]
        public virtual ICollection<ProductRelated> ProductRelatedidProduct2Navigation { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductSpot> ProductSpot { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductTag> ProductTag { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<ProductVideo> ProductVideo { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<Promotion> Promotion { get; set; }
        [InverseProperty("idProductNavigation")]
        public virtual ICollection<SessionTemplate> SessionTemplate { get; set; }
    }
}