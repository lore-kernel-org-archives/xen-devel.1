From: Rian Quinn <rianquinn@gmail.com>
Subject: Re: PVH Whitelist Results / Windows Dom0
Date: Mon, 3 Dec 2018 13:07:47 -0700
Message-ID: <CANmpu8Vk3thW0Zmm9MjoCQ28rK1pQmdwB1P2MnGu7wsuAuU5UQ@mail.gmail.com>
References: <CANmpu8Vg2m0-iWq+H6Z-xSw287vO6W9wogFM0HbcEoGPUiZAMw@mail.gmail.com>
 <20181203114246.ku7rvsctqsmrx72k@mac>
 <CANmpu8WymmVznMW=UMkOeFaSS7RvZoh01r8r4GrrXyucSzCbJw@mail.gmail.com>
 <20181203170412.xyxaemafv27bgfmn@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4479909726245110858=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dcmt=om=gmail.com=rianquinn@srs-us1.protection.inumbo.net>)
 id 1gTuVj-0007Kw-9O
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 20:08:07 +0000
Received: by mail-ed1-x541.google.com with SMTP id j6so11882366edp.9
 for <xen-devel@lists.xenproject.org>; Mon, 03 Dec 2018 12:08:01 -0800 (PST)
In-Reply-To: <20181203170412.xyxaemafv27bgfmn@mac>
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

--===============4479909726245110858==
Content-Type: multipart/alternative; boundary="000000000000af3990057c23b4ab"

--000000000000af3990057c23b4ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Xen signals in the FADT that there's no VGA, but I won't be surprised
> that some OSes simply ignore this bit because there are systems with
> broken ACPI tables out there with the bit set and VGA.

We do the same thing, and yeah it appears that Linux is ignoring this. We
noticed the same thing WRT some other ACPI specific things like SCI that
are not being disabled by Linux even though the ACPI tables say they are
disabled. IIRC, the PIT is in the boat as well. Either way, I agree that
returning nothing in these cases is a legit way to handle it.

> There's no other way to detect MP tables rather that scanning the
> different positions where they can be found, so I think it's fine for
> Linux to do so.

Agreed

> IMO we should try to limit as much as possible the PVH specific
> modifications that we have to make to guests. So it's better to let
> the guest scan memory or poke at IO ports rather than add a specific
> 'is running on PVH' check to each device driver that we know it's not
> available when running as PVH.

> Poking at such ports or scanning memory is exactly the same that's
> done on bare metal, and should work fine on PVH to detect the absence
> of certain devices.

Agreed. We still have to sort out some of these registers, but for now, I
think things are ok in general. I am more worried about Xen specific
things. We will know more once we try to plug all of the holes we had to
open. I also agree 100% that for PVH and HVM we should minimize the number
of things that need to be changed to support. Its better for the hypervisor
to return "no supported" than for the Linux kernel to need mods to support
PVH. This is also really important in order to support PVH Dom0 and
eventually someday a PVH version of Windows, which should be possible.

- Rian


On Mon, Dec 3, 2018 at 10:05 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
wrote:

