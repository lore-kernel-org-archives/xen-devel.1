From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/sched: Remove d->is_pinned
Date: Mon, 1 Apr 2019 13:35:36 +0100
Message-ID: <06b8d55a-89c1-7456-43d8-c0ccceea524c@citrix.com>
References: <1554113345-15068-1-git-send-email-andrew.cooper3@citrix.com>
 <5CA2025B020000780022397B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3527928310358509691=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CA2025B020000780022397B@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Dario Faggioli <dfaggioli@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============3527928310358509691==
Content-Type: multipart/alternative;
	boundary="------------EEAA0F3067376E9D889296A9"
Content-Language: en-GB

--------------EEAA0F3067376E9D889296A9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 01/04/2019 13:21, Jan Beulich wrote:
>>>> On 01.04.19 at 12:09, <andrew.cooper3@citrix.com> wrote:
>> 3) cpumask_weight() is a surprisingly expensive function, and we use it all
>>    over the place.  It will almost certainly benefit from the use of popcnt.
> FTR this was something I was meaning to possibly do once the BMI2
> alternatives patching series would have been accepted. It having
> got rejected (and also the fsgsbase patching one, but that's moot
> now anyway due to selection of insn having become dependent on a
> runtime property), I've stopped all considerations towards further
> alternatives. While there wouldn't be as many helper functions
> needed here as they were needed there, our basic disagreement
> as to whether to use per-register helper functions would continue
> to exist.

The Linux way of fixing this is actually very neat.

Depending on the CPU, there may genuinely be a call to a software
routine, or a single popcnt instruction.  Therefore, the end result is:

asm (ALTERNATIVE("call __sw_hweight64",
                 "popcnt %[in], %[out]", X86_FEATURE_POPCNT)
                 : [out] "=a" (res),
                 : [in] "=D" (w));


etc.  I also note that Linux now has a more optimised sofware version
for x86 and Arm64, due to the architecture selecting
CONFIG_ARCH_HAS_FAST_MULTIPLIER

>
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -1229,7 +1229,7 @@ arch_do_vcpu_op(
>>          struct vcpu_get_physid cpu_id;
>>  
>>          rc = -EINVAL;
>> -        if ( !is_pinned_vcpu(v) )
>> +        if ( !is_hwdom_pinned_vcpu(v) )
>>              break;
> I think the idea here was to allow eventual use of this in a highly
> disaggregated environment by other than Dom0. But this is not
> to say that I would mind this change; in fact

I suppose that usecase is fine in principle, but should come with some
suitable XSM.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

--------------EEAA0F3067376E9D889296A9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 01/04/2019 13:21, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5CA2025B020000780022397B@prv1-mh.provo.novell.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 01.04.19 at 12:09, <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> wrote:
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">3) cpumask_weight() is a surprisingly expensive function, and we use it all
   over the place.  It will almost certainly benefit from the use of popcnt.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
FTR this was something I was meaning to possibly do once the BMI2
alternatives patching series would have been accepted. It having
got rejected (and also the fsgsbase patching one, but that's moot
now anyway due to selection of insn having become dependent on a
runtime property), I've stopped all considerations towards further
alternatives. While there wouldn't be as many helper functions
needed here as they were needed there, our basic disagreement
as to whether to use per-register helper functions would continue
to exist.</pre>
    </blockquote>
    <br>
    The Linux way of fixing this is actually very neat.<br>
    <br>
    Depending on the CPU, there may genuinely be a call to a software
    routine, or a single popcnt instruction.  Therefore, the end result
    is:<br>
    <br>
    <pre>asm (ALTERNATIVE("call __sw_hweight64",
                 "popcnt %[in], %[out]", X86_FEATURE_POPCNT)
                 : [out] "=a" (res),
                 : [in] "=D" (w));
</pre>
    <br>
    etc.  I also note that Linux now has a more optimised sofware
    version for x86 and Arm64, due to the architecture selecting
    CONFIG_ARCH_HAS_FAST_MULTIPLIER<br>
    <br>
    <blockquote type="cite"
      cite="mid:5CA2025B020000780022397B@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1229,7 +1229,7 @@ arch_do_vcpu_op(
         struct vcpu_get_physid cpu_id;
 
         rc = -EINVAL;
-        if ( !is_pinned_vcpu(v) )
+        if ( !is_hwdom_pinned_vcpu(v) )
             break;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I think the idea here was to allow eventual use of this in a highly
disaggregated environment by other than Dom0. But this is not
to say that I would mind this change; in fact</pre>
    </blockquote>
    <br>
    I suppose that usecase is fine in principle, but should come with
    some suitable XSM.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5CA2025B020000780022397B@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <br>
    Thanks,<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------EEAA0F3067376E9D889296A9--


--===============3527928310358509691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3527928310358509691==--
