From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Armv8-A: Not able to enable secondary CPUs in Hikey960
 board
Date: Sat, 11 Aug 2018 20:44:42 +0530
Message-ID: <CAC4nxbsJss__sbvs5fKEW1RZAiyC8KNvV3HMPM88v4HmBwO+ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3367509845032668505=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eahr=k2=pathpartnertech.com=omkar.bolla@srs-us1.protection.inumbo.net>)
 id 1foVbO-0004Lp-0O
 for xen-devel@lists.xenproject.org; Sat, 11 Aug 2018 15:14:50 +0000
Received: by mail-ua1-x935.google.com with SMTP id m13-v6so4983152uaq.7
 for <xen-devel@lists.xenproject.org>; Sat, 11 Aug 2018 08:14:44 -0700 (PDT)
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

--===============3367509845032668505==
Content-Type: multipart/alternative; boundary="000000000000de0e8405732a51de"

--000000000000de0e8405732a51de
Content-Type: text/plain; charset="UTF-8"

Hi,

I am using Hikey960 board and i started trying to port xen on hykey960.

I followed all procedure has given in
https://wiki.xenproject.org/wiki/HiKey960 link.
And using *Xen version 4.11.1-pre *and linux as mentioned in above link.

But, After flashing, I ended up with secondary CPUs errors and linux Dom0
errors.
Please give some suggestions to start xen with all CPUs.

Please check below log:
--------------------------------
 Using modules provided by bootloader in FDT
Xen 4.11.1-pre (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72) EFI loader
 Xen 4.11.1-pre