> Hello,
>
> On Mon, Dec 03, 2018 at 09:06:37AM -0700, Rian Quinn wrote:
> > > Can you trace this to the Linux code that's actually making the call
> > > by injecting a trap when this happens?
> >
> > Yes, we can. In some cases, we have to manually backtrace, but so far
> > we have been able to map resources to the actual source code.
> >
> > > Serial port poking?
> >
> > This would be a great one to locate in the kernel. I suspect that
> > serial is the case, but if that is true, something is a bit wrong as
> > once again, this device doesn't exist without QEMU.
>
> Maybe Linux pokes at this port in order to check whether the device
> exists?
>
> The fact that the device doesn't exist doesn't prevent a guest from
> poking at this port, and IMO it's a legit thing to do. Returning all
> 1s (like bare metal) should be OK and would actually signal Linux
> there's no register there and thus no device.
>
> > There is also a
> > little bit of testing that we should do here. Right now we manually
> > pass-through a serial device for UART debugging, and that might have
> > the side effect of this port showing up so I would want to rule that
> > out first.
> >
> > > APs for PVH can be started using the native way, which means they are
> > > started in real mode, that's why Linux uses the real mode trampoline.
> >
> > Ah... ok. That makes sense. Uhg... emulating INIT/SIPI is no fun. That
> > is some pretty fragile code.
>
> It's the same code that we already use for HVM guests, since PVH
> guests get an emulated LAPIC like HVM ones.
>
> > > Legacy ROMs from which device?
> >
> > Video BIOS was one of them. There are several memory regions within
> > legacy BIOS that are being scanned so my assumption is that these
> > regions are some ROMs, and I am not really sure why PVH would execute
> > that logic at all.
>
> Xen signals in the FADT that there's no VGA, but I won't be surprised
> that some OSes simply ignore this bit because there are systems with
> broken ACPI tables out there with the bit set and VGA.
>
> > I am pretty sure that it is scanning for MP tables
> > as I think I traced that specific logic back to the Linux kernel.
>
> There's no other way to detect MP tables rather that scanning the
> different positions where they can be found, so I think it's fine for
> Linux to do so.
>
> > I
> > know for sure that DMI is being scanned as well. Right now we map in a
> > read-only zero page and that works fine, but I would think that a lot
> > of this logic would not be needed in the Guest case. Dom0 is another
> > story.
>
> IMO we should try to limit as much as possible the PVH specific
> modifications that we have to make to guests. So it's better to let
> the guest scan memory or poke at IO ports rather than add a specific
> 'is running on PVH' check to each device driver that we know it's not
> available when running as PVH.
>
> Poking at such ports or scanning memory is exactly the same that's
> done on bare metal, and should work fine on PVH to detect the absence
> of certain devices.
>
> Thanks, Roger.
>
> > On Mon, Dec 3, 2018 at 4:42 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om>
> wrote:
> >
> > > Hello,
> > >
> > > Thanks, this is very interesting.
> > >
> > > On Sat, Dec 01, 2018 at 09:21:00AM -0700, Rian Quinn wrote:
> > > > We finally have a Linux PVH guest up and running (using an initramf=
s
> > > right
> > > > now). I have posted a quick status update video on YouTube that
> shows our
> > > > progress of getting a Windows Dom0 working (which is one of the man=
y
> > > goals
> > > > of our research).
> > > > https://www.youtube.com/watch?v=3DxzTKBek-g0k
> > > >
> > > > As promised in the x86 Community Call, here is the list of things
> that a
> > > > PVH Linux guest requires. You can see the code for this here:
> > > >
> > >
> https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfvmm/src/hve=
/arch/intel_x64/xen/xen_op.cpp
> > > > and here:
> > > >
> > >
> https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfexec/src/ma=
in.c
> > > >
> > > > I would love to put this information somewhere in Xen's project (i.=
e.
> > > wiki
> > > > or source), but I am not sure what you would prefer. Any ideas?
> > > >
> > > > Finally, keep in mind that we will likely keep adding to this list
> as we
> > > > add more features (like front/back support, xenstore, etc...)
> > > >
> > > > Thanks,
> > > > - Rian
> > > >
> > > > CPUID:
> > > > - XEN_CPUID_LEAF(0)
> > > > - XEN_CPUID_LEAF(1)
> > > > - XEN_CPUID_LEAF(2)
> > > > - XEN_CPUID_LEAF(4)
> > > > - 0x0, 0x1, 0x2, 0x4, 0x6, 0x7, 0xA, 0xB, 0xD, 0xF, 0x10, 0x15, 0x1=
6
> > > > - 0x80000000, 0x80000001, 0x80000002, 0x80000003, 0x80000004
> > > > - 0x80000007, 0x80000008
> > > >
> > > > MSRs:
> > > > - Hypercall page (dynamic)
> > > > - ia32_star
> > > > - ia32_lstar
> > > > - ia32_cstar
> > > > - ia32_fmask
> > > > - ia32_kernel_gs_base
> > > > - ia32_pat
> > > > - ia32_efer
> > > > - ia32_fs_base
> > > > - ia32_gs_base
> > > > - ia32_sysenter_cs
> > > > - ia32_sysenter_eip
> > > > - ia32_sysenter_esp
> > > > - ia32_apic_base
> > > > - platform_info
> > > > - 0x34, 0x64E, 0x140, 0x1A0, 0x6e0
> > > >
> > > > IO Ports (some of these are odd):
> > > > - 0xCF8 - 0xCFF
> > > > - 0x4D0 (odd since PIT and ACPI is disable for everything that migh=
t
> need
> > > > this)
> > >
> > > Likely some poking for EISA devices? (same for 0x4D1)
> > >
> > > Can you trace this to the Linux code that's actually making the call
> > > by injecting a trap when this happens?
> > >
> > > > - 0x4D1
> > > > - 0x70
> > > > - 0x71
> > > > - 0x3FE (any ideas)?
> > >
> > > Serial port poking?
> > >
> > > Again would be interesting to know the Linux code that's poking
> > > this.
> > >
> > > > - 0x42, 0x43, 0x61
> > > > - XEN_IOPORT_BASE (since QEMU is not used, why is this needed?)
> > >
> > > IIRC the PVH code path in Linux is almost the same as the HVM one,
> > > that's why this port is poked in order to see whether there are
> > > emulated devices to disable. I think this is expected and perfectly
> > > fine.
> > >
> > > >
> > > > Hypercalls:
> > > > - XENMEM_decrease_reservation
> > > > - XENMEM_add_to_physmap_handler
> > > > - XENMEM_memory_map_handler
> > > > - XENVER_get_features_handler
> > > > - GNTTABOP_query_size_handler
> > > > - GNTTABOP_set_version_handler
> > > > - EVTCHNOP_init_control_handler
> > > > - EVTCHNOP_expand_array_handler
> > > > - EVTCHNOP_alloc_unbound_handler
> > > > - EVTCHNOP_bind_ipi_handler
> > > > - EVTCHNOP_bind_virq_handler
> > > > - EVTCHNOP_bind_vcpu_handler
> > > > - EVTCHNOP_send_handler
> > > > - HVMOP_set_param_handler
> > > > - HVMOP_get_param_handler
> > > > - HVMOP_pagetable_dying_handler
> > > >
> > > > Memory:
> > > > - Shared info page
> > > > - Start info struct (PVH)
> > > > - Initial GDT, IDT, TSS
> > > > - Command line page
> > > > - ACPI (FSDT, DSDT, MADT)
> > > > - xAPIC page
> > > > - Real-mode trampoline (this was weird)
> > >
> > > APs for PVH can be started using the native way, which means they are
> > > started in real mode, that's why Linux uses the real mode trampoline.
> > >
> > > > - DMI, Video Bios, MP Table, and some legacy ROMs
> > >
> > > Legacy ROMs from which device?
> > >
> > > Also there's no MP tables or video BIOS at all, so I guess this is
> > > Linux trying to find the BDA and friends in the low 1MB?
> > >
> > > Thanks, Roger.
> > >
>

