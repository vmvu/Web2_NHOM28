using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopWeb.Startup))]
namespace ShopWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
