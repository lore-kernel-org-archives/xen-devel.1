From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH v4 00/10] xen/arm64: Suspend preconditions
 and CPU hotplug fixes
Date: Mon, 28 May 2018 12:15:04 +0200
Message-ID: <CAKPH-NhQFucKoGg6j84E1tMBDHSvVXSeGto7nQUA3CApBFEoVw@mail.gmail.com>
References: <20180515114419.7296-1-mirela.simonovic@aggios.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7627626492503469751=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180515114419.7296-1-mirela.simonovic@aggios.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen Devel <xen-devel@lists.xen.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

--===============7627626492503469751==
Content-Type: multipart/alternative; boundary="0000000000003161da056d41647e"

--0000000000003161da056d41647e
Content-Type: text/plain; charset="UTF-8"

Hi,

Could you please provide feedback for the remaining patches?

Thanks,
Mirela

On Tue, May 15, 2018 at 1:44 PM, Mirela Simonovic <
mirela.simonovic@aggios.com> wrote:

> This patch set contains fixes that are required as precondition for
> suspend to
> RAM support, including the CPU hotplug which is required to suspend
> non-boot
> CPUs.
> The first two patches in this series:
> 1) xen/arm64: Added handling of the trapped access to OSLSR register
> 2) xen/arm: Ignore write to GICD_ISACTIVERn registers (vgic-v2)
> are required to avoid Dom0 crashes when Dom0 performs its own suspend. This
> patch set does not include the implementation of virtual PSCI system
> suspend
> call that would allow guests to finalize their suspend procedures. This
> will
> be submitted in the following series.
>
> Remaining of the patches are related to enabling CPU hotplug for non-boot
> CPUs is resume scenario. CPU hotplug of non-boot CPUs will be used for
> suspend
> to RAM support for ARM. In suspend procedure, the hot-unplug of non-boot
> CPUs
> will be triggered with disable_nonboot_cpus(), while the hotplug is
> triggered
> with enable_nonboot_cpus(). Using these calls, the physical non-boot CPUs
> could
> be powered down/up on suspend/resume, respectively, if the underlying
> firmware
> allows so. Calls to enable/disable_nonboot_cpus() functions currently do
> not
> exist in Xen ARM code. This will be added with the suspend to RAM support
> for
> ARM.
>
> When non-boot pCPUs are hot-unplugged their interrupts are migrated to the
> boot
> pCPU. This series also includes a fix that would restore the interrupts
> affinity
> once non-boot pCPUs are hotplugged. Here only SPIs used by guests are
> covered.
> Migration of Xen internal SPIs is not covered. According to my
> understanding
> Xen internal SPIs are routed to the boot CPU which initializes the
> respective
> devices. Therefore, there is no need to migrate Xen internal SPIs.
>
> The code is tested on Xilinx Zynq UltraScale+ MPSoC/ZCU102 board (includes
> physical power down/up of non-boot CPUs). The testing requires additional
> patches for issuing system suspend. These patches and instructions for
> testing
> will be submitted later, when we get closer to the final version of the
> series.
>
> ---
> Changes in v2:
> -Rename cover-letter title and emphasize that 2 patches from this series
> are not
> specific to CPU hotplug (my initial fault, splitting it now could be
> confusing)
> -Fix cover-letter explanations
> -Address all the issues and comments as discussed on mailing list for v1
> -Add 3 patches to ensure that suspend/resume does not cause any memory
> leaks.
> All the memory allocated when a CPU was hotplugged is now freed when the
> CPU is
> hot-unplugged.
> -Remove from the v1 series the patch which incorrectly dealt with an issue:
> [PATCH 4/7] xen/arm: When CPU dies, free percpu area immediatelly
> One solution to the issue addressed by the patch above is to add
> rcu_barrier()
> prior to calling enable_nonboot_cpus() during the suspend. This is how it
> is
> done in x86 suspend implementation. Until the discussion here
> https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg01199.html
> doesn't conclude differently, I need to assume that adding rcu_barrier()
> prior
> to calling enable_nonboot_cpus() as it is done for x86 is the right way to
> go.
> Therefore, the fix to the issue will be part of the suspend to RAM series.
>
> Changes in v3:
> -Add acked-by where needed
> -Fix CPU_OFF PSCI implementation (physical interface)
> -Use notifiers to implement freeing memory and releasing interrupts on CPU
> hotplug
> -Use notifier to trigger setup of virtual paging for non-boot CPUs on CPU
> hotplug
> -Add enabling errata workarounds on CPU hotplug, also based on a notifier
> -Remove patch:
> [PATCH v2 10/10] xen/arm: Call check_local_cpu_errata for secondary CPU
> only on boot
>
> Changes in v4:
> -Add acked-by/reviewed-by where needed
> -Cleanup: use smp_processor_id() instead of get_processor_id(), fixed
>  indentation, add includes alphabetically, add newline before return, etc.
> -Disable timers prior to releasing timer interrupts
> -Initialize cpu_smpboot notifier at presmp_init rather than init phase
> -In the last patch of the series errata notifier now returns an error
>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien.grall@arm.com>
> CC: George Dunlap <george.dunlap@eu.citrix.com>
> CC: Dario Faggioli <dfaggioli@suse.com>
> ---
>
> Mirela Simonovic (10):
>   xen/arm64: Added handling of the trapped access to OSLSR register
>   xen/arm: Ignore write to GICD_ISACTIVERn registers (vgic-v2)
>   xen/arm: Implement CPU_OFF PSCI call (physical interface)
>   xen/arm: Remove __initdata and __init to enable CPU hotplug
>   xen/arm: Setup virtual paging for non-boot CPUs on hotplug/resume
>   xen/common: Restore IRQ affinity when hotplugging a pCPU
>   xen/arm: Release maintenance interrupt when CPU is hot-unplugged
>   xen/arm: Disable timers and release their interrupts on CPU hot-unplug
>   xen/arm: Free memory allocated for sibling/core maps on CPU hot-unplug
>   xen/arm: Enable errata for secondary CPU on hotplug after the boot
>
>  xen/arch/arm/arm64/smpboot.c     |  2 +-
>  xen/arch/arm/arm64/vsysreg.c     |  3 ++-
>  xen/arch/arm/cpuerrata.c         | 49 ++++++++++++++++++++++++++++++
> +++++++
>  xen/arch/arm/cpufeature.c        | 29 ++++++++++++++++++++++
>  xen/arch/arm/gic.c               | 31 +++++++++++++++++++++++
>  xen/arch/arm/irq.c               |  2 +-
>  xen/arch/arm/p2m.c               | 53 ++++++++++++++++++++++++++++++
> ++++++----
>  xen/arch/arm/processor.c         |  2 +-
>  xen/arch/arm/psci.c              | 13 ++++++++++
>  xen/arch/arm/smpboot.c           | 42 +++++++++++++++++++++++++++++--
>  xen/arch/arm/time.c              | 45 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vgic-v2.c           |  2 ++
>  xen/common/schedule.c            |  4 +++
>  xen/include/asm-arm/cpufeature.h |  1 +
>  xen/include/asm-arm/procinfo.h   |  4 +--
>  xen/include/asm-arm/psci.h       |  1 +
>  16 files changed, 270 insertions(+), 13 deletions(-)
>
> --
> 2.13.0
>
>