--000000000000af3990057c23b4ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; Xen signals in the FADT that there&#=
39;s no VGA, but I won&#39;t be surprised<br>&gt;=C2=A0that some OSes simpl=
y ignore this bit because there are systems with<br>&gt;=C2=A0broken ACPI t=
ables out there with the bit set and VGA.<br><div><br></div><div>We do the =
same thing, and yeah it appears that Linux is ignoring this. We noticed the=
 same thing WRT some other ACPI specific things like SCI that are not being=
 disabled by Linux even though the ACPI tables say they are disabled. IIRC,=
 the PIT is in the boat as well. Either way, I agree that returning nothing=
 in these cases is a legit way to handle it.=C2=A0</div><div><br></div><div=
>&gt; There&#39;s no other way to detect MP tables rather that scanning the=
<br>&gt;=C2=A0different positions where they can be found, so I think it&#3=
9;s fine for<br>&gt;=C2=A0Linux to do so.<br></div><div><br></div><div>Agre=
ed</div><div><br></div><div><div>&gt; IMO we should try to limit as much as=
 possible the PVH specific</div><div>&gt; modifications that we have to mak=
e to guests. So it&#39;s better to let</div><div>&gt; the guest scan memory=
 or poke at IO ports rather than add a specific</div><div>&gt; &#39;is runn=
ing on PVH&#39; check to each device driver that we know it&#39;s not</div>=
<div>&gt; available when running as PVH.</div><div><br></div><div>&gt; Poki=
ng at such ports or scanning memory is exactly the same that&#39;s</div><di=
v>&gt; done on bare metal, and should work fine on PVH to detect the absenc=
e</div><div>&gt; of certain devices.</div></div><div><br></div><div>Agreed.=
 We still have to sort out some of these registers, but for now, I think=C2=
