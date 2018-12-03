From: Rian Quinn <rianquinn@gmail.com>
Subject: Re: PVH Whitelist Results / Windows Dom0
Date: Mon, 3 Dec 2018 09:06:37 -0700
Message-ID: <CANmpu8WymmVznMW=UMkOeFaSS7RvZoh01r8r4GrrXyucSzCbJw@mail.gmail.com>
References: <CANmpu8Vg2m0-iWq+H6Z-xSw287vO6W9wogFM0HbcEoGPUiZAMw@mail.gmail.com>
 <20181203114246.ku7rvsctqsmrx72k@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7850502639037382575=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dcmt=om=gmail.com=rianquinn@srs-us1.protection.inumbo.net>)
 id 1gTqkF-0003Bl-DN
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 16:06:51 +0000
Received: by mail-ed1-x543.google.com with SMTP id h15so11218482edb.4
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 08:06:50 -0800 (PST)
In-Reply-To: <20181203114246.ku7rvsctqsmrx72k@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: roger.pau@citrix.com
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7850502639037382575==
Content-Type: multipart/alternative; boundary="000000000000169b7d057c2056f0"

--000000000000169b7d057c2056f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Can you trace this to the Linux code that's actually making the call
> by injecting a trap when this happens?

Yes, we can. In some cases, we have to manually backtrace, but so far
we have been able to map resources to the actual source code.

> Serial port poking?

This would be a great one to locate in the kernel. I suspect that
serial is the case, but if that is true, something is a bit wrong as
once again, this device doesn't exist without QEMU. There is also a
little bit of testing that we should do here. Right now we manually
pass-through a serial device for UART debugging, and that might have
the side effect of this port showing up so I would want to rule that
out first.

> APs for PVH can be started using the native way, which means they are
> started in real mode, that's why Linux uses the real mode trampoline.

Ah... ok. That makes sense. Uhg... emulating INIT/SIPI is no fun. That
is some pretty fragile code.

> Legacy ROMs from which device?

Video BIOS was one of them. There are several memory regions within
legacy BIOS that are being scanned so my assumption is that these
regions are some ROMs, and I am not really sure why PVH would execute
that logic at all. I am pretty sure that it is scanning for MP tables
as I think I traced that specific logic back to the Linux kernel. I
know for sure that DMI is being scanned as well. Right now we map in a
read-only zero page and that works fine, but I would think that a lot
of this logic would not be needed in the Guest case. Dom0 is another
story.

On Mon, Dec 3, 2018 at 4:42 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:

> Hello,
>
> Thanks, this is very interesting.
>
> On Sat, Dec 01, 2018 at 09:21:00AM -0700, Rian Quinn wrote:
> > We finally have a Linux PVH guest up and running (using an initramfs
> right
> > now). I have posted a quick status update video on YouTube that shows o=
ur
> > progress of getting a Windows Dom0 working (which is one of the many
> goals
> > of our research).
> > https://www.youtube.com/watch?v=3DxzTKBek-g0k
> >
> > As promised in the x86 Community Call, here is the list of things that =
a
> > PVH Linux guest requires. You can see the code for this here:
> >
> https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfvmm/src/hve=
/arch/intel_x64/xen/xen_op.cpp
> > and here:
> >
> https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfexec/src/ma=
in.c
> >
> > I would love to put this information somewhere in Xen's project (i.e.
> wiki
> > or source), but I am not sure what you would prefer. Any ideas?
> >
> > Finally, keep in mind that we will likely keep adding to this list as w=
e
> > add more features (like front/back support, xenstore, etc...)
> >
> > Thanks,
> > - Rian
> >
> > CPUID:
> > - XEN_CPUID_LEAF(0)
> > - XEN_CPUID_LEAF(1)
> > - XEN_CPUID_LEAF(2)
> > - XEN_CPUID_LEAF(4)
> > - 0x0, 0x1, 0x2, 0x4, 0x6, 0x7, 0xA, 0xB, 0xD, 0xF, 0x10, 0x15, 0x16
> > - 0x80000000, 0x80000001, 0x80000002, 0x80000003, 0x80000004
> > - 0x80000007, 0x80000008
> >
> > MSRs:
> > - Hypercall page (dynamic)
> > - ia32_star
> > - ia32_lstar
> > - ia32_cstar
> > - ia32_fmask
> > - ia32_kernel_gs_base
> > - ia32_pat
> > - ia32_efer
> > - ia32_fs_base
> > - ia32_gs_base
> > - ia32_sysenter_cs
> > - ia32_sysenter_eip
> > - ia32_sysenter_esp
> > - ia32_apic_base
> > - platform_info
> > - 0x34, 0x64E, 0x140, 0x1A0, 0x6e0
> >
> > IO Ports (some of these are odd):
> > - 0xCF8 - 0xCFF
> > - 0x4D0 (odd since PIT and ACPI is disable for everything that might ne=
ed
> > this)
>
> Likely some poking for EISA devices? (same for 0x4D1)
>
> Can you trace this to the Linux code that's actually making the call
> by injecting a trap when this happens?
>
> > - 0x4D1
> > - 0x70
> > - 0x71
> > - 0x3FE (any ideas)?
>
> Serial port poking?
>
> Again would be interesting to know the Linux code that's poking
> this.
>
> > - 0x42, 0x43, 0x61
> > - XEN_IOPORT_BASE (since QEMU is not used, why is this needed?)
>
> IIRC the PVH code path in Linux is almost the same as the HVM one,
> that's why this port is poked in order to see whether there are
> emulated devices to disable. I think this is expected and perfectly
> fine.
>
> >
> > Hypercalls:
> > - XENMEM_decrease_reservation
> > - XENMEM_add_to_physmap_handler
> > - XENMEM_memory_map_handler
> > - XENVER_get_features_handler
> > - GNTTABOP_query_size_handler
> > - GNTTABOP_set_version_handler
> > - EVTCHNOP_init_control_handler
> > - EVTCHNOP_expand_array_handler
> > - EVTCHNOP_alloc_unbound_handler
> > - EVTCHNOP_bind_ipi_handler
> > - EVTCHNOP_bind_virq_handler
> > - EVTCHNOP_bind_vcpu_handler
> > - EVTCHNOP_send_handler
> > - HVMOP_set_param_handler
> > - HVMOP_get_param_handler
> > - HVMOP_pagetable_dying_handler
> >
> > Memory:
> > - Shared info page
> > - Start info struct (PVH)
> > - Initial GDT, IDT, TSS
> > - Command line page
> > - ACPI (FSDT, DSDT, MADT)
> > - xAPIC page
> > - Real-mode trampoline (this was weird)
>
> APs for PVH can be started using the native way, which means they are
> started in real mode, that's why Linux uses the real mode trampoline.
>
> > - DMI, Video Bios, MP Table, and some legacy ROMs
>
> Legacy ROMs from which device?
>
> Also there's no MP tables or video BIOS at all, so I guess this is
> Linux trying to find the BDA and friends in the low 1MB?
>
> Thanks, Roger.
>

