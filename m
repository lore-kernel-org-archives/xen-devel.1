From: Saeed Mirzamohammadi <saeed.mzmd@gmail.com>
Subject: Re: Routing physical interrupts to EL1
Date: Thu, 2 Aug 2018 12:14:55 -0700
Message-ID: <CALPKaJ=dp7R+e4xtSCU1hpQ0AB29f7ze2-YOz0Ec780A0+AwBg@mail.gmail.com>
References: <CALPKaJ=qbh0rLK+MC=fC966=D50+_3eOCTYbQcbCyqm1psaYcg@mail.gmail.com>
 <0eb78867-7802-f38a-0711-d5336b262d0f@arm.com>
 <CALPKaJmxWGA2nQMoKeQqMtz55ZD7hQUxrEZHHAbsAdFN5F+aZg@mail.gmail.com>
 <4c0bfd16-3936-46ea-cc22-ebad77e4a4b5@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2778630881590386775=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pbec=kr=gmail.com=saeed.mzmd@srs-us1.protection.inumbo.net>)
 id 1flJ3r-0000EY-7b
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 19:14:59 +0000
Received: by mail-wm0-x242.google.com with SMTP id o11-v6so3701708wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Aug 2018 12:14:57 -0700 (PDT)
In-Reply-To: <4c0bfd16-3936-46ea-cc22-ebad77e4a4b5@arm.com>
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

--===============2778630881590386775==
Content-Type: multipart/alternative; boundary="0000000000005fea00057278a024"

--0000000000005fea00057278a024
Content-Type: text/plain; charset="UTF-8"

Sorry for the late reply.

On Sat, Jul 7, 2018 at 2:25 PM, Julien Grall <julien.grall@arm.com> wrote:

> Hello,
>
> On 07/07/2018 08:32 PM, Saeed Mirzamohammadi wrote:
>
>> Thanks for your detailed reply.
>>
>> On Fri, Jul 6, 2018 at 6:13 AM, Julien Grall <julien.grall@arm.com
>> <mailto:julien.grall@arm.com>> wrote:
>>
>>
>>
>>     On 06/07/18 04:51, Saeed Mirzamohammadi wrote:
>>
>>         Hi,
>>
>>
>>     Hello,
>>
>>         I'm trying to route all the physical interrupts to the guest
>>         domain rather than being trapped in the Xen. I would like to
>>         know what is the right way to do that?
>>
>>
>>     May I ask what is your use case for that? If you route interrupts to
>>     the guest, Xen will not receive vital interrupt such as the timer,
>>     UART, SMMU interrupts, maintenance interrupt....
>>
>> I only have one guest domain. So, I'm trying to make Xen transparent to
>> avoid any extra overhead caused by trapping interrupts.
>>
>
> Do you include Dom0 in your "one guest domain"? If so, may I ask what is
> your end goal? Why not booting the OS on baremetal?
>
> Yes, I only have the Dom0 domain and no DomU. My end goal is to make Xen
transparent to the interrupts but have control over the memory management
and be able to create another domain (like a driver domain) on-demand
whenever I need it.


> But I still need Xen for my own hypercalls. I don't need the timer cause I
>> pinned and don't need any vcpu scheduler.
>>
>
> Well, Xen still needs interrupts for other things like UART and SMMU. It
> also needs interrupts to IPI other pCPU such as for softirq, unblocking
> another vCPU (waiting on an event for instance)... I don't think you can
> discard interrupts that easily in Xen without some cooperation with the
> guest.
>
> Let's imagine Xen IPIs another pCPU. If interrupts are routed to your
> guest, this guest will receive the IPIs and will not understand what to do.

My end goal is that all the IPIs are handled in the guest like when it is
on baremetal.


