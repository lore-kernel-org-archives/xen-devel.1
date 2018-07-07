From: Saeed Mirzamohammadi <saeed.mzmd@gmail.com>
Subject: Re: Routing physical interrupts to EL1
Date: Sat, 7 Jul 2018 12:32:02 -0700
Message-ID: <CALPKaJmxWGA2nQMoKeQqMtz55ZD7hQUxrEZHHAbsAdFN5F+aZg@mail.gmail.com>
References: <CALPKaJ=qbh0rLK+MC=fC966=D50+_3eOCTYbQcbCyqm1psaYcg@mail.gmail.com>
 <0eb78867-7802-f38a-0711-d5336b262d0f@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1387549702290119757=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qoml=jx=gmail.com=saeed.mzmd@srs-us1.protection.inumbo.net>)
 id 1fbsw9-0007O0-J0
 for xen-devel@lists.xenproject.org; Sat, 07 Jul 2018 19:32:05 +0000
Received: by mail-qk0-x244.google.com with SMTP id b5-v6so5954720qkg.6
 for <xen-devel@lists.xenproject.org>; Sat, 07 Jul 2018 12:32:03 -0700 (PDT)
In-Reply-To: <0eb78867-7802-f38a-0711-d5336b262d0f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============1387549702290119757==
Content-Type: multipart/alternative; boundary="000000000000bcba4d05706dd56c"

--000000000000bcba4d05706dd56c
Content-Type: text/plain; charset="UTF-8"

Thanks for your detailed reply.

On Fri, Jul 6, 2018 at 6:13 AM, Julien Grall <julien.grall@arm.com> wrote:

>
>
> On 06/07/18 04:51, Saeed Mirzamohammadi wrote:
>
>> Hi,
>>
>
> Hello,
>
> I'm trying to route all the physical interrupts to the guest domain rather
>> than being trapped in the Xen. I would like to know what is the right way
>> to do that?
>>
>
> May I ask what is your use case for that? If you route interrupts to the
> guest, Xen will not receive vital interrupt such as the timer, UART, SMMU
> interrupts, maintenance interrupt....
>
I only have one guest domain. So, I'm trying to make Xen transparent to
avoid any extra overhead caused by trapping interrupts. But I still need
Xen for my own hypercalls. I don't need the timer cause I pinned and don't
need any vcpu scheduler. Based on my understanding, I can only disable the
interrupts on ARM all together using the HCR_EL2 register and we can't pick
one interrupt to not trap, right?

>
>
>> I know that HCR_IMO bit in the HCR_EL2 register is supposed to be for
>> routing the interrupts to the guest (Routing to EL1 instead of EL2).
>> link to the datasheet: http://infocenter.arm.com/help
>> /index.jsp?topic=/com.arm.doc.ddi0500d/CIHJHAAG.html
>>
>> So, I have tried doing the following in the leave_hypervisor_tail. I run
>> a simple hypercall and do the following lines before return (which is I
>> guess the last point of exit to the guest from hypervisor):
>> ---------------------
>> /current->arch.hcr_el2 &= ~HCR_IMO;/
>> /WRITE_SYSREG(current->arch.hcr_el2, HCR_EL2);/
>> /isb();/
>> /----------------------/
>> /
>> /
>> /It looks like to be doing it right for all thevcpus butgets stuck after
>> return from leave_hypervisor_tail for the lastvcpu.
>>
>
> What do you mean by stuck? Do you see any logs?
>
It's hung with no log.

>
> HCR_EL2.IMO unset means the interrupt will get signaled to EL1. It does
> not affect how interrupt will get read (e.g IAR).
>
> Which interrupt controller are you using?
>
I'm using a GICv2.

> In case of GICv2, Xen is re-mapping GICC to GICV. So when the guest is
> reading IAR, it will read the interrupts from the LRs. Not the physical
> interface.
>
 So, in the case of GICv2, we can't route them cause Xen is the one that is
updating the LRs and guest is reading from the LRs, am I right?

>
> In case of GICv3, HCR_EL2.IMO will also control the access. So you should
> be fine here.
>
> However, in both case you will at least need to rework the way software
> generated interrupts are sent to the guest. At the moment, they are written
> in the LRs.
>
> Is it possible to not trap on the ICDSGIR (SGI register)?

Thanks,

> Cheers,
>
> --
> Julien Grall
>



-- 
Saeed Mirzamohammadi
PhD Student
Department of Computer Science
University of California, Irvine
Irvine, CA 92617
saeed@uci.edu <smirzamo@uci.edu>
http://www.ics.uci.edu/~saeed/ <http://www.ics.uci.edu/~smirzamo/>

