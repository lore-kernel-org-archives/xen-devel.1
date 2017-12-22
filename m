From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [RFC] xen/arm: Suspend to RAM Support in Xen for ARM
Date: Fri, 22 Dec 2017 18:51:10 +0100
Message-ID: <CAKPH-NijP6uU_7W-ssBceZ0wov3BDjEGqzTcwapBHHM3rpCVzQ@mail.gmail.com>
References: <20170809174338.10143-1-mirela.simonovic@aggios.com>
 <alpine.DEB.2.10.1712111456180.8052@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4626821286136253464=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1712111456180.8052@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Will Wong <will.wong@xilinx.com>, Davorin Mista <davorin.mista@aggios.com>, Nirmala Pelluri <nirmala.pelluri@xilinx.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============4626821286136253464==
Content-Type: multipart/alternative; boundary="001a113fe8b24957ee0560f17662"

--001a113fe8b24957ee0560f17662
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

Thanks for review.

On Tue, Dec 12, 2017 at 12:10 AM, Stefano Stabellini <sstabellini@kernel.org
> wrote:

> On Wed, 9 Aug 2017, Mirela Simonovic wrote:
> > This document contains our draft proposal for implementing "suspend to
> RAM"
> > support for ARM in Xen, as discussed during the last Xen ARM community
> call.
> > It covers the basic suspend to RAM mechanism based on ARM PSCI standard,
> > that would allow individual guests and Xen itself to suspend.
> >
> > We would appreciate your feedback.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> I am really sorry, for the very late reply. This email fell through the
> cracks. In general, if I forget about an email, please send a follow up
> to help me remember :-) Do you have an more up-to-date proposal or is
> this still the latest?
>

I've just sent new version, you're cc-ed.


>
> From an high level, it looks good, only one minor comment: don't call it
> "hotplug" because usually in the Xen community hotplug means adding more
> vcpus or removing vcpus at runtime (removing entirely, not suspending).
>
>
PSCI-based suspend relies on hotplug mechanism for suspending/resuming
non-boot CPUs. I believe we are aligned with the terminology, but if I
missed something please let me know.
I have updated the design spec, hope it's better now.

Thanks,
Mirela