>
>
> Based on my understanding, I can only disable the interrupts on ARM all
>> together using the HCR_EL2 register and we can't pick one interrupt to not
>> trap, right?
>>
>
> Depends on your interrupts controller. On GICv4, you will be able to
> directly injected some LPIs (i.e MSI).
>
>
>
>>
>>
>>         I know that HCR_IMO bit in the HCR_EL2 register is supposed to
>>         be for routing the interrupts to the guest (Routing to EL1
>>         instead of EL2).
>>         link to the datasheet:
>>         http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.
>> ddi0500d/CIHJHAAG.html
>>         <http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc
>> .ddi0500d/CIHJHAAG.html>
>>
>>         So, I have tried doing the following in
>>         the leave_hypervisor_tail. I run a simple hypercall and do the
>>         following lines before return (which is I guess the last point
>>         of exit to the guest from hypervisor):
>>         ---------------------
>>         /current->arch.hcr_el2 &= ~HCR_IMO;/
>>         /WRITE_SYSREG(current->arch.hcr_el2, HCR_EL2);/
>>         /isb();/
>>         /----------------------/
>>         /
>>         /
>>         /It looks like to be doing it right for all
>>         thevcpus butgets stuck after return from leave_hypervisor_tail
>>         for the lastvcpu.
>>
>>
>>     What do you mean by stuck? Do you see any logs?
>>
>> It's hung with no log.
>>
>>
>>     HCR_EL2.IMO unset means the interrupt will get signaled to EL1. It
>>     does not affect how interrupt will get read (e.g IAR).
>>
>>     Which interrupt controller are you using?
>>
>> I'm using a GICv2.
>>
>>     In case of GICv2, Xen is re-mapping GICC to GICV. So when the guest
>>     is reading IAR, it will read the interrupts from the LRs. Not the
>>     physical interface.
>>
>>   So, in the case of GICv2, we can't route them cause Xen is the one that
>> is updating the LRs and guest is reading from the LRs, am I right?
>>
>
> If you want to route *all* the interrupts, you can map GICC and not GICV
> to your guest. So when the guest will read IAR, it will read the physical
> interrupts.
>
>
>>
>>     In case of GICv3, HCR_EL2.IMO will also control the access. So you
>>     should be fine here.
>>
>>     However, in both case you will at least need to rework the way
>>     software generated interrupts are sent to the guest. At the moment,
>>     they are written in the LRs.
>>
>> Is it possible to not trap on the ICDSGIR (SGI register)?
>>
>
> SGIs register are already trapped by Xen. They are emulated by writing the
> corresponding interrupt to the LRs.
>
> How can make it available to the guest and not trap in Xen? Is it doable?


> However, SGIs are not the only interrupt generated by the hypervisor
> directly. There are also the event channel (a PPI) or any device emulated
> by the hypervisor (e.g PL011).
>
> Trying to remove interrupts from the hypervisor is more a pain compare to
> the benefits you will gain. You will be better at improving the latency
> when receiving interrupt (AFAIK this is already be good).
>
> I changed the value of the HCR_EL2 register after doing a hypercall in
"leave_hypervisor_tail" and now debugging. I realize that "guest_sync" in
entry.S doesn't return back to the guest (I put a print after my hypercall
in the guest and doesn't show up). I see that "return_from_trap" gets
called. I suppose that eret should take me back to the hvc call I made in
the guest. I checked the value of the LR register (link register that store
the return address) in "return_from_trap" and there is no change.
Do you know why changing the value of the HCR_EL2 register should affect
returning back to the guest?  Also, without changing the register value I
get back to the guest from Xen normally.


Cheers,
>
> --
> Julien Grall
>

Thanks a bunch!


-- 
Saeed Mirzamohammadi
PhD Student
Department of Computer Science
University of California, Irvine
Irvine, CA 92617
saeed@uci.edu <smirzamo@uci.edu>
http://www.ics.uci.edu/~saeed/ <http://www.ics.uci.edu/~smirzamo/>