(XEN) Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro
GCC 7.1-2017.05) 7.1.1 20170510) debug=n  Sat Aug 11 20:35:10 IST 201
8
(XEN) Latest ChangeSet: Mon Jul 30 11:30:09 2018 +0200 git:33ced72
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
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
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.1
(XEN) Using PSCI v1.1
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 1920 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000e82b1000
(XEN)         gic_cpu_addr=00000000e82b2000
(XEN)         gic_hyp_addr=00000000e82b4000
(XEN)         gic_vcpu_addr=00000000e82b6000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 64 KiB.
(XEN) Bringing up CPU1
(XEN) Failed to bring up CPU1
(XEN) Failed to bring up CPU 1 (error -9)
(XEN) Bringing up CPU2
(XEN) Failed to bring up CPU2
(XEN) Failed to bring up CPU 2 (error -9)
(XEN) Bringing up CPU3
(XEN) Failed to bring up CPU3
(XEN) Failed to bring up CPU 3 (error -9)
(XEN) Bringing up CPU4
(XEN) Failed to bring up CPU4
(XEN) Failed to bring up CPU 4 (error -9)
(XEN) Bringing up CPU5
(XEN) Failed to bring up CPU5
(XEN) Failed to bring up CPU 5 (error -9)
(XEN) Bringing up CPU6
(XEN) Failed to bring up CPU6
(XEN) Failed to bring up CPU 6 (error -9)
(XEN) Bringing up CPU7
(XEN) Failed to bring up CPU7
(XEN) Failed to bring up CPU 7 (error -9)
(XEN) Brought up 1 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: fa5f17a58e5d75750920185c7944c71cbea9de1d
(XEN) alternatives: Patching with alt table 00000000400acfc8 ->
00000000400ad544
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 00000000b8887000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x000000c0000000-0x000000e0000000 (512MB)
(XEN) Grant table range: 0x0000021fe00000-0x0000021fe40000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 00000000b8887000 to
00000000c0080000-00000000c1187200
(XEN) Loading dom0 DTB to 0x00000000c8000000-0x00000000c800a4db
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 1 CPUs
(XEN)
....................................................................done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) ***************************************************
(XEN) PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)
(XEN) Freed 292kB init memory.
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
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.0-rc7-linaro-hikey960+
(omkar.bolla@OmkarB-LaptopU) (gcc version 7.1.1 20170510 (Linaro GCC
7.1-2017.05)) #7 S
MP PREEMPT Fri Aug 10 23:06:10 IST 2018
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Machine model: HiKey960
[    0.000000] Xen 4.11 support found
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x00000000df000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000000000000-0x00000000dfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0xdefb6800-0xdefb82ff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00000000c0000000-0x00000000dfffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000dfffffff]
[    0.000000] Initmem setup node 0 [mem
0x00000000c0000000-0x00000000dfffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] percpu: Embedded 23 pages/cpu @ffff80001ef9c000 s55448 r8192
d30568 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 129024
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: console=tty0 console=hvc0
root=/dev/sdd10 rw efi=noruntime
[    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
[    0.000000] Memory: 473192K/524288K available (10364K kernel code, 1180K
rwdata, 4664K rodata, 1152K init, 405K bss, 34712K reserved, 16384K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffff000000000000 - 0xffff000008000000   (
 128 MB)
[    0.000000]     vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000
 (129022 GB)
[    0.000000]       .text : 0xffff000008080000 - 0xffff000008aa0000   (
10368 KB)
[    0.000000]     .rodata : 0xffff000008aa0000 - 0xffff000008f40000   (
4736 KB)
[    0.000000]       .init : 0xffff000008f40000 - 0xffff000009060000   (
1152 KB)
[    0.000000]       .data : 0xffff000009060000 - 0xffff000009187200   (
1181 KB)
[    0.000000]        .bss : 0xffff000009187200 - 0xffff0000091ec9e0   (
 406 KB)
[    0.000000]     fixed   : 0xffff7dfffe7fd000 - 0xffff7dfffec00000   (
4108 KB)
[    0.000000]     PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000   (
16 MB)
[    0.000000]     vmemmap : 0xffff7e0000000000 - 0xffff800000000000   (
2048 GB maximum)
[    0.000000]               0xffff7e0000000000 - 0xffff7e0000800000   (
 8 MB actual)
[    0.000000]     memory  : 0xffff800000000000 - 0xffff800020000000   (
 512 MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=1.
[    0.000000]  Tasks RCU enabled.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] arch_timer: cp15 timer(s) running at 1.92MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1c570327e, max_idle_ns: 1763180809505 ns
[    0.000004] sched_clock: 56 bits at 1920kHz, resolution 520ns, wraps
every 4398046510977ns
[    0.000101] clocksource: arm,sp804: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58334160866034 ns
[    0.000560] Console: colour dummy device 80x25
[    0.000846] console [tty0] enabled
[    0.343934] console [hvc0] enabled
[    0.347479] Calibrating delay loop (skipped), value calculated using
timer frequency.. 3.84 BogoMIPS (lpj=7680)
[    0.357565] pid_max: default: 32768 minimum: 301
[    0.362297] Security Framework initialized
[    0.366580] Dentry cache hash table entries: 65536 (order: 7, 524288
bytes)
[    0.373521] Inode-cache hash table entries: 32768 (order: 6, 262144
bytes)
[    0.380393] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
[    0.387061] Mountpoint-cache hash table entries: 1024 (order: 1, 8192
bytes)
[    0.410306] calling  cpu_suspend_init+0x0/0x4c @ 1
[    0.415027] initcall cpu_suspend_init+0x0/0x4c returned 0 after 0 usecs
[    0.421703] calling  asids_init+0x0/0xc0 @ 1
[    0.426028] ASID allocator initialised with 65536 entries
[    0.431488] initcall asids_init+0x0/0xc0 returned 0 after 3906 usecs
[    0.437907] calling  xen_guest_init+0x0/0x2f4 @ 1
[    0.443420] xen:grant_table: Grant tables using version 1 layout
[    0.449353] Grant table initialized
[    0.452910] xen:events: Using FIFO-based ABI
[    0.457310] Xen: initializing cpu0
[    0.460730] initcall xen_guest_init+0x0/0x2f4 returned 0 after 7812 usecs
[    0.467553] calling  spawn_ksoftirqd+0x0/0x50 @ 1
[    0.480345] initcall spawn_ksoftirqd+0x0/0x50 returned 0 after 7812 usecs
[    0.487046] calling  migration_init+0x0/0x4c @ 1
[    0.491722] initcall migration_init+0x0/0x4c returned 0 after 0 usecs
[    0.498227] calling  check_cpu_stall_init+0x0/0x2c @ 1
[    0.503429] initcall check_cpu_stall_init+0x0/0x2c returned 0 after 0
usecs
[    0.510456] calling  srcu_bootup_announce+0x0/0x40 @ 1
[    0.515651] Hierarchical SRCU implementation.
[    0.520078] initcall srcu_bootup_announce+0x0/0x40 returned 0 after 3906
usecs
[    0.527363] calling  rcu_spawn_gp_kthread+0x0/0x12c @ 1
[    0.532752] initcall rcu_spawn_gp_kthread+0x0/0x12c returned 0 after 0
usecs
[    0.539769] calling  cpu_stop_init+0x0/0xd4 @ 1
[    0.552404] initcall cpu_stop_init+0x0/0xd4 returned 0 after 7812 usecs
[    0.558929] calling  jump_label_init_module+0x0/0x1c @ 1
[    0.564304] initcall jump_label_init_module+0x0/0x1c returned 0 after 0
usecs
[    0.571502] calling  its_pci_msi_init+0x0/0xb4 @ 1
[    0.576675] initcall its_pci_msi_init+0x0/0xb4 returned 0 after 0 usecs
[    0.583196] calling  its_pmsi_init+0x0/0x98 @ 1
[    0.587905] initcall its_pmsi_init+0x0/0x98 returned 0 after 0 usecs
[    0.594214] calling  renesas_soc_init+0x0/0x1dc @ 1
[    0.599154] initcall renesas_soc_init+0x0/0x1dc returned -19 after 0
usecs
[    0.606090] calling  rcar_sysc_pd_init+0x0/0x2e4 @ 1
[    0.611214] initcall rcar_sysc_pd_init+0x0/0x2e4 returned -19 after 0
usecs
[    0.618143] calling  tegra_init_fuse+0x0/0x150 @ 1
[    0.623138] initcall tegra_init_fuse+0x0/0x150 returned 0 after 0 usecs
[    0.629677] calling  tegra_flowctrl_init+0x0/0x88 @ 1
[    0.634802] initcall tegra_flowctrl_init+0x0/0x88 returned 0 after 0
usecs
[    0.641730] calling  tegra_pmc_early_init+0x0/0x540 @ 1
[    0.647243] initcall tegra_pmc_early_init+0x0/0x540 returned 0 after 0
usecs
[    0.654203] calling  rand_initialize+0x0/0x128 @ 1
[    0.659132] initcall rand_initialize+0x0/0x128 returned 0 after 0 usecs
[    0.665734] calling  arm_enable_runtime_services+0x0/0x1f8 @ 1
[    0.671622] EFI services will not be available.
[    0.676222] initcall arm_enable_runtime_services+0x0/0x1f8 returned 0
after 3906 usecs
[    0.684204] calling  dummy_timer_register+0x0/0x34 @ 1
[    0.689414] initcall dummy_timer_register+0x0/0x34 returned 0 after 0
usecs
[    0.704455] smp: Bringing up secondary CPUs ...
[    0.708893] smp: Brought up 1 node, 1 CPU
[    0.712966] SMP: Total of 1 processors activated.
[    0.717744] CPU features: detected feature: 32-bit EL0 Support
[    0.723709] CPU: All CPU(s) started at EL1
[    0.727814] alternatives: patching kernel code
[    0.733313] devtmpfs: initialized
[    0.741654] calling  ipc_ns_init+0x0/0x60 @ 1
[    0.745994] random: get_random_u32 called from
bucket_table_alloc+0x108/0x258 with crng_init=0
[    0.754631] initcall ipc_ns_init+0x0/0x60 returned 0 after 3906 usecs
[    0.761132] calling  init_mmap_min_addr+0x0/0x18 @ 1
[    0.766152] initcall init_mmap_min_addr+0x0/0x18 returned 0 after 0 usecs
[    0.773010] calling  init_cpufreq_transition_notifier_list+0x0/0x34 @ 1
[    0.779712] initcall init_cpufreq_transition_notifier_list+0x0/0x34
returned 0 after 0 usecs
[    0.788182] calling  net_ns_init+0x0/0x154 @ 1
[    0.796768] initcall net_ns_init+0x0/0x154 returned 0 after 3906 usecs
[    0.803286] calling  fpsimd_init+0x0/0x80 @ 1
[    0.807635] initcall fpsimd_init+0x0/0x80 returned 0 after 0 usecs
[    0.813868] calling  enable_mrs_emulation+0x0/0x24 @ 1
[    0.819074] initcall enable_mrs_emulation+0x0/0x24 returned 0 after 0
usecs
[    0.826102] calling  cpu_hotplug_pm_sync_init+0x0/0x24 @ 1
[    0.831650] initcall cpu_hotplug_pm_sync_init+0x0/0x24 returned 0 after
0 usecs
[    0.839017] calling  alloc_frozen_cpus+0x0/0x8 @ 1
[    0.843872] initcall alloc_frozen_cpus+0x0/0x8 returned 0 after 0 usecs
[    0.850555] calling  wq_sysfs_init+0x0/0x40 @ 1
[    0.855309] initcall wq_sysfs_init+0x0/0x40 returned 0 after 0 usecs
[    0.861583] calling  ksysfs_init+0x0/0xc0 @ 1
[    0.866082] initcall ksysfs_init+0x0/0xc0 returned 0 after 0 usecs
[    0.872404] random: fast init done
[    0.875724] calling  pm_init+0x0/0x80 @ 1
[    0.879891] initcall pm_init+0x0/0x80 returned 0 after 0 usecs
[    0.885715] calling  pm_disk_init+0x0/0x24 @ 1
[    0.890252] initcall pm_disk_init+0x0/0x24 returned 0 after 0 usecs
[    0.896558] calling  swsusp_header_init+0x0/0x40 @ 1
[    0.901581] initcall swsusp_header_init+0x0/0x40 returned 0 after 0 usecs
[    0.908427] calling  rcu_set_runtime_mode+0x0/0x14 @ 1
[    0.913628] initcall rcu_set_runtime_mode+0x0/0x14 returned 0 after 0
usecs
[    0.920653] calling  init_jiffies_clocksource+0x0/0x24 @ 1
[    0.926206] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.936007] initcall init_jiffies_clocksource+0x0/0x24 returned 0 after
3906 usecs
[    0.943634] calling  futex_init+0x0/0x100 @ 1
[    0.948075] futex hash table entries: 256 (order: 3, 32768 bytes)
[    0.954244] initcall futex_init+0x0/0x100 returned 0 after 3906 usecs
[    0.960717] calling  cgroup_wq_init+0x0/0x40 @ 1
[    0.965409] initcall cgroup_wq_init+0x0/0x40 returned 0 after 0 usecs
[    0.971903] calling  cgroup1_wq_init+0x0/0x40 @ 1
[    0.976680] initcall cgroup1_wq_init+0x0/0x40 returned 0 after 0 usecs
[    0.983270] calling  cpu_pm_init+0x0/0x20 @ 1
[    0.987688] initcall cpu_pm_init+0x0/0x20 returned 0 after 0 usecs
[    0.993932] calling  init_per_zone_wmark_min+0x0/0x7c @ 1
[    0.999408] initcall init_per_zone_wmark_min+0x0/0x7c returned 0 after 0
usecs
[    1.006680] calling  init_zero_pfn+0x0/0x28 @ 1
[    1.011274] initcall init_zero_pfn+0x0/0x28 returned 0 after 0 usecs
[    1.017692] calling  cma_init_reserved_areas+0x0/0x1d0 @ 1
[    1.023632] initcall cma_init_reserved_areas+0x0/0x1d0 returned 0 after
0 usecs
[    1.030858] calling  fsnotify_init+0x0/0x54 @ 1
[    1.035474] initcall fsnotify_init+0x0/0x54 returned 0 after 0 usecs
[    1.041860] calling  filelock_init+0x0/0xc4 @ 1
[    1.046485] initcall filelock_init+0x0/0xc4 returned 0 after 0 usecs
[    1.052873] calling  init_script_binfmt+0x0/0x24 @ 1
[    1.057906] initcall init_script_binfmt+0x0/0x24 returned 0 after 0 usecs
[    1.064753] calling  init_elf_binfmt+0x0/0x24 @ 1
[    1.069523] initcall init_elf_binfmt+0x0/0x24 returned 0 after 0 usecs
[    1.076114] calling  init_compat_elf_binfmt+0x0/0x24 @ 1
[    1.081492] initcall init_compat_elf_binfmt+0x0/0x24 returned 0 after 0
usecs
[    1.088688] calling  configfs_init+0x0/0xb4 @ 1
[    1.093317] initcall configfs_init+0x0/0xb4 returned 0 after 0 usecs
[    1.099704] calling  debugfs_init+0x0/0x74 @ 1
[    1.104217] initcall debugfs_init+0x0/0x74 returned 0 after 0 usecs
[    1.110545] calling  prandom_init+0x0/0x164 @ 1
[    1.115142] initcall prandom_init+0x0/0x164 returned 0 after 0 usecs
[    1.121556] calling  pinctrl_init+0x0/0xc0 @ 1
[    1.126059] pinctrl core: initialized pinctrl subsystem
[    1.131472] initcall pinctrl_init+0x0/0xc0 returned 0 after 3906 usecs
[    1.137947] calling  gpiolib_dev_init+0x0/0xec @ 1
[    1.143018] initcall gpiolib_dev_init+0x0/0xec returned 0 after 0 usecs
[    1.149719] calling  hi3516cv300_crg_init+0x0/0x20 @ 1
[    1.154893] initcall hi3516cv300_crg_init+0x0/0x20 returned 0 after 0
usecs
[    1.161829] calling  hi3519_clk_init+0x0/0x20 @ 1
[    1.166618] initcall hi3519_clk_init+0x0/0x20 returned 0 after 0 usecs
[    1.173185] calling  hi3660_clk_init+0x0/0x20 @ 1
[    1.177956] initcall hi3660_clk_init+0x0/0x20 returned 0 after 0 usecs
[    1.184536] calling  hi3798cv200_crg_init+0x0/0x20 @ 1
[    1.189753] initcall hi3798cv200_crg_init+0x0/0x20 returned 0 after 0
usecs
[    1.196764] calling  gcc_ipq8074_init+0x0/0x20 @ 1
[    1.201631] initcall gcc_ipq8074_init+0x0/0x20 returned 0 after 0 usecs
[    1.208297] calling  gcc_msm8916_init+0x0/0x20 @ 1
[    1.213164] initcall gcc_msm8916_init+0x0/0x20 returned 0 after 0 usecs
[    1.219831] calling  gcc_msm8994_init+0x0/0x20 @ 1
[    1.224705] initcall gcc_msm8994_init+0x0/0x20 returned 0 after 0 usecs
[    1.231363] calling  gcc_msm8996_init+0x0/0x20 @ 1
[    1.236232] initcall gcc_msm8996_init+0x0/0x20 returned 0 after 0 usecs
[    1.242898] calling  rpm_smd_clk_init+0x0/0x20 @ 1
[    1.247764] initcall rpm_smd_clk_init+0x0/0x20 returned 0 after 0 usecs
[    1.254432] calling  vexpress_osc_init+0x0/0x20 @ 1
[    1.259384] initcall vexpress_osc_init+0x0/0x20 returned 0 after 0 usecs
[    1.266138] calling  zx_clk_init+0x0/0x20 @ 1
[    1.270569] initcall zx_clk_init+0x0/0x20 returned 0 after 0 usecs
[    1.276806] calling  fsl_guts_init+0x0/0x20 @ 1
[    1.281411] initcall fsl_guts_init+0x0/0x20 returned 0 after 0 usecs
[    1.287817] calling  exynos4_pm_init_power_domain+0x0/0x2f8 @ 1
[    1.294482] initcall exynos4_pm_init_power_domain+0x0/0x2f8 returned 0
after 0 usecs
[    1.302158] calling  virtio_init+0x0/0x30 @ 1
[    1.306619] initcall virtio_init+0x0/0x30 returned 0 after 0 usecs
[    1.312836] calling  regulator_init+0x0/0xb0 @ 1
[    1.318010] initcall regulator_init+0x0/0xb0 returned 0 after 0 usecs
[    1.324619] calling  iommu_init+0x0/0x3c @ 1
[    1.328855] initcall iommu_init+0x0/0x3c returned 0 after 0 usecs
[    1.334962] calling  opp_debug_init+0x0/0x50 @ 1
[    1.339689] initcall opp_debug_init+0x0/0x50 returned 0 after 0 usecs
[    1.346149] calling  dma_init_reserved_memory+0x0/0x64 @ 1
[    1.351699] initcall dma_init_reserved_memory+0x0/0x64 returned -12
after 0 usecs
[    1.359240] calling  soc_bus_register+0x0/0x54 @ 1
[    1.364132] initcall soc_bus_register+0x0/0x54 returned 0 after 0 usecs
[    1.370794] calling  register_cpufreq_notifier+0x0/0x50 @ 1
[    1.376417] initcall register_cpufreq_notifier+0x0/0x50 returned -22
after 0 usecs
[    1.384046] calling  vexpress_syscfg_init+0x0/0x20 @ 1
[    1.389284] initcall vexpress_syscfg_init+0x0/0x20 returned 0 after 0
usecs
[    1.396290] calling  vexpress_sysreg_init+0x0/0x70 @ 1
[    1.401831] initcall vexpress_sysreg_init+0x0/0x70 returned 0 after 0
usecs
[    1.408731] calling  cpufreq_core_init+0x0/0x68 @ 1
[    1.413658] initcall cpufreq_core_init+0x0/0x68 returned -19 after 0
usecs
[    1.420583] calling  cpuidle_init+0x0/0x58 @ 1
[    1.425097] initcall cpuidle_init+0x0/0x58 returned -19 after 0 usecs
[    1.431600] calling  capsule_reboot_register+0x0/0x20 @ 1
[    1.437065] initcall capsule_reboot_register+0x0/0x20 returned 0 after 0
usecs
[    1.444341] calling  arm_dmi_init+0x0/0x28 @ 1
[    1.448846] DMI not present or invalid.
[    1.452746] initcall arm_dmi_init+0x0/0x28 returned 0 after 0 usecs
[    1.459081] calling  tegra_bpmp_init+0x0/0x20 @ 1
[    1.463884] initcall tegra_bpmp_init+0x0/0x20 returned 0 after 0 usecs
[    1.470463] calling  hi6220_mbox_init+0x0/0x20 @ 1
[    1.475337] initcall hi6220_mbox_init+0x0/0x20 returned 0 after 0 usecs
[    1.482001] calling  hi3660_mbox_init+0x0/0x20 @ 1
[    1.486880] initcall hi3660_mbox_init+0x0/0x20 returned 0 after 0 usecs
[    1.493536] calling  tegra_hsp_init+0x0/0x20 @ 1
[    1.498233] initcall tegra_hsp_init+0x0/0x20 returned 0 after 0 usecs
[    1.504722] calling  sock_init+0x0/0xc0 @ 1
[    1.509230] initcall sock_init+0x0/0xc0 returned 0 after 0 usecs
[    1.515151] calling  net_inuse_init+0x0/0x30 @ 1
[    1.519846] initcall net_inuse_init+0x0/0x30 returned 0 after 0 usecs
[    1.526336] calling  net_defaults_init+0x0/0x30 @ 1
[    1.531280] initcall net_defaults_init+0x0/0x30 returned 0 after 0 usecs
[    1.538040] calling  init_default_flow_dissectors+0x0/0x54 @ 1
[    1.543939] initcall init_default_flow_dissectors+0x0/0x54 returned 0
after 0 usecs
[    1.551654] calling  netlink_proto_init+0x0/0x178 @ 1
[    1.556848] NET: Registered protocol family 16
[    1.561322] initcall netlink_proto_init+0x0/0x178 returned 0 after 3906
usecs
[    1.568482] calling  __gnttab_init+0x0/0x38 @ 1
[    1.573071] initcall __gnttab_init+0x0/0x38 returned 0 after 0 usecs
[    1.579651] calling  debug_monitors_init+0x0/0x38 @ 1
[    1.584652] initcall debug_monitors_init+0x0/0x38 returned 0 after 0
usecs
[    1.591555] calling  irq_sysfs_init+0x0/0xb0 @ 1
[    1.596302] initcall irq_sysfs_init+0x0/0xb0 returned 0 after 0 usecs
[    1.602738] calling  bdi_class_init+0x0/0x78 @ 1
[    1.607484] initcall bdi_class_init+0x0/0x78 returned 0 after 0 usecs
[    1.613964] calling  mm_sysfs_init+0x0/0x3c @ 1
[    1.618532] initcall mm_sysfs_init+0x0/0x3c returned 0 after 0 usecs
[    1.624943] calling  irqc_init+0x0/0x20 @ 1
[    1.629233] initcall irqc_init+0x0/0x20 returned 0 after 0 usecs
[    1.635279] calling  vexpress_config_init+0x0/0xf0 @ 1
[    1.640830] initcall vexpress_config_init+0x0/0xf0 returned 0 after 0
usecs
[    1.647705] calling  rockchip_pinctrl_drv_register+0x0/0x20 @ 1
[    1.653732] initcall rockchip_pinctrl_drv_register+0x0/0x20 returned 0
after 0 usecs
[    1.661513] calling  samsung_pinctrl_drv_register+0x0/0x20 @ 1
[    1.667420] initcall samsung_pinctrl_drv_register+0x0/0x20 returned 0
after 0 usecs
[    1.675128] calling  sh_pfc_init+0x0/0x20 @ 1
[    1.679565] initcall sh_pfc_init+0x0/0x20 returned 0 after 0 usecs
[    1.685791] calling  tegra_gpio_init+0x0/0x20 @ 1
[    1.690580] initcall tegra_gpio_init+0x0/0x20 returned 0 after 0 usecs
[    1.697151] calling  pcibus_class_init+0x0/0x24 @ 1
[    1.702109] initcall pcibus_class_init+0x0/0x24 returned 0 after 0 usecs
[    1.708861] calling  pci_driver_init+0x0/0x1c @ 1
[    1.713661] initcall pci_driver_init+0x0/0x1c returned 0 after 0 usecs
[    1.720218] calling  backlight_class_init+0x0/0xbc @ 1
[    1.725432] initcall backlight_class_init+0x0/0xbc returned 0 after 0
usecs
[    1.732447] calling  amba_init+0x0/0x1c @ 1
[    1.736711] initcall amba_init+0x0/0x1c returned 0 after 0 usecs
[    1.742767] calling  rockchip_grf_init+0x0/0xf8 @ 1
[    1.748087] initcall rockchip_grf_init+0x0/0xf8 returned -19 after 0
usecs
[    1.754874] calling  rockchip_pm_domain_drv_register+0x0/0x20 @ 1
[    1.761071] initcall rockchip_pm_domain_drv_register+0x0/0x20 returned 0
after 0 usecs
[    1.769029] calling  exynos_pmu_init+0x0/0x20 @ 1
[    1.773808] initcall exynos_pmu_init+0x0/0x20 returned 0 after 0 usecs
[    1.780388] calling  xenbus_init+0x0/0x2d4 @ 1
[    1.785163] initcall xenbus_init+0x0/0x2d4 returned 0 after 0 usecs
[    1.791348] calling  hi6220_reset_init+0x0/0x20 @ 1
[    1.796363] initcall hi6220_reset_init+0x0/0x20 returned 0 after 0 usecs
[    1.803073] calling  tty_class_init+0x0/0x58 @ 1
[    1.807767] initcall tty_class_init+0x0/0x58 returned 0 after 0 usecs
[    1.814258] calling  vtconsole_class_init+0x0/0xf8 @ 1
[    1.819561] initcall vtconsole_class_init+0x0/0xf8 returned 0 after 0
usecs
[    1.826509] calling  serdev_init+0x0/0x2c @ 1
[    1.830929] initcall serdev_init+0x0/0x2c returned 0 after 0 usecs
[    1.837149] calling  iommu_dev_init+0x0/0x24 @ 1
[    1.841869] initcall iommu_dev_init+0x0/0x24 returned 0 after 0 usecs
[    1.848338] calling  mipi_dsi_bus_init+0x0/0x1c @ 1
[    1.853297] initcall mipi_dsi_bus_init+0x0/0x1c returned 0 after 0 usecs
[    1.860042] calling  wakeup_sources_debugfs_init+0x0/0x34 @ 1
[    1.865867] initcall wakeup_sources_debugfs_init+0x0/0x34 returned 0
after 0 usecs
[    1.873469] calling  register_node_type+0x0/0x20 @ 1
[    1.878557] initcall register_node_type+0x0/0x20 returned 0 after 0 usecs
[    1.885363] calling  regmap_initcall+0x0/0x18 @ 1
[    1.890123] initcall regmap_initcall+0x0/0x18 returned 0 after 0 usecs
[    1.896705] calling  sram_init+0x0/0x20 @ 1
[    1.900991] initcall sram_init+0x0/0x20 returned 0 after 0 usecs
[    1.907041] calling  syscon_init+0x0/0x24 @ 1
[    1.911479] initcall syscon_init+0x0/0x24 returned 0 after 0 usecs
[    1.917709] calling  spi_init+0x0/0xb0 @ 1
[    1.921920] initcall spi_init+0x0/0xb0 returned 0 after 0 usecs
[    1.927873] calling  spmi_init+0x0/0x30 @ 1
[    1.932127] initcall spmi_init+0x0/0x30 returned 0 after 0 usecs
[    1.938179] calling  i2c_init+0x0/0xf0 @ 1
[    1.942404] initcall i2c_init+0x0/0xf0 returned 0 after 0 usecs
[    1.948340] calling  init_menu+0x0/0x1c @ 1
[    1.952557] initcall init_menu+0x0/0x1c returned -19 after 0 usecs
[    1.958802] calling  pcc_init+0x0/0x368 @ 1
[    1.963059] initcall pcc_init+0x0/0x368 returned -19 after 0 usecs
[    1.969290] calling  qcom_hwspinlock_init+0x0/0x20 @ 1
[    1.974523] initcall qcom_hwspinlock_init+0x0/0x20 returned 0 after 0
usecs
[    1.981534] calling  rpmsg_init+0x0/0x4c @ 1
[    1.985887] initcall rpmsg_init+0x0/0x4c returned 0 after 0 usecs
[    1.992032] calling  kobject_uevent_init+0x0/0x20 @ 1
[    1.997166] initcall kobject_uevent_init+0x0/0x20 returned 0 after 0
usecs
[    2.004065] calling  of_iommu_init+0x0/0x88 @ 1
[    2.009244] initcall of_iommu_init+0x0/0x88 returned 0 after 0 usecs
[    2.015676] calling  debug_traps_init+0x0/0x54 @ 1
[    2.020387] initcall debug_traps_init+0x0/0x54 returned 0 after 0 usecs
[    2.027056] calling  vdso_init+0x0/0x13c @ 1
[    2.031388] vdso: 2 pages (1 code @ ffff000008aa6000, 1 data @
ffff000009065000)
[    2.038852] initcall vdso_init+0x0/0x13c returned 0 after 3906 usecs
[    2.045264] calling  alloc_vectors_page+0x0/0xb8 @ 1
[    2.050301] initcall alloc_vectors_page+0x0/0xb8 returned 0 after 0 usecs
[    2.057146] calling  arch_hw_breakpoint_init+0x0/0xf0 @ 1
[    2.062608] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    2.069525] initcall arch_hw_breakpoint_init+0x0/0xf0 returned 0 after
3906 usecs
[    2.077005] calling  __iommu_dma_init+0x0/0x14 @ 1
[    2.081932] initcall __iommu_dma_init+0x0/0x14 returned 0 after 0 usecs
[    2.088535] calling  arm64_dma_init+0x0/0x48 @ 1
[    2.093821] DMA: preallocated 256 KiB pool for atomic allocations
[    2.099822] initcall arm64_dma_init+0x0/0x48 returned 0 after 3906 usecs
[    2.106596] calling  p2m_init+0x0/0x18 @ 1
[    2.110752] initcall p2m_init+0x0/0x18 returned 0 after 0 usecs
[    2.116734] calling  xen_mm_init+0x0/0x88 @ 1
[    2.121239] xen:swiotlb_xen: Warning: only able to allocate 4 MB for
software IO TLB
[    2.129717] software IO TLB [mem 0xdd000000-0xdd400000] (4MB) mapped at
[ffff80001d000000-ffff80001d3fffff]
[    2.139368] initcall xen_mm_init+0x0/0x88 returned 0 after 7812 usecs
[    2.145869] calling  ns2_pinmux_init+0x0/0x20 @ 1
[    2.150808] initcall ns2_pinmux_init+0x0/0x20 returned 0 after 0 usecs
[    2.157379] calling  ipq8074_pinctrl_init+0x0/0x20 @ 1
[    2.162500] initcall ipq8074_pinctrl_init+0x0/0x20 returned 0 after 0
usecs
[    2.169498] calling  msm8916_pinctrl_init+0x0/0x20 @ 1
[    2.174726] initcall msm8916_pinctrl_init+0x0/0x20 returned 0 after 0
usecs
[    2.181725] calling  msm8994_pinctrl_init+0x0/0x20 @ 1
[    2.186943] initcall msm8994_pinctrl_init+0x0/0x20 returned 0 after 0
usecs
[    2.193952] calling  msm8996_pinctrl_init+0x0/0x20 @ 1
[    2.199167] initcall msm8996_pinctrl_init+0x0/0x20 returned 0 after 0
usecs
[    2.206179] calling  qdf2xxx_pinctrl_init+0x0/0x20 @ 1
[    2.211396] initcall qdf2xxx_pinctrl_init+0x0/0x20 returned 0 after 0
usecs
[    2.218411] calling  mtk_pinctrl_init+0x0/0x20 @ 1
[    2.223275] initcall mtk_pinctrl_init+0x0/0x20 returned 0 after 0 usecs
[    2.229946] calling  acpi_pci_init+0x0/0x80 @ 1
[    2.234521] initcall acpi_pci_init+0x0/0x80 returned 0 after 0 usecs
[    2.240935] calling  clk_mt6797_init+0x0/0x20 @ 1
[    2.245740] initcall clk_mt6797_init+0x0/0x20 returned 0 after 0 usecs
[    2.252314] calling  tegra_clocks_apply_init_table+0x0/0x2c @ 1
[    2.258278] initcall tegra_clocks_apply_init_table+0x0/0x2c returned 0
after 0 usecs
[    2.266081] calling  dma_bus_init+0x0/0xfc @ 1
[    2.270710] initcall dma_bus_init+0x0/0xfc returned 0 after 0 usecs
[    2.276939] calling  dma_channel_table_init+0x0/0x104 @ 1
[    2.282395] initcall dma_channel_table_init+0x0/0x104 returned 0 after 0
usecs
[    2.289669] calling  qcom_smd_rpm_init+0x0/0x24 @ 1
[    2.294645] initcall qcom_smd_rpm_init+0x0/0x24 returned 0 after 0 usecs
[    2.301392] calling  qcom_smem_init+0x0/0x20 @ 1
[    2.306087] initcall qcom_smem_init+0x0/0x20 returned 0 after 0 usecs
[    2.312583] calling  setup_vcpu_hotplug_event+0x0/0x34 @ 1
[    2.318119] initcall setup_vcpu_hotplug_event+0x0/0x34 returned 0 after
0 usecs
[    2.325484] calling  register_xen_amba_notifier+0x0/0x5c @ 1
[    2.331210] initcall register_xen_amba_notifier+0x0/0x5c returned 0
after 0 usecs
[    2.338752] calling  register_xen_platform_notifier+0x0/0x58 @ 1
[    2.344821] initcall register_xen_platform_notifier+0x0/0x58 returned 0
after 0 usecs
[    2.352708] calling  register_xen_pci_notifier+0x0/0x4c @ 1
[    2.358344] initcall register_xen_pci_notifier+0x0/0x4c returned 0 after
0 usecs
[    2.365803] calling  hi3660_reset_init+0x0/0x20 @ 1
[    2.370774] initcall hi3660_reset_init+0x0/0x20 returned 0 after 0 usecs
[    2.377532] calling  pl011_init+0x0/0x54 @ 1
[    2.381845] Serial: AMBA PL011 UART driver
[    2.386080] initcall pl011_init+0x0/0x54 returned 0 after 3906 usecs
[    2.392477] calling  mvebu_uart_init+0x0/0x5c @ 1
[    2.397259] initcall mvebu_uart_init+0x0/0x5c returned 0 after 0 usecs
[    2.403814] calling  dmi_id_init+0x0/0x330 @ 1
[    2.408326] initcall dmi_id_init+0x0/0x330 returned -19 after 0 usecs
[    2.414805] calling  iproc_gpio_init+0x0/0x20 @ 1
[    2.419602] initcall iproc_gpio_init+0x0/0x20 returned 0 after 0 usecs
[    2.426184] calling  of_platform_default_populate_init+0x0/0x78 @ 1
[    2.454282] hi3660-mbox e896b000.mailbox: Mailbox enabled
[    2.461198] uart-pl011 ffd74000.serial: could not find pctldev for node
/soc/pinmux@e896c000/uart3_pmx_func, deferring probe
[    2.473082] uart-pl011 fdf01000.serial: could not find pctldev for node
/soc/pinmux@e896c000/uart4_pmx_func, deferring probe
ERROR:   Unhandled External Abort received on 0x80000000 at EL3!
ERROR:    exception reason=1 syndrome=0x92000210
PANIC at PC : 0x000000001ac5bc28
--------------------------------------------------------------------------