> But the approach looks good to me.
>
>
> > ---
> >  docs/misc/arm/suspend-to-ram.txt | 210 ++++++++++++++++++++++++++++++
> +++++++++
> >  1 file changed, 210 insertions(+)
> >  create mode 100644 docs/misc/arm/suspend-to-ram.txt
> >
> > diff --git a/docs/misc/arm/suspend-to-ram.txt
> b/docs/misc/arm/suspend-to-ram.txt
> > new file mode 100644
> > index 0000000000..ec8080fc64
> > --- /dev/null
> > +++ b/docs/misc/arm/suspend-to-ram.txt
> > @@ -0,0 +1,210 @@
> > +% Suspend to RAM Support in Xen for ARM
> > +% Revision 1.0
> > +
> > +========
> > +Overview
> > +========
> > +
> > +Suspend to RAM (in the following text 'suspend') for ARM in Xen should
> be
> > +coordinated using ARM PSCI standard [1].
> > +
> > +EL1/2 should suspend in the following order:
> > +1) Unprivileged guests (DomUs) suspend
> > +2) Privileged guest (Dom0) suspends
> > +3) Xen suspends
> > +
> > +Since this proposal is focused on implementing PSCI-based suspend
> mechanisms in
> > +Xen, communication with or among the guests is not covered by this
> document.
> > +The order of suspending the guests is assumed to be guaranteed by the
> software
> > +running in EL1.
> > +
> > +-----------------
> > +Suspending Guests
> > +-----------------
> > +
> > +Suspend procedure for a guest consists of the following:
> > +1) Suspending devices
> > +2) Suspending non-boot CPUs
> > +3) System suspend, performed by the boot CPU
> > +
> > +Each guest should suspend the devices it owns. Suspending of devices is
> not
> > +covered by this document. The document covers only mechanisms for
> suspending
> > +non-boot CPUs, as well as the system suspend.
> > +
> > +Guests should suspend their non-boot vCPUs using the hotplug mechanism.
> > +Virtual CPUs should be put offline using the already implemented PSCI
> vCPU_OFF
> > +call (prefix 'v' is added to distinguish PSCI calls made by guests to
> Xen, which
> > +affect virtual machines; as opposed to PSCI calls made by Xen to the
> EL3, which
> > +can affect power state of the physical machine).
> > +
> > +After suspending its non-boot vCPUs a guest should finalize the suspend
> by
> > +making the vSYSTEM_SUSPEND PSCI call. The resume address is specified
> by the
> > +guest via the vSYSTEM_SUSPEND entry_point_address argument. The
> vSYSTEM_SUSPEND
> > +call is currently not implemented in Xen.
> > +
> > +It is expected that a guest leaves enabled all interrupts that should
> wake it
> > +up. Other interrupts should be disabled by the guest prior to calling
> > +vSYSTEM_SUSPEND.
> > +
> > +After an unprivileged guest suspends, Xen will not suspend. Xen would
> suspend
> > +only after the Dom0 completes the system suspend.
> > +
> > +--------------
> > +Suspending Xen
> > +--------------
> > +
> > +Xen should start suspending itself upon receiving the vSYSTEM_SUSPEND
> call
> > +from the last running guest (Dom0). At that moment all physical CPUs
> are still
> > +online (taking offline a vCPU or suspending a VM does not affect
> physical CPUs).
> > +Xen shall now put offline the non-boot pCPUs by making the CPU_OFF PSCI
> call
> > +to EL3. The CPU_OFF PSCI function is currently not implemented in Xen.
> > +
> > +After putting offline the non-boot cores Xen must save the context and
> finalize
> > +suspend by invoking SYSTEM_SUSPEND PSCI call, which is passed to EL3.
> > +The resume point of Xen is specified by the entry_point_address
> argument of the
> > +SYSTEM_SUSPEND call. The SYSTEM_SUSPEND function and context saving is
> not
> > +implemented in Xen for ARM today.
> > +
> > +------------
> > +Resuming Xen
> > +------------
> > +
> > +Xen must be resumed prior to any software running in EL1. Starting from
> the
> > +resume point, Xen should restore the context and resume Dom0. Dom0
> shall always
> > +be resumed whenever Xen resumes.
> > +The whole Xen resume flow for the ARM architecture has to be
> implemented.
> > +
> > +---------------
> > +Resuming Guests
> > +---------------
> > +
> > +Resume of the privileged guest (Dom0) is always following the Xen
> resume.
> > +
> > +An unprivileged guest shall resume once a device it owns triggers a
> wake-up
> > +interrupt, regardless of whether Xen was suspended when the wake-up
> interrupt
> > +was triggered. If Xen was suspended, it is assumed that Dom0 will be
> running
> > +before the DomU guest starts to resume. The synchronization mechanism to
> > +enforce the assumed condition is TBD.
> > +
> > +If the ARM's GIC was powered down after the ARM subsystem suspended, it
> is
> > +assumed that Xen needs to restore the GIC interface for a VM prior to
> handing
> > +over control to the guest. However, the guest should restore its own
> context
> > +upon entering the resume point (out of scope of this document).
> > +
> > +=======================
> > +Implementation Proposal
> > +=======================
> > +
> > +--------
> > +Overview
> > +--------
> > +
> > +In order to enable the suspend/resume of VMs and Xen itself, the
> following PSCI
> > +calls have to be implemented and integrated in Xen:
> > +1) vSYSTEM_SUSPEND
> > +2) CPU_OFF
> > +3) SYSTEM_SUSPEND
> > +
> > +In addition, the following have to be implemented:
> > +* Save/restore of EL2 context
> > +* Save/restore of GIC configuration for each VM
> > +
> > +Implementation details are provided in the sections below. Function
> names and
> > +paths used below are consistent within the document but may not always
> match the
> > +names used in future implementation. Existing functions and paths are
> named as
> > +in Xen source tree.
> > +
> > +Note: The proposal is still incomplete and shall be refined in future
> revisions.
> > +Specific issues that are not addressed are marked as "TBD".
> > +
> > +-------------------------------------
> > +Suspend/Resume Implementation Details
> > +-------------------------------------
> > +
> > +PSCI Implementation and Integration
> > +-----------------------------------
> > +vSYSTEM_SUSPEND
> > +---------------
> > +vSYSTEM_SUSPEND shall be implemented in
> > +* do_psci_system_suspend() in arch/arm/vpsci.c
> > +
> > +The implementation shall include the following steps:
> > +* Block the current vCPU
> > +* If the hardware domain made the call trigger Xen suspend, i.e.
> > +  call machine_suspend() which will be implemented in arch/arm/suspend.c
> > + (similar as the machine_restart() is implemented in
> arch/arm/shutdown.c)
> > +
> > +The function do_psci_system_suspend() shall be called from
> > +* do_trap_psci() in arch/arm/traps.c
> > +
> > +CPU_OFF (physical CPUs)
> > +-----------------------
> > +The CPU_OFF function shall be implemented in
> > +* call_psci_cpu_off() in arch/arm/psci.c
> > +
> > +The implementation shall consist just of making the SMC call to EL3.
> > +
> > +This function needs to be called when Xen generic code disables
> non-boot CPUs,
> > +which is done by
> > +* disable_nonboot_cpus() in common/cpu.c
> > +This function calls architecture specific
> > +* __cpu_die() implemented in arch/arm/smpboot.c
> > +The call_psci_cpu_off() shall be invoked when the respective CPU dies.
> To make
> > +that happen, the
> > +* arch_cpu_die() would be implemented in arch/arm/arm64/smpboot.c
> > +and called from __cpu_die().
> > +Finally the call_psci_cpu_off() shall be invoked from arch_cpu_die().
> > +
> > +Such a control flow would be similar to the already existing flow for
> enabling
> > +non-boot CPUs, which looks like this:
> > +enable_nonboot_cpus() -> cpu_up() -> __cpu_up() -> arch_cpu_up() ->
> > +call_psci_cpu_on()
> > +
> > +SYSTEM_SUSPEND (physical)
> > +-------------------------
> > +The SYSTEM_SUSPEND function shall be implemented in
> > +* call_psci_system_suspend() in arch/arm/psci.c
> > +
> > +The implementation shall consist just of making the SMC call to EL3. The
> > +entry_point_address argument of the SMC call needs to be an ARM
> architecture
> > +resume address. The call_psci_system_suspend() function does not return.
> > +
> > +The function needs to be called from machine_suspend() to finalize the
> suspend
> > +procedure.
> > +
> > +------------------
> > +Additional Changes
> > +------------------
> > +
> > +Suspend Flow
> > +------------
> > +The suspend procedure shall be implemented in
> > +* machine_suspend() in arch/arm/suspend.c
> > +
> > +The implementation shall include the following steps:
> > +* Set the system_state variable to SYS_STATE_suspend
> > +* Freeze domains by calling domain_pause() for each domain (we assume
> this needs
> > +  to be done)
> > +* Disable non-boot CPUs by calling disable_nonboot_cpus()
> > +* Save ARM specific context
> > +
> > +Resume Flow
> > +------------
> > +The resume procedure shall be implemented in
> > +* machine_resume() in arch/arm/suspend.c
> > +
> > +The machine_resume() implementation shall include the following steps:
> > +* Restore ARM specific context
> > +* Enable non-boot CPUs by calling enable_nonboot_cpus()
> > +* Thaw domains by calling domain_unpause() for each domain (we assume
> this needs
> > +  to be done)
> > +* Set the system_state variable to SYS_STATE_resume
> > +* TBD: how to resume Dom0, i.e. how to hand over control to Dom0?
> > +
> > +==========
> > +References
> > +==========
> > +
> > +[1] Power State Coordination Interface (ARM):
> > +http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/Power_State_
> Coordination_Interface_PDD_v1_1_DEN0022D.pdf
> > +
> > --
> > 2.13.0
> >
> >
> > _______________________________________________
> > Xen-devel mailing list
> > Xen-devel@lists.xen.org
> > https://lists.xen.org/xen-devel
> >
>

