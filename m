From: "Wang, Baoqian" <bwang1@islander.tamucc.edu>
Subject: Boot Xen on Jetson TX2
Date: Wed, 20 Dec 2017 21:29:03 +0000
Message-ID: <BLUPR0601MB1604582245D8B0216ED9EFE7C50C0@BLUPR0601MB1604.namprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6644087991933899710=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=2et7=dq=islander.tamucc.edu=bwang1@srs-us1.protection.inumbo.net>)
 id 1eRlvK-00020g-QH
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 21:29:10 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============6644087991933899710==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BLUPR0601MB1604582245D8B0216ED9EFE7C50C0BLUPR0601MB1604_"

--_000_BLUPR0601MB1604582245D8B0216ED9EFE7C50C0BLUPR0601MB1604_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to boot Xen on TX2. But I got a problem with loading domain0 ke=
rnel. Hope somebody could help me.


I compiled the Xen 4.9.1 on Jetson TX2. The domain0 kernel version is 4.4.3=
8. I made some modifications to the device tree provided by the TX2. Then I=
 can boot xen hypervisor, but when it comes to boot domain0 kernel. It hang=
s there. No more output. I enabled Xen related configurations in domain0 ke=
rnel and pass the console=3Dhvc0 command to the kernel.  It doesn't work.  =
What is the problem ?? Any suggestion is appreciated.  Thanks!


Baoqian Wang


Here is the bootargs and log:


U-Boot 2016.07-g0ce7ca2 (Jul 20 2017 - 00:45:25 -0700)

TEGRA186
Model: NVIDIA P2771-0000-500
DRAM:  7.8 GiB
MC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@2490000
Hit any key to stop autoboot:  2 ^H^H^H 0
Tegra186 (P2771-0000-500) # ext4load $dev $kernel_addr_r $kernel_path
20418088 bytes read in 538 ms (36.2 MiB/s)
Tegra186 (P2771-0000-500) # setenv kernel_size 0x$filesize
Tegra186 (P2771-0000-500) # <INTERRUPT>
Tegra186 (P2771-0000-500) # ext4load $dev $xen_addr_r $xen_path
819536 bytes read in 100 ms (7.8 MiB/s)
Tegra186 (P2771-0000-500) # ext4load $dev $dtb_addr_r $dtb_path
267196 bytes read in 92 ms (2.8 MiB/s)
Tegra186 (P2771-0000-500) # fdt addr $dtb_addr_r
Tegra186 (P2771-0000-500) # fdt resize
Tegra186 (P2771-0000-500) # fdt set /chosen xen,xen-bootargs \"$xen_bootarg=
s\"
Tegra186 (P2771-0000-500) # fdt set /chosen xen,dom0-bootargs \"$dom0_boota=
rgs\"
Tegra186 (P2771-0000-500) # fdt set /chosen xen,dom0-bootargs \"$dom0_boota=
rgs\"
Tegra186 (P2771-0000-500) # fdt mknode /chosen modules
Tegra186 (P2771-0000-500) # fdt set /chosen/modules '#address-cells' <1>
Tegra186 (P2771-0000-500) # fdt set /chosen/modules '#size-cells' <1>
Tegra186 (P2771-0000-500) # fdt mknode /chosen/modules module@0
Tegra186 (P2771-0000-500) # fdt set /chosen/modules/module@0 compatible xen=
,linux-zimage xen,multiboot-module
Tegra186 (P2771-0000-500) # fdt set /chosen/modules/module@0 reg <$kernel_a=
ddr_r $kernel_size>
Tegra186 (P2771-0000-500) # fdt print /chosen
chosen {
        xen,dom0-bootargs =3D "vmalloc=3D256M console=3Dhvc0 psci=3Denable =
earlyprintk=3Dxen debug clk_ignore_unused root=3D/dev/mmcblk0p1 rootwait rw=
";
        xen,xen-bootargs =3D "sync_console console=3Ddtuart dtuart=3D/seria=
l@3100000 earlyprintk=3Dxen dom0_mem=3D800M";
        modules {
                #size-cells =3D <0x00000001>;
                #address-cells =3D <0x00000001>;
                module@0 {
                        reg =3D <0x82000000 0x01378e28>;
                        compatible =3D "xen,linux-zimage", "xen,multiboot-m=
odule";
                };
        };
};
Tegra186 (P2771-0000-500) # booti $xen_addr_r - $dtb_addr_r
Image lacks image_size field, assuming 16MiB
## Flattened Device Tree blob at 92000000
   Booting using the fdt blob at 0x92000000
   reserving fdt memory region: addr=3D80000000 size=3D10000
   reserving fdt memory region: addr=3D92000000 size=3D42000
   Using Device Tree in place at 0000000092000000, end 0000000092044fff

