using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace $rootnamespace$.CodeGuard.Internals
{
    public class AccumulateErrorsArg<T> : ArgBaseExpression<T>
    {

        public AccumulateErrorsArg(Expression<Func<T>> argument) : base(argument)
        {
            this.Message = new SaveMessageHandler<T>(this);
        }

        public AccumulateErrorsArg(T argument) : base(argument)
        {
            this.Message = new SaveMessageHandler<T>(this);
            this.Value = argument;
        }

        public override IEnumerable<ErrorInfo> Errors
        {
            get { return ((SaveMessageHandler<T>) this.Message).GetResult(); }
        }
    }
}
