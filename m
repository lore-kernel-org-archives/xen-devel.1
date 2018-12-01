From: Rian Quinn <rianquinn@gmail.com>
Subject: PVH Whitelist Results / Windows Dom0
Date: Sat, 1 Dec 2018 09:21:00 -0700
Message-ID: <CANmpu8Vg2m0-iWq+H6Z-xSw287vO6W9wogFM0HbcEoGPUiZAMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1339748766296436967=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xwgc=ok=gmail.com=rianquinn@srs-us1.protection.inumbo.net>)
 id 1gT816-0006rc-Cd
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 16:21:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id o10so7281018edt.13
 for <xen-devel@lists.xenproject.org>; Sat, 01 Dec 2018 08:21:14 -0800 (PST)
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

--===============1339748766296436967==
Content-Type: multipart/alternative; boundary="000000000000ef0e17057bf84d84"

--000000000000ef0e17057bf84d84
Content-Type: text/plain; charset="UTF-8"

We finally have a Linux PVH guest up and running (using an initramfs right
now). I have posted a quick status update video on YouTube that shows our
progress of getting a Windows Dom0 working (which is one of the many goals
of our research).
https://www.youtube.com/watch?v=xzTKBek-g0k

As promised in the x86 Community Call, here is the list of things that a
PVH Linux guest requires. You can see the code for this here:
https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfvmm/src/hve/arch/intel_x64/xen/xen_op.cpp
and here:
https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfexec/src/main.c

I would love to put this information somewhere in Xen's project (i.e. wiki
or source), but I am not sure what you would prefer. Any ideas?

Finally, keep in mind that we will likely keep adding to this list as we
add more features (like front/back support, xenstore, etc...)

Thanks,
- Rian

CPUID:
- XEN_CPUID_LEAF(0)
- XEN_CPUID_LEAF(1)
- XEN_CPUID_LEAF(2)
- XEN_CPUID_LEAF(4)
- 0x0, 0x1, 0x2, 0x4, 0x6, 0x7, 0xA, 0xB, 0xD, 0xF, 0x10, 0x15, 0x16
- 0x80000000, 0x80000001, 0x80000002, 0x80000003, 0x80000004
- 0x80000007, 0x80000008

MSRs:
- Hypercall page (dynamic)
- ia32_star
- ia32_lstar
- ia32_cstar
- ia32_fmask
- ia32_kernel_gs_base
- ia32_pat
- ia32_efer
- ia32_fs_base
- ia32_gs_base
- ia32_sysenter_cs
- ia32_sysenter_eip
- ia32_sysenter_esp
- ia32_apic_base
- platform_info
- 0x34, 0x64E, 0x140, 0x1A0, 0x6e0

IO Ports (some of these are odd):
- 0xCF8 - 0xCFF
- 0x4D0 (odd since PIT and ACPI is disable for everything that might need
this)
- 0x4D1
- 0x70
- 0x71
- 0x3FE (any ideas)?
- 0x42, 0x43, 0x61
- XEN_IOPORT_BASE (since QEMU is not used, why is this needed?)

Hypercalls:
- XENMEM_decrease_reservation
- XENMEM_add_to_physmap_handler
- XENMEM_memory_map_handler
- XENVER_get_features_handler
- GNTTABOP_query_size_handler
- GNTTABOP_set_version_handler
- EVTCHNOP_init_control_handler
- EVTCHNOP_expand_array_handler
- EVTCHNOP_alloc_unbound_handler
- EVTCHNOP_bind_ipi_handler
- EVTCHNOP_bind_virq_handler
- EVTCHNOP_bind_vcpu_handler
- EVTCHNOP_send_handler
- HVMOP_set_param_handler
- HVMOP_get_param_handler
- HVMOP_pagetable_dying_handler

Memory:
- Shared info page
- Start info struct (PVH)
- Initial GDT, IDT, TSS
- Command line page
- ACPI (FSDT, DSDT, MADT)
- xAPIC page
- Real-mode trampoline (this was weird)
- DMI, Video Bios, MP Table, and some legacy ROMs