--001a113fe8b24957ee0560f17662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefano,<div><br></div><div>Thanks for review.</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Dec 12, 2017=
 at 12:10 AM, Stefano Stabellini <span dir=3D"ltr">&lt;<a href=3D"mailto:ss=
tabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail-">On Wed, 9 Aug 2017, Mirela Simonovic wrote:<br>
&gt; This document contains our draft proposal for implementing &quot;suspe=
nd to RAM&quot;<br>
&gt; support for ARM in Xen, as discussed during the last Xen ARM community=
 call.<br>
&gt; It covers the basic suspend to RAM mechanism based on ARM PSCI standar=
d,<br>
&gt; that would allow individual guests and Xen itself to suspend.<br>
&gt;<br>
&gt; We would appreciate your feedback.<br>
&gt;<br>
&gt; Signed-off-by: Mirela Simonovic &lt;<a href=3D"mailto:mirela.simonovic=
@aggios.com">mirela.simonovic@aggios.com</a>&gt;<br>
<br>
</span>I am really sorry, for the very late reply. This email fell through =
the<br>
cracks. In general, if I forget about an email, please send a follow up<br>
to help me remember :-) Do you have an more up-to-date proposal or is<br>
this still the latest?<br></blockquote><div><br></div><div>I&#39;ve just se=
nt new version, you&#39;re cc-ed.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
>From an high level, it looks good, only one minor comment: don&#39;t call i=
t<br>
&quot;hotplug&quot; because usually in the Xen community hotplug means addi=
ng more<br>
vcpus or removing vcpus at runtime (removing entirely, not suspending).<br>
<br></blockquote><div><br></div><div>PSCI-based suspend relies on hotplug m=
echanism for suspending/resuming non-boot CPUs. I believe we are aligned wi=
th the terminology, but if I missed something please let me know.=C2=A0</di=
v><div>I have updated the design spec, hope it&#39;s better now.<br></div><=
div><br></div><div>Thanks,</div><div>Mirela</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
But the approach looks good to me.<br>
<div><div class=3D"gmail-h5"><br>
<br>
&gt; ---<br>
&gt;=C2=A0 docs/misc/arm/suspend-to-ram.<wbr>txt | 210 ++++++++++++++++++++=
++++++++++<wbr>+++++++++<br>
&gt;=C2=A0 1 file changed, 210 insertions(+)<br>
&gt;=C2=A0 create mode 100644 docs/misc/arm/suspend-to-ram.<wbr>txt<br>
&gt;<br>
&gt; diff --git a/docs/misc/arm/suspend-to-<wbr>ram.txt b/docs/misc/arm/sus=
pend-to-<wbr>ram.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ec8080fc64<br>
&gt; --- /dev/null<br>
&gt; +++ b/docs/misc/arm/suspend-to-<wbr>ram.txt<br>
&gt; @@ -0,0 +1,210 @@<br>
&gt; +% Suspend to RAM Support in Xen for ARM<br>
&gt; +% Revision 1.0<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +Overview<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +Suspend to RAM (in the following text &#39;suspend&#39;) for ARM in X=
en should be<br>
&gt; +coordinated using ARM PSCI standard [1].<br>
&gt; +<br>
&gt; +EL1/2 should suspend in the following order:<br>
&gt; +1) Unprivileged guests (DomUs) suspend<br>
&gt; +2) Privileged guest (Dom0) suspends<br>
&gt; +3) Xen suspends<br>
&gt; +<br>
&gt; +Since this proposal is focused on implementing PSCI-based suspend mec=
hanisms in<br>
&gt; +Xen, communication with or among the guests is not covered by this do=
cument.<br>
&gt; +The order of suspending the guests is assumed to be guaranteed by the=
 software<br>