Thanks,
Omkar B

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--000000000000de0e8405732a51de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">Hi,</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br>=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">I am usin=
g Hikey960 board and i started trying to port xen on hykey960.</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br></div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">I followed all procedure =
has given in=C2=A0<a href=3D"https://wiki.xenproject.org/wiki/HiKey960">htt=
ps://wiki.xenproject.org/wiki/HiKey960</a>=C2=A0link.</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">And using=C2=A0<b>Xen version 4=
.11.1-pre </b>and linux as mentioned in above link.</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_def=
ault" style=3D"color:rgb(11,83,148)">But, After flashing, I ended up with s=
econdary CPUs errors and linux Dom0 errors.</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">Please give some suggestions to start xen=
 with all CPUs.=C2=A0</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)"><br></div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">Please check below log:</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">--------------------------------</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">=C2=A0Using modules provided by=
 bootloader in FDT</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">Xen 4.11.1-pre (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72) EF=
I loader</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
=C2=A0Xen 4.11.1-pre</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">(XEN) Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-g=
cc (Linaro GCC 7.1-2017.05) 7.1.1 20170510) debug=3Dn=C2=A0 Sat Aug 11 20:3=
5:10 IST 201</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)">8</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=
 Latest ChangeSet: Mon Jul 30 11:30:09 2018 +0200 git:33ced72</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Processor: 410fd0=
