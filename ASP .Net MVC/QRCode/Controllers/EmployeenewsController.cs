using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Windows.Markup;
using iTextSharp.text;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using QRCode.Models;
using ZXing;
using ZXing.Common;

namespace QRCode.Controllers
{
    public class EmployeenewsController : Controller
    {
        private AdityaPracticeEntities db = new AdityaPracticeEntities();

        // GET: Employeenews
        public ActionResult Index()
        {
            return View(db.Employeenews.ToList());
        }

        // GET: Employeenews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employeenew employeenew = db.Employeenews.Find(id);
            if (employeenew == null)
            {
                return HttpNotFound();
            }
            return View(employeenew);
        }

        // GET: Employeenews/Create
        public ActionResult Create()
        {
            return View();
        }

        public ActionResult Scanner()
        {
            return View();
        }

        // POST: Employeenews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FullName,Gender,Age,HireDate,EmailAddress,Salary,PersonalWebSite,QRCode")] Employeenew employeenew)
        {
                string a = GenerateQRCode("a");
            if (ModelState.IsValid)
            {
                db.Employeenews.Add(employeenew);
                db.SaveChanges();

                employeenew.QRCode = GenerateQRCode(employeenew);


                // Update the database with the generated QR code
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            return View(employeenew);
        }

        // GET: Employeenews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employeenew employeenew = db.Employeenews.Find(id);
            if (employeenew == null)
            {
                return HttpNotFound();
            }
            return View(employeenew);
        }

        // POST: Employeenews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FullName,Gender,Age,HireDate,EmailAddress,Salary,PersonalWebSite,QRCode")] Employeenew employeenew)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employeenew).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(employeenew);
        }

        // GET: Employeenews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employeenew employeenew = db.Employeenews.Find(id);
            if (employeenew == null)
            {
                return HttpNotFound();
            }
            return View(employeenew);
        }

        // POST: Employeenews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employeenew employeenew = db.Employeenews.Find(id);
            db.Employeenews.Remove(employeenew);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        private string GenerateQRCode(string qrData)
        {
            //// Create a BarcodeWriter instance
            //BarcodeWriter barcodeWriter = new BarcodeWriter();
            //barcodeWriter.Format = BarcodeFormat.QR_CODE;

            //// Write the QR code content
            //var qrCodeBitmap = barcodeWriter.Write(qrData);

            //// Convert the QR code to a bitmap
            //Bitmap qrCodeImage = new Bitmap(qrCodeBitmap);

            //// Save the QR code image to a file
            //string filePath = $"~/QRCodes/{Guid.NewGuid()}_QRCode.png"; // Unique file name
            //qrCodeImage.Save(Server.MapPath(filePath));

            //// Return the file path
            //return filePath;

            // Create a BarcodeWriter instance
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;

            // Set encoding options for customizing QR code
            EncodingOptions options = new EncodingOptions();
            options.Width = 450; // Set width of QR code
            options.Height = 450; // Set height of QR code
            options.NoPadding = true; // Disable padding
            barcodeWriter.Options = options;

            // Generate QR code image
            BitMatrix qrCode = barcodeWriter.Encode(qrData);

            // Convert BitMatrix to bitmap
            Bitmap qrCodeBitmap = barcodeWriter.Write(qrCode);

            // Save the QR code image to a file
            //qrCodeBitmap.Save(filePath);

            // Save the QR code image to a file
            string filePath = $"~/QRCodes/{Guid.NewGuid()}_QRCode.png"; // Unique file name
            qrCodeBitmap.Save(Server.MapPath(filePath));

            // Return the file path
            return filePath;
        }


        private string GenerateQRCode(Employeenew employee)
        {
            // Create a BarcodeWriter instance
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;

            // Create a QR code data
            //var qrCodeData = barcodeWriter.Write($"EmployeeID:{employee.Id},Salary:{employee.Salary},Gender:{employee.Gender}");

            var qrCodeData = new
            {
                Id = employee.Id,
                Salary = employee.Salary,
                Gender = employee.Gender
            };
            var qrCodeContent = JsonConvert.SerializeObject(qrCodeData);
            var qrCodeBitmap = barcodeWriter.Write(qrCodeContent);

            // Convert the QR code to a bitmap
            Bitmap qrCodeImage = new Bitmap(qrCodeBitmap);

            // Save the QR code image to a file
            string filePath = $"~/QRCodes/{employee.Id}_QRCode.png"; // Adjust the file path as needed
            qrCodeImage.Save(Server.MapPath(filePath));

            // Return the file path
            return filePath;
        }

        [HttpGet]
        public ActionResult ScanQR_Get()
        {

            var cookieValue = Request.Cookies["employeeData"]?.Value;

            Employeenew employeeObject = JsonConvert.DeserializeObject<Employeenew>(Uri.UnescapeDataString(cookieValue));

            return View("ScanQR");
            //return Json(new { success = true, message = "Employee data processed successfully" });
        }

        [HttpPost]
        public ActionResult ScanQR(Employeenew employee)
        {
            //return View();
            return Json(new { success = true,employee, message = "Employee data processed successfully" });
        }

        public ActionResult PrintInvoice()
        {
            MemoryStream ms = new MemoryStream();
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, ms);
            document.Open();

            // Add content to the PDF
            iTextSharp.text.Font regularFont = FontFactory.GetFont(FontFactory.COURIER, 8);
            iTextSharp.text.Font titleFont = FontFactory.GetFont(FontFactory.COURIER, 14);

            document.Add(new Paragraph("----------------------------------------", regularFont));
            document.Add(new Paragraph("Item Name".PadRight(30) + "Price", regularFont));
            document.Add(new Paragraph("----------------------------------------", regularFont));

            document.Close();
            writer.Close();

            // Send the PDF to the browser
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Invoice.pdf");
            Response.OutputStream.Write(ms.GetBuffer(), 0, ms.GetBuffer().Length);
            Response.OutputStream.Flush();
            Response.OutputStream.Close();
            Response.End();

            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }   
    }
}