&gt; +running in EL1.<br>
&gt; +<br>
&gt; +-----------------<br>
&gt; +Suspending Guests<br>
&gt; +-----------------<br>
&gt; +<br>
&gt; +Suspend procedure for a guest consists of the following:<br>
&gt; +1) Suspending devices<br>
&gt; +2) Suspending non-boot CPUs<br>
&gt; +3) System suspend, performed by the boot CPU<br>
&gt; +<br>
&gt; +Each guest should suspend the devices it owns. Suspending of devices =
is not<br>
&gt; +covered by this document. The document covers only mechanisms for sus=
pending<br>
&gt; +non-boot CPUs, as well as the system suspend.<br>
&gt; +<br>
&gt; +Guests should suspend their non-boot vCPUs using the hotplug mechanis=
m.<br>
&gt; +Virtual CPUs should be put offline using the already implemented PSCI=
 vCPU_OFF<br>
&gt; +call (prefix &#39;v&#39; is added to distinguish PSCI calls made by g=
uests to Xen, which<br>
&gt; +affect virtual machines; as opposed to PSCI calls made by Xen to the =
EL3, which<br>
&gt; +can affect power state of the physical machine).<br>
&gt; +<br>
&gt; +After suspending its non-boot vCPUs a guest should finalize the suspe=
nd by<br>
&gt; +making the vSYSTEM_SUSPEND PSCI call. The resume address is specified=
 by the<br>
