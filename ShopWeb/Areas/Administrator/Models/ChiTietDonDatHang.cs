//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShopWeb.Areas.Administrator.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChiTietDonDatHang
    {
        public string MaChiTietDonDatHang { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<int> GiaBan { get; set; }
        public string MaDonDatHang { get; set; }
        public Nullable<int> MaSanPham { get; set; }
    
        public virtual DonDatHang DonDatHang { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}
