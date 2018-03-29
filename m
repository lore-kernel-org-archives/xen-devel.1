From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v3 06/39] ARM: evtchn: Handle level
 triggered IRQs correctly
Date: Thu, 29 Mar 2018 00:34:28 +0000
Message-ID: <CAF3u54AOhD0OdOMQBDcyWkdjtYMKx5xogF9CMk8jkQjmHwftMw@mail.gmail.com>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-7-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803271651150.12360@sstabellini-ThinkPad-X260>
 <a172ae47-53c4-47f6-0c5f-f42b12f80f3d@arm.com>
 <alpine.DEB.2.10.1803281023050.15200@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4411419820567887164=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z/a2=gt=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f1LWb-0004mF-Tc
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 00:34:41 +0000
Received: by mail-oi0-x229.google.com with SMTP id l190-v6so3743814oig.9
 for <xen-devel@lists.xenproject.org>; Wed, 28 Mar 2018 17:34:39 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1803281023050.15200@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============4411419820567887164==
Content-Type: multipart/alternative; boundary="001a113cd874edac9705688249c1"

--001a113cd874edac9705688249c1
Content-Type: text/plain; charset="UTF-8"

(sorry for the formatting)

On Thu, 29 Mar 2018, 01:48 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Wed, 28 Mar 2018, Andre Przywara wrote:
> > On 28/03/18 01:01, Stefano Stabellini wrote:
> > > On Wed, 21 Mar 2018, Andre Przywara wrote:
> > >> The event channel IRQ has level triggered semantics, however the
> current
> > >> VGIC treats everything as edge triggered.
> > >> To correctly process those IRQs, we have to lower the (virtual) IRQ
> line
> > >> at some point in time, depending on whether ther interrupt condition
> > >> still prevails.
> > >> Check the per-VCPU evtchn_upcall_pending variable to make the
> interrupt
> > >> line match its status, and call this function upon every hypervisor
> > >> entry.
> > >>
> > >> Signed-off-by: Andre Przywara <andre.przywara@linaro.org>
> > >> Reviewed-by: Julien Grall <julien.grall@arm.com>
> > >> ---
> > >>  xen/arch/arm/domain.c       | 7 +++++++
> > >>  xen/arch/arm/traps.c        | 1 +
> > >>  xen/include/asm-arm/event.h | 1 +
> > >>  3 files changed, 9 insertions(+)
> > >>
> > >> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > >> index ff97f2bc76..9688e62f78 100644
> > >> --- a/xen/arch/arm/domain.c
> > >> +++ b/xen/arch/arm/domain.c
> > >> @@ -953,6 +953,13 @@ void vcpu_mark_events_pending(struct vcpu *v)
> > >>      vgic_inject_irq(v->domain, v, v->domain->arch.evtchn_irq, true);
> > >>  }
> > >>
> > >> +void vcpu_update_evtchn_irq(struct vcpu *v)
> > >> +{
> > >> +    bool pending = vcpu_info(v, evtchn_upcall_pending);
> > >> +
> > >> +    vgic_inject_irq(v->domain, v, v->domain->arch.evtchn_irq,
> pending);
> > >> +}
> > >> +
> > >>  /* The ARM spec declares that even if local irqs are masked in
> > >>   * the CPSR register, an irq should wake up a cpu from WFI anyway.
> > >>   * For this reason we need to check for irqs that need delivery,
> > >> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> > >> index 2638446693..5c18e918b0 100644
> > >> --- a/xen/arch/arm/traps.c
> > >> +++ b/xen/arch/arm/traps.c
> > >> @@ -2033,6 +2033,7 @@ static void enter_hypervisor_head(struct
> cpu_user_regs *regs)
> > >>           * trap and how it can be optimised.
> > >>           */
> > >>          vtimer_update_irqs(current);
> > >> +        vcpu_update_evtchn_irq(current);
> > >>  #endif
> > >
> > > I am replying to this patch, even though I have already committed it,
> to
> > > point out a problem with the way we currently handle the evtchn_irq in
> > > this series.
> > >
> > > The short version is that I think we should configure the PPI
> > > corresponding to the evtchn_irq as EDGE instead of LEVEL.
> >
> > Well, that's really a separate problem, then. We can't just configure
> > the PPI at will, it has to match the device semantic.
> > When writing this patch, I checked how the the evtchn "device" is
> > implemented, and it screams "level IRQ" to me:
> > - We have a flag (evtchn_upcall_pending), which stores the current
> > interrupt state.
> > - This flag gets set by the producer when the interrupt condition is
> true.
> > - It gets cleared by the *consumer* once it has handled the request.
> >
> > So if the event channel mechanism should be edge (which would be fair
> > enough), we need to change the code to implement this: the interrupt
> > condition should be cleared once we *injected* the IRQ - and not only
> > when the consumer has signalled completion.
> >
> > Another thing to consider: by the spec the *configurability* of PPIs is
> > implementation defined. The KVM implementation chose to fix all of them
> > to "level", which we need for the arch timer. So setting the evtchn PPI
> > to edge would be ignored. We could deviate from that, but I need to
> > check what the side effects are.
> >
> > > The long explanation follows, please correct me if I am wrong.
> > >
> > > 1) vcpuA/cpuA is running, it has already handled the event, cleared
> > > evtchn_upcall_pending and EOIed the event_irq but hasn't trapped into
> > > Xen yet. It is still in guest mode.
> > >
> > > 2) Xen on cpuB calls vcpu_mark_events_pending(vcpuA), then calls
> > > vgic_inject_irq. However, because irq->line_level is high, it is not
> > > injected.
> >
> > So this is a case where we fail to sync in time on the actual emulated
> > line level. KVM recently gained some nice code to solve this: We can
> > register per-IRQ functions that return the line level. For hardware
> > mapped IRQs this queries the distributor, but for the arch timer for
> > instance it just uses a shortcut to read CNTV_CTL_EL0.
> > The evtchn IRQ could just check evtchn_upcall_pending.
> >
> > I can take a look at a follow up patch to implement this.
>
> I agree that the evtchn_upcall_pending mechanism is very similar to a
> level interrupt, however the mechanism to bring the notification to the
> guest is edge, even on x86. Even with the new vgic implementation it
> falls very naturally in the edge pattern of behaviors. This is one of
> those cases where I would be happy to deviate from the KVM
> implementation, because it makes sense and would be easier to maintain
> going forward. We can even get rid of vcpu_update_evtchn_irq.
>
> I am OK with a not-ideal short term fix by the end of this week, as long
> as we come up with a proper fix later, by the release date. But in this
> instance, wouldn't be enough to change the PPI type to EDGE, remove
> vcpu_update_evtchn_irq, and be done with it?
>

