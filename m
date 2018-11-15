From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 03/18] xen/arm: Save GIC and virtual timer
 context when the domain suspends
Date: Thu, 15 Nov 2018 00:05:55 +0000
Message-ID: <CAF3u54Bd1rS-mX0AfzWuLrd975qyVkfQcZtNu+PV=Vi0sMnkaw@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-4-git-send-email-mirela.simonovic@aggios.com>
 <03aa1b00-b087-6258-0273-d40c526d7d08@arm.com>
 <CAKPH-NipkcTy+_GKPVptQxnc-3cqo5UiQ8ao05Yi8egdXMX0Qg@mail.gmail.com>
 <811e51c5-516a-4bcf-f9e3-02c5b448b967@arm.com>
 <CAKPH-Ngc_LMdG8tKPDzLWxy+1fuamiO_PTPHQSAkN0AVy9oofA@mail.gmail.com>
 <17ab88c4-cdf7-8f7f-5933-25d9294f3641@arm.com>
 <alpine.DEB.2.10.1811131242560.8259@sstabellini-ThinkPad-X260>
 <6b03d660-15e6-d6ca-a8b8-1662c045a7a9@arm.com>
 <alpine.DEB.2.10.1811141444480.302@sstabellini-ThinkPad-X260>
 <1bc18b94-cb14-5d9f-514c-34b0f86442b7@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6001357850980475037=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mzf2=n2=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gN5Ag-0003Cm-Ei
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 00:06:10 +0000
Received: by mail-vs1-xe34.google.com with SMTP id x64so10666502vsa.5
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 16:06:08 -0800 (PST)
In-Reply-To: <1bc18b94-cb14-5d9f-514c-34b0f86442b7@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <xen-devel@lists.xen.org>, Davorin Mista <dm@aggios.com>, Andre Przywara <Andre.Przywara@arm.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

--===============6001357850980475037==
Content-Type: multipart/alternative; boundary="0000000000004bc61b057aa8d190"

--0000000000004bc61b057aa8d190
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Wed, 14 Nov 2018, 23:41 Julien Grall, <Julien.Grall@arm.com> wrote:

>
>
> On 14/11/2018 22:45, Stefano Stabellini wrote:
> > On Wed, 14 Nov 2018, Julien Grall wrote:
> >> Hi,
> >>
> >> On 13/11/2018 20:44, Stefano Stabellini wrote:
> >>> On Mon, 12 Nov 2018, Julien Grall wrote:
> >>>> (+ Andre)
> >>>>
> >>>> On 11/12/18 5:42 PM, Mirela Simonovic wrote:
> >>>>> Hi Julien,
> >>>>>
> >>>>> On Mon, Nov 12, 2018 at 6:00 PM Julien Grall <julien.grall@arm.com>
> >>>>> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 11/12/18 4:52 PM, Mirela Simonovic wrote:
> >>>>>>> Hi Julien,
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>>> Thanks for the feedback.
> >>>>>>>
> >>>>>>> On Mon, Nov 12, 2018 at 4:36 PM Julien Grall <julien.grall@arm.com
> >
> >>>>>>> wrote:
> >>>>>>>>
> >>>>>>>> Hi Mirela,
> >>>>>>>>
> >>>>>>>> On 11/12/18 11:30 AM, Mirela Simonovic wrote:
> >>>>>>>>> GIC and virtual timer context must be saved when the domain
> >>>>>>>>> suspends.
> >>>>>>>>
> >>>>>>>> Please provide the rationale for this. Is it required by the spec?
> >>>>>>>>
> >>>>>>>
> >>>>>>> This is required for GIC because a guest leaves enabled interrupts
> >>>>>>> in
> >>>>>>> the GIC that could wake it up, and on resume it should be able to
> >>>>>>> detect which interrupt woke it up. Without saving/restoring the
> >>>>>>> state
> >>>>>>> of GIC this would not be possible.
> >>>>>>
> >>>>>> I am confused. In patch #10, you save the GIC host because the GIC
> can
> >>>>>> be powered-down. Linux is also saving the GIC state. So how the
> >>>>>> interrupt can come up if the GIC is powered down?
> >>>>>>
> >>>>>
> >>>>> After Xen (or Linux in the config without Xen) hands over the control
> >>>>> to EL3 on suspend (calls system suspend PSCI to EL3), it leaves
> >>>>> enabled interrupts that are its wake-up sources. Saving a GIC state
> >>>>> only means that its current configuration will be remembered
> somewhere
> >>>>> in data structures, but the configuration is not changed on suspend.
> >>>>> Everything that happens with interrupt configuration from this point
> >>>>> on is platform specific. Now there are 2 options: 1) EL3 will never
> >>>>> allow CPU0 to be powered down and the wake-up interrupt will indeed
> >>>>> propagate via GIC;
> >>>>> or 2) CPU0 will be powered down and the GIC may be
> >>>>> powered down as well, so an external help is needed to deal with
> >>>>> wake-up and resume (e.g. in order to react to a wake-up interrupt
> >>>>> while the GIC is down, and power up CPU0). This external help is
> >>>>> provided by some low-power processor outside of the Cortex-A cluster.
> >>>>>
> >>>>> So the platform firmware is responsible for properly configuring a
> >>>>> wake-up path if GIC goes down. This is commonly handled by EL3
> >>>>> communicating with low-power processor. When the GIC power comes up,
> >>>>> the interrupt triggered by a peripheral is still active and the
> >>>>> software on Cortex-A cluster should be able to observe it once the
> GIC
> >>>>> state is restored, i.e. interrupts get enabled at GIC.
> >>>>
> >>>> Thank you for the explanation.  Now the question is why can't we
> reset at
> >>>> least the GIC CPU interface?
> >>>>
> >>>> AFAIU, the guest should restore them in any case. The only things we
> need
> >>>> to
> >>>> know is the interrupt was received for a given guest. We can then
> queue it
> >>>> and
> >>>> wake-up the domain.
> >>>>
> >>>> This seems to fit with the description on top of gic_dist_save() in
> Linux
> >>>> GICv2 driver.
> >>>
> >>> Can we rely on all PSCI compliant OSes to restore their own GIC again
> at
> >>> resume? The PSCI spec is not very clear in that regard (at the the
> >>> version I am looking at...) I am just asking so that we don't come up
> >>> with a solution that only works with Linux.
> >> See PSCI 1.1 (DEN0022D) section 6.8. Each level should save its own
> context
> >> because the PSCI implementations is allowed to shutdown the GIC.
> >
> > Great, in that case we should be able to skip saving some of the GICD
> > registers too. We do need to save GICD_ISACTIVER, and GICD_ICFGR,
> > but we should be able to skip the others (GICD_ISENABLER,
> > GICD_IPRIORITYR, GICD_ITARGETSR). If we do, we still need to
> > re-initialize them as we do in gicv2_dist_init.
>
> You are assuming a domain will handle properly the suspend/resume. I
> don't think we can promise that as we call freeze/thaw.
>