--0000000000005fea00057278a024
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the late reply.<br><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sat, Jul 7, 2018 at 2:25 PM, Julien Grall <=
span dir=3D"ltr">&lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_bla=
nk">julien.grall@arm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello,<span class=3D"gmail-"><br>
<br>
On 07/07/2018 08:32 PM, Saeed Mirzamohammadi wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gma=
il-">
Thanks for your detailed reply.<br>
<br></span><span class=3D"gmail-">
On Fri, Jul 6, 2018 at 6:13 AM, Julien Grall &lt;<a href=3D"mailto:julien.g=
rall@arm.com" target=3D"_blank">julien.grall@arm.com</a> &lt;mailto:<a href=
=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</a>=
&gt;&gt; wrote:<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 On 06/07/18 04:51, Saeed Mirzamohammadi wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi,<br>
<br>
<br>
=C2=A0 =C2=A0 Hello,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I&#39;m trying to route all the physical interr=
upts to the guest<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 domain rather than being trapped in the Xen. I =
would like to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 know what is the right way to do that?<br>
<br>
<br>
=C2=A0 =C2=A0 May I ask what is your use case for that? If you route interr=
upts to<br>
=C2=A0 =C2=A0 the guest, Xen will not receive vital interrupt such as the t=
imer,<br>
=C2=A0 =C2=A0 UART, SMMU interrupts, maintenance interrupt....<br>
<br>
I only have one guest domain. So, I&#39;m trying to make Xen transparent to=
 avoid any extra overhead caused by trapping interrupts.<br>
</span></blockquote>
<br>
Do you include Dom0 in your &quot;one guest domain&quot;? If so, may I ask =
what is your end goal? Why not booting the OS on baremetal?<span class=3D"g=
mail-"><br>
<br></span></blockquote><div>Yes, I only have the Dom0 domain and no DomU. =
My end goal is to make Xen transparent to the interrupts but have control o=
ver the memory management and be able to create another domain (like a driv=
er domain) on-demand whenever I need it.</div><div>=C2=A0<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
But I still need Xen for my own hypercalls. I don&#39;t need the timer caus=
e I pinned and don&#39;t need any vcpu scheduler.<br>
</blockquote>
<br></span>
Well, Xen still needs interrupts for other things like UART and SMMU. It al=
so needs interrupts to IPI other pCPU such as for softirq, unblocking anoth=
er vCPU (waiting on an event for instance)... I don&#39;t think you can dis=
card interrupts that easily in Xen without some cooperation with the guest.=
<br>
<br>
Let&#39;s imagine Xen IPIs another pCPU. If interrupts are routed to your g=
uest, this guest will receive the IPIs and will not understand what to do.<=
/blockquote><div>My end goal is that all the IPIs are handled in the guest =
like when it is on baremetal.=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Based on my understanding, I can only disable the interrupts on ARM all tog=
ether using the HCR_EL2 register and we can&#39;t pick one interrupt to not=
 trap, right?<br>
</blockquote>
<br></span>
Depends on your interrupts controller. On GICv4, you will be able to direct=
ly injected some LPIs (i.e MSI).<div><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I know that HCR_IMO bit in the HCR_EL2 register=
 is supposed to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 be for routing the interrupts to the guest (Rou=
ting to EL1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 instead of EL2).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 link to the datasheet:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://infocenter.arm.com/help/index=
.jsp?topic=3D/com.arm.doc.ddi0500d/CIHJHAAG.html" rel=3D"noreferrer" target=
=3D"_blank">http://infocenter.arm.com/help<wbr>/index.jsp?topic=3D/com.arm.=
doc.<wbr>ddi0500d/CIHJHAAG.html</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://infocenter.arm.com/help/i=
ndex.jsp?topic=3D/com.arm.doc.ddi0500d/CIHJHAAG.html" rel=3D"noreferrer" ta=
rget=3D"_blank">http://infocenter.arm.com/hel<wbr>p/index.jsp?topic=3D/com.=
arm.doc<wbr>.ddi0500d/CIHJHAAG.html</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 So, I have tried doing the following in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the=C2=A0leave_hypervisor_tail. I run a simple =
hypercall=C2=A0and do the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 following lines before return (which is I guess=
 the last point<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of exit to the guest from hypervisor):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---------------------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /current-&gt;arch.hcr_el2 &amp;=3D ~HCR_IMO;/<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /WRITE_SYSREG(current-&gt;arch.hc<wbr>r_el2, HC=
R_EL2);/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /isb();/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /----------------------/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /It looks like to be doing it right for all<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 thevcpus=C2=A0butgets=C2=A0stuck after return f=
rom leave_hypervisor_tail<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for the lastvcpu.<br>
<br>
<br>
=C2=A0 =C2=A0 What do you mean by stuck? Do you see any logs?<br>
<br>
It&#39;s hung with no log.<br>
<br>
<br>
=C2=A0 =C2=A0 HCR_EL2.IMO unset means the interrupt will get signaled to EL=
1. It<br>
=C2=A0 =C2=A0 does not affect how interrupt will get read (e.g IAR).<br>
<br>
=C2=A0 =C2=A0 Which interrupt controller are you using?<br>
<br>
I&#39;m using a GICv2.<br>
<br>
=C2=A0 =C2=A0 In case of GICv2, Xen is re-mapping GICC to GICV. So when the=
 guest<br>