We expose the event channsl as level in the DT and HVM_PARAM_CALLBACK_IRQ.
So they at least need to change.

But I an bit concerned to change those values between the 2 versions of the
vGIC.

What was the rationale to expose them as level in the old vGIC?



>
>
> > > 3) vcpuA has to wait until trapping into Xen, calling
> > > vcpu_update_evtchn_irq, and going back to guest mode before receiving
> > > the event. This is theoretically a very long time.
> > >
> > >
> > > Instead what should happen is:
> > >
> > > 1) vcpuA/cpuA is running, it has already handled the event, cleared
> > > evtchn_upcall_pending and EOIed the event_irq but hasn't trapped into
> > > Xen yet. It is still in guest mode.
> > >
> > > 2) Xen on cpuB calls vcpu_mark_events_pending(vcpuA), then calls
> > > vgic_inject_irq, which calls vgic_queue_irq_unlock that
> > > vcpu_kick(vcpuA), forcing it to take the event immediately.
> > >
> > > Am I right? Wouldn't it be safer to continue configuring the evtchn_irq
> > > as edge even in the new vgic?
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a113cd874edac9705688249c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(sorry for the formatting)<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Thu, 29 Mar 2018, 01:48 Stefano Stabellini, &lt;<a href=3D"mailto:sst=
abellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Wed, 28 Mar 2018, Andre Przywara wrote:<br>
&gt; On 28/03/18 01:01, Stefano Stabellini wrote:<br>
&gt; &gt; On Wed, 21 Mar 2018, Andre Przywara wrote:<br>
&gt; &gt;&gt; The event channel IRQ has level triggered semantics, however =
the current<br>
&gt; &gt;&gt; VGIC treats everything as edge triggered.<br>
&gt; &gt;&gt; To correctly process those IRQs, we have to lower the (virtua=
l) IRQ line<br>
&gt; &gt;&gt; at some point in time, depending on whether ther interrupt co=
ndition<br>
&gt; &gt;&gt; still prevails.<br>
&gt; &gt;&gt; Check the per-VCPU evtchn_upcall_pending variable to make the=
 interrupt<br>
