From: "LOPEZ, FUENTES NACARINO Jairo Eduardo" <jairo@ruri.waseda.jp>
Subject: Re: RT Xen on ARM - R-Car series
Date: Thu, 31 Jan 2019 05:23:45 +0900
Message-ID: <CACrvCsaYBv2p2Fsu9+Y8Ewu=qrOY6erOdBBRo+JHvuzqA0f7Zg@mail.gmail.com>
References: <CACrvCsaeHuwzZzUQTzNYF7fqmgQWNJUVOQZv9D0MnYrXjqzZtQ@mail.gmail.com>
 <59df6425-f6de-fda1-a1a5-7d2774ff6796@gmail.com>
 <CACrvCsaO1ZNPWNJE9vdE7Th0uMt9BJnx32p2ozwuLvEg9Tpmmw@mail.gmail.com>
 <3aecad20-41f5-4249-46be-bfef80c88ea3@gmail.com>
 <623d0b16-8616-183c-d8d4-559ad81363ed@gmail.com>
 <CACrvCsZyZhrL0eoJ6=VTwfrRPKjqapGObqaixxmGMTXS+ua3aA@mail.gmail.com>
 <CACrvCsZH1-KCrPhfBYoji14KjXEk0hkdkRD4+1AKiXeJhTMNrA@mail.gmail.com>
 <CACrvCsZuh+tj2ejA2RYh78QnySw0fBBEXxWpam_TcFZAORSCXw@mail.gmail.com>
 <feb11726-086c-c6ad-9fca-30c7a22e4d9d@gmail.com>
 <CACrvCsZB-tps6=Vr=1Phf5oo5eUReabMLJzkbO3d2hmNLDOxww@mail.gmail.com>
 <7e217489-2c1a-c35f-d51f-0969654aa8cc@gmail.com>
 <CACrvCsaYJ-zGkZwfdV7BXDABW8u_EDQetU3pq+2otRGXWTXagw@mail.gmail.com>
 <4d078801-b804-06e7-ad5c-8032b1dbaa84@gmail.com>
 <CACrvCsYb0ANJASKYxeA0V2yg0aqKM0OaKCB=_i1zX9DPLwrNrQ@mail.gmail.com>
 <28e6dfab-6a3f-7bea-eca9-2d812903d9f7@gmail.com>
 <CACrvCsbhjtN6gr9-qqUZ2m1WYM3ZexDhngXM3G0rYcyp3BPJrw@mail.gmail.com>
 <d1cd35de-b278-aad8-49ec-8d77666cbdd5@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3742672672832956503=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d1cd35de-b278-aad8-49ec-8d77666cbdd5@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============3742672672832956503==
Content-Type: multipart/alternative; boundary="00000000000009ef100580aaf540"

--00000000000009ef100580aaf540
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrii,

2019=E5=B9=B41=E6=9C=8829=E6=97=A5(=E7=81=AB) 22:30 Andrii Anisov <andrii.a=
nisov@gmail.com>:

> Hello Jairo,
>
> On 29.01.19 17:30, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:
> > (XEN) Checking for initrd in /chosen
> > (XEN) RAM: 0000000048000000 - 000000007fffffff
> > (XEN) RAM: 0000000600000000 - 000000063fffffff
> > (XEN) RAM: 0000000600000000 - 000000063fffffff
> Duplication of RAM range `0000000600000000 - 000000063fffffff` gives me a=
n
> idea that you still did not merge memory nodes in your device tree.
>
> > (XEN) Xen call trace:
> > (XEN)    [<000000000028b310>]
> page_alloc.c#bootmem_region_add+0x188/0x198 (PC)
> And XEN can not handle that.
>
> --
> Sincerely,
> Andrii Anisov.
>

As you correctly pointed out, I was using an older version of a dtb file
which didn't have the memory modification.

I was able to check that the dtb file I was using was finally correct by
utilizing dtc on the compiled dtb.

dtc -I dtb -O dts -o test.dtb r8a7796-m3ulcb-xen-local.dtb

It seems that finally Xen was able to boot with the Dom0 Linux also
somewhat booting. At the end I get a p2m.c error repeatedly which loops the
machine. The complete output is below:

- UART enabled -
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000048000000 - 000000007fffffff
(XEN) RAM: 0000000600000000 - 000000063fffffff
(XEN)
(XEN) MODULE[0]: 0000000048000000 - 0000000048011000 Device Tree
(XEN) MODULE[1]: 000000007a000000 - 000000007c000000 Kernel
(XEN)  RESVD[0]: 0000000048000000 - 0000000048011000
(XEN)
(XEN)
(XEN) Command line: dom0_mem=3D752M console=3Ddtuart dtuart=3Dserial0
dom0_max_vcpus=3D4
(XEN) PFN compression on bits 19...20
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "serial0", options ""
 Xen 4.12.0-rc
