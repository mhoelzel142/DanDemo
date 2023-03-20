using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsSandbox
{
    public partial class WebcamTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void UploadImage(string imageData)
        {
            // Do whatever you want with imageData here
            if (imageData.IndexOf(',') > -1)
            {
                var base64string = imageData.Split(',')[1];
                var imgBytes = Convert.FromBase64String(base64string);
                // Save imgBytes to database
                // Context.Images.Add(new Image() {imgBytes});
                // Context.SaveChangesAsync()
            }
        }
    }
}