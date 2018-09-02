From: Spencer Michaels <sxmichaels@gmail.com>
Subject: Event monitoring support for PV guests
Date: Sun, 2 Sep 2018 15:10:35 -0400
Message-ID: <CAMf-k8EWH=R-O3fC0ywEwVxfQkujyHAsS_CuvLMJJv6_Nw18sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3296218762728998017=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i0qy=lq=gmail.com=sxmichaels@srs-us1.protection.inumbo.net>)
 id 1fwXlo-0002Ox-N8
 for xen-devel@lists.xenproject.org; Sun, 02 Sep 2018 19:10:48 +0000
Received: by mail-pg1-x52d.google.com with SMTP id d19-v6so7610872pgv.1
 for <xen-devel@lists.xenproject.org>; Sun, 02 Sep 2018 12:10:46 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3296218762728998017==
Content-Type: multipart/alternative; boundary="0000000000008f7ad60574e82e66"

--0000000000008f7ad60574e82e66
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm currently doing some research that involves examining the behavior of
native code on paravirtualized Xen guests. gdbsx has proven somewhat limited
for my use case, in large part due to the very limitations I describe
below, so
I have been writing my own application with some debugging capabilities to
interface with the guests.

I have found, however, that quite a few major debugging features ---
chiefly,
breakpoints and single-step mode --- do not appear to be supported for PV
guests. Looking through the source of Xen itself seems to confirm this [1].
It
looks like the root cause of this is a lack of event monitoring support for
PV
guests, however, I have not been able to find much information online about
whether or not there are other ways to do what I want.

Is there any other way that I can use trap-based breakpoints or single step
mode on PV guests (presumably without using the event monitoring API), or
does
Xen simply not support anything of the sort at the moment? If not, I might
take
a stab at adding support for it myself, but I'm not sure how complicated
that
would be.

Thanks,
Spencer


[1] For instance: to enable single-step mode, the `XEN_DOMCTL_debug_op`
syscall is
used; its implementation `xen/arch/x86/domctl.c:978` bails out if the guest
is
not HVM, and otherwise calls what `hvm_debug_op()`, clearly an HVM-specific
function. A similar trend appears to be the case for all the `xc_monitor_*`
functions, e.g. `xc_monitor_software_breakpoint()`, which uses the
`XC_DOMCTL_MONITOR_OP_ENABLE` domctl syscall. As best as I can tell, when
that
syscall is run, the VM's capabilities are checked at
`xen/common/monitor.c:53`,
and PV guests don't seem to have any monitoring capabilities.

--0000000000008f7ad60574e82e66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div><div>I&#39;=
m currently doing some research that involves examining the behavior of</di=
v><div>native code on paravirtualized Xen guests. gdbsx has proven somewhat=
 limited</div><div>for my use case, in large part due to the very limitatio=
ns I describe below, so</div><div>I have been writing my own application wi=
th some debugging capabilities to</div><div>interface with the guests.</div=
></div><div><br></div><div>I have found, however, that quite a few major de=
bugging features --- chiefly,</div><div>breakpoints and single-step mode --=
- do not appear to be supported for PV</div><div>guests. Looking through th=
e source of Xen itself seems to confirm this [1]. It</div><div>looks like t=
he root cause of this is a lack of event monitoring support for PV</div><di=
v>guests, however, I have not been able to find much information online abo=
ut</div><div>whether or not there are other ways to do what I want.</div><d=
iv><br></div><div><div>Is there any other way that I can use trap-based bre=
akpoints or single step</div><div>mode on PV guests (presumably without usi=
ng the event monitoring API), or does</div><div>Xen simply not support anyt=
hing of the sort at the moment? If not, I might take</div><div>a stab at ad=
ding support for it myself, but I&#39;m not sure how complicated that</div>=
<div>would be.</div></div><div><br></div><div>Thanks,</div><div>Spencer</di=
v><div><br></div><div><br></div><div>[1] For instance: to enable single-ste=
p mode, the `XEN_DOMCTL_debug_op` syscall is</div><div>used; its implementa=
tion `xen/arch/x86/domctl.c:978` bails out if the guest is</div><div>not HV=
M, and otherwise calls what `hvm_debug_op()`, clearly an HVM-specific</div>=
<div>function. A similar trend appears to be the case for all the `xc_monit=
or_*`</div><div>functions, e.g. `xc_monitor_software_breakpoint()`, which u=
ses the</div><div>`XC_DOMCTL_MONITOR_OP_ENABLE` domctl syscall. As best as =
I can tell, when that</div><div>syscall is run, the VM&#39;s capabilities a=
re checked at `xen/common/monitor.c:53`,</div><div>and PV guests don&#39;t =
seem to have any monitoring capabilities.</div><div><br></div></div></div><=
/div></div></div></div>

--0000000000008f7ad60574e82e66--


--===============3296218762728998017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3296218762728998017==--