&gt; +guest via the vSYSTEM_SUSPEND entry_point_address argument. The vSYST=
EM_SUSPEND<br>
&gt; +call is currently not implemented in Xen.<br>
&gt; +<br>
&gt; +It is expected that a guest leaves enabled all interrupts that should=
 wake it<br>
&gt; +up. Other interrupts should be disabled by the guest prior to calling=
<br>
&gt; +vSYSTEM_SUSPEND.<br>
&gt; +<br>
&gt; +After an unprivileged guest suspends, Xen will not suspend. Xen would=
 suspend<br>
&gt; +only after the Dom0 completes the system suspend.<br>
&gt; +<br>
&gt; +--------------<br>
&gt; +Suspending Xen<br>
&gt; +--------------<br>
&gt; +<br>
&gt; +Xen should start suspending itself upon receiving the vSYSTEM_SUSPEND=
 call<br>
&gt; +from the last running guest (Dom0). At that moment all physical CPUs =
are still<br>
&gt; +online (taking offline a vCPU or suspending a VM does not affect phys=
ical CPUs).<br>
&gt; +Xen shall now put offline the non-boot pCPUs by making the CPU_OFF PS=
CI call<br>
&gt; +to EL3. The CPU_OFF PSCI function is currently not implemented in Xen=
.<br>
&gt; +<br>
&gt; +After putting offline the non-boot cores Xen must save the context an=
d finalize<br>
&gt; +suspend by invoking SYSTEM_SUSPEND PSCI call, which is passed to EL3.=
<br>
&gt; +The resume point of Xen is specified by the entry_point_address argum=
ent of the<br>
&gt; +SYSTEM_SUSPEND call. The SYSTEM_SUSPEND function and context saving i=
s not<br>
&gt; +implemented in Xen for ARM today.<br>
&gt; +<br>
&gt; +------------<br>
&gt; +Resuming Xen<br>
&gt; +------------<br>
&gt; +<br>
&gt; +Xen must be resumed prior to any software running in EL1. Starting fr=
om the<br>
&gt; +resume point, Xen should restore the context and resume Dom0. Dom0 sh=
all always<br>
&gt; +be resumed whenever Xen resumes.<br>
&gt; +The whole Xen resume flow for the ARM architecture has to be implemen=
ted.<br>
&gt; +<br>
&gt; +---------------<br>
&gt; +Resuming Guests<br>
&gt; +---------------<br>
&gt; +<br>
&gt; +Resume of the privileged guest (Dom0) is always following the Xen res=
ume.<br>
&gt; +<br>
&gt; +An unprivileged guest shall resume once a device it owns triggers a w=
ake-up<br>
&gt; +interrupt, regardless of whether Xen was suspended when the wake-up i=
nterrupt<br>
&gt; +was triggered. If Xen was suspended, it is assumed that Dom0 will be =
running<br>
&gt; +before the DomU guest starts to resume. The synchronization mechanism=
 to<br>