=A0things are ok in general. I am more worried about Xen specific things. W=
e will know more once we try to plug all of the holes we had to open. I als=
o agree 100% that for PVH and HVM we should minimize the number of things t=
hat need to be changed to support. Its better for the hypervisor to return =
&quot;no supported&quot; than for the Linux kernel to need mods to support =
PVH. This is also really important in order to support PVH Dom0 and eventua=
lly someday a PVH version of Windows, which should be possible.=C2=A0</div>=
<div><br></div><div>- Rian</div><div><br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Mon, Dec 3, 2018 at 10:05 AM Roger Pau=
 Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
On Mon, Dec 03, 2018 at 09:06:37AM -0700, Rian Quinn wrote:<br>
&gt; &gt; Can you trace this to the Linux code that&#39;s actually making t=
he call<br>
&gt; &gt; by injecting a trap when this happens?<br>
&gt; <br>
&gt; Yes, we can. In some cases, we have to manually backtrace, but so far<=
br>
&gt; we have been able to map resources to the actual source code.<br>
&gt; <br>
&gt; &gt; Serial port poking?<br>
&gt; <br>
&gt; This would be a great one to locate in the kernel. I suspect that<br>
&gt; serial is the case, but if that is true, something is a bit wrong as<b=
r>
&gt; once again, this device doesn&#39;t exist without QEMU.<br>
<br>
Maybe Linux pokes at this port in order to check whether the device<br>
exists?<br>
<br>
The fact that the device doesn&#39;t exist doesn&#39;t prevent a guest from=
<br>
poking at this port, and IMO it&#39;s a legit thing to do. Returning all<br=
>
1s (like bare metal) should be OK and would actually signal Linux<br>
there&#39;s no register there and thus no device.<br>
<br>
&gt; There is also a<br>
&gt; little bit of testing that we should do here. Right now we manually<br=
>
&gt; pass-through a serial device for UART debugging, and that might have<b=
r>
&gt; the side effect of this port showing up so I would want to rule that<b=
r>
&gt; out first.<br>
&gt; <br>
&gt; &gt; APs for PVH can be started using the native way, which means they=
 are<br>