Starting kernel ...

- UART enabled -
- CPU 00000100 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000080000000 - 00000000efffffff
(XEN) RAM: 00000000f0110000 - 0000000275f0ffff
(XEN)
(XEN) MODULE[0]: 0000000092000000 - 0000000092042000 Device Tree
(XEN) MODULE[1]: 0000000082000000 - 0000000083378e28 Kernel
(XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
(XEN)  RESVD[1]: 0000000092000000 - 0000000092042000
(XEN)
(XEN) Command line: sync_console console=3Ddtuart dtuart=3D/serial@3100000 =
earlyprintk=3Dxen dom0_mem=3D800M
(XEN) Placing Xen at 0x0000000275c00000-0x0000000275e00000
(XEN) Update BOOTMOD_XEN from 0000000080000000-0000000080112d81 =3D> 000000=
0275c00000-0000000275d12d81
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "/serial@3 Xen 4.9.0
(XEN) Xen version 4.9.0 (root@) (gcc (Ubuntu/Linaro 5.3.1-14ubuntu2.1) 5.3.=
1 20160413) debug=3Dy  Mon Dec 18 21:49:04 UTC 2017
(XEN) Latest ChangeSet:
(XEN) Console output is synchronous.
(XEN) Processor: 411fd073: "ARM Limited", variant: 0x1, part 0xd07, rev 0x3
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001124 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using PSCI-1.0 for SMP bringup
(XEN) SMP: Allowing 6 CPUs
(XEN) Generic Timer IRQ: phys=3D46 hyp=3D42 virt=3D43 Freq: 31250 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=3D0000000003881000
(XEN)         gic_cpu_addr=3D0000000003882000
(XEN)         gic_hyp_addr=3D0000000003884000
(XEN)         gic_vcpu_addr=3D0000000003886000
(XEN)         gic_maintenance_irq=3D25
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200043b).
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 64 KiB.
(XEN) Bringing up CPU1
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 00000001 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
- CPU 00000101 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
- CPU 00000102 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 4 booted.
(XEN) Bringing up CPU5
- CPU 00000103 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 5 booted.
(XEN) Brought up 6 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) smmu: /iommu@12000000: found 2 interrupts but expected at least 3
(XEN) I/O virtualisation disabled
(XEN) build-id: c1ab29064b82d810923afbe25e0061da738af14a
(XEN) alternatives: Patching with alt table 00000000400b4ca0 -> 00000000400=
b5078
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 0000000082000000
(XEN) Allocating 1:1 mappings totalling 800MB for dom0:
(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)
(XEN) BANK[1] 0x000000e0000000-0x000000f0000000 (256MB)
(XEN) BANK[2] 0x000000f2000000-0x000000f4000000 (32MB)
(XEN) Grant table range: 0x00000275c00000-0x00000275c62000
(XEN) Loading zImage from 0000000082000000 to 00000000a0080000-00000000a13f=
8e28
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a803f510
(XEN) Scrubbing Free RAM on 1 nodes using 6 CPUs
(XEN) ...........done.
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) This option is intended to aid debugging of Xen by ensuring
(XEN) that all output is synchronously delivered on the serial line.
(XEN) However it can introduce SIGNIFICANT latencies and affect
(XEN) timekeeping. It is NOT recommended for production use!
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input t=
o Xen)
(XEN) Freed 288kB init memory.






--_000_BLUPR0601MB1604582245D8B0216ED9EFE7C50C0BLUPR0601MB1604_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi, <br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I am trying to boot Xen on TX2. B=
ut I got a problem with loading domain0 kernel. Hope somebody could help me=
.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I compiled the Xen 4.9.1 on Jetso=
n TX2. The domain0 kernel version is 4.4.38. I made some modifications to t=
he device tree provided by the TX2. Then I can boot xen hypervisor, but whe=
n it comes to boot domain0 kernel.
 It hangs there. No more output. I enabled Xen related configurations in do=
