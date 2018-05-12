From: Kun Cheng <chengkunck@gmail.com>
Subject: need help when libxenlight.so is used
Date: Sat, 12 May 2018 20:55:46 +0800
Message-ID: <CAO3v1VT9Hu2vxnNtFKZ1npaau9tZ4NJ6rXk2TAF0govFW2unqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8059282907274090120=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============8059282907274090120==
Content-Type: multipart/alternative; boundary="000000000000a00946056c01c683"

--000000000000a00946056c01c683
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Xen devs,

I'm learning code in xen-4.10.0/tools/xl to find out how to program with
libxl.

I've trying to use libxenlight.so (compiled and installed from xen 4.10.0
source code) to control my vms from my own code until I met this issue.
Now my test code follows xl_vmmcontrol.c and tries to create a VM from its
config file (file can be used to successfully create a vm with 'xl create')=
.

My Xen make is successful and I can use 'xl' to manage all vms.

When I test my own code, I got such an error in dmesg"

test[16678]: segfault at 18 ip 00007f69fa6526ad sp 00007ffe1eadedf0 error 4
in libxenlight.so.4.10.0[7f69fa61a000+bc000] in dmesg

and also segmentation fault in my terminal.

I dumped my debugging info, hoping could give everyone some clue.

FYI, my program was compiled with:

gcc -m64 -pthread -std=3Dgnu99  -g xl_executor.c xl_parse.c  xl_utils.c
xl_nic.c -lxenlight -lxlutil -lxentoollog  -lyajl  -o test

where xl_executor.c is my code of creating a vm, all other c file are
copied from tools/xl/

GDB bebugging info:

Breakpoint 3, parse_config_data (config_source=3D0x7fffffffe360
"/data/chengkun/vms/vm4/vm4.cfg",
    config_data=3D0x6155f0 "# ", '=3D' <repeats 69 times>, "\n# Example HVM
guest configuration\n# ", '=3D' <repeats 69 times>, "\n#\n# This is a fairl=
y
m"..., config_len=3D1543,
    d_config=3D0x7fffffffdde0) at xl_parse.c:993