--0000000000003161da056d41647e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Could you please provide feedback f=
or the remaining patches?</div><div><br></div><div>Thanks,</div><div>Mirela=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tu=
e, May 15, 2018 at 1:44 PM, Mirela Simonovic <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mirela.simonovic@aggios.com" target=3D"_blank">mirela.simonovic@=
aggios.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This pat=
ch set contains fixes that are required as precondition for suspend to<br>
RAM support, including the CPU hotplug which is required to suspend non-boo=
t<br>
CPUs.<br>
The first two patches in this series:<br>
1) xen/arm64: Added handling of the trapped access to OSLSR register<br>
2) xen/arm: Ignore write to GICD_ISACTIVERn registers (vgic-v2)<br>
are required to avoid Dom0 crashes when Dom0 performs its own suspend. This=
<br>
patch set does not include the implementation of virtual PSCI system suspen=
d<br>
call that would allow guests to finalize their suspend procedures. This wil=
l<br>
be submitted in the following series.<br>
<br>
Remaining of the patches are related to enabling CPU hotplug for non-boot<b=
r>
CPUs is resume scenario. CPU hotplug of non-boot CPUs will be used for susp=
end<br>
to RAM support for ARM. In suspend procedure, the hot-unplug of non-boot CP=
Us<br>
will be triggered with disable_nonboot_cpus(), while the hotplug is trigger=
ed<br>
with enable_nonboot_cpus(). Using these calls, the physical non-boot CPUs c=
ould<br>
be powered down/up on suspend/resume, respectively, if the underlying firmw=
are<br>
allows so. Calls to enable/disable_nonboot_cpus() functions currently do no=
t<br>
exist in Xen ARM code. This will be added with the suspend to RAM support f=
or<br>
ARM.<br>
<br>
When non-boot pCPUs are hot-unplugged their interrupts are migrated to the =
boot<br>
pCPU. This series also includes a fix that would restore the interrupts aff=
inity<br>
once non-boot pCPUs are hotplugged. Here only SPIs used by guests are cover=
ed.<br>
Migration of Xen internal SPIs is not covered. According to my understandin=
g<br>
Xen internal SPIs are routed to the boot CPU which initializes the respecti=
ve<br>
devices. Therefore, there is no need to migrate Xen internal SPIs.<br>
<br>
The code is tested on Xilinx Zynq UltraScale+ MPSoC/ZCU102 board (includes<=
br>
physical power down/up of non-boot CPUs). The testing requires additional<b=
r>
patches for issuing system suspend. These patches and instructions for test=
ing<br>
will be submitted later, when we get closer to the final version of the ser=
ies.<br>
<br>
---<br>
Changes in v2:<br>
-Rename cover-letter title and emphasize that 2 patches from this series ar=
e not<br>
specific to CPU hotplug (my initial fault, splitting it now could be confus=
ing)<br>
-Fix cover-letter explanations<br>
-Address all the issues and comments as discussed on mailing list for v1<br=
>
-Add 3 patches to ensure that suspend/resume does not cause any memory leak=
s.<br>
All the memory allocated when a CPU was hotplugged is now freed when the CP=
U is<br>
hot-unplugged.<br>
-Remove from the v1 series the patch which incorrectly dealt with an issue:=
<br>
[PATCH 4/7] xen/arm: When CPU dies, free percpu area immediatelly<br>
One solution to the issue addressed by the patch above is to add rcu_barrie=
r()<br>
prior to calling enable_nonboot_cpus() during the suspend. This is how it i=
s<br>
done in x86 suspend implementation. Until the discussion here<br>
<a href=3D"https://lists.xenproject.org/archives/html/xen-devel/2018-04/msg=
01199.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xenproject.o=
rg/<wbr>archives/html/xen-devel/2018-<wbr>04/msg01199.html</a><br>
doesn&#39;t conclude differently, I need to assume that adding rcu_barrier(=
) prior<br>
to calling enable_nonboot_cpus() as it is done for x86 is the right way to =
go.<br>
Therefore, the fix to the issue will be part of the suspend to RAM series.<=
br>
<br>
Changes in v3:<br>
-Add acked-by where needed<br>
-Fix CPU_OFF PSCI implementation (physical interface)<br>
-Use notifiers to implement freeing memory and releasing interrupts on CPU<=
br>
hotplug<br>
-Use notifier to trigger setup of virtual paging for non-boot CPUs on CPU<b=
r>
hotplug<br>
-Add enabling errata workarounds on CPU hotplug, also based on a notifier<b=
r>
-Remove patch:<br>
[PATCH v2 10/10] xen/arm: Call check_local_cpu_errata for secondary CPU onl=
y on boot<br>
<br>
Changes in v4:<br>
-Add acked-by/reviewed-by where needed<br>
-Cleanup: use smp_processor_id() instead of get_processor_id(), fixed<br>
=C2=A0indentation, add includes alphabetically, add newline before return, =
etc.<br>
-Disable timers prior to releasing timer interrupts<br>
-Initialize cpu_smpboot notifier at presmp_init rather than init phase<br>
-In the last patch of the series errata notifier now returns an error<br>
<br>
---<br>
CC: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabe=
llini@kernel.org</a>&gt;<br>
CC: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com">julien.grall@a=
rm.com</a>&gt;<br>
CC: George Dunlap &lt;<a href=3D"mailto:george.dunlap@eu.citrix.com">george=
.dunlap@eu.citrix.com</a>&gt;<br>
CC: Dario Faggioli &lt;<a href=3D"mailto:dfaggioli@suse.com">dfaggioli@suse=
.com</a>&gt;<br>
---<br>
<br>
Mirela Simonovic (10):<br>
=C2=A0 xen/arm64: Added handling of the trapped access to OSLSR register<br=
>
=C2=A0 xen/arm: Ignore write to GICD_ISACTIVERn registers (vgic-v2)<br>
=C2=A0 xen/arm: Implement CPU_OFF PSCI call (physical interface)<br>
=C2=A0 xen/arm: Remove __initdata and __init to enable CPU hotplug<br>
=C2=A0 xen/arm: Setup virtual paging for non-boot CPUs on hotplug/resume<br=
>
=C2=A0 xen/common: Restore IRQ affinity when hotplugging a pCPU<br>
=C2=A0 xen/arm: Release maintenance interrupt when CPU is hot-unplugged<br>
=C2=A0 xen/arm: Disable timers and release their interrupts on CPU hot-unpl=
ug<br>
=C2=A0 xen/arm: Free memory allocated for sibling/core maps on CPU hot-unpl=
ug<br>
=C2=A0 xen/arm: Enable errata for secondary CPU on hotplug after the boot<b=
r>
<br>
=C2=A0xen/arch/arm/arm64/smpboot.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0xen/arch/arm/arm64/vsysreg.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0xen/arch/arm/cpuerrata.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 49 ++++++=
++++++++++++++++++++++++<wbr>+++++++<br>
=C2=A0xen/arch/arm/cpufeature.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 29 +++++++++++=
+++++++++++<br>
=C2=A0xen/arch/arm/gic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 31 +++++++++++++++++++++++<br>
=C2=A0xen/arch/arm/irq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0xen/arch/arm/p2m.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 53 ++++++++++++++++++++++++++++++<wbr>++++++----<br>
=C2=A0xen/arch/arm/processor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
=C2=A0xen/arch/arm/psci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 13 ++++++++++<br>
=C2=A0xen/arch/arm/smpboot.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 +=
++++++++++++++++++++++++++++-<wbr>-<br>
=C2=A0xen/arch/arm/time.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 45 ++++++++++++++++++++++++++++++<wbr>++++<br>
=C2=A0xen/arch/arm/vgic-v2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0xen/common/schedule.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 4 +++<br>
=C2=A0xen/include/asm-arm/<wbr>cpufeature.h |=C2=A0 1 +<br>
=C2=A0xen/include/asm-arm/procinfo.h=C2=A0 =C2=A0|=C2=A0 4 +--<br>
=C2=A0xen/include/asm-arm/psci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A016 files changed, 270 insertions(+), 13 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
2.13.0<br>
<br>
</font></span></blockquote></div><br></div>

--0000000000003161da056d41647e--


--===============7627626492503469751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7627626492503469751==--