=C2=A0 =C2=A0 is reading IAR, it will read the interrupts from the LRs. Not=
 the<br>
=C2=A0 =C2=A0 physical interface.<br>
<br>
=C2=A0=C2=A0So, in the case of GICv2, we can&#39;t route them cause Xen is =
the one that is updating the LRs and guest is reading from the LRs, am I ri=
ght?<br>
</blockquote>
<br></div></div>
If you want to route *all* the interrupts, you can map GICC and not GICV to=
 your guest. So when the guest will read IAR, it will read the physical int=
errupts.<span class=3D"gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
=C2=A0 =C2=A0 In case of GICv3, HCR_EL2.IMO will also control the access. S=
o you<br>
=C2=A0 =C2=A0 should be fine here.<br>
<br>
=C2=A0 =C2=A0 However, in both case you will at least need to rework the wa=
y<br>
=C2=A0 =C2=A0 software generated interrupts are sent to the guest. At the m=
oment,<br>
=C2=A0 =C2=A0 they are written in the LRs.<br>
<br>
Is it possible to not trap on the=C2=A0ICDSGIR (SGI register)?<br>
</blockquote>
<br></span>
SGIs register are already trapped by Xen. They are emulated by writing the =
corresponding interrupt to the LRs.<br>
<br></blockquote><div>How can make it available to the guest and not trap i=
n Xen? Is it doable?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
However, SGIs are not the only interrupt generated by the hypervisor direct=
ly. There are also the event channel (a PPI) or any device emulated by the =
hypervisor (e.g PL011).<br>
<br>
Trying to remove interrupts from the hypervisor is more a pain compare to t=
he benefits you will gain. You will be better at improving the latency when=
 receiving interrupt (AFAIK this is already be good).<br>
<br></blockquote>I changed the value of the HCR_EL2 register after doing a =
hypercall in &quot;leave_hypervisor_tail&quot; and now debugging. I realize=
 that &quot;guest_sync&quot; in entry.S doesn&#39;t return back to the gues=
t (I put a print after my hypercall in the guest and doesn&#39;t show up). =
I see that &quot;return_from_trap&quot; gets called. I suppose that eret sh=
ould take me back to the hvc call I made in the guest. I checked the value =
of the LR register (link register that store the return address) in &quot;r=
eturn_from_trap&quot; and there is no change.=C2=A0</div><div class=3D"gmai=
l_quote">Do you know why changing the value of the HCR_EL2 register should =
affect returning back to the guest?=C2=A0 Also, without changing the regist=
er value I get back to the guest from Xen normally.<br></div><div class=3D"=
gmail_quote"><br></div><div class=3D"gmail_quote"><br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Cheers,<br>
<br>
--<br>
Julien Grall<br>
</blockquote></div><div class=3D"gmail_extra"><br></div>Thanks a bunch!<br>=
<br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_signature"><div=
 dir=3D"ltr"><div><div dir=3D"ltr">Saeed Mirzamohammadi<div>PhD Student<br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;ba=
ckground-color:rgb(255,255,255)"><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)">Dep=
artment of Computer Science</span><br><div><span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255=
,255)">University of California, Irvine</span></div><div><span style=3D"col=
or:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-col=
or:rgb(255,255,255)">Irvine, CA 92617</span></div><div><span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;background-color=
:rgb(255,255,255)"><a href=3D"mailto:smirzamo@uci.edu" target=3D"_blank">sa=
eed@uci.edu</a></span></div><div><span style=3D"background-color:rgb(255,25=
5,255)"><a href=3D"http://www.ics.uci.edu/~smirzamo/" target=3D"_blank">htt=
p://www.ics.uci.edu/~saeed/</a></span></div></div></div></div></div></div>
</div></div>

--0000000000005fea00057278a024--


--===============2778630881590386775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2778630881590386775==--