To clarify what I meant by "handle properly" is any domain that will not
call SYSTEM_SUSPEND before the host is suspending. That may happen if the
domain is not aware of suspend/resume.

If you wonder, it is not Xen to decide whether we should stop suspending
but the control domain to not issue the suspend.

Cheers,


> Furthermore, we still have to suspend/resume other drivers in Xen. I
> think this is a bit painful to have to rely on every drivers to deal
> with their interrupts.
>
> Cheers,
>
> --
> Julien Grall
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000004bc61b057aa8d190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the formatting.<br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
">On Wed, 14 Nov 2018, 23:41 Julien Grall, &lt;<a href=3D"mailto:Julien.Gra=
ll@arm.com">Julien.Grall@arm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
<br>
On 14/11/2018 22:45, Stefano Stabellini wrote:<br>
&gt; On Wed, 14 Nov 2018, Julien Grall wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; On 13/11/2018 20:44, Stefano Stabellini wrote:<br>
&gt;&gt;&gt; On Mon, 12 Nov 2018, Julien Grall wrote:<br>
&gt;&gt;&gt;&gt; (+ Andre)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 11/12/18 5:42 PM, Mirela Simonovic wrote:<br>
&gt;&gt;&gt;&gt;&gt; Hi Julien,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Mon, Nov 12, 2018 at 6:00 PM Julien Grall &lt;<a hr=
ef=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@arm.com</=
a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 11/12/18 4:52 PM, Mirela Simonovic wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi Julien,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Thanks for the feedback.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Nov 12, 2018 at 4:36 PM Julien Grall &=
lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.grall@a=
rm.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi Mirela,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/12/18 11:30 AM, Mirela Simonovic wro=
te:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; GIC and virtual timer context must be =
saved when the domain<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; suspends.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Please provide the rationale for this. Is =
it required by the spec?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This is required for GIC because a guest leave=
s enabled interrupts<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the GIC that could wake it up, and on resume i=
t should be able to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; detect which interrupt woke it up. Without sav=
ing/restoring the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; state<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; of GIC this would not be possible.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I am confused. In patch #10, you save the GIC host=
 because the GIC can<br>
