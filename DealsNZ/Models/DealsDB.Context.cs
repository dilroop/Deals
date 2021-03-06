﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DealsNZ.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DealsDB : DbContext
    {
        public DealsDB()
            : base("name=DealsDB")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Card> Cards { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<CustomerSupport> CustomerSupports { get; set; }
        public virtual DbSet<DealImage> DealImages { get; set; }
        public virtual DbSet<LogTracker> LogTrackers { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<Store> Stores { get; set; }
        public virtual DbSet<Subscription> Subscriptions { get; set; }
        public virtual DbSet<UserSubscrition> UserSubscritions { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
        public virtual DbSet<UserVerification> UserVerifications { get; set; }
        public virtual DbSet<Wallet> Wallets { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<UserProfile> UserProfiles { get; set; }
        public virtual DbSet<Coupon> Coupons { get; set; }
        public virtual DbSet<Deal> Deals { get; set; }
        public virtual DbSet<WishList> WishLists { get; set; }
    }
}