main0 kernel and pass the console=3Dhvc0 command to the kernel.&nbsp; It do=
esn't work.&nbsp; What is the problem ?? Any suggestion is appreciated.&nbs=
p; Thanks!</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Baoqian Wang <br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Here is the bootargs and log:</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>U-Boot 2016.07-g0ce7ca2 (Jul 20 2017 - 00:45:25 -0700)<br>
<br>
TEGRA186<br>
Model: NVIDIA P2771-0000-500<br>
DRAM:&nbsp; 7.8 GiB<br>
MC:&nbsp;&nbsp; Tegra SD/MMC: 0, Tegra SD/MMC: 1<br>
In:&nbsp;&nbsp;&nbsp; serial<br>
Out:&nbsp;&nbsp; serial<br>
Err:&nbsp;&nbsp; serial<br>
Net:&nbsp;&nbsp; eth0: ethernet@2490000<br>
Hit any key to stop autoboot:&nbsp; 2 ^H^H^H 0<br>
Tegra186 (P2771-0000-500) # ext4load $dev $kernel_addr_r $kernel_path<br>
20418088 bytes read in 538 ms (36.2 MiB/s)<br>
Tegra186 (P2771-0000-500) # setenv kernel_size 0x$filesize<br>
Tegra186 (P2771-0000-500) # &lt;INTERRUPT&gt;<br>
Tegra186 (P2771-0000-500) # ext4load $dev $xen_addr_r $xen_path<br>
819536 bytes read in 100 ms (7.8 MiB/s)<br>
Tegra186 (P2771-0000-500) # ext4load $dev $dtb_addr_r $dtb_path<br>
267196 bytes read in 92 ms (2.8 MiB/s)<br>
Tegra186 (P2771-0000-500) # fdt addr $dtb_addr_r<br>
Tegra186 (P2771-0000-500) # fdt resize<br>
Tegra186 (P2771-0000-500) # fdt set /chosen xen,xen-bootargs \&quot;$xen_bo=
otargs\&quot;<br>
Tegra186 (P2771-0000-500) # fdt set /chosen xen,dom0-bootargs \&quot;$dom0_=
bootargs\&quot;<br>
Tegra186 (P2771-0000-500) # fdt set /chosen xen,dom0-bootargs \&quot;$dom0_=
bootargs\&quot;<br>
Tegra186 (P2771-0000-500) # fdt mknode /chosen modules<br>
Tegra186 (P2771-0000-500) # fdt set /chosen/modules '#address-cells' &lt;1&=
gt;<br>
Tegra186 (P2771-0000-500) # fdt set /chosen/modules '#size-cells' &lt;1&gt;=
<br>
Tegra186 (P2771-0000-500) # fdt mknode /chosen/modules module@0<br>
Tegra186 (P2771-0000-500) # fdt set /chosen/modules/module@0 compatible xen=
,linux-zimage xen,multiboot-module<br>
Tegra186 (P2771-0000-500) # fdt set /chosen/modules/module@0 reg &lt;$kerne=
l_addr_r $kernel_size&gt;<br>
Tegra186 (P2771-0000-500) # fdt print /chosen<br>
chosen {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xen,dom0-bootargs =3D &quot;vmal=
loc=3D256M console=3Dhvc0 psci=3Denable earlyprintk=3Dxen debug clk_ignore_=
unused root=3D/dev/mmcblk0p1 rootwait rw&quot;;<br>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xen,xen-bootargs =3D &quot;=
sync_console console=3Ddtuart dtuart=3D/serial@3100000 earlyprintk=3Dxen do=
m0_mem=3D800M&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modules {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #size-cells =3D &lt;0x00000001&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; #address-cells =3D &lt;0x00000001&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; module@0 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt=
;0x82000000 0x01378e28&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =
=3D &quot;xen,linux-zimage&quot;, &quot;xen,multiboot-module&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; };<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
};<br>
Tegra186 (P2771-0000-500) # booti $xen_addr_r - $dtb_addr_r<br>
Image lacks image_size field, assuming 16MiB<br>
</div>
<div>## Flattened Device Tree blob at 92000000<br>
&nbsp;&nbsp; Booting using the fdt blob at 0x92000000<br>
&nbsp;&nbsp; reserving fdt memory region: addr=3D80000000 size=3D10000<br>
&nbsp;&nbsp; reserving fdt memory region: addr=3D92000000 size=3D42000<br>
&nbsp;&nbsp; Using Device Tree in place at 0000000092000000, end 0000000092=
044fff<br>
<br>
Starting kernel ...<br>
<br>
- UART enabled -<br>
- CPU 00000100 booting -<br>
<div>- Current EL 00000008 -<br>
- Xen starting at EL2 -<br>
- Zero BSS -<br>
- Setting up control registers -<br>
- Turning on paging -<br>
- Ready -<br>
(XEN) Checking for initrd in /chosen<br>
(XEN) RAM: 0000000080000000 - 00000000efffffff<br>
(XEN) RAM: 00000000f0110000 - 0000000275f0ffff<br>
(XEN)<br>
<div>(XEN) MODULE[0]: 0000000092000000 - 0000000092042000 Device Tree<br>
(XEN) MODULE[1]: 0000000082000000 - 0000000083378e28 Kernel<br>
(XEN)&nbsp; RESVD[0]: 0000000080000000 - 0000000080010000<br>
(XEN)&nbsp; RESVD[1]: 0000000092000000 - 0000000092042000<br>
(XEN)<br>
(XEN) Command line: sync_console console=3Ddtuart dtuart=3D/serial@3100000 =
earlyprintk=3Dxen dom0_mem=3D800M<br>
(XEN) Placing Xen at 0x0000000275c00000-0x0000000275e00000<br>
(XEN) Update BOOTMOD_XEN from 0000000080000000-0000000080112d81 =3D&gt; 000=
0000275c00000-0000000275d12d81<br>
(XEN) Domain heap initialised<br>
(XEN) Booting using Device Tree<br>
<div>(XEN) Platform: Generic System<br>
(XEN) Looking for dtuart at &quot;/serial@3 Xen 4.9.0<br>
(XEN) Xen version 4.9.0 (root@) (gcc (Ubuntu/Linaro 5.3.1-14ubuntu2.1) 5.3.=
1 20160413) debug=3Dy&nbsp; Mon Dec 18 21:49:04 UTC 2017<br>
(XEN) Latest ChangeSet:<br>
(XEN) Console output is synchronous.<br>
(XEN) Processor: 411fd073: &quot;ARM Limited&quot;, variant: 0x1, part 0xd0=
7, rev 0x3<br>
(XEN) 64-bit Execution:<br>
(XEN)&nbsp;&nbsp; Processor Features: 0000000000002222 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Exception Levels: EL3:64&#43;32 EL2:64&#43;32=
 EL1:64&#43;32 EL0:64&#43;32<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Extensions: FloatingPoint AdvancedSIMD<br>