--000000000000bcba4d05706dd56c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your detailed reply.<br><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Fri, Jul 6, 2018 at 6:13 AM, Julien G=
rall <span dir=3D"ltr">&lt;<a href=3D"mailto:julien.grall@arm.com" target=
=3D"_blank">julien.grall@arm.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
<br>
On 06/07/18 04:51, Saeed Mirzamohammadi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Hi,<br>
</blockquote>
<br>
Hello,<span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
I&#39;m trying to route all the physical interrupts to the guest domain rat=
her than being trapped in the Xen. I would like to know what is the right w=
ay to do that?<br>
</blockquote>
<br></span>
May I ask what is your use case for that? If you route interrupts to the gu=
est, Xen will not receive vital interrupt such as the timer, UART, SMMU int=
errupts, maintenance interrupt....<br></blockquote><div>I only have one gue=
st domain. So, I&#39;m trying to make Xen transparent to avoid any extra ov=
erhead caused by trapping interrupts. But I still need Xen for my own hyper=
calls. I don&#39;t need the timer cause I pinned and don&#39;t need any vcp=
u scheduler. Based on my understanding, I can only disable the interrupts o=
n ARM all together using the HCR_EL2 register and we can&#39;t pick one int=
errupt to not trap, right?<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><span>
<br>
I know that HCR_IMO bit in the HCR_EL2 register is supposed to be for routi=
ng the interrupts to the guest (Routing to EL1 instead of EL2).<br>
link to the datasheet: <a href=3D"http://infocenter.arm.com/help/index.jsp?=
topic=3D/com.arm.doc.ddi0500d/CIHJHAAG.html" rel=3D"noreferrer" target=3D"_=
blank">http://infocenter.arm.com/help<wbr>/index.jsp?topic=3D/com.arm.doc.<=
wbr>ddi0500d/CIHJHAAG.html</a><br>
<br>
So, I have tried doing the following in the=C2=A0leave_hypervisor_tail. I r=
un a simple hypercall=C2=A0and do the following lines before return (which =
is I guess the last point of exit to the guest from hypervisor):<br>
---------------------<br></span>
/current-&gt;arch.hcr_el2 &amp;=3D ~HCR_IMO;/<br>
/WRITE_SYSREG(current-&gt;arch.hc<wbr>r_el2, HCR_EL2);/<br>
/isb();/<br>
/----------------------/<br>
/<br>
/<br>
/It looks like to be doing it right for all thevcpus=C2=A0butgets=C2=A0stuc=
k after return from leave_hypervisor_tail for the lastvcpu.<br>
</blockquote>
<br>
What do you mean by stuck? Do you see any logs?<br></blockquote><div>It&#39=
;s hung with no log.</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
HCR_EL2.IMO unset means the interrupt will get signaled to EL1. It does not=
 affect how interrupt will get read (e.g IAR).<br>
<br>
Which interrupt controller are you using?<br></blockquote><div>I&#39;m usin=
g a GICv2.=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">In case of GICv2, Xen is re-mapping GICC to GICV. So when the guest is r=
eading IAR, it will read the interrupts from the LRs. Not the physical inte=
rface.<br></blockquote><div>=C2=A0So, in the case of GICv2, we can&#39;t ro=
ute them cause Xen is the one that is updating the LRs and guest is reading=
 from the LRs, am I right?</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
In case of GICv3, HCR_EL2.IMO will also control the access. So you should b=
e fine here.<br>
<br>
However, in both case you will at least need to rework the way software gen=
erated interrupts are sent to the guest. At the moment, they are written in=
 the LRs.<br>
<br></blockquote><div>Is it possible to not trap on the=C2=A0ICDSGIR (SGI r=
egister)?</div><div><br></div><div>Thanks,</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
Cheers,<span class=3D"gmail-m_8719056196740612075m_9097269075652312375HOEnZ=
b"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail-m_8719056196740612075m_9097269075652312375gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr">Saeed Mirzamohammadi<div>PhD S=
tudent<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:13px;background-color:rgb(255,255,255)"><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">Department of Computer Science</span><br><div><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color:r=
gb(255,255,255)">University of California, Irvine</span></div><div><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;back=
ground-color:rgb(255,255,255)">Irvine, CA 92617</span></div><div><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backgr=
ound-color:rgb(255,255,255)"><a href=3D"mailto:smirzamo@uci.edu" target=3D"=
_blank">saeed@uci.edu</a></span></div><div><span style=3D"background-color:=
rgb(255,255,255)"><a href=3D"http://www.ics.uci.edu/~smirzamo/" target=3D"_=
blank">http://www.ics.uci.edu/~saeed/</a></span></div></div></div></div></d=
iv></div>
</div></div>

--000000000000bcba4d05706dd56c--


--===============1387549702290119757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1387549702290119757==--
