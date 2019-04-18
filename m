From: Dylanger Daly <dylanger@thegrail.co>
Subject: Re: [PATCH] Add Undervolt MSRs to wrmsr function.
Date: Thu, 18 Apr 2019 10:19:34 +0100
Message-ID: <CANJ4vQ1nOuFZw0kk0dWEsx4Q0h8YE2H8gRzg422cRf65FAkncg@mail.gmail.com>
References: <20190418085634.3629-1-dylanger@thegrail.co>
 <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3823579359462117102=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <53b32c69-b0b4-5441-c8e2-299769eabf8f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Dylanger Daly <dylanger@thegrail.co>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============3823579359462117102==
Content-Type: multipart/alternative; boundary="000000000000d20a3e0586ca80c5"

--000000000000d20a3e0586ca80c5
Content-Type: text/plain; charset="UTF-8"

No worries Andrew, it was my first patch, thank you for the response.

It's based on Xen 4.8

Dom0 should be controlling it, but I wasn't aware of the Security
implications.

The scope isn't well documented:
 https://ressman.org/posts/2018-06-26-voltage-temperature-tdp-thinkpad/

More experimental as it worked with my Laptop.

Thank you for your time


On Thu, Apr 18, 2019, 10:09 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 18/04/2019 09:56, Dylanger Daly wrote:
> > Giving Laptop Users the ability to Undervolt and change Temp Throttle
> Limits.
> >
> > Signed-off-by: Dylanger Daly <dylanger@thegrail.co>
>
> Thankyou for the patch.  Which version of Xen is it against?  It is
> fairly old, given that the function you patch has now moved to
> arch/x86/pv/emul-priv-op.c.  Furthermore, this is the legacy path, so
> the functions this should be added to are guest_{rdmsr,wrmsr}() in
> arch/x86/msr.c
>
> What entity is controlling this?
>
> Sadly, there are a number of issues.  You open these MSRs up to
> unprivileged domUs, and there is a mismatch between the vcpus/pcpus.
>
> What is the scope of these MSRs?  I guess dom0 is going to write them on
> all cores, but as dom0 gets scheduled around, this wont match up with
> the pcpus across the host.
>
> ~Andrew
>

--000000000000d20a3e0586ca80c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No worries Andrew, it was my first patch, thank you for t=
he response.<div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s based on=
 Xen 4.8</div><div dir=3D"auto"><br></div><div dir=3D"auto">Dom0 should be =
controlling it, but I wasn&#39;t aware of the Security implications.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">The scope isn&#39;t well docum=
ented:</div><div dir=3D"auto">=C2=A0<a href=3D"https://ressman.org/posts/20=
18-06-26-voltage-temperature-tdp-thinkpad/">https://ressman.org/posts/2018-=
06-26-voltage-temperature-tdp-thinkpad/</a></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">More experimental as it worked with my Laptop.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thank you for your time</div><br=
><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Apr 18, 2019, 10:09 AM Andrew Cooper &lt;<a href=3D"mailto:=
andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 18/04/2019 09:56, Dylanger Daly wrote:<=
br>
&gt; Giving Laptop Users the ability to Undervolt and change Temp Throttle =
Limits.<br>
&gt;<br>
&gt; Signed-off-by: Dylanger Daly &lt;<a href=3D"mailto:dylanger@thegrail.c=
o" target=3D"_blank" rel=3D"noreferrer">dylanger@thegrail.co</a>&gt;<br>
<br>
Thankyou for the patch.=C2=A0 Which version of Xen is it against?=C2=A0 It =
is<br>
fairly old, given that the function you patch has now moved to<br>
arch/x86/pv/emul-priv-op.c.=C2=A0 Furthermore, this is the legacy path, so<=
br>
the functions this should be added to are guest_{rdmsr,wrmsr}() in<br>
arch/x86/msr.c<br>
<br>
What entity is controlling this?<br>
<br>
Sadly, there are a number of issues.=C2=A0 You open these MSRs up to<br>
unprivileged domUs, and there is a mismatch between the vcpus/pcpus.<br>
<br>
What is the scope of these MSRs?=C2=A0 I guess dom0 is going to write them =
on<br>
all cores, but as dom0 gets scheduled around, this wont match up with<br>
the pcpus across the host.<br>
<br>
~Andrew<br>
</blockquote></div></div>

--000000000000d20a3e0586ca80c5--


--===============3823579359462117102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3823579359462117102==--