993         if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {

(gdb) p *c_info
$3 =3D {type =3D LIBXL_DOMAIN_TYPE_HVM, hap =3D {val =3D 0}, oos =3D {val =
=3D 0},
ssidref =3D 0, ssid_label =3D 0x0, name =3D 0x6154f0 "test_vm", uuid =3D {
    uuid =3D "O\374\032\231+\330A\265\213rV=DE=90\375\020\270"}, xsdata =3D=
 0x0,
platformdata =3D 0x0, poolid =3D 0, pool_name =3D 0x0, run_hotplug_scripts =
=3D {val
=3D 1}, driver_domain =3D {
    val =3D 0}}

(gdb) p *b_info
$4 =3D {max_vcpus =3D 0, avail_vcpus =3D {size =3D 0, map =3D 0x0}, cpumap =
=3D {size =3D
0, map =3D 0x0}, nodemap =3D {size =3D 0, map =3D 0x0}, num_vcpu_hard_affin=
ity =3D 0,
  vcpu_hard_affinity =3D 0x0, num_vcpu_soft_affinity =3D 0, vcpu_soft_affin=
ity
=3D 0x0, numa_placement =3D {val =3D 0}, tsc_mode =3D LIBXL_TSC_MODE_DEFAUL=
T,
max_memkb =3D 4194304,
  target_memkb =3D 2097152, video_memkb =3D 18446744073709551615, shadow_me=
mkb
=3D 18446744073709551615, rtc_timeoffset =3D 0, exec_ssidref =3D 0,
exec_ssid_label =3D 0x0,
  localtime =3D {val =3D 0}, disable_migrate =3D {val =3D 0}, cpuid =3D 0x0=
,
blkdev_start =3D 0x0, num_vnuma_nodes =3D 0, vnuma_nodes =3D 0x0,
max_grant_frames =3D 32,
  max_maptrack_frames =3D 1024, device_model_version =3D
LIBXL_DEVICE_MODEL_VERSION_UNKNOWN, device_model_stubdomain =3D {val =3D 0}=
,
device_model =3D 0x0, device_model_ssidref =3D 0,
  device_model_ssid_label =3D 0x0, device_model_user =3D 0x0, extra =3D 0x0=
,
extra_pv =3D 0x0, extra_hvm =3D 0x0, sched_params =3D {sched =3D
LIBXL_SCHEDULER_UNKNOWN, weight =3D -1,
    cap =3D -1, period =3D -1, budget =3D -1, extratime =3D -1, slice =3D -=
1, latency
=3D -1}, num_ioports =3D 0, ioports =3D 0x0, num_irqs =3D 0, irqs =3D 0x0, =
num_iomem
=3D 0, iomem =3D 0x0,
  claim_mode =3D {val =3D 0}, event_channels =3D 0, kernel =3D 0x0, cmdline=
 =3D 0x0,
ramdisk =3D 0x0, device_tree =3D 0x0, acpi =3D {val =3D 0}, bootloader =3D =
0x0,
bootloader_args =3D 0x0,
  timer_mode =3D LIBXL_TIMER_MODE_UNKNOWN, nested_hvm =3D {val =3D 0}, apic=
 =3D
{val =3D 0}, dm_restrict =3D {val =3D 0}, type =3D LIBXL_DOMAIN_TYPE_HVM, u=
 =3D {hvm
=3D {firmware =3D 0x0,
      bios =3D LIBXL_BIOS_TYPE_UNKNOWN, pae =3D {val =3D 0}, apic =3D {val =
=3D 0},
acpi =3D {val =3D 0}, acpi_s3 =3D {val =3D 0}, acpi_s4 =3D {val =3D 0},
acpi_laptop_slate =3D {val =3D 0}, nx =3D {
        val =3D 0}, viridian =3D {val =3D 0}, viridian_enable =3D {size =3D=
 0, map =3D
0x0}, viridian_disable =3D {size =3D 0, map =3D 0x0}, timeoffset =3D 0x0, h=
pet =3D
{val =3D 0}, vpt_align =3D {
        val =3D 0}, mmio_hole_memkb =3D 18446744073709551615, timer_mode =
=3D
LIBXL_TIMER_MODE_UNKNOWN, nested_hvm =3D {val =3D 0}, altp2m =3D {val =3D 0=
},
system_firmware =3D 0x0,
      smbios_firmware =3D 0x0, acpi_firmware =3D 0x0, hdtype =3D
LIBXL_HDTYPE_IDE, nographic =3D {val =3D 0}, vga =3D {kind =3D
LIBXL_VGA_INTERFACE_TYPE_UNKNOWN}, vnc =3D {enable =3D {
          val =3D 0}, listen =3D 0x0, passwd =3D 0x0, display =3D 0, findun=
used =3D
{val =3D 0}}, keymap =3D 0x0, sdl =3D {enable =3D {val =3D 0}, opengl =3D {=
val =3D 0},
display =3D 0x0,
        xauthority =3D 0x0}, spice =3D {enable =3D {val =3D 0}, port =3D 0,=
 tls_port
=3D 0, host =3D 0x0, disable_ticketing =3D {val =3D 0}, passwd =3D 0x0, age=
nt_mouse =3D
{val =3D 0},
        vdagent =3D {val =3D 0}, clipboard_sharing =3D {val =3D 0}, usbredi=
rection
=3D 0, image_compression =3D 0x0, streaming_video =3D 0x0}, gfx_passthru =
=3D {val =3D
0},
      gfx_passthru_kind =3D LIBXL_GFX_PASSTHRU_KIND_DEFAULT, serial =3D 0x0=
,
boot =3D 0x0, usb =3D {val =3D 0}, usbversion =3D 0, usbdevice =3D 0x0, sou=
ndhw =3D
0x0, xen_platform_pci =3D {
        val =3D 0}, usbdevice_list =3D 0x0, vendor_device =3D
LIBXL_VENDOR_DEVICE_NONE, ms_vm_genid =3D {bytes =3D '\000' <repeats 15
times>}, serial_list =3D 0x0, rdm =3D {
        strategy =3D LIBXL_RDM_RESERVE_STRATEGY_IGNORE, policy =3D
LIBXL_RDM_RESERVE_POLICY_INVALID}, rdm_mem_boundary_memkb =3D
18446744073709551615, mca_caps =3D 0}, pv =3D {
      kernel =3D 0x0, slack_memkb =3D 0, bootloader =3D 0x0, bootloader_arg=
s =3D
0x0, cmdline =3D 0x0, ramdisk =3D 0x0, features =3D 0x0, e820_host =3D {val=
 =3D 0}}},
arch_arm =3D {
    gic_version =3D LIBXL_GIC_VERSION_DEFAULT, vuart =3D
LIBXL_VUART_TYPE_UNKNOWN}, altp2m =3D LIBXL_ALTP2M_MODE_DISABLED}

(gdb) p ctx
$5 =3D (libxl_ctx *) 0x0

(gdb) p *ctx
$6 =3D <incomplete type>

(gdb) s

Program received signal SIGSEGV, Segmentation fault.
0x00007ffff7b476ad in libxl.ptr_add () from
/usr/local/lib/libxenlight.so.4.10


Is that related to my compiling cmd?
Any help is appreciated.

Thanks,
K

--000000000000a00946056c01c683
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Xen devs,<br><br>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">I&#39;m learning code in xen-4.10.0/tools/xl to f=
ind out how to program with libxl.=C2=A0</span>=C2=A0<div>=C2=A0
<br>I&#39;ve trying to use libxenlight.so (compiled and installed from xen =
4.10.0 source code) to control my vms from my own code until I met this iss=
ue.=C2=A0</div><div>Now my test code follows xl_vmmcontrol.c and tries to c=
reate a VM from its config file (file can be used to successfully create a =
vm with &#39;xl create&#39;).</div><div><br><div>My Xen make is successful =
and I can use &#39;xl&#39; to manage all vms.</div><div><br></div><div>When=
 I test my own code, I got such an error in dmesg&quot;</div><div><br></div=
><div>test[16678]: segfault at 18 ip 00007f69fa6526ad sp 00007ffe1eadedf0 e=
rror 4 in libxenlight.so.4.10.0[7f69fa61a000+bc000] in dmesg<br></div><div>=
<br></div><div>and also segmentation fault in my terminal.</div><div><br></=
div><div>I dumped my debugging info, hoping could give everyone some clue.<=
br><div><br></div><div>FYI, my program was compiled with:</div><div><br></d=
iv><div>gcc -m64 -pthread -std=3Dgnu99=C2=A0 -g xl_executor.c xl_parse.c=C2=
=A0 xl_utils.c xl_nic.c -lxenlight -lxlutil -lxentoollog=C2=A0 -lyajl=C2=A0=
 -o test</div><div><br></div><div>where xl_executor.c is my code of creatin=
g a vm, all other c file are copied from tools/xl/=C2=A0</div><div><br></di=
v><div>GDB bebugging info:<br><br>Breakpoint 3, parse_config_data (config_s=
ource=3D0x7fffffffe360 &quot;/data/chengkun/vms/vm4/vm4.cfg&quot;, <br>=C2=
=A0 =C2=A0 config_data=3D0x6155f0 &quot;# &quot;, &#39;=3D&#39; &lt;repeats=
 69 times&gt;, &quot;\n# Example HVM guest configuration\n# &quot;, &#39;=
=3D&#39; &lt;repeats 69 times&gt;, &quot;\n#\n# This is a fairly m&quot;...=
, config_len=3D1543, <br>=C2=A0 =C2=A0 d_config=3D0x7fffffffdde0) at xl_par=
se.c:993<div><br>993 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (libxl_cpu_bitmap_alloc=
(ctx, &amp;b_info-&gt;avail_vcpus, l)) {</div><div><br>(gdb) p *c_info</div=
><div>$3 =3D {type =3D LIBXL_DOMAIN_TYPE_HVM, hap =3D {val =3D 0}, oos =3D =
{val =3D 0}, ssidref =3D 0, ssid_label =3D 0x0, name =3D 0x6154f0 &quot;tes=
t_vm&quot;, uuid =3D {<br>=C2=A0 =C2=A0 uuid =3D &quot;O\374\032\231+\330A\=
265\213rV=DE=90\375\020\270&quot;}, xsdata =3D 0x0, platformdata =3D 0x0, p=
oolid =3D 0, pool_name =3D 0x0, run_hotplug_scripts =3D {val =3D 1}, driver=
_domain =3D {<br>=C2=A0 =C2=A0 val =3D 0}}</div><div><br>(gdb) p *b_info</d=
iv><div>$4 =3D {max_vcpus =3D 0, avail_vcpus =3D {size =3D 0, map =3D 0x0},=
 cpumap =3D {size =3D 0, map =3D 0x0}, nodemap =3D {size =3D 0, map =3D 0x0=
}, num_vcpu_hard_affinity =3D 0, <br>=C2=A0 vcpu_hard_affinity =3D 0x0, num=
_vcpu_soft_affinity =3D 0, vcpu_soft_affinity =3D 0x0, numa_placement =3D {=
val =3D 0}, tsc_mode =3D LIBXL_TSC_MODE_DEFAULT, max_memkb =3D 4194304, <br=
>=C2=A0 target_memkb =3D 2097152, video_memkb =3D 18446744073709551615, sha=
dow_memkb =3D 18446744073709551615, rtc_timeoffset =3D 0, exec_ssidref =3D =
0, exec_ssid_label =3D 0x0, <br>=C2=A0 localtime =3D {val =3D 0}, disable_m=
igrate =3D {val =3D 0}, cpuid =3D 0x0, blkdev_start =3D 0x0, num_vnuma_node=
s =3D 0, vnuma_nodes =3D 0x0, max_grant_frames =3D 32, <br>=C2=A0 max_maptr=
ack_frames =3D 1024, device_model_version =3D LIBXL_DEVICE_MODEL_VERSION_UN=
KNOWN, device_model_stubdomain =3D {val =3D 0}, device_model =3D 0x0, devic=
e_model_ssidref =3D 0, <br>=C2=A0 device_model_ssid_label =3D 0x0, device_m=
odel_user =3D 0x0, extra =3D 0x0, extra_pv =3D 0x0, extra_hvm =3D 0x0, sche=
d_params =3D {sched =3D LIBXL_SCHEDULER_UNKNOWN, weight =3D -1, <br>=C2=A0 =
=C2=A0 cap =3D -1, period =3D -1, budget =3D -1, extratime =3D -1, slice =
=3D -1, latency =3D -1}, num_ioports =3D 0, ioports =3D 0x0, num_irqs =3D 0=
, irqs =3D 0x0, num_iomem =3D 0, iomem =3D 0x0, <br>=C2=A0 claim_mode =3D {=
val =3D 0}, event_channels =3D 0, kernel =3D 0x0, cmdline =3D 0x0, ramdisk =
=3D 0x0, device_tree =3D 0x0, acpi =3D {val =3D 0}, bootloader =3D 0x0, boo=
tloader_args =3D 0x0, <br>=C2=A0 timer_mode =3D LIBXL_TIMER_MODE_UNKNOWN, n=
ested_hvm =3D {val =3D 0}, apic =3D {val =3D 0}, dm_restrict =3D {val =3D 0=
}, type =3D LIBXL_DOMAIN_TYPE_HVM, u =3D {hvm =3D {firmware =3D 0x0, <br>=
=C2=A0 =C2=A0 =C2=A0 bios =3D LIBXL_BIOS_TYPE_UNKNOWN, pae =3D {val =3D 0},=
 apic =3D {val =3D 0}, acpi =3D {val =3D 0}, acpi_s3 =3D {val =3D 0}, acpi_=
s4 =3D {val =3D 0}, acpi_laptop_slate =3D {val =3D 0}, nx =3D {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 val =3D 0}, viridian =3D {val =3D 0}, viridian_enable =
=3D {size =3D 0, map =3D 0x0}, viridian_disable =3D {size =3D 0, map =3D 0x=
0}, timeoffset =3D 0x0, hpet =3D {val =3D 0}, vpt_align =3D {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 val =3D 0}, mmio_hole_memkb =3D 18446744073709551615, tim=
er_mode =3D LIBXL_TIMER_MODE_UNKNOWN, nested_hvm =3D {val =3D 0}, altp2m =
=3D {val =3D 0}, system_firmware =3D 0x0, <br>=C2=A0 =C2=A0 =C2=A0 smbios_f=
irmware =3D 0x0, acpi_firmware =3D 0x0, hdtype =3D LIBXL_HDTYPE_IDE, nograp=
hic =3D {val =3D 0}, vga =3D {kind =3D LIBXL_VGA_INTERFACE_TYPE_UNKNOWN}, v=
nc =3D {enable =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0}, list=
en =3D 0x0, passwd =3D 0x0, display =3D 0, findunused =3D {val =3D 0}}, key=
map =3D 0x0, sdl =3D {enable =3D {val =3D 0}, opengl =3D {val =3D 0}, displ=
ay =3D 0x0, <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 xauthority =3D 0x0}, spice =3D =
{enable =3D {val =3D 0}, port =3D 0, tls_port =3D 0, host =3D 0x0, disable_=
ticketing =3D {val =3D 0}, passwd =3D 0x0, agent_mouse =3D {val =3D 0}, <br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent =3D {val =3D 0}, clipboard_sharing =3D=
 {val =3D 0}, usbredirection =3D 0, image_compression =3D 0x0, streaming_vi=
deo =3D 0x0}, gfx_passthru =3D {val =3D 0}, <br>=C2=A0 =C2=A0 =C2=A0 gfx_pa=
ssthru_kind =3D LIBXL_GFX_PASSTHRU_KIND_DEFAULT, serial =3D 0x0, boot =3D 0=
x0, usb =3D {val =3D 0}, usbversion =3D 0, usbdevice =3D 0x0, soundhw =3D 0=
x0, xen_platform_pci =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0}, usbde=
vice_list =3D 0x0, vendor_device =3D LIBXL_VENDOR_DEVICE_NONE, ms_vm_genid =
=3D {bytes =3D &#39;\000&#39; &lt;repeats 15 times&gt;}, serial_list =3D 0x=
0, rdm =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 strategy =3D LIBXL_RDM_RESERVE_=
STRATEGY_IGNORE, policy =3D LIBXL_RDM_RESERVE_POLICY_INVALID}, rdm_mem_boun=
dary_memkb =3D 18446744073709551615, mca_caps =3D 0}, pv =3D {<br>=C2=A0 =
=C2=A0 =C2=A0 kernel =3D 0x0, slack_memkb =3D 0, bootloader =3D 0x0, bootlo=
ader_args =3D 0x0, cmdline =3D 0x0, ramdisk =3D 0x0, features =3D 0x0, e820=
_host =3D {val =3D 0}}}, arch_arm =3D {<br>=C2=A0 =C2=A0 gic_version =3D LI=
BXL_GIC_VERSION_DEFAULT, vuart =3D LIBXL_VUART_TYPE_UNKNOWN}, altp2m =3D LI=
BXL_ALTP2M_MODE_DISABLED}</div><div><br>(gdb) p ctx<br>$5 =3D (libxl_ctx *)=
 0x0</div><div><br>(gdb) p *ctx<br>$6 =3D &lt;incomplete type&gt;</div><div=
><br>(gdb) s<br><br>Program received signal SIGSEGV, Segmentation fault.<br=
>0x00007ffff7b476ad in libxl.ptr_add () from /usr/local/lib/libxenlight.so.=
4.10<br></div></div></div></div><div><br></div><div><br></div><div>Is that =
related to my compiling cmd?=C2=A0</div><div>Any help is appreciated.</div>=
<div><br></div><div>Thanks,</div><div>K</div></div>

--000000000000a00946056c01c683--


--===============8059282907274090120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8059282907274090120==--