34: &quot;ARM Limited&quot;, variant: 0x0, part 0xd03, rev 0x4</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) 64-bit Execution=
:</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=C2=
=A0 =C2=A0Processor Features: 0000000000002222 0000000000000000</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =
=C2=A0Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =
=C2=A0Extensions: FloatingPoint AdvancedSIMD</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0Debug Features: 000000=
0010305106 0000000000000000</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0Auxiliary Features: 0000000000000000 00=
00000000000000</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,1=
48)">(XEN)=C2=A0 =C2=A0Memory Model Features: 0000000000001122 000000000000=
0000</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=
=C2=A0 =C2=A0ISA Features:=C2=A0 0000000000011120 0000000000000000</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) 32-bit Execu=
tion:</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN=
)=C2=A0 =C2=A0Processor Features: 00000131:00011011</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =C2=A0Instruct=
ion Sets: AArch32 A32 Thumb Thumb-2 Jazelle</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =C2=A0Extensions: Gene=
ricTimer Security</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">(XEN)=C2=A0 =C2=A0Debug Features: 03010066</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0Auxiliary Featur=
es: 00000000</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)">(XEN)=C2=A0 =C2=A0Memory Model Features: 10201105 40000000 01260000 0210=
2211</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=
=C2=A0 ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Usin=
g SMC Calling Convention v1.1</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">(XEN) Using PSCI v1.1</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">(XEN) SMP: Allowing 8 CPUs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Generic Timer IRQ: =
phys=3D30 hyp=3D26 virt=3D27 Freq: 1920 KHz</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">(XEN) GICv2 initialization:</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gic_dist_addr=3D00000000e82b1000</div><div class=3D"gmail_=
default" style=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0gic_cpu_addr=3D00000000e82b2000</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_hyp_=
addr=3D00000000e82b4000</div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_vcpu_addr=3D000000=
00e82b6000</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"=
>(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_maintenance_irq=3D25</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) GICv2: 384 lin=
es, 8 cpus, secure (IID 0200143b).</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">(XEN) Using scheduler: SMP Credit Scheduler (cred=
it)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) =
Allocated console ring of 64 KiB.</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">(XEN) Bringing up CPU1</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">(XEN) Failed to bring up CPU1</div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Failed to =
bring up CPU 1 (error -9)</div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">(XEN) Bringing up CPU2</div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">(XEN) Failed to bring up CPU2</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Failed to bring up =
CPU 2 (error -9)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">(XEN) Bringing up CPU3</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">(XEN) Failed to bring up CPU3</div><div class=3D"gmail_=
default" style=3D"color:rgb(11,83,148)">(XEN) Failed to bring up CPU 3 (err=
or -9)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XE=
N) Bringing up CPU4</div><div class=3D"gmail_default" style=3D"color:rgb(11=
,83,148)">(XEN) Failed to bring up CPU4</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)">(XEN) Failed to bring up CPU 4 (error -9)</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Bringin=
g up CPU5</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
(XEN) Failed to bring up CPU5</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">(XEN) Failed to bring up CPU 5 (error -9)</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Bringing up CPU6<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Fail=
ed to bring up CPU6</div><div class=3D"gmail_default" style=3D"color:rgb(11=
,83,148)">(XEN) Failed to bring up CPU 6 (error -9)</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">(XEN) Bringing up CPU7</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Failed to brin=
g up CPU7</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
(XEN) Failed to bring up CPU 7 (error -9)</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">(XEN) Brought up 1 CPUs</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">(XEN) P2M: 40-bit IPA with 40=
-bit PA and 8-bit VMID</div><div class=3D"gmail_default" style=3D"color:rgb=
(11,83,148)">(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558</div><d=
iv class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) I/O virtual=
isation disabled</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">(XEN) build-id: fa5f17a58e5d75750920185c7944c71cbea9de1d</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) alternatives: P=
atching with alt table 00000000400acfc8 -&gt; 00000000400ad544</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) *** LOADING DOMA=
IN 0 ***</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(=
XEN) Loading kernel from boot module @ 00000000b8887000</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Allocating 1:1 mappings=
 totalling 512MB for dom0:</div><div class=3D"gmail_default" style=3D"color=