--000000000000169b7d057c2056f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=
 Can you trace this to the Linux code that&#39;s actually making the call<b=
r>&gt; by injecting a trap when this happens?<br><br></span>Yes, we can. In=
 some cases, we have to manually backtrace, but so far<br>we have been able=
 to map resources to the actual source code.<br><br>&gt; Serial port poking=
?<br><br>This would be a great one to locate in the kernel. I suspect that<=
br>serial is the case, but if that is true, something is a bit wrong as<br>=
once again, this device doesn&#39;t exist without QEMU. There is also a<br>=
little bit of testing that we should do here. Right now we manually<br>pass=
-through a serial device for UART debugging, and that might have<br>the sid=
e effect of this port showing up so I would want to rule that<br>out first.=
<span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br><br>&gt; APs for =
PVH can be started using the native way, which means they are<br>&gt; start=
ed in real mode, that&#39;s why Linux uses the real mode trampoline.<br><br=
></span>Ah... ok. That makes sense. Uhg... emulating INIT/SIPI is no fun. T=
hat<br>is some pretty fragile code.<span class=3D"gmail-im" style=3D"color:=
rgb(80,0,80)"><br><br>&gt; Legacy ROMs from which device?<br><br></span>Vid=
eo BIOS was one of them. There are several memory regions within<br>legacy =
BIOS that are being scanned so my assumption is that these<br>regions are s=
ome ROMs, and I am not really sure why PVH would execute<br>that logic at a=
ll. I am pretty sure that it is scanning for MP tables<br>as I think I trac=
ed that specific logic back to the Linux kernel. I<br>know for sure that DM=
I is being scanned as well. Right now we map in a<br>read-only zero page an=
d that works fine, but I would think that a lot<br>of this logic would not =
be needed in the Guest case. Dom0 is another<br>story.=C2=A0=C2=A0<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Dec 3, 2018 at 4:4=
2 AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger=
.pau@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hell=
o,<br>
<br>
Thanks, this is very interesting.<br>
<br>
On Sat, Dec 01, 2018 at 09:21:00AM -0700, Rian Quinn wrote:<br>
&gt; We finally have a Linux PVH guest up and running (using an initramfs r=
ight<br>
&gt; now). I have posted a quick status update video on YouTube that shows =
our<br>
&gt; progress of getting a Windows Dom0 working (which is one of the many g=
oals<br>
&gt; of our research).<br>
&gt; <a href=3D"https://www.youtube.com/watch?v=3DxzTKBek-g0k" rel=3D"noref=
errer" target=3D"_blank">https://www.youtube.com/watch?v=3DxzTKBek-g0k</a><=
br>
&gt; <br>
&gt; As promised in the x86 Community Call, here is the list of things that=
 a<br>