&gt; +enforce the assumed condition is TBD.<br>
&gt; +<br>
&gt; +If the ARM&#39;s GIC was powered down after the ARM subsystem suspend=
ed, it is<br>
&gt; +assumed that Xen needs to restore the GIC interface for a VM prior to=
 handing<br>
&gt; +over control to the guest. However, the guest should restore its own =
context<br>
&gt; +upon entering the resume point (out of scope of this document).<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; +Implementation Proposal<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; +<br>
&gt; +--------<br>
&gt; +Overview<br>
&gt; +--------<br>
&gt; +<br>
&gt; +In order to enable the suspend/resume of VMs and Xen itself, the foll=
owing PSCI<br>
&gt; +calls have to be implemented and integrated in Xen:<br>
&gt; +1) vSYSTEM_SUSPEND<br>
&gt; +2) CPU_OFF<br>
&gt; +3) SYSTEM_SUSPEND<br>
&gt; +<br>
&gt; +In addition, the following have to be implemented:<br>
&gt; +* Save/restore of EL2 context<br>
&gt; +* Save/restore of GIC configuration for each VM<br>
&gt; +<br>
&gt; +Implementation details are provided in the sections below. Function n=
ames and<br>
&gt; +paths used below are consistent within the document but may not alway=
s match the<br>
&gt; +names used in future implementation. Existing functions and paths are=
 named as<br>
&gt; +in Xen source tree.<br>
&gt; +<br>
&gt; +Note: The proposal is still incomplete and shall be refined in future=
 revisions.<br>
&gt; +Specific issues that are not addressed are marked as &quot;TBD&quot;.=
<br>
&gt; +<br>
&gt; +-----------------------------<wbr>--------<br>
&gt; +Suspend/Resume Implementation Details<br>
&gt; +-----------------------------<wbr>--------<br>
&gt; +<br>
&gt; +PSCI Implementation and Integration<br>
&gt; +-----------------------------<wbr>------<br>
&gt; +vSYSTEM_SUSPEND<br>
&gt; +---------------<br>
&gt; +vSYSTEM_SUSPEND shall be implemented in<br>
&gt; +* do_psci_system_suspend() in arch/arm/vpsci.c<br>
&gt; +<br>
&gt; +The implementation shall include the following steps:<br>
&gt; +* Block the current vCPU<br>
&gt; +* If the hardware domain made the call trigger Xen suspend, i.e.<br>
&gt; +=C2=A0 call machine_suspend() which will be implemented in arch/arm/s=
uspend.c<br>
&gt; + (similar as the machine_restart() is implemented in arch/arm/shutdow=
n.c)<br>
&gt; +<br>
&gt; +The function do_psci_system_suspend() shall be called from<br>
&gt; +* do_trap_psci() in arch/arm/traps.c<br>
&gt; +<br>
&gt; +CPU_OFF (physical CPUs)<br>
&gt; +-----------------------<br>
&gt; +The CPU_OFF function shall be implemented in<br>
&gt; +* call_psci_cpu_off() in arch/arm/psci.c<br>
&gt; +<br>
&gt; +The implementation shall consist just of making the SMC call to EL3.<=
br>
&gt; +<br>
&gt; +This function needs to be called when Xen generic code disables non-b=
oot CPUs,<br>
&gt; +which is done by<br>
&gt; +* disable_nonboot_cpus() in common/cpu.c<br>
&gt; +This function calls architecture specific<br>
&gt; +* __cpu_die() implemented in arch/arm/smpboot.c<br>
&gt; +The call_psci_cpu_off() shall be invoked when the respective CPU dies=
. To make<br>
&gt; +that happen, the<br>
&gt; +* arch_cpu_die() would be implemented in arch/arm/arm64/smpboot.c<br>
&gt; +and called from __cpu_die().<br>
&gt; +Finally the call_psci_cpu_off() shall be invoked from arch_cpu_die().=
<br>
&gt; +<br>
&gt; +Such a control flow would be similar to the already existing flow for=
 enabling<br>