</div>
<div>(XEN)&nbsp;&nbsp; Debug Features: 0000000010305106 0000000000000000<br=
>
(XEN)&nbsp;&nbsp; Auxiliary Features: 0000000000000000 0000000000000000<br>
(XEN)&nbsp;&nbsp; Memory Model Features: 0000000000001124 0000000000000000<=
br>
(XEN)&nbsp;&nbsp; ISA Features:&nbsp; 0000000000011120 0000000000000000<br>
(XEN) 32-bit Execution:<br>
(XEN)&nbsp;&nbsp; Processor Features: 00000131:00011011<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Instruction Sets: AArch32 A32 Thumb Thumb-2 J=
azelle<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; Extensions: GenericTimer Security<br>
(XEN)&nbsp;&nbsp; Debug Features: 03010066<br>
(XEN)&nbsp;&nbsp; Auxiliary Features: 00000000<br>
</div>
<div>(XEN)&nbsp;&nbsp; Memory Model Features: 10201105 40000000 01260000 02=
102211<br>
(XEN)&nbsp; ISA Features: 02101110 13112111 21232042 01112131 00011142 0001=
1121<br>
(XEN) Using PSCI-1.0 for SMP bringup<br>
(XEN) SMP: Allowing 6 CPUs<br>
(XEN) Generic Timer IRQ: phys=3D46 hyp=3D42 virt=3D43 Freq: 31250 KHz<br>
(XEN) GICv2 initialization:<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gic_dist_addr=3D00000=
00003881000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gic_cpu_addr=3D000000=
0003882000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gic_hyp_addr=3D000000=
0003884000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gic_vcpu_addr=3D00000=
00003886000<br>
</div>
<div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gic_maintenance_=
irq=3D25<br>
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200043b).<br>
(XEN) Using scheduler: SMP Credit Scheduler (credit)<br>
(XEN) Allocated console ring of 64 KiB.<br>
(XEN) Bringing up CPU1<br>
- CPU 00000000 booting -<br>
- Current EL 00000008 -<br>
- Xen starting at EL2 -<br>
- Setting up control registers -<br>
- Turning on paging -<br>
</div>
<div>- Ready -<br>
(XEN) CPU 1 booted.<br>
(XEN) Bringing up CPU2<br>
- CPU 00000001 booting -<br>
- Current EL 00000008 -<br>
- Xen starting at EL2 -<br>
- Setting up control registers -<br>
- Turning on paging -<br>
- Ready -<br>
(XEN) CPU 2 booted.<br>
</div>
<div>(XEN) Bringing up CPU3<br>
- CPU 00000101 booting -<br>
- Current EL 00000008 -<br>
- Xen starting at EL2 -<br>
- Setting up control registers -<br>
- Turning on paging -<br>
- Ready -<br>
</div>
<div>(XEN) CPU 3 booted.<br>
(XEN) Bringing up CPU4<br>
- CPU 00000102 booting -<br>
- Current EL 00000008 -<br>
- Xen starting at EL2 -<br>
- Setting up control registers -<br>
- Turning on paging -<br>
- Ready -<br>
(XEN) CPU 4 booted.<br>
(XEN) Bringing up CPU5<br>
- CPU 00000103 booting -<br>
- Current EL 00000008 -<br>
- Xen starting at EL2 -<br>
</div>
<div>- Setting up control registers -<br>
- Turning on paging -<br>
- Ready -<br>
(XEN) CPU 5 booted.<br>
(XEN) Brought up 6 CPUs<br>
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID<br>
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558<br>
(XEN) smmu: /iommu@12000000: found 2 interrupts but expected at least 3<br>
(XEN) I/O virtualisation disabled<br>
(XEN) build-id: c1ab29064b82d810923afbe25e0061da738af14a<br>
</div>
<div>(XEN) alternatives: Patching with alt table 00000000400b4ca0 -&gt; 000=
00000400b5078<br>
(XEN) *** LOADING DOMAIN 0 ***<br>
(XEN) Loading kernel from boot module @ 0000000082000000<br>
(XEN) Allocating 1:1 mappings totalling 800MB for dom0:<br>
(XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)<br>
(XEN) BANK[1] 0x000000e0000000-0x000000f0000000 (256MB)<br>
(XEN) BANK[2] 0x000000f2000000-0x000000f4000000 (32MB)<br>
(XEN) Grant table range: 0x00000275c00000-0x00000275c62000<br>
(XEN) Loading zImage from 0000000082000000 to 00000000a0080000-00000000a13f=
8e28<br>
(XEN) Allocating PPI 16 for event channel interrupt<br>
</div>
<div>(XEN) Loading dom0 DTB to 0x00000000a8000000-0x00000000a803f510<br>
(XEN) Scrubbing Free RAM on 1 nodes using 6 CPUs<br>
(XEN) ...........done.<br>
(XEN) Initial low memory virq threshold set at 0x4000 pages.<br>
(XEN) Std. Loglevel: All<br>
(XEN) Guest Loglevel: All<br>
(XEN) ***************************************************<br>
(XEN) WARNING: CONSOLE OUTPUT IS SYNCHRONOUS<br>
(XEN) This option is intended to aid debugging of Xen by ensuring<br>
(XEN) that all output is synchronously delivered on the serial line.<br>
</div>
<div>(XEN) However it can introduce SIGNIFICANT latencies and affect<br>
(XEN) timekeeping. It is NOT recommended for production use!<br>
(XEN) ***************************************************<br>
(XEN) 3... 2... 1...<br>
(XEN) *** Serial input -&gt; DOM0 (type 'CTRL-a' three times to switch inpu=
t to Xen)<br>
(XEN) Freed 288kB init memory.<br>
</div>
<br>
</div>
<br>
</div>
<br>
</div>
<br>
</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_BLUPR0601MB1604582245D8B0216ED9EFE7C50C0BLUPR0601MB1604_--


--===============6644087991933899710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6644087991933899710==--