&gt; &gt;&gt; line match its status, and call this function upon every hype=
rvisor<br>
&gt; &gt;&gt; entry.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Andre Przywara &lt;<a href=3D"mailto:andre.prz=
ywara@linaro.org" target=3D"_blank">andre.przywara@linaro.org</a>&gt;<br>
&gt; &gt;&gt; Reviewed-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@=
arm.com" target=3D"_blank">julien.grall@arm.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 xen/arch/arm/domain.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++=
++++<br>
&gt; &gt;&gt;=C2=A0 xen/arch/arm/traps.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<b=
r>
&gt; &gt;&gt;=C2=A0 xen/include/asm-arm/event.h | 1 +<br>
&gt; &gt;&gt;=C2=A0 3 files changed, 9 insertions(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c<br=
>
&gt; &gt;&gt; index ff97f2bc76..9688e62f78 100644<br>
&gt; &gt;&gt; --- a/xen/arch/arm/domain.c<br>
&gt; &gt;&gt; +++ b/xen/arch/arm/domain.c<br>
&gt; &gt;&gt; @@ -953,6 +953,13 @@ void vcpu_mark_events_pending(struct vcp=
u *v)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 vgic_inject_irq(v-&gt;domain, v, v-&gt;do=
main-&gt;arch.evtchn_irq, true);<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; +void vcpu_update_evtchn_irq(struct vcpu *v)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 bool pending =3D vcpu_info(v, evtchn_upcall_pe=
nding);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 vgic_inject_irq(v-&gt;domain, v, v-&gt;domain-=
&gt;arch.evtchn_irq, pending);<br>
&gt; &gt;&gt; +}<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt;=C2=A0 /* The ARM spec declares that even if local irqs are ma=
sked in<br>
&gt; &gt;&gt;=C2=A0 =C2=A0* the CPSR register, an irq should wake up a cpu =
from WFI anyway.<br>
&gt; &gt;&gt;=C2=A0 =C2=A0* For this reason we need to check for irqs that =
need delivery,<br>
&gt; &gt;&gt; diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c<br>
&gt; &gt;&gt; index 2638446693..5c18e918b0 100644<br>
&gt; &gt;&gt; --- a/xen/arch/arm/traps.c<br>
&gt; &gt;&gt; +++ b/xen/arch/arm/traps.c<br>
&gt; &gt;&gt; @@ -2033,6 +2033,7 @@ static void enter_hypervisor_head(struc=
t cpu_user_regs *regs)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* trap and how it can=
 be optimised.<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vtimer_update_irqs(current)=
;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vcpu_update_evtchn_irq(current);=
<br>
&gt; &gt;&gt;=C2=A0 #endif<br>
&gt; &gt;<br>
&gt; &gt; I am replying to this patch, even though I have already committed=
 it, to<br>
&gt; &gt; point out a problem with the way we currently handle the evtchn_i=
rq in<br>
&gt; &gt; this series.<br>
&gt; &gt;<br>
&gt; &gt; The short version is that I think we should configure the PPI<br>
&gt; &gt; corresponding to the evtchn_irq as EDGE instead of LEVEL.<br>
&gt;<br>
&gt; Well, that&#39;s really a separate problem, then. We can&#39;t just co=
nfigure<br>
&gt; the PPI at will, it has to match the device semantic.<br>
&gt; When writing this patch, I checked how the the evtchn &quot;device&quo=
t; is<br>
&gt; implemented, and it screams &quot;level IRQ&quot; to me:<br>
&gt; - We have a flag (evtchn_upcall_pending), which stores the current<br>
&gt; interrupt state.<br>
&gt; - This flag gets set by the producer when the interrupt condition is t=
rue.<br>
&gt; - It gets cleared by the *consumer* once it has handled the request.<b=
r>
&gt;<br>
&gt; So if the event channel mechanism should be edge (which would be fair<=
br>
&gt; enough), we need to change the code to implement this: the interrupt<b=
r>
&gt; condition should be cleared once we *injected* the IRQ - and not only<=
br>
&gt; when the consumer has signalled completion.<br>
&gt;<br>
&gt; Another thing to consider: by the spec the *configurability* of PPIs i=
s<br>
&gt; implementation defined. The KVM implementation chose to fix all of the=
m<br>
&gt; to &quot;level&quot;, which we need for the arch timer. So setting the=
 evtchn PPI<br>
&gt; to edge would be ignored. We could deviate from that, but I need to<br=
>
&gt; check what the side effects are.<br>
&gt;<br>
&gt; &gt; The long explanation follows, please correct me if I am wrong.<br=
>
&gt; &gt;<br>
&gt; &gt; 1) vcpuA/cpuA is running, it has already handled the event, clear=
ed<br>
&gt; &gt; evtchn_upcall_pending and EOIed the event_irq but hasn&#39;t trap=
ped into<br>
&gt; &gt; Xen yet. It is still in guest mode.<br>
&gt; &gt;<br>
&gt; &gt; 2) Xen on cpuB calls vcpu_mark_events_pending(vcpuA), then calls<=
br>
&gt; &gt; vgic_inject_irq. However, because irq-&gt;line_level is high, it =
is not<br>
&gt; &gt; injected.<br>
&gt;<br>
&gt; So this is a case where we fail to sync in time on the actual emulated=
<br>
&gt; line level. KVM recently gained some nice code to solve this: We can<b=
r>
&gt; register per-IRQ functions that return the line level. For hardware<br=
>
&gt; mapped IRQs this queries the distributor, but for the arch timer for<b=
r>
&gt; instance it just uses a shortcut to read CNTV_CTL_EL0.<br>
&gt; The evtchn IRQ could just check evtchn_upcall_pending.<br>
&gt;<br>
&gt; I can take a look at a follow up patch to implement this.<br>
<br>
I agree that the evtchn_upcall_pending mechanism is very similar to a<br>
level interrupt, however the mechanism to bring the notification to the<br>
guest is edge, even on x86. Even with the new vgic implementation it<br>
falls very naturally in the edge pattern of behaviors. This is one of<br>
those cases where I would be happy to deviate from the KVM<br>
implementation, because it makes sense and would be easier to maintain<br>
going forward. We can even get rid of vcpu_update_evtchn_irq.<br>
<br>
I am OK with a not-ideal short term fix by the end of this week, as long<br=
>
as we come up with a proper fix later, by the release date. But in this<br>
instance, wouldn&#39;t be enough to change the PPI type to EDGE, remove<br>
vcpu_update_evtchn_irq, and be done with it?<br></blockquote></div><div><br=
></div><div>We expose the event channsl as level in the DT and HVM_PARAM_CA=
LLBACK_IRQ. So they at least need to change.</div><div><br></div><div>But I=
 an bit concerned to change those values between the 2 versions of the vGIC=
.</div><div><br></div><div>What was the rationale to expose them as level i=
n the old vGIC?</div><div><br></div><div><br></div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
<br>
<br>
&gt; &gt; 3) vcpuA has to wait until trapping into Xen, calling<br>
&gt; &gt; vcpu_update_evtchn_irq, and going back to guest mode before recei=
ving<br>
&gt; &gt; the event. This is theoretically a very long time.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Instead what should happen is:<br>
&gt; &gt;<br>
&gt; &gt; 1) vcpuA/cpuA is running, it has already handled the event, clear=
ed<br>
&gt; &gt; evtchn_upcall_pending and EOIed the event_irq but hasn&#39;t trap=
ped into<br>
&gt; &gt; Xen yet. It is still in guest mode.<br>
&gt; &gt;<br>
&gt; &gt; 2) Xen on cpuB calls vcpu_mark_events_pending(vcpuA), then calls<=
br>
&gt; &gt; vgic_inject_irq, which calls vgic_queue_irq_unlock that<br>
&gt; &gt; vcpu_kick(vcpuA), forcing it to take the event immediately.<br>
&gt; &gt;<br>
&gt; &gt; Am I right? Wouldn&#39;t it be safer to continue configuring the =
evtchn_irq<br>
&gt; &gt; as edge even in the new vgic?<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--001a113cd874edac9705688249c1--


--===============4411419820567887164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4411419820567887164==--
