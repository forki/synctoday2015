﻿using System;
using System.Activities;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sync.today.activities.Appointments.Adapter
{
    public sealed class InsertAdapterAppointment : BaseCodeActivity
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger
    (System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public InArgument<Models.AdapterAppointmentDTO> adapterAppointment { get; set; }
        protected override void DoExecute(CodeActivityContext context)
        {
            devlog.Debug(string.Format("Entered for '{0}'", adapterAppointment));
            var myAdapterAppointment = adapterAppointment.Get(context);
            devlog.Debug(string.Format("would call for '{0}'", myAdapterAppointment));
            AdapterAppointmentRepository.InsertOrUpdate(myAdapterAppointment);
        }

    }
}

