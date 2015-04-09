﻿using sync.today.activities;
using System;
using System.Activities;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sync.today.io.exchange.activities
{
    public sealed class Upload : BaseCodeActivity
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger
    (System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public InArgument<Models.ServiceAccountDTO> ServiceAccount { get; set; }
        public InArgument<bool> Ignore { get; set; }
        protected override void DoExecute(CodeActivityContext context)
        {
            devlog.Debug(string.Format("Entered for '{0}' and '{1}'", ServiceAccount, Ignore));
            var myServiceAccount = ServiceAccount.Get(context);
            var myIgnore = Ignore.Get(context);
            devlog.Debug(string.Format("Got for '{0}' and '{1}'", myServiceAccount, myIgnore));
            if (!myIgnore)
                ExchangeRepository.Upload(myServiceAccount);
        }

    }
}
