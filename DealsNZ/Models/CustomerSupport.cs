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
    
    public partial class CustomerSupport
    {
        public int CustomerSupportID { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerIssueSubject { get; set; }
        public string CustomerIssue { get; set; }
        public int IssueStage { get; set; }
        public Nullable<System.DateTime> AddedOn { get; set; }
        public string AdminResponse { get; set; }
    }
}
