//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Address
    {
        public int AddressId { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Street { get; set; }
        public Nullable<int> StoreId { get; set; }
    
        public virtual Store Store { get; set; }
    }
}