&gt; PVH Linux guest requires. You can see the code for this here:<br>
&gt; <a href=3D"https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1=
/bfvmm/src/hve/arch/intel_x64/xen/xen_op.cpp" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfvmm/s=
rc/hve/arch/intel_x64/xen/xen_op.cpp</a><br>
&gt; and here:<br>
&gt; <a href=3D"https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1=
/bfexec/src/main.c" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/rianquinn/hyperkernel/blob/hyperkernel_1/bfexec/src/main.c</a><br>
&gt; <br>
&gt; I would love to put this information somewhere in Xen&#39;s project (i=
.e. wiki<br>
&gt; or source), but I am not sure what you would prefer. Any ideas?<br>
&gt; <br>
&gt; Finally, keep in mind that we will likely keep adding to this list as =
we<br>
&gt; add more features (like front/back support, xenstore, etc...)<br>
&gt; <br>
&gt; Thanks,<br>
&gt; - Rian<br>
&gt; <br>
&gt; CPUID:<br>
&gt; - XEN_CPUID_LEAF(0)<br>
&gt; - XEN_CPUID_LEAF(1)<br>
&gt; - XEN_CPUID_LEAF(2)<br>
&gt; - XEN_CPUID_LEAF(4)<br>
&gt; - 0x0, 0x1, 0x2, 0x4, 0x6, 0x7, 0xA, 0xB, 0xD, 0xF, 0x10, 0x15, 0x16<b=
r>
&gt; - 0x80000000, 0x80000001, 0x80000002, 0x80000003, 0x80000004<br>
&gt; - 0x80000007, 0x80000008<br>
&gt; <br>
&gt; MSRs:<br>
&gt; - Hypercall page (dynamic)<br>
&gt; - ia32_star<br>
&gt; - ia32_lstar<br>
&gt; - ia32_cstar<br>
&gt; - ia32_fmask<br>
&gt; - ia32_kernel_gs_base<br>
&gt; - ia32_pat<br>
&gt; - ia32_efer<br>
&gt; - ia32_fs_base<br>
&gt; - ia32_gs_base<br>
&gt; - ia32_sysenter_cs<br>
&gt; - ia32_sysenter_eip<br>
&gt; - ia32_sysenter_esp<br>
&gt; - ia32_apic_base<br>
&gt; - platform_info<br>
&gt; - 0x34, 0x64E, 0x140, 0x1A0, 0x6e0<br>
&gt; <br>
&gt; IO Ports (some of these are odd):<br>
&gt; - 0xCF8 - 0xCFF<br>
&gt; - 0x4D0 (odd since PIT and ACPI is disable for everything that might n=
eed<br>
&gt; this)<br>
<br>
Likely some poking for EISA devices? (same for 0x4D1)<br>
<br>
Can you trace this to the Linux code that&#39;s actually making the call<br=
>
by injecting a trap when this happens?<br>
<br>
&gt; - 0x4D1<br>
&gt; - 0x70<br>
&gt; - 0x71<br>
&gt; - 0x3FE (any ideas)?<br>
<br>
Serial port poking?<br>
<br>
Again would be interesting to know the Linux code that&#39;s poking<br>
this.<br>
<br>
&gt; - 0x42, 0x43, 0x61<br>
&gt; - XEN_IOPORT_BASE (since QEMU is not used, why is this needed?)<br>
<br>
IIRC the PVH code path in Linux is almost the same as the HVM one,<br>
that&#39;s why this port is poked in order to see whether there are<br>
emulated devices to disable. I think this is expected and perfectly<br>
fine.<br>
<br>
&gt; <br>
&gt; Hypercalls:<br>
&gt; - XENMEM_decrease_reservation<br>
&gt; - XENMEM_add_to_physmap_handler<br>
&gt; - XENMEM_memory_map_handler<br>
&gt; - XENVER_get_features_handler<br>
&gt; - GNTTABOP_query_size_handler<br>
&gt; - GNTTABOP_set_version_handler<br>
&gt; - EVTCHNOP_init_control_handler<br>
&gt; - EVTCHNOP_expand_array_handler<br>
&gt; - EVTCHNOP_alloc_unbound_handler<br>
&gt; - EVTCHNOP_bind_ipi_handler<br>
&gt; - EVTCHNOP_bind_virq_handler<br>
&gt; - EVTCHNOP_bind_vcpu_handler<br>
&gt; - EVTCHNOP_send_handler<br>
&gt; - HVMOP_set_param_handler<br>
&gt; - HVMOP_get_param_handler<br>
&gt; - HVMOP_pagetable_dying_handler<br>
&gt; <br>
&gt; Memory:<br>
&gt; - Shared info page<br>
&gt; - Start info struct (PVH)<br>
&gt; - Initial GDT, IDT, TSS<br>
&gt; - Command line page<br>
&gt; - ACPI (FSDT, DSDT, MADT)<br>
&gt; - xAPIC page<br>
&gt; - Real-mode trampoline (this was weird)<br>
<br>
APs for PVH can be started using the native way, which means they are<br>
started in real mode, that&#39;s why Linux uses the real mode trampoline.<b=
r>
<br>
&gt; - DMI, Video Bios, MP Table, and some legacy ROMs<br>
<br>
Legacy ROMs from which device?<br>
<br>
Also there&#39;s no MP tables or video BIOS at all, so I guess this is<br>
Linux trying to find the BDA and friends in the low 1MB?<br>
<br>
Thanks, Roger.<br>
</blockquote></div>

--000000000000169b7d057c2056f0--


--===============7850502639037382575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7850502639037382575==--