--000000000000ef0e17057bf84d84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div =
dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"=
ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr">We finally have a Linux PVH guest up and ru=
nning (using an initramfs=C2=A0right now). I have posted a quick status upd=
ate video on YouTube that shows our progress of getting a Windows Dom0 work=
ing (which is one of the many goals of our research).=C2=A0=C2=A0<div><a hr=
ef=3D"https://www.youtube.com/watch?v=3DxzTKBek-g0k">https://www.youtube.co=
m/watch?v=3DxzTKBek-g0k</a></div><div><div><br></div><div>As promised in th=
e x86 Community Call, here is the list of things that a PVH Linux guest req=
uires. You can see the code for this here:</div></div><div><a href=3D"https=
://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfvmm/src/hve/arch/i=
ntel_x64/xen/xen_op.cpp">https://github.com/rianquinn/hyperkernel/blob/hype=
rkernel_1/bfvmm/src/hve/arch/intel_x64/xen/xen_op.cpp</a><br></div><div>and=
 here:</div><div><a href=3D"https://github.com/rianquinn/hyperkernel/blob/h=
yperkernel_1/bfexec/src/main.c">https://github.com/rianquinn/hyperkernel/bl=
ob/hyperkernel_1/bfexec/src/main.c</a><br></div><div><br></div><div>I would=
 love to put this information somewhere in Xen&#39;s project (i.e. wiki or =
source), but I am not sure what you would prefer. Any ideas?</div><div><br>=
</div><div>Finally, keep in mind that we will likely keep adding to this li=
st as we add more features (like front/back support, xenstore, etc...)</div=
><div><br></div><div>Thanks,</div><div>- Rian</div><div><br></div><div>CPUI=
D:</div><div>- XEN_CPUID_LEAF(0)<br></div><div>- XEN_CPUID_LEAF(1)<br></div=
><div>- XEN_CPUID_LEAF(2)<br></div><div>- XEN_CPUID_LEAF(4)<br></div><div>-=
 0x0, 0x1, 0x2, 0x4, 0x6, 0x7, 0xA, 0xB, 0xD, 0xF, 0x10, 0x15, 0x16</div><d=
iv>- 0x80000000, 0x80000001, 0x80000002, 0x80000003, 0x80000004</div><div>-=
 0x80000007, 0x80000008</div><div><br></div><div>MSRs:</div><div>- Hypercal=
l page (dynamic)</div><div>- ia32_star</div><div>- ia32_lstar</div><div>- i=
a32_cstar</div><div>- ia32_fmask</div><div>- ia32_kernel_gs_base</div><div>=
- ia32_pat</div><div>- ia32_efer</div><div>- ia32_fs_base</div><div>- ia32_=
gs_base</div><div>- ia32_sysenter_cs</div><div>- ia32_sysenter_eip</div><di=
v>- ia32_sysenter_esp</div><div>- ia32_apic_base</div><div>- platform_info<=
/div><div>- 0x34, 0x64E, 0x140, 0x1A0, 0x6e0</div><div><br></div><div>IO Po=
rts (some of these are odd):</div><div>- 0xCF8 - 0xCFF</div><div>- 0x4D0 (o=
dd since PIT and ACPI is disable for everything that might need this)</div>=
<div>- 0x4D1</div><div>- 0x70</div><div>- 0x71</div><div>- 0x3FE (any ideas=
)?</div><div>- 0x42, 0x43, 0x61<br></div><div>- XEN_IOPORT_BASE (since QEMU=
 is not used, why is this needed?)</div><div><br></div><div>Hypercalls:</di=
v><div>- XENMEM_decrease_reservation</div><div>- XENMEM_add_to_physmap_hand=
ler</div><div>- XENMEM_memory_map_handler</div><div>- XENVER_get_features_h=
andler</div><div>- GNTTABOP_query_size_handler</div><div>- GNTTABOP_set_ver=
sion_handler</div><div>- EVTCHNOP_init_control_handler<br></div><div>- EVTC=
HNOP_expand_array_handler</div><div>- EVTCHNOP_alloc_unbound_handler</div><=
div>- EVTCHNOP_bind_ipi_handler</div><div>- EVTCHNOP_bind_virq_handler</div=
><div>- EVTCHNOP_bind_vcpu_handler</div><div>- EVTCHNOP_send_handler</div><=
div>- HVMOP_set_param_handler</div><div>- HVMOP_get_param_handler</div><div=
>- HVMOP_pagetable_dying_handler</div><div><br></div><div>Memory:</div><div=
>- Shared info page</div><div>- Start info struct (PVH)</div><div>- Initial=
 GDT, IDT, TSS</div><div>- Command line page</div><div>- ACPI (FSDT, DSDT, =
MADT)</div><div>- xAPIC page</div><div>- Real-mode trampoline (this was wei=
rd)</div><div>- DMI, Video Bios, MP Table, and some legacy ROMs</div><div><=
br></div><div><br></div><div><br></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000ef0e17057bf84d84--


--===============1339748766296436967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1339748766296436967==--