&gt; +non-boot CPUs, which looks like this:<br>
&gt; +enable_nonboot_cpus() -&gt; cpu_up() -&gt; __cpu_up() -&gt; arch_cpu_=
up() -&gt;<br>
&gt; +call_psci_cpu_on()<br>
&gt; +<br>
&gt; +SYSTEM_SUSPEND (physical)<br>
&gt; +-------------------------<br>
&gt; +The SYSTEM_SUSPEND function shall be implemented in<br>
&gt; +* call_psci_system_suspend() in arch/arm/psci.c<br>
&gt; +<br>
&gt; +The implementation shall consist just of making the SMC call to EL3. =
The<br>
&gt; +entry_point_address argument of the SMC call needs to be an ARM archi=
tecture<br>
&gt; +resume address. The call_psci_system_suspend() function does not retu=
rn.<br>
&gt; +<br>
&gt; +The function needs to be called from machine_suspend() to finalize th=
e suspend<br>
&gt; +procedure.<br>
&gt; +<br>
&gt; +------------------<br>
&gt; +Additional Changes<br>
&gt; +------------------<br>
&gt; +<br>
&gt; +Suspend Flow<br>
&gt; +------------<br>
&gt; +The suspend procedure shall be implemented in<br>
&gt; +* machine_suspend() in arch/arm/suspend.c<br>
&gt; +<br>
&gt; +The implementation shall include the following steps:<br>
&gt; +* Set the system_state variable to SYS_STATE_suspend<br>
&gt; +* Freeze domains by calling domain_pause() for each domain (we assume=
 this needs<br>
&gt; +=C2=A0 to be done)<br>
&gt; +* Disable non-boot CPUs by calling disable_nonboot_cpus()<br>
&gt; +* Save ARM specific context<br>
&gt; +<br>
&gt; +Resume Flow<br>
&gt; +------------<br>
&gt; +The resume procedure shall be implemented in<br>
&gt; +* machine_resume() in arch/arm/suspend.c<br>
&gt; +<br>
&gt; +The machine_resume() implementation shall include the following steps=
:<br>
&gt; +* Restore ARM specific context<br>
&gt; +* Enable non-boot CPUs by calling enable_nonboot_cpus()<br>
&gt; +* Thaw domains by calling domain_unpause() for each domain (we assume=
 this needs<br>
&gt; +=C2=A0 to be done)<br>
&gt; +* Set the system_state variable to SYS_STATE_resume<br>
&gt; +* TBD: how to resume Dom0, i.e. how to hand over control to Dom0?<br>
&gt; +<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +References<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +[1] Power State Coordination Interface (ARM):<br>
&gt; +<a href=3D"http://infocenter.arm.com/help/topic/com.arm.doc.den0022d/=
Power_State_Coordination_Interface_PDD_v1_1_DEN0022D.pdf" rel=3D"noreferrer=
" target=3D"_blank">http://infocenter.arm.com/<wbr>help/topic/com.arm.doc.<=
wbr>den0022d/Power_State_<wbr>Coordination_Interface_PDD_v1_<wbr>1_DEN0022D=
.pdf</a><br>
&gt; +<br>
&gt; --<br>
&gt; 2.13.0<br>
&gt;<br>
&gt;<br>
</div></div>&gt; ______________________________<wbr>_________________<br>
&gt; Xen-devel mailing list<br>
&gt; <a href=3D"mailto:Xen-devel@lists.xen.org">Xen-devel@lists.xen.org</a>=
<br>
&gt; <a href=3D"https://lists.xen.org/xen-devel" rel=3D"noreferrer" target=
=3D"_blank">https://lists.xen.org/xen-<wbr>devel</a><br>
&gt;<br>
</blockquote></div><br></div></div>

--001a113fe8b24957ee0560f17662--


--===============4626821286136253464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4626821286136253464==--
