using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Spire.Barcode;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;

/// <summary>
/// BarcodeGenerator 的摘要说明
/// </summary>
public static class MyBarcodeGenerator
{
    public static Image Generate(string barcode)
    {
        var settings = new BarcodeSettings
        {
            Type = BarCodeType.EAN13,
            Data = barcode,
            UseChecksum = CheckSumMode.ForceEnable,
            ShowTextOnBottom = true,
            TextAlignment = StringAlignment.Center
        };
        var generator = new BarCodeGenerator(settings);
        Image barcodeImage = generator.GenerateImage();
        return barcodeImage;
    }

    public static void ShowBarcode(string barcode, HttpResponse response)
    {
        Image barcodeImage = Generate(barcode);

        var barcodeBitmap = new Bitmap(barcodeImage);
        var memoryStream = new MemoryStream();
        barcodeImage.Save(memoryStream, ImageFormat.Bmp);

        response.Clear();
        response.ContentType = "image/bmp";
        response.BinaryWrite(memoryStream.ToArray());

        memoryStream.Close();
        memoryStream.Dispose();
        barcodeImage.Dispose();
    }
}