&gt; &gt; started in real mode, that&#39;s why Linux uses the real mode tra=
mpoline.<br>
&gt; <br>
&gt; Ah... ok. That makes sense. Uhg... emulating INIT/SIPI is no fun. That=
<br>
&gt; is some pretty fragile code.<br>
<br>
It&#39;s the same code that we already use for HVM guests, since PVH<br>
guests get an emulated LAPIC like HVM ones.<br>
<br>
&gt; &gt; Legacy ROMs from which device?<br>
&gt; <br>
&gt; Video BIOS was one of them. There are several memory regions within<br=
>
&gt; legacy BIOS that are being scanned so my assumption is that these<br>
&gt; regions are some ROMs, and I am not really sure why PVH would execute<=
br>
&gt; that logic at all.<br>
<br>
Xen signals in the FADT that there&#39;s no VGA, but I won&#39;t be surpris=
ed<br>
that some OSes simply ignore this bit because there are systems with<br>
broken ACPI tables out there with the bit set and VGA.<br>
<br>
&gt; I am pretty sure that it is scanning for MP tables<br>
&gt; as I think I traced that specific logic back to the Linux kernel.<br>
<br>
There&#39;s no other way to detect MP tables rather that scanning the<br>
different positions where they can be found, so I think it&#39;s fine for<b=
r>
Linux to do so.<br>
<br>
&gt; I<br>
&gt; know for sure that DMI is being scanned as well. Right now we map in a=
<br>
&gt; read-only zero page and that works fine, but I would think that a lot<=
br>
&gt; of this logic would not be needed in the Guest case. Dom0 is another<b=
r>
&gt; story.<br>
<br>
IMO we should try to limit as much as possible the PVH specific<br>
modifications that we have to make to guests. So it&#39;s better to let<br>
the guest scan memory or poke at IO ports rather than add a specific<br>
&#39;is running on PVH&#39; check to each device driver that we know it&#39=
;s not<br>
available when running as PVH.<br>
<br>
Poking at such ports or scanning memory is exactly the same that&#39;s<br>
done on bare metal, and should work fine on PVH to detect the absence<br>
of certain devices.<br>
<br>
Thanks, Roger.<br>
<br>
&gt; On Mon, Dec 3, 2018 at 4:42 AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mai=
lto:roger.pau@citrix.com" target=3D"_blank">roger.pau@citrix.com</a>&gt; wr=
ote:<br>
&gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; Thanks, this is very interesting.<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Dec 01, 2018 at 09:21:00AM -0700, Rian Quinn wrote:<br>
&gt; &gt; &gt; We finally have a Linux PVH guest up and running (using an i=
nitramfs<br>
&gt; &gt; right<br>
&gt; &gt; &gt; now). I have posted a quick status update video on YouTube t=
hat shows our<br>
&gt; &gt; &gt; progress of getting a Windows Dom0 working (which is one of =
the many<br>
&gt; &gt; goals<br>
&gt; &gt; &gt; of our research).<br>
&gt; &gt; &gt; <a href=3D"https://www.youtube.com/watch?v=3DxzTKBek-g0k" re=
l=3D"noreferrer" target=3D"_blank">https://www.youtube.com/watch?v=3DxzTKBe=
k-g0k</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As promised in the x86 Community Call, here is the list of t=
hings that a<br>
&gt; &gt; &gt; PVH Linux guest requires. You can see the code for this here=
:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/rianquinn/hyperkernel/blob/hyperker=
nel_1/bfvmm/src/hve/arch/intel_x64/xen/xen_op.cpp" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/rianquinn/hyperkernel/blob/hyperkernel_1/bf=
vmm/src/hve/arch/intel_x64/xen/xen_op.cpp</a><br>
&gt; &gt; &gt; and here:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/rianquinn/hyperkernel/blob/hyperker=
nel_1/bfexec/src/main.c" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/rianquinn/hyperkernel/blob/hyperkernel_1/bfexec/src/main.c</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would love to put this information somewhere in Xen&#39;s =
project (i.e.<br>
&gt; &gt; wiki<br>
&gt; &gt; &gt; or source), but I am not sure what you would prefer. Any ide=
as?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Finally, keep in mind that we will likely keep adding to thi=
s list as we<br>
&gt; &gt; &gt; add more features (like front/back support, xenstore, etc...=
)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks,<br>
&gt; &gt; &gt; - Rian<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; CPUID:<br>
&gt; &gt; &gt; - XEN_CPUID_LEAF(0)<br>
&gt; &gt; &gt; - XEN_CPUID_LEAF(1)<br>
&gt; &gt; &gt; - XEN_CPUID_LEAF(2)<br>
&gt; &gt; &gt; - XEN_CPUID_LEAF(4)<br>
&gt; &gt; &gt; - 0x0, 0x1, 0x2, 0x4, 0x6, 0x7, 0xA, 0xB, 0xD, 0xF, 0x10, 0x=
15, 0x16<br>
&gt; &gt; &gt; - 0x80000000, 0x80000001, 0x80000002, 0x80000003, 0x80000004=
<br>
&gt; &gt; &gt; - 0x80000007, 0x80000008<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; MSRs:<br>
&gt; &gt; &gt; - Hypercall page (dynamic)<br>
&gt; &gt; &gt; - ia32_star<br>
&gt; &gt; &gt; - ia32_lstar<br>
&gt; &gt; &gt; - ia32_cstar<br>
&gt; &gt; &gt; - ia32_fmask<br>
&gt; &gt; &gt; - ia32_kernel_gs_base<br>
&gt; &gt; &gt; - ia32_pat<br>
&gt; &gt; &gt; - ia32_efer<br>
&gt; &gt; &gt; - ia32_fs_base<br>
&gt; &gt; &gt; - ia32_gs_base<br>
&gt; &gt; &gt; - ia32_sysenter_cs<br>
&gt; &gt; &gt; - ia32_sysenter_eip<br>
&gt; &gt; &gt; - ia32_sysenter_esp<br>
&gt; &gt; &gt; - ia32_apic_base<br>
&gt; &gt; &gt; - platform_info<br>
&gt; &gt; &gt; - 0x34, 0x64E, 0x140, 0x1A0, 0x6e0<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; IO Ports (some of these are odd):<br>
&gt; &gt; &gt; - 0xCF8 - 0xCFF<br>
&gt; &gt; &gt; - 0x4D0 (odd since PIT and ACPI is disable for everything th=
at might need<br>
&gt; &gt; &gt; this)<br>
&gt; &gt;<br>
&gt; &gt; Likely some poking for EISA devices? (same for 0x4D1)<br>
&gt; &gt;<br>
&gt; &gt; Can you trace this to the Linux code that&#39;s actually making t=
he call<br>
&gt; &gt; by injecting a trap when this happens?<br>
&gt; &gt;<br>
&gt; &gt; &gt; - 0x4D1<br>
&gt; &gt; &gt; - 0x70<br>
&gt; &gt; &gt; - 0x71<br>
&gt; &gt; &gt; - 0x3FE (any ideas)?<br>
&gt; &gt;<br>
&gt; &gt; Serial port poking?<br>
&gt; &gt;<br>
&gt; &gt; Again would be interesting to know the Linux code that&#39;s poki=
ng<br>
&gt; &gt; this.<br>
&gt; &gt;<br>
&gt; &gt; &gt; - 0x42, 0x43, 0x61<br>
&gt; &gt; &gt; - XEN_IOPORT_BASE (since QEMU is not used, why is this neede=
d?)<br>
&gt; &gt;<br>
&gt; &gt; IIRC the PVH code path in Linux is almost the same as the HVM one=
,<br>
&gt; &gt; that&#39;s why this port is poked in order to see whether there a=
re<br>
&gt; &gt; emulated devices to disable. I think this is expected and perfect=
ly<br>
&gt; &gt; fine.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hypercalls:<br>
&gt; &gt; &gt; - XENMEM_decrease_reservation<br>
&gt; &gt; &gt; - XENMEM_add_to_physmap_handler<br>
&gt; &gt; &gt; - XENMEM_memory_map_handler<br>
&gt; &gt; &gt; - XENVER_get_features_handler<br>
&gt; &gt; &gt; - GNTTABOP_query_size_handler<br>
&gt; &gt; &gt; - GNTTABOP_set_version_handler<br>
&gt; &gt; &gt; - EVTCHNOP_init_control_handler<br>
&gt; &gt; &gt; - EVTCHNOP_expand_array_handler<br>
&gt; &gt; &gt; - EVTCHNOP_alloc_unbound_handler<br>
&gt; &gt; &gt; - EVTCHNOP_bind_ipi_handler<br>
&gt; &gt; &gt; - EVTCHNOP_bind_virq_handler<br>
&gt; &gt; &gt; - EVTCHNOP_bind_vcpu_handler<br>
&gt; &gt; &gt; - EVTCHNOP_send_handler<br>
&gt; &gt; &gt; - HVMOP_set_param_handler<br>
&gt; &gt; &gt; - HVMOP_get_param_handler<br>
&gt; &gt; &gt; - HVMOP_pagetable_dying_handler<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Memory:<br>
&gt; &gt; &gt; - Shared info page<br>
&gt; &gt; &gt; - Start info struct (PVH)<br>
&gt; &gt; &gt; - Initial GDT, IDT, TSS<br>
&gt; &gt; &gt; - Command line page<br>
&gt; &gt; &gt; - ACPI (FSDT, DSDT, MADT)<br>
&gt; &gt; &gt; - xAPIC page<br>
&gt; &gt; &gt; - Real-mode trampoline (this was weird)<br>
&gt; &gt;<br>
&gt; &gt; APs for PVH can be started using the native way, which means they=
 are<br>
&gt; &gt; started in real mode, that&#39;s why Linux uses the real mode tra=
mpoline.<br>
&gt; &gt;<br>
&gt; &gt; &gt; - DMI, Video Bios, MP Table, and some legacy ROMs<br>
&gt; &gt;<br>
&gt; &gt; Legacy ROMs from which device?<br>
&gt; &gt;<br>
&gt; &gt; Also there&#39;s no MP tables or video BIOS at all, so I guess th=
is is<br>
&gt; &gt; Linux trying to find the BDA and friends in the low 1MB?<br>
&gt; &gt;<br>
&gt; &gt; Thanks, Roger.<br>
&gt; &gt;<br>
</blockquote></div>

--000000000000af3990057c23b4ab--


--===============4479909726245110858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4479909726245110858==--
