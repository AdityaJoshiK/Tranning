using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TranningMVCApp.Models
{
    [Table("Products")]
    public class ProductModel
    {
        [Key]
        public int ProductID { get; set; }

        [Required(ErrorMessage = "Product Name is required")]
        [StringLength(50, ErrorMessage = "Product Name should be no more than 50 characters")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Price is required")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Price must be greater than 0")]
        public decimal Price { get; set; }

        [Required(ErrorMessage = "Quantity is required")]
        [Range(1, int.MaxValue, ErrorMessage = "Quantity must be greater than 0")]
        public int Quantity { get; set; }

        [StringLength(50, ErrorMessage = "Brand should be no more than 50 characters")]
        public string Brand { get; set; }

        public bool Availability { get; set; }

        //[StringLength(50, ErrorMessage = "Category should be no more than 50 characters")]
        public string Category { get; set; }
    }
}