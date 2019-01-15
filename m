From: Leo Yan <leo.yan@linaro.org>
Subject: Hikey: Enable Xen + Mainline Linux Kernel
Date: Tue, 15 Jan 2019 10:49:58 +0800
Message-ID: <20190115024958.GC3971@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iy6k=PX=linaro.org=leo.yan@srs-us1.protection.inumbo.net>)
 id 1gjEno-0005hn-1A
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 02:50:08 +0000
Received: by mail-pf1-x442.google.com with SMTP id b7so567166pfi.8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jan 2019 18:50:04 -0800 (PST)
Received: from leoy-ThinkPad-X240s (li421-24.members.linode.com. [50.116.3.24])
 by smtp.gmail.com with ESMTPSA id z13sm2198940pgf.84.2019.01.14.18.50.01
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Jan 2019 18:50:02 -0800 (PST)
Content-Disposition: inline
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


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Sorry I bring up this question at here if it's duplicate due I googled
and found on the mailing list there have several related discussion for
enabling Xen on Hikey (I use Hikey but not Hikey960); but what I saw it
seems a new issue.

Below is the configuration at my side:

- Linux kernel: mainline kernel with 5.0-rc2;

  make defconfig
  make -j16 Image dtbs

- Xen: latest code base

  git clone git://xenbits.xen.org/xen.git
  cd xen
  make dist-xen XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

- Prepare my boot image:

  $ mount -o loop,rw,sync boot-linux.uefi.img boot-fat
  $ cp Image hi6220-hikey.dtb boot-fat/

  # prepare xen.cfg and startup.nsh

  For xen.cfg, it have below content:
  options=dom0_mem=512M dom0_max_vcpus=8 conswitch=x console=dtuart
  dtuart=/smb/uart@f7113000
  kernel=Image console=hvc root=/dev/mmcblk0p9 rootwait rw 3 mem=256M
  dtb=hi6220-hikey.dtb

  For startup.nsh, it have below content:
  FS0:
  Image console=ttyAMA3,115200 root=/dev/mmcblk0p9 rootwait rw efi=noruntime earlycon=pl011,0xf7113000

  $ umount boot-fat

- Flash the boot image into 'boot' partition and UEFI will find it by
  default:

  $ fastboot flash boot boot-linux.uefi.img

- After run into UEFI shell, after execute 'xen' command I can see
  below kernel panic; it's related with mmc driver initialization and
  it tries to use xen_swiotlb_alloc_coherent() for DMA memory
  allocation but failed.

  I tried to reduce the memory size in xen.cfg (options=dom0_mem=512M)
  for Xen and Linux kernel (mem=256M) but it doesn't work.

  Also enclosed the complete booting log.

  Very appreciate if you could give some suggestions for this.

Thanks,
Leo Yan