:rgb(11,83,148)">(XEN) BANK[0] 0x000000c0000000-0x000000e0000000 (512MB)</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Grant =
table range: 0x0000021fe00000-0x0000021fe40000</div><div class=3D"gmail_def=
ault" style=3D"color:rgb(11,83,148)">(XEN) Allocating PPI 16 for event chan=
nel interrupt</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">(XEN) Loading zImage from 00000000b8887000 to 00000000c0080000-00000000=
c1187200</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(=
XEN) Loading dom0 DTB to 0x00000000c8000000-0x00000000c800a4db</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Initial low memo=
ry virq threshold set at 0x4000 pages.</div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">(XEN) Scrubbing Free RAM on 1 nodes using 1 CP=
Us</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) .=
...................................................................done.</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) Std. L=
oglevel: All</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)">(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)</div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) **********=
*****************************************</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">(XEN) PLEASE SPECIFY dom0_mem PARAMETER - U=
SING 512M FOR NOW</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">(XEN) ***************************************************</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) 3... 2... 1..=
.=C2=A0</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(X=
EN) *** Serial input -&gt; DOM0 (type &#39;CTRL-a&#39; three times to switc=
h input to Xen)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,=
148)">(XEN) Freed 292kB init memory.</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">(XEN) d0v0: vGICD: unhandled word write 0xffffff=
ff to ICACTIVER4</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) d0v0: v=
GICD: unhandled word write 0xffffffff to ICACTIVER12</div><div class=3D"gma=
il_default" style=3D"color:rgb(11,83,148)">(XEN) d0v0: vGICD: unhandled wor=
d write 0xffffffff to ICACTIVER16</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">(XEN) d0v0: vGICD: unhandled word write 0xfffffff=
f to ICACTIVER20</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER24</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">(XEN) d0v0: =
vGICD: unhandled word write 0xffffffff to ICACTIVER28</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">(XEN) d0v0: vGICD: unhandled wo=
rd write 0xffffffff to ICACTIVER32</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">(XEN) d0v0: vGICD: unhandled word write 0xfffffff=
f to ICACTIVER36</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.000000] Booting Linux on physical CPU 0x0</div><div class=3D"gmail_de=
fault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] Linux versio=
n 4.14.0-rc7-linaro-hikey960+ (omkar.bolla@OmkarB-LaptopU) (gcc version 7.1=
.1 20170510 (Linaro GCC 7.1-2017.05)) #7 S</div><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)">MP PREEMPT Fri Aug 10 23:06:10 IST 2018</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]</div><div class=3D"gma=
il_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] Machine=
 model: HiKey960</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 0.000000] Xen 4.11 support found</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] efi: =
Getting EFI parameters from FDT:</div><div class=3D"gmail_default" style=3D=
"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] efi: UEFI not found.</div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0=
.000000] cma: Reserved 16 MiB at 0x00000000df000000</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] NUMA: No=
 NUMA configuration found</div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] NUMA: Faking a node at [mem 0x0000=
000000000000-0x00000000dfffffff]</div><div class=3D"gmail_default" style=3D=
"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] NUMA: NODE_DATA [mem 0xdefb=
6800-0xdefb82ff]</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 0.000000] Zone ranges:</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0DMA=
=C2=A0 =C2=A0 =C2=A0 [mem 0x00000000c0000000-0x00000000dfffffff]</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000=
000]=C2=A0 =C2=A0Normal=C2=A0 =C2=A0empty</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] Movable zone start=
 for each node</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,1=
48)">[=C2=A0 =C2=A0 0.000000] Early memory node ranges</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0=
 =C2=A0node=C2=A0 =C2=A00: [mem 0x00000000c0000000-0x00000000dfffffff]</div=
><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0=
 0.000000] Initmem setup node 0 [mem 0x00000000c0000000-0x00000000dfffffff]=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.000000] psci: probing for conduit method from DT.</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] =
psci: PSCIv1.1 detected in firmware.</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] psci: Using standard PS=
CI v0.2 function IDs</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">[=C2=A0 =C2=A0 0.000000] psci: Trusted OS migration not required=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.000000] percpu: Embedded 23 pages/cpu @ffff80001ef9c000 s55448 r81=
92 d30568 u94208</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 0.000000] Detected VIPT I-cache on CPU0</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000=
] CPU features: enabling workaround for ARM erratum 845719</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] =
Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 129024</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.0=
00000] Policy zone: DMA</div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">[=C2=A0 =C2=A0 0.000000] Kernel command line: console=3Dtty0 =
console=3Dhvc0 root=3D/dev/sdd10 rw efi=3Dnoruntime</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] PID hash=
 table entries: 2048 (order: 2, 16384 bytes)</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] Memory: 473192K=
/524288K available (10364K kernel code, 1180K rwdata, 4664K rodata, 1152K i=
nit, 405K bss, 34712K reserved, 16384K=C2=A0</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">cma-reserved)</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] Virtual ker=
nel memory layout:</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0modules : 0xffff000000=
000000 - 0xffff000008000000=C2=A0 =C2=A0(=C2=A0 =C2=A0128 MB)</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000=
]=C2=A0 =C2=A0 =C2=A0vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000=C2=
=A0 =C2=A0(129022 GB)</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.text : 0xff=
ff000008080000 - 0xffff000008aa0000=C2=A0 =C2=A0( 10368 KB)</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=
=C2=A0 =C2=A0 =C2=A0.rodata : 0xffff000008aa0000 - 0xffff000008f40000=C2=A0=
 =C2=A0(=C2=A0 4736 KB)</div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.init : 0x=
ffff000008f40000 - 0xffff000009060000=C2=A0 =C2=A0(=C2=A0 1152 KB)</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.0=
00000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.data : 0xffff000009060000 - 0xffff0000091=
87200=C2=A0 =C2=A0(=C2=A0 1181 KB)</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .bss : 0xffff000009187200 - 0xffff0000091ec9e0=C2=A0 =C2=A0(=C2=A0 =C2=
=A0406 KB)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"=
>[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0fixed=C2=A0 =C2=A0: 0xffff7dff=
fe7fd000 - 0xffff7dfffec00000=C2=A0 =C2=A0(=C2=A0 4108 KB)</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=
=C2=A0 =C2=A0 =C2=A0PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000=C2=A0=
 =C2=A0(=C2=A0 =C2=A0 16 MB)</div><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0vmemmap : 0x=
ffff7e0000000000 - 0xffff800000000000=C2=A0 =C2=A0(=C2=A0 2048 GB maximum)<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xff=
ff7e0000000000 - 0xffff7e0000800000=C2=A0 =C2=A0(=C2=A0 =C2=A0 =C2=A08 MB a=
ctual)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0memory=C2=A0 : 0xffff80000000000=
0 - 0xffff800020000000=C2=A0 =C2=A0(=C2=A0 =C2=A0512 MB)</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000] SLU=
B: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.00=
0000] Preemptible hierarchical RCU implementation.</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0 RCU=
 restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D1.</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000000]=C2=A0=
 Tasks RCU enabled.</div><div class=3D"gmail_default" style=3D"color:rgb(11=
,83,148)">[=C2=A0 =C2=A0 0.000000] RCU: Adjusting geometry for rcu_fanout_l=
eaf=3D16, nr_cpu_ids=3D1</div><div class=3D"gmail_default" style=3D"color:r=
gb(11,83,148)">[=C2=A0 =C2=A0 0.000000] NR_IRQS: 64, nr_irqs: 64, prealloca=
ted irqs: 0</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">[=C2=A0 =C2=A0 0.000000] arch_timer: cp15 timer(s) running at 1.92MHz (vi=
rt).</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff =
max_cycles: 0x1c570327e, max_idle_ns: 1763180809505 ns</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000004] sched=
_clock: 56 bits at 1920kHz, resolution 520ns, wraps every 4398046510977ns</=
div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.000101] clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 58334160866034 ns</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.000560] Console: colour dummy de=
vice 80x25</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"=
>[=C2=A0 =C2=A0 0.000846] console [tty0] enabled</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.343934] console [hv=
c0] enabled</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">[=C2=A0 =C2=A0 0.347479] Calibrating delay loop (skipped), value calculat=
ed using timer frequency.. 3.84 BogoMIPS (lpj=3D7680)</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.357565] pid_ma=
x: default: 32768 minimum: 301</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 0.362297] Security Framework initialize=
d</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.366580] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 0.373521] Inode-cache hash table entries: 32768 (order: 6, 26214=
4 bytes)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 0.380393] Mount-cache hash table entries: 1024 (order: 1, 819=
2 bytes)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 0.387061] Mountpoint-cache hash table entries: 1024 (order: 1=
, 8192 bytes)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 0.410306] calling=C2=A0 cpu_suspend_init+0x0/0x4c @ 1</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.415027] initcall cpu_suspend_init+0x0/0x4c returned 0 after 0 usecs</=
div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.421703] calling=C2=A0 asids_init+0x0/0xc0 @ 1</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.426028] ASID all=
ocator initialised with 65536 entries</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.431488] initcall asids_init+0x=
0/0xc0 returned 0 after 3906 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.437907] calling=C2=A0 xen_guest_=
init+0x0/0x2f4 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 0.443420] xen:grant_table: Grant tables using versi=
on 1 layout</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">[=C2=A0 =C2=A0 0.449353] Grant table initialized</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.452910] xen:event=
s: Using FIFO-based ABI</div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">[=C2=A0 =C2=A0 0.457310] Xen: initializing cpu0</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.460730=
] initcall xen_guest_init+0x0/0x2f4 returned 0 after 7812 usecs</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.4675=
53] calling=C2=A0 spawn_ksoftirqd+0x0/0x50 @ 1</div><div class=3D"gmail_def=
ault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.480345] initcall spaw=
n_ksoftirqd+0x0/0x50 returned 0 after 7812 usecs</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.487046] calling=C2=
=A0 migration_init+0x0/0x4c @ 1</div><div class=3D"gmail_default" style=3D"=
color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.491722] initcall migration_init+0x0/=
0x4c returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 0.498227] calling=C2=A0 check_cpu_stall_=
init+0x0/0x2c @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 0.503429] initcall check_cpu_stall_init+0x0/0x2c ret=
urned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 0.510456] calling=C2=A0 srcu_bootup_announce+0x0=
/0x40 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
[=C2=A0 =C2=A0 0.515651] Hierarchical SRCU implementation.</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.520078] =
initcall srcu_bootup_announce+0x0/0x40 returned 0 after 3906 usecs</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.5=
27363] calling=C2=A0 rcu_spawn_gp_kthread+0x0/0x12c @ 1</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.532752] init=
call rcu_spawn_gp_kthread+0x0/0x12c returned 0 after 0 usecs</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.539769]=
 calling=C2=A0 cpu_stop_init+0x0/0xd4 @ 1</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.552404] initcall cpu_stop_=