(XEN) Xen version 4.12.0-rc (jelfn@waseda.jp) (aarch64-poky-linux-gcc (GCC)
7.3.0) debug=3Dy  Tue Jan 29 01:08:01 JST 2019
(XEN) Latest ChangeSet: Fri Jan 18 12:47:45 2019 +0000 git:1912f12-dirty
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
(XEN) Using SMC Calling Convention v1.1
(XEN) Using PSCI v1.0
(XEN) SMP: Allowing 6 CPUs
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 8333 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=3D00000000f1010000
(XEN)         gic_cpu_addr=3D00000000f1020000
(XEN)         gic_hyp_addr=3D00000000f1040000
(XEN)         gic_vcpu_addr=3D00000000f1060000
(XEN)         gic_maintenance_irq=3D25
(XEN) GICv2: Adjusting CPU interface base to 0xf102f000
(XEN) GICv2: 512 lines, 8 cpus, secure (IID 0200043b).
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Allocated console ring of 64 KiB.
(XEN) Bringing up CPU1
- CPU 00000001 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Adding cpu 1 to runqueue 0
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 00000100 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU2 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073),
(XEN) disable cpu (see big.LITTLE.txt under docs/).
(XEN) CPU2 never came online
(XEN) Failed to bring up CPU 2 (error -5)
(XEN) Bringing up CPU3
- CPU 00000101 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU3 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073),
(XEN) disable cpu (see big.LITTLE.txt under docs/).
(XEN) CPU3 never came online
(XEN) Failed to bring up CPU 3 (error -5)
(XEN) Bringing up CPU4
- CPU 00000102 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU4 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073),
(XEN) disable cpu (see big.LITTLE.txt under docs/).
(XEN) CPU4 never came online
(XEN) Failed to bring up CPU 4 (error -5)
(XEN) Bringing up CPU5
- CPU 00000103 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU5 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073),
(XEN) disable cpu (see big.LITTLE.txt under docs/).
(XEN) CPU5 never came online
(XEN) Failed to bring up CPU 5 (error -5)
(XEN) Brought up 2 CPUs
(XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID
(XEN) P2M: 4 levels with order-0 root, VTCR 0x80043594
(XEN) I/O virtualisation disabled
(XEN) build-id: 55fe145621420426dea5dd5aabe4a4e16006031d
(XEN) alternatives: Patching with alt table 00000000002abbb8 ->
00000000002ac1dc
(XEN) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
(XEN) CPU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading Domd0 kernel from boot module @ 000000007a000000
(XEN) Allocating 1:1 mappings totalling 752MB for dom0:
(XEN) BANK[0] 0x00000049000000-0x00000078000000 (752MB)
(XEN) Grant table range: 0x00000078080000-0x000000780c0000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 000000007a000000 to
0000000049080000-000000004b080000
(XEN) Loading dom0 DTB to 0x0000000051000000-0x000000005100fc9f
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 344kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER32
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER36
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER44
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER48
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER52
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER56
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER60
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
[    0.000000] Booting Linux on physical CPU 0x0

[    0.000000] Linux version 4.14.35-yocto-standard (oe-user@oe-host) (gcc
version 7.3.0 (GCC)) #2 SMP PREEMPT Mon Jan 21 23:44:14 JST 2019

[    0.000000] Boot CPU: AArch64 Processor [411fd073]

[    0.000000] Machine model: Renesas M3ULCB board based on r8a7796

[    0.000000] debug: ignoring loglevel setting.

[    0.000000] Xen 4.12 support found

[    0.000000] efi: Getting EFI parameters from FDT:

[    0.000000] efi: UEFI not found.

[    0.000000] Reserved memory: created CMA memory pool at
0x0000000057000000, size 400 MiB

[    0.000000] OF: reserved mem: initialized node linux,cma@57000000,
compatible id shared-dma-pool

[    0.000000] Reserved memory: created CMA memory pool at
0x0000000070000000, size 256 MiB

[    0.000000] OF: reserved mem: initialized node linux,multimedia@70000000=
,
compatible id shared-dma-pool

[    0.000000] NUMA: No NUMA configuration found

[    0.000000] NUMA: Faking a node at [mem
0x0000000000000000-0x0000000077ffffff]

[    0.000000] NUMA: NODE_DATA [mem 0x53f9a000-0x53f9baff]

[    0.000000] Zone ranges:

[    0.000000]   DMA      [mem 0x0000000049000000-0x0000000077ffffff]

[    0.000000]   Normal   empty

[    0.000000] Movable zone start for each node

[    0.000000] Early memory node ranges

[    0.000000]   node   0: [mem 0x0000000049000000-0x0000000053ffffff]

[    0.000000]   node   0: [mem 0x0000000057000000-0x0000000077ffffff]

[    0.000000] Initmem setup node 0 [mem
0x0000000049000000-0x0000000077ffffff]

[    0.000000] On node 0 totalpages: 180224

[    0.000000]   DMA zone: 2816 pages used for memmap

[    0.000000]   DMA zone: 0 pages reserved

[    0.000000]   DMA zone: 180224 pages, LIFO batch:31

[    0.000000] psci: probing for conduit method from DT.

[    0.000000] psci: PSCIv1.1 detected in firmware.

[    0.000000] psci: Using standard PSCI v0.2 function IDs

[    0.000000] psci: Trusted OS migration not required

[    0.000000] psci: SMC Calling Convention v1.1

[    0.000000] random: fast init done

[    0.000000] percpu: Embedded 23 pages/cpu @ffff800013f39000 s55448 r8192
d30568 u94208

[    0.000000] pcpu-alloc: s55448 r8192 d30568 u94208 alloc=3D23*4096

[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3

[    0.000000] Detected PIPT I-cache on CPU0

[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 17740=
8

[    0.000000] Policy zone: DMA

[    0.000000] Kernel command line: console=3Dhvc0 clk_ignore_unused
root=3D/dev/mmcblk1p2 rw rootwait ignore_loglevel cma=3D128M

[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)

[    0.000000] Memory: 144356K/720896K available (10748K kernel code, 1192K
rwdata, 5004K rodata, 1152K init, 412K bss, 18446744073709456412K reserved,
671744K cma-reserved)

[    0.000000] Virtual kernel memory layout:

[    0.000000]     modules : 0xffff000000000000 - 0xffff000008000000   (
128 MB)

[    0.000000]     vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000
(129022 GB)

[    0.000000]       .text : 0xffff000008080000 - 0xffff000008b00000   (
10752 KB)

[    0.000000]     .rodata : 0xffff000008b00000 - 0xffff000008ff0000   (
5056 KB)

[    0.000000]       .init : 0xffff000008ff0000 - 0xffff000009110000   (
1152 KB)

[    0.000000]       .data : 0xffff000009110000 - 0xffff00000923a200   (
1193 KB)

[    0.000000]        .bss : 0xffff00000923a200 - 0xffff0000092a14e0   (
413 KB)

[    0.000000]     fixed   : 0xffff7dfffe7f9000 - 0xffff7dfffec00000   (
4124 KB)

[    0.000000]     PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000   (
16 MB)

[    0.000000]     vmemmap : 0xffff7e0000000000 - 0xffff800000000000   (
2048 GB maximum)

[    0.000000]               0xffff7e0000240000 - 0xffff7e0000e00000   (
11 MB actual)

[    0.000000]     memory  : 0xffff800009000000 - 0xffff800038000000   (
752 MB)

[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1

[    0.000000] Preemptible hierarchical RCU implementation.

[    0.000000]     RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D4=
.

[    0.000000]     Tasks RCU enabled.

[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D4

[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0

[    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).

[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1ec02923e, max_idle_ns: 440795202125 ns

[    0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every
2199023255496ns

[    0.000393] Console: colour dummy device 80x25

[    0.401164] console [hvc0] enabled

[    0.404660] Calibrating delay loop (skipped), value calculated using
timer frequency.. 16.66 BogoMIPS (lpj=3D33333)

[    0.414905] pid_max: default: 32768 minimum: 301

[    0.419609] Security Framework initialized

[    0.424151] Dentry cache hash table entries: 131072 (order: 8, 1048576
bytes)

[    0.431419] Inode-cache hash table entries: 65536 (order: 7, 524288
bytes)

[    0.438218] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)

[    0.444945] Mountpoint-cache hash table entries: 2048 (order: 2, 16384
bytes)

[    0.468219] ASID allocator initialised with 32768 entries

[    0.474295] xen:grant_table: Grant tables using version 1 layout

[    0.480256] Grant table initialized

[    0.483760] xen:events: Using FIFO-based ABI

[    0.488113] Xen: initializing cpu0

[    0.496120] Hierarchical SRCU implementation.

[    0.508876] Detected Renesas R-Car Gen3 r8a7796 ES1.0

[    0.514874] EFI services will not be available.

[    0.527365] smp: Bringing up secondary CPUs ...

(XEN) d0v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v2: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v3: vGICD: unhandled word write 0xffffffff to ICACTIVER0
[    0.560023] Detected PIPT I-cache on CPU1

[    0.565657] Xen: initializing cpu1

[    0.565681] CPU1: Booted secondary processor [411fd073]

[    0.592149] Detected PIPT I-cache on CPU2

[    0.597770] Xen: initializing cpu2

[    0.597789] CPU2: Booted secondary processor [411fd073]

[    0.624278] Detected PIPT I-cache on CPU3

[    0.629891] Xen: initializing cpu3

[    0.629909] CPU3: Booted secondary processor [411fd073]

[    0.629998] smp: Brought up 1 node, 4 CPUs

[    0.672375] SMP: Total of 4 processors activated.

[    0.677122] CPU features: detected feature: 32-bit EL0 Support

[    0.682996] CPU features: detected feature: Kernel page table isolation
(KPTI)

(XEN) p2m.c:1844: d0v1: Failed to walk page-table va 0xffff800013f59c57
(XEN) p2m.c:1844: d0v2: Failed to walk page-table va 0xffff800013f70c57
(XEN) p2m.c:1844: d0v1: Failed to walk page-table va 0xffff800013f59c48
(XEN) p2m.c:1844: d0v2: Failed to walk page-table va 0xffff800013f70c48

</ this continues infinitely>

Is this normal. Could the error have anything to do with me using the
dom0_max_vpcus=3D4 bootarg for Xen?

Thank you for all the help.

Best regards,

Jairo

--00000000000009ef100580aaf540
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>He=
llo Andrii,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">2019=E5=B9=B41=E6=9C=8829=E6=97=A5(=E7=81=AB) 22:30 Andrii Aniso=
v &lt;<a href=3D"mailto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Jai=
ro,<br>
<br>
On 29.01.19 17:30, LOPEZ, FUENTES NACARINO Jairo Eduardo wrote:<br>
&gt; (XEN) Checking for initrd in /chosen<br>
&gt; (XEN) RAM: 0000000048000000 - 000000007fffffff<br>
&gt; (XEN) RAM: 0000000600000000 - 000000063fffffff<br>
&gt; (XEN) RAM: 0000000600000000 - 000000063fffffff<br>
Duplication of RAM range `0000000600000000 - 000000063fffffff` gives me an =
idea that you still did not merge memory nodes in your device tree.<br>
<br>
&gt; (XEN) Xen call trace:<br>
&gt; (XEN)=C2=A0=C2=A0=C2=A0 [&lt;000000000028b310&gt;] page_alloc.c#bootme=
m_region_add+0x188/0x198 (PC)<br>
And XEN can not handle that.<br>
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br></blockquote><div><br></div><div>As you correctly pointed=
 out, I was using an older version of a dtb file which didn&#39;t have the =
memory modification.<br></div><div><br></div><div>I was able to check that =
the dtb file I was using was finally correct by utilizing dtc on the compil=
ed dtb.<br></div><div><br></div><div>dtc -I dtb -O dts -o test.dtb r8a7796-=
m3ulcb-xen-local.dtb</div><div><br></div><div>It seems that finally Xen was=
 able to boot with the Dom0 Linux also somewhat booting. At the end I get a=
 p2m.c error repeatedly which loops the machine. The complete output is bel=
ow:</div><div><br></div><div>- UART enabled -<br>- CPU 00000000 booting -<b=
r>- Current EL 00000008 -<br>- Xen starting at EL2 -<br>- Zero BSS -<br>- S=
etting up control registers -<br>- Turning on paging -<br>- Ready -<br>(XEN=
) Checking for initrd in /chosen<br>(XEN) RAM: 0000000048000000 - 000000007=
fffffff<br>(XEN) RAM: 0000000600000000 - 000000063fffffff<br>(XEN) <br>(XEN=
) MODULE[0]: 0000000048000000 - 0000000048011000 Device Tree <br>(XEN) MODU=
LE[1]: 000000007a000000 - 000000007c000000 Kernel=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <br>(XEN)=C2=A0 RESVD[0]: 0000000048000000 - 0000000048011000<br>(XE=
N) <br>(XEN) <br>(XEN) Command line: dom0_mem=3D752M console=3Ddtuart dtuar=
t=3Dserial0 dom0_max_vcpus=3D4<br>(XEN) PFN compression on bits 19...20<br>=
(XEN) Domain heap initialised<br>(XEN) Booting using Device Tree<br>(XEN) P=
latform: Generic System<br>(XEN) Looking for dtuart at &quot;serial0&quot;,=
 options &quot;&quot;<br>=C2=A0Xen 4.12.0-rc<br>(XEN) Xen version 4.12.0-rc=
 (<a href=3D"mailto:jelfn@waseda.jp">jelfn@waseda.jp</a>) (aarch64-poky-lin=
ux-gcc (GCC) 7.3.0) debug=3Dy=C2=A0 Tue Jan 29 01:08:01 JST 2019<br>(XEN) L=
atest ChangeSet: Fri Jan 18 12:47:45 2019 +0000 git:1912f12-dirty<br>(XEN) =
Processor: 411fd073: &quot;ARM Limited&quot;, variant: 0x1, part 0xd07, rev=
 0x3<br>(XEN) 64-bit Execution:<br>(XEN)=C2=A0=C2=A0 Processor Features: 00=
00000000002222 0000000000000000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Exception =
Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32<br>(XEN)=C2=A0=C2=A0=C2=A0=
=C2=A0 Extensions: FloatingPoint AdvancedSIMD<br>(XEN)=C2=A0=C2=A0 Debug Fe=
atures: 0000000010305106 0000000000000000<br>(XEN)=C2=A0=C2=A0 Auxiliary Fe=
atures: 0000000000000000 0000000000000000<br>(XEN)=C2=A0=C2=A0 Memory Model=
 Features: 0000000000001124 0000000000000000<br>(XEN)=C2=A0=C2=A0 ISA Featu=
res:=C2=A0 0000000000011120 0000000000000000<br>(XEN) 32-bit Execution:<br>=
(XEN)=C2=A0=C2=A0 Processor Features: 00000131:00011011<br>(XEN)=C2=A0=C2=
=A0=C2=A0=C2=A0 Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle<br>(XEN=
)=C2=A0=C2=A0=C2=A0=C2=A0 Extensions: GenericTimer Security<br>(XEN)=C2=A0=
=C2=A0 Debug Features: 03010066<br>(XEN)=C2=A0=C2=A0 Auxiliary Features: 00=
000000<br>(XEN)=C2=A0=C2=A0 Memory Model Features: 10201105 40000000 012600=
00 02102211<br>(XEN)=C2=A0 ISA Features: 02101110 13112111 21232042 0111213=
1 00011142 00011121<br>(XEN) Using SMC Calling Convention v1.1<br>(XEN) Usi=
ng PSCI v1.0<br>(XEN) SMP: Allowing 6 CPUs<br>(XEN) Generic Timer IRQ: phys=
=3D30 hyp=3D26 virt=3D27 Freq: 8333 KHz<br>(XEN) GICv2 initialization:<br>(=
XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_dist_addr=3D000000=
00f1010000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_cpu=
_addr=3D00000000f1020000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 gic_hyp_addr=3D00000000f1040000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 gic_vcpu_addr=3D00000000f1060000<br>(XEN)=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_maintenance_irq=3D25<br>(XEN) GICv=
2: Adjusting CPU interface base to 0xf102f000<br>(XEN) GICv2: 512 lines, 8 =
cpus, secure (IID 0200043b).<br>(XEN) Using scheduler: SMP Credit Scheduler=
 rev2 (credit2)<br>(XEN) Initializing Credit2 scheduler<br>(XEN)=C2=A0 load=
_precision_shift: 18<br>(XEN)=C2=A0 load_window_shift: 30<br>(XEN)=C2=A0 un=
derload_balance_tolerance: 0<br>(XEN)=C2=A0 overload_balance_tolerance: -3<=
br>(XEN)=C2=A0 runqueues arrangement: socket<br>(XEN)=C2=A0 cap enforcement=
 granularity: 10ms<br>(XEN) load tracking window length 1073741824 ns<br>(X=
EN) Adding cpu 0 to runqueue 0<br>(XEN)=C2=A0 First cpu on runqueue, activa=
ting<br>(XEN) Allocated console ring of 64 KiB.<br>(XEN) Bringing up CPU1<b=
r>- CPU 00000001 booting -<br>- Current EL 00000008 -<br>- Xen starting at =
EL2 -<br>- Setting up control registers -<br>- Turning on paging -<br>- Rea=
dy -<br>(XEN) Adding cpu 1 to runqueue 0<br>(XEN) CPU 1 booted.<br>(XEN) Br=
inging up CPU2<br>- CPU 00000100 booting -<br>- Current EL 00000008 -<br>- =
Xen starting at EL2 -<br>- Setting up control registers -<br>- Turning on p=
aging -<br>- Ready -<br>(XEN) CPU2 MIDR (0x410fd034) does not match boot CP=
U MIDR (0x411fd073),<br>(XEN) disable cpu (see big.LITTLE.txt under docs/).=
<br>(XEN) CPU2 never came online<br>(XEN) Failed to bring up CPU 2 (error -=
5)<br>(XEN) Bringing up CPU3<br>- CPU 00000101 booting -<br>- Current EL 00=
000008 -<br>- Xen starting at EL2 -<br>- Setting up control registers -<br>=
- Turning on paging -<br>- Ready -<br>(XEN) CPU3 MIDR (0x410fd034) does not=
 match boot CPU MIDR (0x411fd073),<br>(XEN) disable cpu (see big.LITTLE.txt=
 under docs/).<br>(XEN) CPU3 never came online<br>(XEN) Failed to bring up =
CPU 3 (error -5)<br>(XEN) Bringing up CPU4<br>- CPU 00000102 booting -<br>-=
 Current EL 00000008 -<br>- Xen starting at EL2 -<br>- Setting up control r=
egisters -<br>- Turning on paging -<br>- Ready -<br>(XEN) CPU4 MIDR (0x410f=
d034) does not match boot CPU MIDR (0x411fd073),<br>(XEN) disable cpu (see =
big.LITTLE.txt under docs/).<br>(XEN) CPU4 never came online<br>(XEN) Faile=
d to bring up CPU 4 (error -5)<br>(XEN) Bringing up CPU5<br>- CPU 00000103 =
booting -<br>- Current EL 00000008 -<br>- Xen starting at EL2 -<br>- Settin=
g up control registers -<br>- Turning on paging -<br>- Ready -<br>(XEN) CPU=
5 MIDR (0x410fd034) does not match boot CPU MIDR (0x411fd073),<br>(XEN) dis=
able cpu (see big.LITTLE.txt under docs/).<br>(XEN) CPU5 never came online<=
br>(XEN) Failed to bring up CPU 5 (error -5)<br>(XEN) Brought up 2 CPUs<br>=
(XEN) P2M: 44-bit IPA with 44-bit PA and 8-bit VMID<br>(XEN) P2M: 4 levels =
with order-0 root, VTCR 0x80043594<br>(XEN) I/O virtualisation disabled<br>=
(XEN) build-id: 55fe145621420426dea5dd5aabe4a4e16006031d<br>(XEN) alternati=
ves: Patching with alt table 00000000002abbb8 -&gt; 00000000002ac1dc<br>(XE=
N) CPU0 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry<br>(XEN) C=
PU1 will call ARM_SMCCC_ARCH_WORKAROUND_1 on exception entry<br>(XEN) *** L=
OADING DOMAIN 0 ***<br>(XEN) Loading Domd0 kernel from boot module @ 000000=
007a000000<br>(XEN) Allocating 1:1 mappings totalling 752MB for dom0:<br>(X=
EN) BANK[0] 0x00000049000000-0x00000078000000 (752MB)<br>(XEN) Grant table =
range: 0x00000078080000-0x000000780c0000<br>(XEN) Allocating PPI 16 for eve=
nt channel interrupt<br>(XEN) Loading zImage from 000000007a000000 to 00000=
00049080000-000000004b080000<br>(XEN) Loading dom0 DTB to 0x000000005100000=
0-0x000000005100fc9f<br>(XEN) Initial low memory virq threshold set at 0x40=
00 pages.<br>(XEN) Scrubbing Free RAM in background<br>(XEN) Std. Loglevel:=
 All<br>(XEN) Guest Loglevel: All<br>(XEN) *** Serial input to DOM0 (type &=
#39;CTRL-a&#39; three times to switch input)<br>(XEN) Freed 344kB init memo=
ry.<br>(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4<br>=
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8<br>(XEN) d=
0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12<br>(XEN) d0v0: v=
GICD: unhandled word write 0xffffffff to ICACTIVER16<br>(XEN) d0v0: vGICD: =
unhandled word write 0xffffffff to ICACTIVER20<br>(XEN) d0v0: vGICD: unhand=
led word write 0xffffffff to ICACTIVER24<br>(XEN) d0v0: vGICD: unhandled wo=
rd write 0xffffffff to ICACTIVER28<br>(XEN) d0v0: vGICD: unhandled word wri=
te 0xffffffff to ICACTIVER32<br>(XEN) d0v0: vGICD: unhandled word write 0xf=
fffffff to ICACTIVER36<br>(XEN) d0v0: vGICD: unhandled word write 0xfffffff=
f to ICACTIVER40<br>(XEN) d0v0: vGICD: unhandled word write 0xffffffff to I=
CACTIVER44<br>(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIV=
ER48<br>(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER52<b=
r>(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER56<br>(XEN=
) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER60<br>(XEN) d0v0=
: vGICD: unhandled word write 0xffffffff to ICACTIVER0<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Booting Linux on physical CPU 0x0<br><br>[=C2=A0=C2=A0=C2=A0 =
0.000000] Linux version 4.14.35-yocto-standard (oe-user@oe-host) (gcc versi=
on 7.3.0 (GCC)) #2 SMP PREEMPT Mon Jan 21 23:44:14 JST 2019<br><br>[=C2=A0=
=C2=A0=C2=A0 0.000000] Boot CPU: AArch64 Processor [411fd073]<br><br>[=C2=
=A0=C2=A0=C2=A0 0.000000] Machine model: Renesas M3ULCB board based on r8a7=
796<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] debug: ignoring loglevel setting.<=
br><br>[=C2=A0=C2=A0=C2=A0 0.000000] Xen 4.12 support found<br><br>[=C2=A0=
=C2=A0=C2=A0 0.000000] efi: Getting EFI parameters from FDT:<br><br>[=C2=A0=
=C2=A0=C2=A0 0.000000] efi: UEFI not found.<br><br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] Reserved memory: created CMA memory pool at 0x0000000057000000, size =
400 MiB<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: initialized =
node linux,cma@57000000, compatible id shared-dma-pool<br><br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Reserved memory: created CMA memory pool at 0x000000007000=
0000, size 256 MiB<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] OF: reserved mem: i=
nitialized node linux,multimedia@70000000, compatible id shared-dma-pool<br=
><br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: No NUMA configuration found<br><br=
>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: Faking a node at [mem 0x00000000000000=
00-0x0000000077ffffff]<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] NUMA: NODE_DATA=
 [mem 0x53f9a000-0x53f9baff]<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] Zone rang=
es:<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [mem 0x0000000049000000-0x0000000077ffffff]<br><br>[=C2=A0=C2=
=A0=C2=A0 0.000000]=C2=A0=C2=A0 Normal=C2=A0=C2=A0 empty<br><br>[=C2=A0=C2=
=A0=C2=A0 0.000000] Movable zone start for each node<br><br>[=C2=A0=C2=A0=
=C2=A0 0.000000] Early memory node ranges<br><br>[=C2=A0=C2=A0=C2=A0 0.0000=
00]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [mem 0x0000000049000000-0x0000000053fff=
fff]<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 node=C2=A0=C2=A0 0: [=
mem 0x0000000057000000-0x0000000077ffffff]<br><br>[=C2=A0=C2=A0=C2=A0 0.000=
000] Initmem setup node 0 [mem 0x0000000049000000-0x0000000077ffffff]<br><b=
r>[=C2=A0=C2=A0=C2=A0 0.000000] On node 0 totalpages: 180224<br><br>[=C2=A0=
=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA zone: 2816 pages used for memmap<br>=
<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA zone: 0 pages reserved<br=
><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0 DMA zone: 180224 pages, LIFO=
 batch:31<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit me=
thod from DT.<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 detected =
in firmware.<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: Using standard PSCI=
 v0.2 function IDs<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: Trusted OS mi=
gration not required<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling=
 Convention v1.1<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] random: fast init don=
e<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedded 23 pages/cpu @ffff8=
00013f39000 s55448 r8192 d30568 u94208<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 pcpu-alloc: s55448 r8192 d30568 u94208 alloc=3D23*4096<br><br>[=C2=A0=C2=
=A0=C2=A0 0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 <br><br>[=C2=A0=C2=
=A0=C2=A0 0.000000] Detected PIPT I-cache on CPU0<br><br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 1=
77408<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] Policy zone: DMA<br><br>[=C2=A0=
=C2=A0=C2=A0 0.000000] Kernel command line: console=3Dhvc0 clk_ignore_unuse=
d root=3D/dev/mmcblk1p2 rw rootwait ignore_loglevel cma=3D128M<br><br>[=C2=
=A0=C2=A0=C2=A0 0.000000] PID hash table entries: 4096 (order: 3, 32768 byt=
es)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 144356K/720896K available =
(10748K kernel code, 1192K rwdata, 5004K rodata, 1152K init, 412K bss, 1844=
6744073709456412K reserved, 671744K cma-reserved)<br><br>[=C2=A0=C2=A0=C2=
=A0 0.000000] Virtual kernel memory layout:<br><br>[=C2=A0=C2=A0=C2=A0 0.00=
0000]=C2=A0=C2=A0=C2=A0=C2=A0 modules : 0xffff000000000000 - 0xffff00000800=
0000=C2=A0=C2=A0 (=C2=A0=C2=A0 128 MB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=
=C2=A0=C2=A0=C2=A0=C2=A0 vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000=
=C2=A0=C2=A0 (129022 GB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .text : 0xffff000008080000 - 0xffff000008b00000=C2=
=A0=C2=A0 ( 10752 KB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=
=A0=C2=A0 .rodata : 0xffff000008b00000 - 0xffff000008ff0000=C2=A0=C2=A0 (=
=C2=A0 5056 KB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .init : 0xffff000008ff0000 - 0xffff000009110000=C2=A0=C2=A0=
 (=C2=A0 1152 KB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .data : 0xffff000009110000 - 0xffff00000923a200=C2=A0=C2=A0=
 (=C2=A0 1193 KB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .bss : 0xffff00000923a200 - 0xffff0000092a14e0=C2=A0=
=C2=A0 (=C2=A0=C2=A0 413 KB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=
=A0=C2=A0=C2=A0 fixed=C2=A0=C2=A0 : 0xffff7dfffe7f9000 - 0xffff7dfffec00000=
=C2=A0=C2=A0 (=C2=A0 4124 KB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=
=A0=C2=A0=C2=A0 PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000=C2=A0=C2=
=A0 (=C2=A0=C2=A0=C2=A0 16 MB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=
=C2=A0=C2=A0=C2=A0 vmemmap : 0xffff7e0000000000 - 0xffff800000000000=C2=A0=
=C2=A0 (=C2=A0 2048 GB maximum)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0xffff7e0000240000 - 0xffff7e0000e00000=C2=A0=C2=A0 (=C2=A0=C2=A0=C2=A0=
 11 MB actual)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=
 memory=C2=A0 : 0xffff800009000000 - 0xffff800038000000=C2=A0=C2=A0 (=C2=A0=
=C2=A0 752 MB)<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] SLUB: HWalign=3D64, Ord=
er=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1<br><br>[=C2=A0=C2=A0=C2=A0 0.=
000000] Preemptible hierarchical RCU implementation.<br><br>[=C2=A0=C2=A0=
=C2=A0 0.000000] =C2=A0=C2=A0=C2=A0 RCU restricting CPUs from NR_CPUS=3D64 =
to nr_cpu_ids=3D4.<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] =C2=A0=C2=A0=C2=A0 =
Tasks RCU enabled.<br><br>[=C2=A0=C2=A0=C2=A0 0.000000] RCU: Adjusting geom=
etry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D4<br><br>[=C2=A0=C2=A0=C2=A0 0.=
000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0<br><br>[=C2=A0=C2=A0=
=C2=A0 0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).<br><b=
r>[=C2=A0=C2=A0=C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xffff=
ffffffffff max_cycles: 0x1ec02923e, max_idle_ns: 440795202125 ns<br><br>[=
=C2=A0=C2=A0=C2=A0 0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns=
, wraps every 2199023255496ns<br><br>[=C2=A0=C2=A0=C2=A0 0.000393] Console:=
 colour dummy device 80x25<br><br>[=C2=A0=C2=A0=C2=A0 0.401164] console [hv=
c0] enabled<br><br>[=C2=A0=C2=A0=C2=A0 0.404660] Calibrating delay loop (sk=
ipped), value calculated using timer frequency.. 16.66 BogoMIPS (lpj=3D3333=
3)<br><br>[=C2=A0=C2=A0=C2=A0 0.414905] pid_max: default: 32768 minimum: 30=
1<br><br>[=C2=A0=C2=A0=C2=A0 0.419609] Security Framework initialized<br><b=
r>[=C2=A0=C2=A0=C2=A0 0.424151] Dentry cache hash table entries: 131072 (or=
der: 8, 1048576 bytes)<br><br>[=C2=A0=C2=A0=C2=A0 0.431419] Inode-cache has=
h table entries: 65536 (order: 7, 524288 bytes)<br><br>[=C2=A0=C2=A0=C2=A0 =
0.438218] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)<br><=
br>[=C2=A0=C2=A0=C2=A0 0.444945] Mountpoint-cache hash table entries: 2048 =
(order: 2, 16384 bytes)<br><br>[=C2=A0=C2=A0=C2=A0 0.468219] ASID allocator=
 initialised with 32768 entries<br><br>[=C2=A0=C2=A0=C2=A0 0.474295] xen:gr=
ant_table: Grant tables using version 1 layout<br><br>[=C2=A0=C2=A0=C2=A0 0=
.480256] Grant table initialized<br><br>[=C2=A0=C2=A0=C2=A0 0.483760] xen:e=
vents: Using FIFO-based ABI<br><br>[=C2=A0=C2=A0=C2=A0 0.488113] Xen: initi=
alizing cpu0<br><br>[=C2=A0=C2=A0=C2=A0 0.496120] Hierarchical SRCU impleme=
ntation.<br><br>[=C2=A0=C2=A0=C2=A0 0.508876] Detected Renesas R-Car Gen3 r=
8a7796 ES1.0<br><br>[=C2=A0=C2=A0=C2=A0 0.514874] EFI services will not be =
available.<br><br>[=C2=A0=C2=A0=C2=A0 0.527365] smp: Bringing up secondary =
CPUs ...<br><br>(XEN) d0v1: vGICD: unhandled word write 0xffffffff to ICACT=
IVER0<br>(XEN) d0v2: vGICD: unhandled word write 0xffffffff to ICACTIVER0<b=
r>(XEN) d0v3: vGICD: unhandled word write 0xffffffff to ICACTIVER0<br>[=C2=
=A0=C2=A0=C2=A0 0.560023] Detected PIPT I-cache on CPU1<br><br>[=C2=A0=C2=
=A0=C2=A0 0.565657] Xen: initializing cpu1<br><br>[=C2=A0=C2=A0=C2=A0 0.565=
681] CPU1: Booted secondary processor [411fd073]<br><br>[=C2=A0=C2=A0=C2=A0=
 0.592149] Detected PIPT I-cache on CPU2<br><br>[=C2=A0=C2=A0=C2=A0 0.59777=
0] Xen: initializing cpu2<br><br>[=C2=A0=C2=A0=C2=A0 0.597789] CPU2: Booted=
 secondary processor [411fd073]<br><br>[=C2=A0=C2=A0=C2=A0 0.624278] Detect=
ed PIPT I-cache on CPU3<br><br>[=C2=A0=C2=A0=C2=A0 0.629891] Xen: initializ=
ing cpu3<br><br>[=C2=A0=C2=A0=C2=A0 0.629909] CPU3: Booted secondary proces=
sor [411fd073]<br><br>[=C2=A0=C2=A0=C2=A0 0.629998] smp: Brought up 1 node,=
 4 CPUs<br><br>[=C2=A0=C2=A0=C2=A0 0.672375] SMP: Total of 4 processors act=
ivated.<br><br>[=C2=A0=C2=A0=C2=A0 0.677122] CPU features: detected feature=
: 32-bit EL0 Support<br><br>[=C2=A0=C2=A0=C2=A0 0.682996] CPU features: det=
ected feature: Kernel page table isolation (KPTI)<br><br>(XEN) p2m.c:1844: =
d0v1: Failed to walk page-table va 0xffff800013f59c57<br>(XEN) p2m.c:1844: =
d0v2: Failed to walk page-table va 0xffff800013f70c57</div><div>(XEN) p2m.c=
:1844: d0v1: Failed to walk page-table va 0xffff800013f59c48<br>(XEN) p2m.c=
:1844: d0v2: Failed to walk page-table va 0xffff800013f70c48</div><div><br>=
</div><div>&lt;/ this continues infinitely&gt;<br></div><div><br></div><div=
>Is this normal. Could the error have anything to do with me using the dom0=
_max_vpcus=3D4 bootarg for Xen?</div><div><br></div><div>Thank you for all =
the help.</div><div><br></div><div>Best regards,</div><div><br></div><div>J=
airo<br></div></div></div></div></div></div>

--00000000000009ef100580aaf540--


--===============3742672672832956503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3742672672832956503==--