[    1.807591] Modules linked in:
[    1.810717] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc2-00001-g5b47dea3757c #3
[    1.818691] Hardware name: HiKey Development Board (DT)
[    1.823983] pstate: 40000005 (nZcv daif -PAN -UAO)
[    1.828848] pc : xen_swiotlb_alloc_coherent+0x64/0x1e8
[    1.834044] lr : dma_alloc_attrs+0xf4/0x110
[    1.838289] sp : ffff000010073a50
[    1.841671] x29: ffff000010073a50 x28: 0000000000000007 
[    1.847047] x27: ffff000011150068 x26: ffff80001b6ddd60 
[    1.852429] x25: ffff000010caaa70 x24: 0000000000000000 
[    1.857800] x23: 0000000000001000 x22: 0000000000001000 
[    1.863177] x21: 0000000000000000 x20: ffff80001c2edc10 
[    1.868553] x19: ffff0000111fd000 x18: ffffffffffffffff 
[    1.873930] x17: 0000000000000000 x16: 0000000000000000 
[    1.879306] x15: ffff0000111fd6c8 x14: ffff0000900737b7 
[    1.884683] x13: ffff0000100737c5 x12: ffff000011215000 
[    1.890060] x11: 0000000005f5e0ff x10: ffff0000111fd940 
[    1.895436] x9 : 0000000000000000 x8 : ffff80001bb0e700 
[    1.900813] x7 : 0000000000000000 x6 : 0000000000000000 
[    1.906189] x5 : ffff0000105bdbb8 x4 : 0000000000000000 
[    1.911566] x3 : 00000000006000c0 x2 : ffff80001b6ddd60 
[    1.916943] x1 : 0000000000001000 x0 : 0000000000000000 
[    1.922326] Process swapper/0 (pid: 1, stack limit = 0x(____ptrval____))
[    1.929084] Call trace:
[    1.931602]  xen_swiotlb_alloc_coherent+0x64/0x1e8
[    1.936456]  dma_alloc_attrs+0xf4/0x110
[    1.940359]  dmam_alloc_attrs+0x64/0xb8
[    1.944264]  dw_mci_probe+0x5f8/0xb00
[    1.947990]  dw_mci_pltfm_register+0xa0/0xd0
[    1.952327]  dw_mci_k3_probe+0x2c/0x38
[    1.956145]  platform_drv_probe+0x50/0xa0
[    1.960218]  really_probe+0x1f0/0x298
[    1.963947]  driver_probe_device+0x58/0x100
[    1.968196]  __driver_attach+0xd4/0xd8
[    1.972017]  bus_for_each_dev+0x74/0xc8
[    1.975914]  driver_attach+0x20/0x28
[    1.979556]  bus_add_driver+0x1ac/0x218
[    1.983458]  driver_register+0x60/0x110
[    1.987361]  __platform_driver_register+0x40/0x48
[    1.992138]  dw_mci_k3_pltfm_driver_init+0x18/0x20
[    1.996988]  do_one_initcall+0x5c/0x178
[    2.000891]  kernel_init_freeable+0x198/0x240
[    2.005314]  kernel_init+0x10/0x108
[    2.008867]  ret_from_fork+0x10/0x18
[    2.012516] Code: f9414280 aa1503e4 aa1a03e2 aa1703e1 (f9400005) 
[    2.018680] ---[ end trace baf3ac16eabafa1f ]---
[    2.023394] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    2.031068] SMP: stopping secondary CPUs
[    2.035101] Kernel Offset: disabled
[    2.038611] CPU features: 0x002,24002004
[    2.042604] Memory Limit: 256 MB
[    2.045898] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="hikey_xen.log"

xen
Loading driver at 0x0003783D000 EntryPoint=0x000378E1398
Loading driver at 0x0003783D000 EntryPoint=0x000378E1398 
3hXen 4.12-unstable (c/s Mon Dec 17 09:22:59 2018 +0000 git:a5b0eb3636) EFI loader

Using configuration file 'xen.cfg'
hi6220-hikey.dtb: 0x0000000037b10000-0x0000000037b195c5
Image: 0x000000003653b000-0x000000003783ca00
 Xen 4.12-unstable