init+0x0/0xd4 returned 0 after 7812 usecs</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.558929] calling=C2=A0 jump=
_label_init_module+0x0/0x1c @ 1</div><div class=3D"gmail_default" style=3D"=
color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.564304] initcall jump_label_init_mod=
ule+0x0/0x1c returned 0 after 0 usecs</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.571502] calling=C2=A0 its_pci_=
msi_init+0x0/0xb4 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 0.576675] initcall its_pci_msi_init+0x0/0xb4 ret=
urned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 0.583196] calling=C2=A0 its_pmsi_init+0x0/0x98 @=
 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0=
 =C2=A0 0.587905] initcall its_pmsi_init+0x0/0x98 returned 0 after 0 usecs<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.594214] calling=C2=A0 renesas_soc_init+0x0/0x1dc @ 1</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.599154=
] initcall renesas_soc_init+0x0/0x1dc returned -19 after 0 usecs</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.606=
090] calling=C2=A0 rcar_sysc_pd_init+0x0/0x2e4 @ 1</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.611214] initcall =
rcar_sysc_pd_init+0x0/0x2e4 returned -19 after 0 usecs</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.618143] calli=
ng=C2=A0 tegra_init_fuse+0x0/0x150 @ 1</div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.623138] initcall tegra_init_f=
use+0x0/0x150 returned 0 after 0 usecs</div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.629677] calling=C2=A0 tegra_f=
lowctrl_init+0x0/0x88 @ 1</div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">[=C2=A0 =C2=A0 0.634802] initcall tegra_flowctrl_init+0x0/0=
x88 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)">[=C2=A0 =C2=A0 0.641730] calling=C2=A0 tegra_pmc_early_i=
nit+0x0/0x540 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 0.647243] initcall tegra_pmc_early_init+0x0/0x540 re=
turned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb=
(11,83,148)">[=C2=A0 =C2=A0 0.654203] calling=C2=A0 rand_initialize+0x0/0x1=
28 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 0.659132] initcall rand_initialize+0x0/0x128 returned 0 after=
 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 0.665734] calling=C2=A0 arm_enable_runtime_services+0x0/0x1f8=
 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 0.671622] EFI services will not be available.</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.676222] ini=
tcall arm_enable_runtime_services+0x0/0x1f8 returned 0 after 3906 usecs</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.684204] calling=C2=A0 dummy_timer_register+0x0/0x34 @ 1</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.689414=
] initcall dummy_timer_register+0x0/0x34 returned 0 after 0 usecs</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.70=
4455] smp: Bringing up secondary CPUs ...</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.708893] smp: Brought up 1 =
node, 1 CPU</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">[=C2=A0 =C2=A0 0.712966] SMP: Total of 1 processors activated.</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.717=
744] CPU features: detected feature: 32-bit EL0 Support</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.723709] CPU:=
 All CPU(s) started at EL1</div><div class=3D"gmail_default" style=3D"color=
:rgb(11,83,148)">[=C2=A0 =C2=A0 0.727814] alternatives: patching kernel cod=
e</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.733313] devtmpfs: initialized</div><div class=3D"gmail_default" st=
yle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.741654] calling=C2=A0 ipc_ns_=
init+0x0/0x60 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 0.745994] random: get_random_u32 called from bucket_=
table_alloc+0x108/0x258 with crng_init=3D0</div><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.754631] initcall ipc_ns_i=
nit+0x0/0x60 returned 0 after 3906 usecs</div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.761132] calling=C2=A0 init_=
mmap_min_addr+0x0/0x18 @ 1</div><div class=3D"gmail_default" style=3D"color=
:rgb(11,83,148)">[=C2=A0 =C2=A0 0.766152] initcall init_mmap_min_addr+0x0/0=
x18 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)">[=C2=A0 =C2=A0 0.773010] calling=C2=A0 init_cpufreq_tran=
sition_notifier_list+0x0/0x34 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.779712] initcall init_cpufreq_tr=
ansition_notifier_list+0x0/0x34 returned 0 after 0 usecs</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.788182] cal=
ling=C2=A0 net_ns_init+0x0/0x154 @ 1</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.796768] initcall net_ns_init+0x=
0/0x154 returned 0 after 3906 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.803286] calling=C2=A0 fpsimd_ini=
t+0x0/0x80 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,1=
48)">[=C2=A0 =C2=A0 0.807635] initcall fpsimd_init+0x0/0x80 returned 0 afte=
r 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
[=C2=A0 =C2=A0 0.813868] calling=C2=A0 enable_mrs_emulation+0x0/0x24 @ 1</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.819074] initcall enable_mrs_emulation+0x0/0x24 returned 0 after 0 use=
cs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0=
 =C2=A0 0.826102] calling=C2=A0 cpu_hotplug_pm_sync_init+0x0/0x24 @ 1</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
0.831650] initcall cpu_hotplug_pm_sync_init+0x0/0x24 returned 0 after 0 use=
cs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0=
 =C2=A0 0.839017] calling=C2=A0 alloc_frozen_cpus+0x0/0x8 @ 1</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.843872=
] initcall alloc_frozen_cpus+0x0/0x8 returned 0 after 0 usecs</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.850555=
] calling=C2=A0 wq_sysfs_init+0x0/0x40 @ 1</div><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.855309] initcall wq_sysfs=
_init+0x0/0x40 returned 0 after 0 usecs</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.861583] calling=C2=A0 ksysfs=
_init+0x0/0xc0 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 0.866082] initcall ksysfs_init+0x0/0xc0 returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 0.872404] random: fast init done</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.875724] calling=
=C2=A0 pm_init+0x0/0x80 @ 1</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 0.879891] initcall pm_init+0x0/0x80 return=
ed 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 0.885715] calling=C2=A0 pm_disk_init+0x0/0x24 @ 1</=
div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 0.890252] initcall pm_disk_init+0x0/0x24 returned 0 after 0 usecs</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
0.896558] calling=C2=A0 swsusp_header_init+0x0/0x40 @ 1</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.901581] init=
call swsusp_header_init+0x0/0x40 returned 0 after 0 usecs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.908427] =
calling=C2=A0 rcu_set_runtime_mode+0x0/0x14 @ 1</div><div class=3D"gmail_de=
fault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.913628] initcall rcu=
_set_runtime_mode+0x0/0x14 returned 0 after 0 usecs</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.920653] calling=
=C2=A0 init_jiffies_clocksource+0x0/0x24 @ 1</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.926206] clocksource: ji=
ffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 76450417851000=
00 ns</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 0.936007] initcall init_jiffies_clocksource+0x0/0x24 returned 0 =
after 3906 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 0.943634] calling=C2=A0 futex_init+0x0/0x100 @ 1</div=
><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0=
 0.948075] futex hash table entries: 256 (order: 3, 32768 bytes)</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.954=
244] initcall futex_init+0x0/0x100 returned 0 after 3906 usecs</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.96071=
7] calling=C2=A0 cgroup_wq_init+0x0/0x40 @ 1</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.965409] initcall cgroup=
_wq_init+0x0/0x40 returned 0 after 0 usecs</div><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.971903] calling=C2=A0 cgr=
oup1_wq_init+0x0/0x40 @ 1</div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">[=C2=A0 =C2=A0 0.976680] initcall cgroup1_wq_init+0x0/0x40 =
returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:r=
gb(11,83,148)">[=C2=A0 =C2=A0 0.983270] calling=C2=A0 cpu_pm_init+0x0/0x20 =
@ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 0.987688] initcall cpu_pm_init+0x0/0x20 returned 0 after 0 usecs=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 0.993932] calling=C2=A0 init_per_zone_wmark_min+0x0/0x7c @ 1</div><d=
iv class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 0.=
999408] initcall init_per_zone_wmark_min+0x0/0x7c returned 0 after 0 usecs<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 1.006680] calling=C2=A0 init_zero_pfn+0x0/0x28 @ 1</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.011274] =
initcall init_zero_pfn+0x0/0x28 returned 0 after 0 usecs</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.017692] cal=
ling=C2=A0 cma_init_reserved_areas+0x0/0x1d0 @ 1</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.023632] initcall cm=
a_init_reserved_areas+0x0/0x1d0 returned 0 after 0 usecs</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.030858] cal=
ling=C2=A0 fsnotify_init+0x0/0x54 @ 1</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.035474] initcall fsnotify_init=
+0x0/0x54 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.041860] calling=C2=A0 filelock_i=
nit+0x0/0xc4 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 1.046485] initcall filelock_init+0x0/0xc4 returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.052873] calling=C2=A0 init_script_binfmt+0x0/0x24 @ 1<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 1.057906] initcall init_script_binfmt+0x0/0x24 returned 0 after 0 us=
ecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.064753] calling=C2=A0 init_elf_binfmt+0x0/0x24 @ 1</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.0695=
23] initcall init_elf_binfmt+0x0/0x24 returned 0 after 0 usecs</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.07611=
4] calling=C2=A0 init_compat_elf_binfmt+0x0/0x24 @ 1</div><div class=3D"gma=
il_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.081492] initcal=
l init_compat_elf_binfmt+0x0/0x24 returned 0 after 0 usecs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.088688] =
calling=C2=A0 configfs_init+0x0/0xb4 @ 1</div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.093317] initcall configfs_i=
nit+0x0/0xb4 returned 0 after 0 usecs</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.099704] calling=C2=A0 debugfs_=
init+0x0/0x74 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 1.104217] initcall debugfs_init+0x0/0x74 returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.110545] calling=C2=A0 prandom_init+0x0/0x164 @ 1</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
1.115142] initcall prandom_init+0x0/0x164 returned 0 after 0 usecs</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.1=
21556] calling=C2=A0 pinctrl_init+0x0/0xc0 @ 1</div><div class=3D"gmail_def=
ault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.126059] pinctrl core:=
 initialized pinctrl subsystem</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.131472] initcall pinctrl_init+0x0/0xc=
0 returned 0 after 3906 usecs</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.137947] calling=C2=A0 gpiolib_dev_init=
+0x0/0xec @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.143018] initcall gpiolib_dev_init+0x0/0xec returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.149719] calling=C2=A0 hi3516cv300_crg_init+0x0/0x20 @ =
1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 1.154893] initcall hi3516cv300_crg_init+0x0/0x20 returned 0 after 0 =
usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.161829] calling=C2=A0 hi3519_clk_init+0x0/0x20 @ 1</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.1666=
18] initcall hi3519_clk_init+0x0/0x20 returned 0 after 0 usecs</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.17318=
5] calling=C2=A0 hi3660_clk_init+0x0/0x20 @ 1</div><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.177956] initcall hi366=
0_clk_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.184536] calling=C2=A0 h=
i3798cv200_crg_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D=
"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.189753] initcall hi3798cv200_crg_in=
it+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.196764] calling=C2=A0 gcc_ipq80=
74_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">[=C2=A0 =C2=A0 1.201631] initcall gcc_ipq8074_init+0x0/0x20 retu=
rned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">[=C2=A0 =C2=A0 1.208297] calling=C2=A0 gcc_msm8916_init+0x0/0x20=
 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.213164] initcall gcc_msm8916_init+0x0/0x20 returned 0 after 0 =
usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.219831] calling=C2=A0 gcc_msm8994_init+0x0/0x20 @ 1</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.224=
705] initcall gcc_msm8994_init+0x0/0x20 returned 0 after 0 usecs</div><div =
class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.231=
363] calling=C2=A0 gcc_msm8996_init+0x0/0x20 @ 1</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.236232] initcall gc=
c_msm8996_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.242898] calling=C2=
=A0 rpm_smd_clk_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.247764] initcall rpm_smd_clk_ini=
t+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.254432] calling=C2=A0 vexpress_o=
sc_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">[=C2=A0 =C2=A0 1.259384] initcall vexpress_osc_init+0x0/0x20 ret=
urned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 1.266138] calling=C2=A0 zx_clk_init+0x0/0x20 @ 1=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 1.270569] initcall zx_clk_init+0x0/0x20 returned 0 after 0 usecs</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.276806] calling=C2=A0 fsl_guts_init+0x0/0x20 @ 1</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.281411] initc=
all fsl_guts_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.287817] calling=
=C2=A0 exynos4_pm_init_power_domain+0x0/0x2f8 @ 1</div><div class=3D"gmail_=
default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.294482] initcall e=
xynos4_pm_init_power_domain+0x0/0x2f8 returned 0 after 0 usecs</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.30215=
8] calling=C2=A0 virtio_init+0x0/0x30 @ 1</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.306619] initcall virtio_in=
it+0x0/0x30 returned 0 after 0 usecs</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.312836] calling=C2=A0 regulator=
_init+0x0/0xb0 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 1.318010] initcall regulator_init+0x0/0xb0 returned=
 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 1.324619] calling=C2=A0 iommu_init+0x0/0x3c @ 1</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
1.328855] initcall iommu_init+0x0/0x3c returned 0 after 0 usecs</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.3349=
62] calling=C2=A0 opp_debug_init+0x0/0x50 @ 1</div><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.339689] initcall opp_d=
ebug_init+0x0/0x50 returned 0 after 0 usecs</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.346149] calling=C2=A0 dm=
a_init_reserved_memory+0x0/0x64 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.351699] initcall dma_init_reserv=
ed_memory+0x0/0x64 returned -12 after 0 usecs</div><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.359240] calling=C2=A0 =
soc_bus_register+0x0/0x54 @ 1</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.364132] initcall soc_bus_register+0x0/=
0x54 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.370794] calling=C2=A0 register_cpufreq=
_notifier+0x0/0x50 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb=
(11,83,148)">[=C2=A0 =C2=A0 1.376417] initcall register_cpufreq_notifier+0x=
0/0x50 returned -22 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.384046] calling=C2=A0 vexpress_s=
yscfg_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">[=C2=A0 =C2=A0 1.389284] initcall vexpress_syscfg_init+0x0/0x=
20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 1.396290] calling=C2=A0 vexpress_sysreg_in=
it+0x0/0x70 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,=
148)">[=C2=A0 =C2=A0 1.401831] initcall vexpress_sysreg_init+0x0/0x70 retur=
ned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11=
,83,148)">[=C2=A0 =C2=A0 1.408731] calling=C2=A0 cpufreq_core_init+0x0/0x68=
 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.413658] initcall cpufreq_core_init+0x0/0x68 returned -19 after=
 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 1.420583] calling=C2=A0 cpuidle_init+0x0/0x58 @ 1</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.4250=
97] initcall cpuidle_init+0x0/0x58 returned -19 after 0 usecs</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.431600=
] calling=C2=A0 capsule_reboot_register+0x0/0x20 @ 1</div><div class=3D"gma=
il_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.437065] initcal=
l capsule_reboot_register+0x0/0x20 returned 0 after 0 usecs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.444341] =
calling=C2=A0 arm_dmi_init+0x0/0x28 @ 1</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.448846] DMI not present or i=
nvalid.</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 1.452746] initcall arm_dmi_init+0x0/0x28 returned 0 after 0 u=
secs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.459081] calling=C2=A0 tegra_bpmp_init+0x0/0x20 @ 1</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.4638=
84] initcall tegra_bpmp_init+0x0/0x20 returned 0 after 0 usecs</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.47046=
3] calling=C2=A0 hi6220_mbox_init+0x0/0x20 @ 1</div><div class=3D"gmail_def=
ault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.475337] initcall hi62=
20_mbox_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_def=
ault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.482001] calling=C2=A0=
 hi3660_mbox_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.486880] initcall hi3660_mbox_init+0x0=
/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.493536] calling=C2=A0 tegra_hsp_init+=
0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)">[=C2=A0 =C2=A0 1.498233] initcall tegra_hsp_init+0x0/0x20 returned 0 aft=
er 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"=
>[=C2=A0 =C2=A0 1.504722] calling=C2=A0 sock_init+0x0/0xc0 @ 1</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.50923=
0] initcall sock_init+0x0/0xc0 returned 0 after 0 usecs</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.515151] call=
ing=C2=A0 net_inuse_init+0x0/0x30 @ 1</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.519846] initcall net_inuse_ini=
t+0x0/0x30 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.526336] calling=C2=A0 net_defaul=
ts_init+0x0/0x30 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">[=C2=A0 =C2=A0 1.531280] initcall net_defaults_init+0x0/0x30 ret=
urned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 1.538040] calling=C2=A0 init_default_flow_dissec=
tors+0x0/0x54 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 1.543939] initcall init_default_flow_dissectors+0x0/=
0x54 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.551654] calling=C2=A0 netlink_proto_in=
it+0x0/0x178 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 1.556848] NET: Registered protocol family 16</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.5=
61322] initcall netlink_proto_init+0x0/0x178 returned 0 after 3906 usecs</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.568482] calling=C2=A0 __gnttab_init+0x0/0x38 @ 1</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.573071] initc=
all __gnttab_init+0x0/0x38 returned 0 after 0 usecs</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.579651] calling=
=C2=A0 debug_monitors_init+0x0/0x38 @ 1</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.584652] initcall debug_monit=
ors_init+0x0/0x38 returned 0 after 0 usecs</div><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.591555] calling=C2=A0 irq=
_sysfs_init+0x0/0xb0 @ 1</div><div class=3D"gmail_default" style=3D"color:r=
gb(11,83,148)">[=C2=A0 =C2=A0 1.596302] initcall irq_sysfs_init+0x0/0xb0 re=
turned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb=
(11,83,148)">[=C2=A0 =C2=A0 1.602738] calling=C2=A0 bdi_class_init+0x0/0x78=
 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.607484] initcall bdi_class_init+0x0/0x78 returned 0 after 0 us=
ecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.613964] calling=C2=A0 mm_sysfs_init+0x0/0x3c @ 1</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.618532=
] initcall mm_sysfs_init+0x0/0x3c returned 0 after 0 usecs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.624943] =
calling=C2=A0 irqc_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" styl=
e=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.629233] initcall irqc_init+0x0/=
0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.635279] calling=C2=A0 vexpress_config_=
init+0x0/0xf0 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 1.640830] initcall vexpress_config_init+0x0/0xf0 ret=
urned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 1.647705] calling=C2=A0 rockchip_pinctrl_drv_reg=
ister+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 1.653732] initcall rockchip_pinctrl_drv_register+0x=
0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"=
color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.661513] calling=C2=A0 samsung_pinctr=
l_drv_register+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 1.667420] initcall samsung_pinctrl_drv_reg=
ister+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.675128] calling=C2=A0 sh_pfc=
_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">[=C2=A0 =C2=A0 1.679565] initcall sh_pfc_init+0x0/0x20 returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.685791] calling=C2=A0 tegra_gpio_init+0x0/0x20 @ 1</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.690580] initcall tegra_gpio_init+0x0/0x20 returned 0 after 0 usecs</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.697151] calling=C2=A0 pcibus_class_init+0x0/0x24 @ 1</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.702109] =
initcall pcibus_class_init+0x0/0x24 returned 0 after 0 usecs</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.708861]=
 calling=C2=A0 pci_driver_init+0x0/0x1c @ 1</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.713661] initcall pci_dri=
ver_init+0x0/0x1c returned 0 after 0 usecs</div><div class=3D"gmail_default=
" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.720218] calling=C2=A0 bac=
klight_class_init+0x0/0xbc @ 1</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.725432] initcall backlight_class_init=
+0x0/0xbc returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.732447] calling=C2=A0 amba_init+=
0x0/0x1c @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)">[=C2=A0 =C2=A0 1.736711] initcall amba_init+0x0/0x1c returned 0 after 0 =
usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 1.742767] calling=C2=A0 rockchip_grf_init+0x0/0xf8 @ 1</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.74=
8087] initcall rockchip_grf_init+0x0/0xf8 returned -19 after 0 usecs</div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1=
.754874] calling=C2=A0 rockchip_pm_domain_drv_register+0x0/0x20 @ 1</div><d=
iv class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.=
761071] initcall rockchip_pm_domain_drv_register+0x0/0x20 returned 0 after =
0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 1.769029] calling=C2=A0 exynos_pmu_init+0x0/0x20 @ 1</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.7=
73808] initcall exynos_pmu_init+0x0/0x20 returned 0 after 0 usecs</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.78=
0388] calling=C2=A0 xenbus_init+0x0/0x2d4 @ 1</div><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.785163] initcall xenbu=
s_init+0x0/0x2d4 returned 0 after 0 usecs</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.791348] calling=C2=A0 hi62=
20_reset_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color=
:rgb(11,83,148)">[=C2=A0 =C2=A0 1.796363] initcall hi6220_reset_init+0x0/0x=
20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 1.803073] calling=C2=A0 tty_class_init+0x0=
/0x58 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
[=C2=A0 =C2=A0 1.807767] initcall tty_class_init+0x0/0x58 returned 0 after =
0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 1.814258] calling=C2=A0 vtconsole_class_init+0x0/0xf8 @ 1</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.819561] initcall vtconsole_class_init+0x0/0xf8 returned 0 after 0 use=
cs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0=
 =C2=A0 1.826509] calling=C2=A0 serdev_init+0x0/0x2c @ 1</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.830929] ini=
tcall serdev_init+0x0/0x2c returned 0 after 0 usecs</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.837149] calling=
=C2=A0 iommu_dev_init+0x0/0x24 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.841869] initcall iommu_dev_init+=
0x0/0x24 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.848338] calling=C2=A0 mipi_dsi_b=
us_init+0x0/0x1c @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(1=
1,83,148)">[=C2=A0 =C2=A0 1.853297] initcall mipi_dsi_bus_init+0x0/0x1c ret=
urned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 1.860042] calling=C2=A0 wakeup_sources_debugfs_i=
nit+0x0/0x34 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 1.865867] initcall wakeup_sources_debugfs_init+0x0/0x=
34 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 1.873469] calling=C2=A0 register_node_type=
+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.878557] initcall register_node_type+0x0/0x20 returned =
0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,=
148)">[=C2=A0 =C2=A0 1.885363] calling=C2=A0 regmap_initcall+0x0/0x18 @ 1</=
div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.890123] initcall regmap_initcall+0x0/0x18 returned 0 after 0 usecs</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 1.896705] calling=C2=A0 sram_init+0x0/0x20 @ 1</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.900991] initcall =
sram_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.907041] calling=C2=A0 sy=
scon_init+0x0/0x24 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb=
(11,83,148)">[=C2=A0 =C2=A0 1.911479] initcall syscon_init+0x0/0x24 returne=
d 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 1.917709] calling=C2=A0 spi_init+0x0/0xb0 @ 1</div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1=
.921920] initcall spi_init+0x0/0xb0 returned 0 after 0 usecs</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.927873]=
 calling=C2=A0 spmi_init+0x0/0x30 @ 1</div><div class=3D"gmail_default" sty=
