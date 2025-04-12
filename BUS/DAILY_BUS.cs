using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
namespace BUS
{
    public class DAILY_BUS
    {
        DAILY_DAL DAILYobj = new DAL.DAILY_DAL();
        public DataTable GetDAILY()
        {
            return DAILYobj.GetAllDAILY();
        }
    }
}