&gt;&gt;&gt;&gt;&gt;&gt; be powered-down. Linux is also saving the GIC stat=
e. So how the<br>
&gt;&gt;&gt;&gt;&gt;&gt; interrupt can come up if the GIC is powered down?<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; After Xen (or Linux in the config without Xen) hands o=
ver the control<br>
&gt;&gt;&gt;&gt;&gt; to EL3 on suspend (calls system suspend PSCI to EL3), =
it leaves<br>
&gt;&gt;&gt;&gt;&gt; enabled interrupts that are its wake-up sources. Savin=
g a GIC state<br>
&gt;&gt;&gt;&gt;&gt; only means that its current configuration will be reme=
mbered somewhere<br>
&gt;&gt;&gt;&gt;&gt; in data structures, but the configuration is not chang=
ed on suspend.<br>
&gt;&gt;&gt;&gt;&gt; Everything that happens with interrupt configuration f=
rom this point<br>
&gt;&gt;&gt;&gt;&gt; on is platform specific. Now there are 2 options: 1) E=
L3 will never<br>
&gt;&gt;&gt;&gt;&gt; allow CPU0 to be powered down and the wake-up interrup=
t will indeed<br>
&gt;&gt;&gt;&gt;&gt; propagate via GIC;<br>
&gt;&gt;&gt;&gt;&gt; or 2) CPU0 will be powered down and the GIC may be<br>
&gt;&gt;&gt;&gt;&gt; powered down as well, so an external help is needed to=
 deal with<br>
&gt;&gt;&gt;&gt;&gt; wake-up and resume (e.g. in order to react to a wake-u=
p interrupt<br>
&gt;&gt;&gt;&gt;&gt; while the GIC is down, and power up CPU0). This extern=
al help is<br>
&gt;&gt;&gt;&gt;&gt; provided by some low-power processor outside of the Co=
rtex-A cluster.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So the platform firmware is responsible for properly c=
onfiguring a<br>
&gt;&gt;&gt;&gt;&gt; wake-up path if GIC goes down. This is commonly handle=
d by EL3<br>
&gt;&gt;&gt;&gt;&gt; communicating with low-power processor. When the GIC p=
ower comes up,<br>
&gt;&gt;&gt;&gt;&gt; the interrupt triggered by a peripheral is still activ=
e and the<br>
&gt;&gt;&gt;&gt;&gt; software on Cortex-A cluster should be able to observe=
 it once the GIC<br>
&gt;&gt;&gt;&gt;&gt; state is restored, i.e. interrupts get enabled at GIC.=
<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Thank you for the explanation.=C2=A0 Now the question is w=
hy can&#39;t we reset at<br>
&gt;&gt;&gt;&gt; least the GIC CPU interface?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; AFAIU, the guest should restore them in any case. The only=
 things we need<br>
&gt;&gt;&gt;&gt; to<br>
&gt;&gt;&gt;&gt; know is the interrupt was received for a given guest. We c=
an then queue it<br>
&gt;&gt;&gt;&gt; and<br>
&gt;&gt;&gt;&gt; wake-up the domain.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; This seems to fit with the description on top of gic_dist_=
save() in Linux<br>
&gt;&gt;&gt;&gt; GICv2 driver.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can we rely on all PSCI compliant OSes to restore their own GI=
C again at<br>
&gt;&gt;&gt; resume? The PSCI spec is not very clear in that regard (at the=
 the<br>
&gt;&gt;&gt; version I am looking at...) I am just asking so that we don&#3=
9;t come up<br>
&gt;&gt;&gt; with a solution that only works with Linux.<br>
&gt;&gt; See PSCI 1.1 (DEN0022D) section 6.8. Each level should save its ow=
n context<br>
&gt;&gt; because the PSCI implementations is allowed to shutdown the GIC.<b=
r>
&gt; <br>
&gt; Great, in that case we should be able to skip saving some of the GICD<=
br>
&gt; registers too. We do need to save GICD_ISACTIVER, and GICD_ICFGR,<br>
&gt; but we should be able to skip the others (GICD_ISENABLER,<br>
&gt; GICD_IPRIORITYR, GICD_ITARGETSR). If we do, we still need to<br>
&gt; re-initialize them as we do in gicv2_dist_init.<br>
<br>
You are assuming a domain will handle properly the suspend/resume. I <br>
don&#39;t think we can promise that as we call freeze/thaw.<br></blockquote=
></div><div><br></div><div>To clarify what I meant by &quot;handle properly=
&quot; is any domain that will not call SYSTEM_SUSPEND before the host is s=
uspending. That may happen if the domain is not aware of suspend/resume.</d=
iv><div><br></div><div>If you wonder, it is not Xen to decide whether we sh=
ould stop suspending but the control domain to not issue the suspend.</div>=
<div><br></div><div>Cheers,</div><div><br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Furthermore, we still have to suspend/resume other drivers in Xen. I <br>
think this is a bit painful to have to rely on every drivers to deal <br>
with their interrupts.<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--0000000000004bc61b057aa8d190--


--===============6001357850980475037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6001357850980475037==--