le=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.932127] initcall spmi_init+0x0=
/0x30 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 1.938179] calling=C2=A0 i2c_init+0x0/0x=
f0 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 1.942404] initcall i2c_init+0x0/0xf0 returned 0 after 0 usecs=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 1.948340] calling=C2=A0 init_menu+0x0/0x1c @ 1</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.952557] initca=
ll init_menu+0x0/0x1c returned -19 after 0 usecs</div><div class=3D"gmail_d=
efault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.958802] calling=C2=
=A0 pcc_init+0x0/0x368 @ 1</div><div class=3D"gmail_default" style=3D"color=
:rgb(11,83,148)">[=C2=A0 =C2=A0 1.963059] initcall pcc_init+0x0/0x368 retur=
ned -19 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">[=C2=A0 =C2=A0 1.969290] calling=C2=A0 qcom_hwspinlock_init+0x0=
/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
[=C2=A0 =C2=A0 1.974523] initcall qcom_hwspinlock_init+0x0/0x20 returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 1.981534] calling=C2=A0 rpmsg_init+0x0/0x4c @ 1</div><di=
v class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.9=
85887] initcall rpmsg_init+0x0/0x4c returned 0 after 0 usecs</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.992032]=
 calling=C2=A0 kobject_uevent_init+0x0/0x20 @ 1</div><div class=3D"gmail_de=
fault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 1.997166] initcall kob=
ject_uevent_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.004065] calling=
=C2=A0 of_iommu_init+0x0/0x88 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.009244] initcall of_iommu_init+0=
x0/0x88 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D=
"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.015676] calling=C2=A0 debug_traps_i=
nit+0x0/0x54 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 2.020387] initcall debug_traps_init+0x0/0x54 returned=
 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 2.027056] calling=C2=A0 vdso_init+0x0/0x13c @ 1</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
2.031388] vdso: 2 pages (1 code @ ffff000008aa6000, 1 data @ ffff0000090650=
00)</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=
=A0 =C2=A0 2.038852] initcall vdso_init+0x0/0x13c returned 0 after 3906 use=
cs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0=
 =C2=A0 2.045264] calling=C2=A0 alloc_vectors_page+0x0/0xb8 @ 1</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.0503=
01] initcall alloc_vectors_page+0x0/0xb8 returned 0 after 0 usecs</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.05=
7146] calling=C2=A0 arch_hw_breakpoint_init+0x0/0xf0 @ 1</div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.062608] hw-=
breakpoint: found 6 breakpoint and 4 watchpoint registers.</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.069525] =
initcall arch_hw_breakpoint_init+0x0/0xf0 returned 0 after 3906 usecs</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
2.077005] calling=C2=A0 __iommu_dma_init+0x0/0x14 @ 1</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.081932] initca=
ll __iommu_dma_init+0x0/0x14 returned 0 after 0 usecs</div><div class=3D"gm=
ail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.088535] callin=
g=C2=A0 arm64_dma_init+0x0/0x48 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.093821] DMA: preallocated 256 Ki=
B pool for atomic allocations</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 2.099822] initcall arm64_dma_init+0x0/0x=
48 returned 0 after 3906 usecs</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 2.106596] calling=C2=A0 p2m_init+0x0/0x=
18 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 2.110752] initcall p2m_init+0x0/0x18 returned 0 after 0 usecs=
</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 2.116734] calling=C2=A0 xen_mm_init+0x0/0x88 @ 1</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.121239] xen:=
swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB</div><=
div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2=
.129717] software IO TLB [mem 0xdd000000-0xdd400000] (4MB) mapped at [ffff8=
0001d000000-ffff80001d3fffff]</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 2.139368] initcall xen_mm_init+0x0/0x88 =
returned 0 after 7812 usecs</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 2.145869] calling=C2=A0 ns2_pinmux_init+0x=
0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"=
>[=C2=A0 =C2=A0 2.150808] initcall ns2_pinmux_init+0x0/0x20 returned 0 afte=
r 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
[=C2=A0 =C2=A0 2.157379] calling=C2=A0 ipq8074_pinctrl_init+0x0/0x20 @ 1</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 2.162500] initcall ipq8074_pinctrl_init+0x0/0x20 returned 0 after 0 use=
cs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0=
 =C2=A0 2.169498] calling=C2=A0 msm8916_pinctrl_init+0x0/0x20 @ 1</div><div=
 class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.17=
4726] initcall msm8916_pinctrl_init+0x0/0x20 returned 0 after 0 usecs</div>=
<div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 =
2.181725] calling=C2=A0 msm8994_pinctrl_init+0x0/0x20 @ 1</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.186943] =
initcall msm8994_pinctrl_init+0x0/0x20 returned 0 after 0 usecs</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.1939=
52] calling=C2=A0 msm8996_pinctrl_init+0x0/0x20 @ 1</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.199167] initcall=
 msm8996_pinctrl_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.206179] call=
ing=C2=A0 qdf2xxx_pinctrl_init+0x0/0x20 @ 1</div><div class=3D"gmail_defaul=
t" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.211396] initcall qdf2xxx=
_pinctrl_init+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_de=
fault" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.218411] calling=C2=
=A0 mtk_pinctrl_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.223275] initcall mtk_pinctrl_ini=
t+0x0/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.229946] calling=C2=A0 acpi_pci_i=
nit+0x0/0x80 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83=
,148)">[=C2=A0 =C2=A0 2.234521] initcall acpi_pci_init+0x0/0x80 returned 0 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 2.240935] calling=C2=A0 clk_mt6797_init+0x0/0x20 @ 1</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 2.245740] initcall clk_mt6797_init+0x0/0x20 returned 0 after 0 usecs</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 2.252314] calling=C2=A0 tegra_clocks_apply_init_table+0x0/0x2c @ 1</div=
><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0=
 2.258278] initcall tegra_clocks_apply_init_table+0x0/0x2c returned 0 after=
 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 2.266081] calling=C2=A0 dma_bus_init+0x0/0xfc @ 1</div><div c=
lass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.2707=
10] initcall dma_bus_init+0x0/0xfc returned 0 after 0 usecs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.276939] =
calling=C2=A0 dma_channel_table_init+0x0/0x104 @ 1</div><div class=3D"gmail=
_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.282395] initcall =
dma_channel_table_init+0x0/0x104 returned 0 after 0 usecs</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.289669] =
calling=C2=A0 qcom_smd_rpm_init+0x0/0x24 @ 1</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.294645] initcall qcom_s=
md_rpm_init+0x0/0x24 returned 0 after 0 usecs</div><div class=3D"gmail_defa=
ult" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.301392] calling=C2=A0 =
qcom_smem_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 2.306087] initcall qcom_smem_init+0x0/0x20=
 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">[=C2=A0 =C2=A0 2.312583] calling=C2=A0 setup_vcpu_hotplug_e=
vent+0x0/0x34 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,8=
3,148)">[=C2=A0 =C2=A0 2.318119] initcall setup_vcpu_hotplug_event+0x0/0x34=
 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"color:=
rgb(11,83,148)">[=C2=A0 =C2=A0 2.325484] calling=C2=A0 register_xen_amba_no=
tifier+0x0/0x5c @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11=
,83,148)">[=C2=A0 =C2=A0 2.331210] initcall register_xen_amba_notifier+0x0/=
0x5c returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 2.338752] calling=C2=A0 register_xen_pla=
tform_notifier+0x0/0x58 @ 1</div><div class=3D"gmail_default" style=3D"colo=
r:rgb(11,83,148)">[=C2=A0 =C2=A0 2.344821] initcall register_xen_platform_n=
otifier+0x0/0x58 returned 0 after 0 usecs</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.352708] calling=C2=A0 regi=
ster_xen_pci_notifier+0x0/0x4c @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.358344] initcall register_xen_pc=
i_notifier+0x0/0x4c returned 0 after 0 usecs</div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.365803] calling=C2=A0 h=
i3660_reset_init+0x0/0x20 @ 1</div><div class=3D"gmail_default" style=3D"co=
lor:rgb(11,83,148)">[=C2=A0 =C2=A0 2.370774] initcall hi3660_reset_init+0x0=
/0x20 returned 0 after 0 usecs</div><div class=3D"gmail_default" style=3D"c=
olor:rgb(11,83,148)">[=C2=A0 =C2=A0 2.377532] calling=C2=A0 pl011_init+0x0/=
0x54 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=
=C2=A0 =C2=A0 2.381845] Serial: AMBA PL011 UART driver</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.386080] initc=
all pl011_init+0x0/0x54 returned 0 after 3906 usecs</div><div class=3D"gmai=
l_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.392477] calling=
=C2=A0 mvebu_uart_init+0x0/0x5c @ 1</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.397259] initcall mvebu_uart_init=
+0x0/0x5c returned 0 after 0 usecs</div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.403814] calling=C2=A0 dmi_id_ini=
t+0x0/0x330 @ 1</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,=
148)">[=C2=A0 =C2=A0 2.408326] initcall dmi_id_init+0x0/0x330 returned -19 =
after 0 usecs</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,14=
8)">[=C2=A0 =C2=A0 2.414805] calling=C2=A0 iproc_gpio_init+0x0/0x20 @ 1</di=
v><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 2.419602] initcall iproc_gpio_init+0x0/0x20 returned 0 after 0 usecs</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=
=A0 2.426184] calling=C2=A0 of_platform_default_populate_init+0x0/0x78 @ 1<=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =
=C2=A0 2.454282] hi3660-mbox e896b000.mailbox: Mailbox enabled</div><div cl=
ass=3D"gmail_default" style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.46119=
8] uart-pl011 ffd74000.serial: could not find pctldev for node /soc/pinmux@=
e896c000/uart3_pmx_func, deferring probe</div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)">[=C2=A0 =C2=A0 2.473082] uart-pl011 fdf01000=
.serial: could not find pctldev for node /soc/pinmux@e896c000/uart4_pmx_fun=
c, deferring probe</div><div class=3D"gmail_default" style=3D"color:rgb(11,=
83,148)">ERROR:=C2=A0 =C2=A0Unhandled External Abort received on 0x80000000=
 at EL3!</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">E=
RROR:=C2=A0 =C2=A0 exception reason=3D1 syndrome=3D0x92000210</div><div cla=
ss=3D"gmail_default" style=3D"color:rgb(11,83,148)">PANIC at PC : 0x0000000=
01ac5bc28</div><div><div class=3D"gmail_default" style=3D"color:rgb(11,83,1=
48)">----------------------------------------------------------------------=
----</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br><=
/div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Thanks,</d=
iv><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">Omkar B</div=
><br></div></div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--000000000000de0e8405732a51de--


--===============3367509845032668505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3367509845032668505==--