(XEN) Xen version 4.12-unstable (leoy@) (aarch64-linux-gnu-gcc (Linaro GCC 6.2-2016.11) 6.2.1 20161016) debug=y  Mon Jan 14 11:16:40 CST 2019
(XEN) Latest ChangeSet: Mon Dec 17 09:22:59 2018 +0000 git:a5b0eb3636
(XEN) Processor: 410fd033: "ARM Limited", variant: 0x0, part 0xd03, rev 0x3
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10101105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.1
(XEN) Using PSCI v1.1
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 1200 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000f6801000
(XEN)         gic_cpu_addr=00000000f6802000
(XEN)         gic_hyp_addr=00000000f6804000
(XEN)         gic_vcpu_addr=00000000f6806000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: 160 lines, 8 cpus, secure (IID 0200143b).
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
(XEN) Adding cpu 1 to runqueue 0
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
(XEN) Adding cpu 2 to runqueue 0
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
(XEN) Adding cpu 3 to runqueue 0
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
(XEN) Adding cpu 4 to runqueue 0
(XEN) CPU 4 booted.
(XEN) Bringing up CPU5
(XEN) Adding cpu 5 to runqueue 0
(XEN) CPU 5 booted.
(XEN) Bringing up CPU6
(XEN) Adding cpu 6 to runqueue 0
(XEN) CPU 6 booted.
(XEN) Bringing up CPU7
(XEN) Adding cpu 7 to runqueue 0
(XEN) CPU 7 booted.
(XEN) Brought up 8 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: ea6618b0837011e4049a83a5185c9de93fb6e64b
(XEN) alternatives: Patching with alt table 00000000002abc00 -> 00000000002ac224
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading Domd0 kernel from boot module @ 000000003653b000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x00000010000000-0x00000020000000 (256MB)
(XEN) BANK[1] 0x00000024000000-0x00000034000000 (256MB)
(XEN) Grant table range: 0x0000003783d000-0x0000003787d000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 000000003653b000 to 0000000010080000-0000000011381a00
(XEN) Loading dom0 DTB to 0x0000000018000000-0x0000000018008d9a
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-x' three times to switch input)
(XEN) Freed 324kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd033]
[    0.000000] Linux version 5.0.0-rc2-00001-g5b47dea3757c (leo.yan@hackbox2) (gcc version 7.3.0 (Ubuntu/Linaro 7.3.0-27ubuntu1~18.04)) #3 SMP PREEMPT Tue Jan 15 02:04:31 GMT 2019
[    0.000000] Machine model: HiKey Development Board
[    0.000000] Memory limited to 256MB
[    0.000000] Xen 4.12 support found
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] OF: reserved mem: failed to allocate memory for node 'linux,cma'
[    0.000000] cma: Reserved 32 MiB at 0x000000001e000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000010000000-0x000000001fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x1df4c840-0x1df4dfff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000010000000-0x000000001fffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000010000000-0x000000001fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000001fffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] random: get_random_bytes called from start_kernel+0xa8/0x408 with crng_init=0
[    0.000000] percpu: Embedded 23 pages/cpu @(____ptrval____) s55960 r8192 d30056 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: ARM erratum 845719
[    0.000000] CPU features: detected: ARM erratum 843419
[    0.000000] Speculative Store Bypass Disable mitigation not required
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 64512
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: console=hvc root=/dev/mmcblk0p9 rootwait rw 3 mem=256M
[    0.000000] Memory: 190904K/262144K available (11068K kernel code, 1606K rwdata, 5344K rodata, 1408K init, 381K bss, 38472K reserved, 32768K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=8.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] arch_timer: cp15 timer(s) running at 1.20MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x11b661f8e, max_idle_ns: 1763180809113 ns
[    0.000005] sched_clock: 56 bits at 1200kHz, resolution 833ns, wraps every 4398046510838ns
[    0.000159] clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 99544814920 ns
[    0.000168] sched_clock: 32 bits at 19MHz, resolution 52ns, wraps every 111848106981ns
[    0.000917] Console: colour dummy device 80x25
[    0.288330] printk: console [hvc0] enabled
[    0.292565] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.40 BogoMIPS (lpj=4800)
[    0.302647] pid_max: default: 32768 minimum: 301
[    0.307398] LSM: Security Framework initializing
[    0.312127] Dentry cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.319085] Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.325992] Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
[    0.332566] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes)
[    0.363992] ASID allocator initialised with 32768 entries
[    0.369898] xen:grant_table: Grant tables using version 1 layout
[    0.375836] Grant table initialized
[    0.379393] xen:events: Using FIFO-based ABI
[    0.383748] Xen: initializing cpu0
[    0.391804] rcu: Hierarchical SRCU implementation.
[    0.406872] EFI services will not be available.
[    0.419417] smp: Bringing up secondary CPUs ...
(XEN) d0v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v2: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v3: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v4: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v5: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v6: vGICD: unhandled word write 0xffffffff to ICACTIVER0
(XEN) d0v7: vGICD: unhandled word write 0xffffffff to ICACTIVER0
[    0.456461] Detected VIPT I-cache on CPU1
[    0.462100] Xen: initializing cpu1
[    0.462124] CPU1: Booted secondary processor 0x0000000001 [0x410fd033]
[    0.492885] Detected VIPT I-cache on CPU2
[    0.498487] Xen: initializing cpu2
[    0.498507] CPU2: Booted secondary processor 0x0000000002 [0x410fd033]
[    0.529345] Detected VIPT I-cache on CPU3
[    0.534943] Xen: initializing cpu3
[    0.534963] CPU3: Booted secondary processor 0x0000000003 [0x410fd033]
[    0.565898] Detected VIPT I-cache on CPU4
[    0.571522] Xen: initializing cpu4
[    0.571554] CPU4: Booted secondary processor 0x0000000004 [0x410fd033]
[    0.602375] Detected VIPT I-cache on CPU5
[    0.607968] Xen: initializing cpu5
[    0.607987] CPU5: Booted secondary processor 0x0000000005 [0x410fd033]
[    0.638791] Detected VIPT I-cache on CPU6
[    0.644384] Xen: initializing cpu6
[    0.644403] CPU6: Booted secondary processor 0x0000000006 [0x410fd033]
[    0.675308] Detected VIPT I-cache on CPU7
[    0.680900] Xen: initializing cpu7
[    0.680920] CPU7: Booted secondary processor 0x0000000007 [0x410fd033]
[    0.681055] smp: Brought up 1 node, 8 CPUs
[    0.784024] SMP: Total of 8 processors activated.
[    0.788786] CPU features: detected: 32-bit EL0 Support
[    0.794003] CPU features: detected: CRC32 instructions
[    0.799694] CPU: All CPU(s) started at EL1
[    0.803793] alternatives: patching kernel code
[    0.809270] devtmpfs: initialized
[    0.818465] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.828178] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.835656] pinctrl core: initialized pinctrl subsystem
[    0.842648] DMI not present or invalid.
[    0.846919] NET: Registered protocol family 16
[    0.851949] audit: initializing netlink subsys (disabled)
[    0.857446] audit: type=2000 audit(0.628:1): state=initialized audit_enabled=0 res=1
[    0.865153] vdso: 2 pages (1 code @ (____ptrval____), 1 data @ (____ptrval____))
[    0.872600] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.880932] DMA: preallocated 256 KiB pool for atomic allocations
[    0.887037] xen:swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB
[    0.895504] software IO TLB: mapped [mem 0x1bc00000-0x1c000000] (4MB)
[    0.903657] Serial: AMBA PL011 UART driver
[    0.910367] f8015000.uart: ttyAMA0 at MMIO 0xf8015000 (irq = 6, base_baud = 0) is a PL011 rev2
[    0.925627] hi6220-mbox f7510000.mailbox: Mailbox enabled
[    0.949460] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.956118] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.962849] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.969606] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.977016] cryptd: max_cpu_qlen set to 1000
[    0.982463] ACPI: Interpreter disabled.
[    0.987089] xen:balloon: Initialising balloon driver
[    0.992558] VDD_3V3: supplied by SYS_5V
[    0.997409] vgaarb: loaded
[    1.000308] SCSI subsystem initialized
[    1.004718] usbcore: registered new interface driver usbfs
[    1.010165] usbcore: registered new interface driver hub
[    1.015702] usbcore: registered new device driver usb
[    1.021618] pps_core: LinuxPPS API ver. 1 registered
[    1.026501] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.035711] PTP clock support registered
[    1.039801] EDAC MC: Ver: 3.0.0
[    1.044093] Advanced Linux Sound Architecture Driver Initialized.
[    1.050999] clocksource: Switched to clocksource arch_sys_counter
[    1.057279] VFS: Disk quotas dquot_6.6.0
[    1.061180] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.068267] pnp: PnP ACPI: disabled
[    1.080818] OF: /soc/thermal-zones/cls0/cooling-maps/map0: could not find phandle
[    1.088250] failed to build thermal zone cls0: -22
[    1.093185] NET: Registered protocol family 2
[    1.097938] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 4096 bytes)
[    1.105551] TCP established hash table entries: 2048 (order: 2, 16384 bytes)
[    1.112722] TCP bind hash table entries: 2048 (order: 3, 32768 bytes)
[    1.119147] TCP: Hash tables configured (established 2048 bind 2048)
[    1.125635] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    1.131449] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    1.137878] NET: Registered protocol family 1
[    1.142828] RPC: Registered named UNIX socket transport module.
[    1.148677] RPC: Registered udp transport module.
[    1.153433] RPC: Registered tcp transport module.
[    1.158193] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.165757] kvm [1]: HYP mode not available
[    1.179855] Initialise system trusted keyrings
[    1.184421] workingset: timestamp_bits=44 max_order=16 bucket_order=0
[    1.197590] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.204195] NFS: Registering the id_resolver key type
[    1.209192] Key type id_resolver registered
[    1.213409] Key type id_legacy registered
[    1.217506] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.224469] 9p: Installing v9fs 9p2000 file system support
[    1.238690] Key type asymmetric registered
[    1.242730] Asymmetric key parser 'x509' registered
[    1.247713] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    1.255118] io scheduler mq-deadline registered
[    1.259703] io scheduler kyber registered
[    1.268569] pinctrl-single f7010000.pinmux: 159 pins, size 636
[    1.275001] pinctrl-single f7010800.pinmux: 163 pins, size 652
[    1.281204] pinctrl-single f8001800.pinmux: 30 pins, size 120
[    1.289175] pl061_gpio f8011000.gpio: PL061 GPIO chip @0x00000000f8011000 registered
[    1.297196] pl061_gpio f8012000.gpio: PL061 GPIO chip @0x00000000f8012000 registered
[    1.305206] pl061_gpio f8013000.gpio: PL061 GPIO chip @0x00000000f8013000 registered
[    1.313198] pl061_gpio f8014000.gpio: PL061 GPIO chip @0x00000000f8014000 registered
[    1.321146] pl061_gpio f7020000.gpio: PL061 GPIO chip @0x00000000f7020000 registered
[    1.329096] pl061_gpio f7021000.gpio: PL061 GPIO chip @0x00000000f7021000 registered
[    1.337019] pl061_gpio f7022000.gpio: PL061 GPIO chip @0x00000000f7022000 registered
[    1.344956] pl061_gpio f7023000.gpio: PL061 GPIO chip @0x00000000f7023000 registered
[    1.352898] pl061_gpio f7024000.gpio: PL061 GPIO chip @0x00000000f7024000 registered
[    1.360828] pl061_gpio f7025000.gpio: PL061 GPIO chip @0x00000000f7025000 registered
[    1.368759] pl061_gpio f7026000.gpio: PL061 GPIO chip @0x00000000f7026000 registered
[    1.376690] pl061_gpio f7027000.gpio: PL061 GPIO chip @0x00000000f7027000 registered
[    1.384601] pl061_gpio f7028000.gpio: PL061 GPIO chip @0x00000000f7028000 registered
[    1.392542] pl061_gpio f7029000.gpio: PL061 GPIO chip @0x00000000f7029000 registered
[    1.400454] pl061_gpio f702a000.gpio: PL061 GPIO chip @0x00000000f702a000 registered
[    1.408393] pl061_gpio f702b000.gpio: PL061 GPIO chip @0x00000000f702b000 registered
[    1.416313] pl061_gpio f702c000.gpio: PL061 GPIO chip @0x00000000f702c000 registered
[    1.424229] pl061_gpio f702d000.gpio: PL061 GPIO chip @0x00000000f702d000 registered
[    1.432138] pl061_gpio f702e000.gpio: PL061 GPIO chip @0x00000000f702e000 registered
[    1.440061] pl061_gpio f702f000.gpio: PL061 GPIO chip @0x00000000f702f000 registered
[    1.450446] EINJ: ACPI disabled.
[    1.458360] k3-dma f7370000.dma: initialized
[    1.465701] xen:xen_evtchn: Event-channel device installed
[    1.471692] Initialising Xen pvcalls frontend driver
[    1.483229] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.491908] SuperH (H)SCI(F) driver initialized
[    1.496722] msm_serial: driver initialized
[    1.501561] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    1.515299] loop: module loaded
[    1.526643] libphy: Fixed MDIO Bus: probed
[    1.531269] tun: Universal TUN/TAP device driver, 1.6
[    1.537241] thunder_xcv, ver 1.0
[    1.540451] thunder_bgx, ver 1.0
[    1.543736] nicpf, ver 1.0
[    1.546883] hclge is initializing
[    1.550120] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    1.557402] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.562846] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.568677] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.574699] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    1.581680] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.587358] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k
[    1.595202] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.601581] sky2: driver version 1.30
[    1.605675] xen_netfront: Initialising Xen virtual ethernet driver
[    1.612133] VFIO - User Level meta-driver version: 0.3
[    1.618751] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.625220] ehci-pci: EHCI PCI platform driver
[    1.629764] ehci-platform: EHCI generic platform driver
[    1.635159] ehci-orion: EHCI orion driver
[    1.639187] ehci-exynos: EHCI EXYNOS driver
[    1.643409] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.649592] ohci-pci: OHCI PCI platform driver
[    1.654139] ohci-platform: OHCI generic platform driver
[    1.659486] ohci-exynos: OHCI EXYNOS driver
[    1.664082] usbcore: registered new interface driver usb-storage
[    1.672060] input: HISI 65xx PowerOn Key as /devices/platform/f8000000.pmic/hi65xx-powerkey.0.auto/input/input0
[    1.683458] rtc-pl031 f8003000.rtc: registered as rtc0
[    1.688887] rtc-pl031 f8004000.rtc: registered as rtc1
[    1.694660] i2c /dev entries driver
[    1.701168] hisi_thermal f7030700.tsensor: failed to register sensor id 2: -517
[    1.708402] hisi_thermal f7030700.tsensor: failed to register thermal sensor: -517
[    1.716782] sp805-wdt f8005000.watchdog: registration successful
[    1.724142] sdhci: Secure Digital Host Controller Interface driver
[    1.730243] sdhci: Copyright(c) Pierre Ossman
[    1.735105] Synopsys Designware Multimedia Card Interface Driver
[    1.741753] dwmmc_k3 f723d000.dwmmc0: fifo-depth property not found, using value of FIFOTH register as default
[    1.751827] dwmmc_k3 f723d000.dwmmc0: IDMAC supports 32-bit address mode.
[    1.758548] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    1.767381] Mem abort info:
[    1.770215]   ESR = 0x96000004
[    1.773350]   Exception class = DABT (current EL), IL = 32 bits
[    1.779339]   SET = 0, FnV = 0
[    1.782442]   EA = 0, S1PTW = 0
[    1.785669] Data abort info:
[    1.788611]   ISV = 0, ISS = 0x00000004
[    1.792520]   CM = 0, WnR = 0
[    1.795556] [0000000000000000] user address but active_mm is swapper
[    1.801981] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    1.807591] Modules linked in:
[    1.810717] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc2-00001-g5b47dea3757c #3
[    1.818691] Hardware name: HiKey Development Board (DT)
[    1.823983] pstate: 40000005 (nZcv daif -PAN -UAO)
[    1.828848] pc : xen_swiotlb_alloc_coherent+0x64/0x1e8
[    1.834044] lr : dma_alloc_attrs+0xf4/0x110
[    1.838289] sp : ffff000010073a50
[    1.841671] x29: ffff000010073a50 x28: 0000000000000007 
[    1.847047] x27: ffff000011150068 x26: ffff80001b6ddd60 
[    1.852429] x25: ffff000010caaa70 x24: 0000000000000000 
[    1.857800] x23: 0000000000001000 x22: 0000000000001000 
[    1.863177] x21: 0000000000000000 x20: ffff80001c2edc10 
[    1.868553] x19: ffff0000111fd000 x18: ffffffffffffffff 
[    1.873930] x17: 0000000000000000 x16: 0000000000000000 
[    1.879306] x15: ffff0000111fd6c8 x14: ffff0000900737b7 
[    1.884683] x13: ffff0000100737c5 x12: ffff000011215000 
[    1.890060] x11: 0000000005f5e0ff x10: ffff0000111fd940 
[    1.895436] x9 : 0000000000000000 x8 : ffff80001bb0e700 
[    1.900813] x7 : 0000000000000000 x6 : 0000000000000000 
[    1.906189] x5 : ffff0000105bdbb8 x4 : 0000000000000000 
[    1.911566] x3 : 00000000006000c0 x2 : ffff80001b6ddd60 
[    1.916943] x1 : 0000000000001000 x0 : 0000000000000000 
[    1.922326] Process swapper/0 (pid: 1, stack limit = 0x(____ptrval____))
[    1.929084] Call trace:
[    1.931602]  xen_swiotlb_alloc_coherent+0x64/0x1e8
[    1.936456]  dma_alloc_attrs+0xf4/0x110
[    1.940359]  dmam_alloc_attrs+0x64/0xb8
[    1.944264]  dw_mci_probe+0x5f8/0xb00
[    1.947990]  dw_mci_pltfm_register+0xa0/0xd0
[    1.952327]  dw_mci_k3_probe+0x2c/0x38
[    1.956145]  platform_drv_probe+0x50/0xa0
[    1.960218]  really_probe+0x1f0/0x298
[    1.963947]  driver_probe_device+0x58/0x100
[    1.968196]  __driver_attach+0xd4/0xd8
[    1.972017]  bus_for_each_dev+0x74/0xc8
[    1.975914]  driver_attach+0x20/0x28
[    1.979556]  bus_add_driver+0x1ac/0x218
[    1.983458]  driver_register+0x60/0x110
[    1.987361]  __platform_driver_register+0x40/0x48
[    1.992138]  dw_mci_k3_pltfm_driver_init+0x18/0x20
[    1.996988]  do_one_initcall+0x5c/0x178
[    2.000891]  kernel_init_freeable+0x198/0x240
[    2.005314]  kernel_init+0x10/0x108
[    2.008867]  ret_from_fork+0x10/0x18
[    2.012516] Code: f9414280 aa1503e4 aa1a03e2 aa1703e1 (f9400005) 
[    2.018680] ---[ end trace baf3ac16eabafa1f ]---
[    2.023394] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    2.031068] SMP: stopping secondary CPUs
[    2.035101] Kernel Offset: disabled
[    2.038611] CPU features: 0x002,24002004
[    2.042604] Memory Limit: 256 MB
[    2.045898] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--KsGdsel6WgEHnImy--
