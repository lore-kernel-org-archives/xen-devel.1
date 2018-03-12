From: Chris Brannon <cmb@prgmr.com>
Subject: Re: xen 4.10.0: stubdomain for HVM guest fails to start
	unless qdisk backend is used?
Date: Mon, 12 Mar 2018 11:33:00 -0700
Message-ID: <87efkpp2jn.fsf@prgmr.com>
References: <87po4db7b0.fsf@prgmr.com>
 <CAFLBxZbQR+zrrbdnmNWfjs=XrdU=pB8KkJbV9z1p=k_R34M=5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZbQR+zrrbdnmNWfjs=XrdU=pB8KkJbV9z1p=k_R34M=5A@mail.gmail.com>
 (George Dunlap's message of "Mon, 12 Mar 2018 14:28:50 +0000")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

--=-=-=
Content-Type: text/plain

George Dunlap <dunlapg@umich.edu> writes:

> Can you attach the following?
>
> * the output of `xl dmesg`
> * the output of `dmesg`
> * the config file for the guest

Attached.

> I just tested stubdoms with staging-4.10 and everything works
> correctly *as long as dom0 is assigned all memory*.  If I limit the
> amount of dom0 memory to 1GiB, then stubdomains *doesn't* work with
> qdisk; only works with the defautl ("phy") backend.

Oh now that is interesting.
For what it's worth, I have seen this on both xen-4.10.0 and
stable-4.10.  I have not tried staging-4.10.

-- Chris


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=xldmesg-out.txt

 Xen 4.10.0-1_prgmr.el6
(XEN) Xen version 4.10.0-1_prgmr.el6 (cmb@centos.org) (gcc (GCC) 4.4.7 20120313 (Red Hat 4.4.7-18)) debug=n  Wed Mar  7 17:18:35 PST 2018
(XEN) Latest ChangeSet: Wed Sep 13 17:16:31 2017 +0100 git:62bd6f0-dirty
(XEN) Bootloader: GNU GRUB 0.97
(XEN) Command line: cpuinfo loglvl=all guest_loglvl=error dom0_mem=2560M,max:2560M com1=115200,8n1 console=com1 dom0_max_vcpus=2 dom0_vcpus_pin=true dom0_nodes=0 pv-linear-pt=true
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  No VGA detected
(XEN) Disc information:
(XEN)  Found 4 MBR signatures
(XEN)  Found 4 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009e000 (usable)
(XEN)  000000000009e000 - 00000000000a0000 (reserved)
(XEN)  00000000000e0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 00000000f0000000 (usable)
(XEN)  00000000fc000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000210000000 (usable)
(XEN) New Xen image base address: 0xefa00000
(XEN) ACPI: RSDP 000EA020, 0024 (r2    Xen)
(XEN) ACPI: XSDT FC00C750, 0054 (r1    Xen      HVM        0 HVML        0)
(XEN) ACPI: FACP FC00C440, 00F4 (r4    Xen      HVM        0 HVML        0)
(XEN) ACPI: DSDT FC003940, 8A7E (r2    Xen      HVM        0 INTL 20090123)
(XEN) ACPI: FACS FC003900, 0040
(XEN) ACPI: APIC FC00C540, 00A0 (r2    Xen      HVM        0 HVML        0)
(XEN) ACPI: HPET FC00C660, 0038 (r1    Xen      HVM        0 HVML        0)
(XEN) ACPI: WAET FC00C6A0, 0028 (r1    Xen      HVM        0 HVML        0)
(XEN) ACPI: SSDT FC00C6D0, 0031 (r2    Xen      HVM        0 INTL 20090123)
(XEN) ACPI: SSDT FC00C710, 0031 (r2    Xen      HVM        0 INTL 20090123)
(XEN) System RAM: 8191MB (8388216kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000210000000
(XEN) Domain heap initialised
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 62 (0x3e), Stepping 4 (raw 000306e4)
(XEN) found SMP MP-table at 000fb710
(XEN) DMI 2.4 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0xb008 (32 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:b004,1:0], pm1x_evt[1:b000,1:0]
(XEN) ACPI:             wakeup_vec[fc00390c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x08] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x0a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x0c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x0e] enabled)
(XEN) ACPI: IOAPIC (id[0x01] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 1, version 17, address 0xfec00000, GSI 0-47
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low level)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ5 used by override.
(XEN) ACPI: IRQ10 used by override.
(XEN) ACPI: IRQ11 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) ERST table was not found
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 48 GSI, 1504 MSI/MSI-X
(XEN) Not enabling x2APIC: depends on iommu_supports_eim.
(XEN) Levelling caps: 0x1
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 0
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Initializing CPU#0
(XEN) Platform timer is 62.500MHz HPET
(XEN) Detected 2200.058 MHz processor.
(XEN) Initing memory sharing.
(XEN) alt table ffff82d080410558 -> ffff82d080411c8c
(XEN) I/O virtualisation disabled
(XEN) CPU0: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) nr_sockets: 1
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=0 pin2=0
(XEN) TSC deadline timer enabled
(XEN) Allocated console ring of 64 KiB.
(XEN) mwait-idle: does not run on family 6 model 62
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Booting processor 1/2 eip 8e000
(XEN) Initializing CPU#1
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 1
(XEN) CPU1: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Booting processor 2/4 eip 8e000
(XEN) Initializing CPU#2
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 2
(XEN) CPU2: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Booting processor 3/6 eip 8e000
(XEN) Initializing CPU#3
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 3
(XEN) CPU3: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Booting processor 4/8 eip 8e000
(XEN) Initializing CPU#4
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 4
(XEN) CPU4: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Booting processor 5/10 eip 8e000
(XEN) Initializing CPU#5
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 5
(XEN) CPU5: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Booting processor 6/12 eip 8e000
(XEN) Initializing CPU#6
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 6
(XEN) CPU6: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Booting processor 7/14 eip 8e000
(XEN) Initializing CPU#7
(XEN) CPU: L1 I cache: 32K, L1 D cache: 32K
(XEN) CPU: L2 cache: 256K
(XEN) CPU: L3 cache: 25600K
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 7
(XEN) CPU7: Intel(R) Xeon(R) CPU E5-2660 v2 @ 2.20GHz stepping 04
(XEN) Brought up 8 CPUs
(XEN) build-id: ec7cace1e9215d3ed63fa87ff8c7804d9712e15b
(XEN) HPET: 0 timers usable for broadcast (3 total)
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) xenoprof: Initialization failed. Intel processor family 6 model 62 is not supported
(XEN) Dom0 has maximum 432 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** LOADING DOMAIN 0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x2497000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000200000000->0000000204000000 (634381 pages to be allocated)
(XEN)  Init. ramdisk: 000000020ee0d000->0000000210000000
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff82497000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000500000
(XEN)  Start info:    ffffffff82497000->ffffffff824974b4
(XEN)  Page tables:   ffffffff82498000->ffffffff824af000
(XEN)  Boot stack:    ffffffff824af000->ffffffff824b0000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82800000
(XEN)  ENTRY ADDRESS: ffffffff81fa4180
(XEN) Dom0 has maximum 2 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 8 CPUs
(XEN) .........done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Errors
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 444kB init memory
(XEN) PCI add device 0000:00:00.0
(XEN) PCI add device 0000:00:01.0
(XEN) PCI add device 0000:00:01.1
(XEN) PCI add device 0000:00:01.3
(XEN) PCI add device 0000:00:02.0
(XEN) PCI add device 0000:00:03.0
(XEN) PCI add device 0000:00:04.0
(XEN) PCI add device 0000:00:05.0

--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=dmesg-out.txt

[    0.000000] Linux version 4.9.58 (poisonivy@gotham-earth2) (gcc version 5.3.1 20160413 (Ubuntu 5.3.1-14ubuntu2) ) #6 SMP Wed Feb 7 19:06:24 UTC 2018
[    0.000000] Command line: ro root=UUID=0cef071f-495f-445b-8bc2-aba8c13fe1b1 rd_NO_LUKS rd_NO_LVM LANG=en_US.UTF-8 rd_NO_MD SYSFONT=latarcyrheb-sun64  KEYBOARDTYPE=pc KEYTABLE=us rd_NO_DM edd=off max_loop=768 swiotlb=32768 console=hvc0
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] x86/fpu: Using 'eager' FPU context switches.
[    0.000000] Released 0 page(s)
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000009dfff] usable
[    0.000000] Xen: [mem 0x000000000009e000-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x00000000a0061fff] usable
[    0.000000] Xen: [mem 0x00000000fc000000-0x00000000ffffffff] reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Xen HVM domU, BIOS 4.8.2-1_prgmr.el6 10/02/2017
[    0.000000] Hypervisor detected: Xen
[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000000] e820: last_pfn = 0xa0062 max_arch_pfn = 0x400000000
[    0.000000] MTRR: Disabled
[    0.000000] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.000000] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC  
[    0.000000] Base memory trampoline at [ffff880000098000] 98000 size 24576
[    0.000000] BRK [0x0246b000, 0x0246bfff] PGTABLE
[    0.000000] BRK [0x0246c000, 0x0246cfff] PGTABLE
[    0.000000] BRK [0x0246d000, 0x0246dfff] PGTABLE
[    0.000000] BRK [0x0246e000, 0x0246efff] PGTABLE
[    0.000000] BRK [0x0246f000, 0x0246ffff] PGTABLE
[    0.000000] BRK [0x02470000, 0x02470fff] PGTABLE
[    0.000000] BRK [0x02471000, 0x02471fff] PGTABLE
[    0.000000] BRK [0x02472000, 0x02472fff] PGTABLE
[    0.000000] BRK [0x02473000, 0x02473fff] PGTABLE
[    0.000000] BRK [0x02474000, 0x02474fff] PGTABLE
[    0.000000] BRK [0x02475000, 0x02475fff] PGTABLE
[    0.000000] BRK [0x02476000, 0x02476fff] PGTABLE
[    0.000000] RAMDISK: [mem 0x04000000-0x051f2fff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000EA020 000024 (v02 Xen   )
[    0.000000] ACPI: XSDT 0x00000000FC00C750 000054 (v01 Xen    HVM      00000000 HVML 00000000)
[    0.000000] ACPI: FACP 0x00000000FC00C440 0000F4 (v04 Xen    HVM      00000000 HVML 00000000)
[    0.000000] ACPI: DSDT 0x00000000FC003940 008A7E (v02 Xen    HVM      00000000 INTL 20090123)
[    0.000000] ACPI: FACS 0x00000000FC003900 000040
[    0.000000] ACPI: FACS 0x00000000FC003900 000040
[    0.000000] ACPI: APIC 0x00000000FC00C540 0000A0 (v02 Xen    HVM      00000000 HVML 00000000)
[    0.000000] ACPI: HPET 0x00000000FC00C660 000038 (v01 Xen    HVM      00000000 HVML 00000000)
[    0.000000] ACPI: WAET 0x00000000FC00C6A0 000028 (v01 Xen    HVM      00000000 HVML 00000000)
[    0.000000] ACPI: SSDT 0x00000000FC00C6D0 000031 (v02 Xen    HVM      00000000 INTL 20090123)
[    0.000000] ACPI: SSDT 0x00000000FC00C710 000031 (v02 Xen    HVM      00000000 INTL 20090123)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] Setting APIC routing to Xen PV.
[    0.000000] NUMA turned off
[    0.000000] Faking a node at [mem 0x0000000000000000-0x00000000a0061fff]
[    0.000000] NODE_DATA(0) allocated [mem 0x9fafb000-0x9fb1cfff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000a0061fff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009dfff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x00000000a0061fff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x00000000a0061fff]
[    0.000000] On node 0 totalpages: 655359
[    0.000000]   DMA zone: 64 pages used for memmap
[    0.000000]   DMA zone: 21 pages reserved
[    0.000000]   DMA zone: 3997 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 10178 pages used for memmap
[    0.000000]   DMA32 zone: 651362 pages, LIFO batch:31
[    0.000000] p2m virtual area at ffffc90000000000, size is 600000
[    0.000000] Remapped 98 page(s)
[    0.000000] ACPI: PM-Timer IO Port: 0xb008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] IOAPIC[0]: apic_id 1, version 17, address 0xfec00000, GSI 0-47
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low level)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 low level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ5 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] ACPI: IRQ10 used by override.
[    0.000000] ACPI: IRQ11 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.000000] e820: [mem 0xa0062000-0xfbffffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on Xen
[    0.000000] Xen version: 4.10.0-1_prgmr.el6 (preserve-AD)
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:8 nr_cpu_ids:8 nr_node_ids:1
[    0.000000] percpu: Embedded 36 pages/cpu @ffff88009c600000 s109528 r8192 d29736 u262144
[    0.000000] pcpu-alloc: s109528 r8192 d29736 u262144 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 645096
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: ro root=UUID=0cef071f-495f-445b-8bc2-aba8c13fe1b1 rd_NO_LUKS rd_NO_LVM LANG=en_US.UTF-8 rd_NO_MD SYSFONT=latarcyrheb-sun64  KEYBOARDTYPE=pc KEYTABLE=us rd_NO_DM edd=off max_loop=768 swiotlb=32768 console=hvc0
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] software IO TLB [mem 0x98600000-0x9c600000] (64MB) mapped at [ffff880098600000-ffff88009c5fffff]
[    0.000000] Memory: 2461336K/2621436K available (8659K kernel code, 1565K rwdata, 4060K rodata, 2420K init, 2544K bss, 160100K reserved, 0K cma-reserved)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=2.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=2
[    0.000000] Using NULL legacy PIC
[    0.000000] NR_IRQS:524544 nr_irqs:512 0
[    0.000000] xen:events: Using FIFO-based ABI
[    0.000000] xen: --> pirq=1 -> irq=1 (gsi=1)
[    0.000000] xen: --> pirq=2 -> irq=2 (gsi=2)
[    0.000000] xen: --> pirq=3 -> irq=3 (gsi=3)
[    0.000000] xen: --> pirq=4 -> irq=4 (gsi=4)
[    0.000000] xen: --> pirq=5 -> irq=5 (gsi=5)
[    0.000000] xen: --> pirq=6 -> irq=6 (gsi=6)
[    0.000000] xen: --> pirq=7 -> irq=7 (gsi=7)
[    0.000000] xen: --> pirq=8 -> irq=8 (gsi=8)
[    0.000000] xen: --> pirq=9 -> irq=9 (gsi=9)
[    0.000000] xen: --> pirq=10 -> irq=10 (gsi=10)
[    0.000000] xen: --> pirq=11 -> irq=11 (gsi=11)
[    0.000000] xen: --> pirq=12 -> irq=12 (gsi=12)
[    0.000000] xen: --> pirq=13 -> irq=13 (gsi=13)
[    0.000000] xen: --> pirq=14 -> irq=14 (gsi=14)
[    0.000000] xen: --> pirq=15 -> irq=15 (gsi=15)
[    0.000000] 	Offload RCU callbacks from all CPUs
[    0.000000] 	Offload RCU callbacks from CPUs: 0-1.
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [hvc0] enabled
[    0.000000] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000000] Xen: using vcpuop timer interface
[    0.000000] installing Xen timer for CPU 0
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2199.983 MHz processor
[    0.003000] Calibrating delay loop (skipped), value calculated using timer frequency.. 4400.11 BogoMIPS (lpj=2200058)
[    0.004012] pid_max: default: 32768 minimum: 301
[    0.005069] ACPI: Core revision 20160831
[    0.018542] ACPI: 3 ACPI AML tables successfully acquired and loaded
[    0.020385] Security Framework initialized
[    0.021015] Yama: becoming mindful.
[    0.022034] SELinux:  Initializing.
[    0.023101] SELinux:  Starting in permissive mode
[    0.023758] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.025376] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.026587] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.027032] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.028936] CPU: Physical Processor ID: 0
[    0.029011] CPU: Processor Core ID: 0
[    0.030019] mce: CPU supports 2 MCE banks
[    0.031038] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
[    0.032013] Last level dTLB entries: 4KB 512, 2MB 0, 4MB 0, 1GB 4
[    0.035013] Freeing SMP alternatives memory: 32K
[    0.040806] ftrace: allocating 34088 entries in 134 pages
[    0.050199] smpboot: Max logical packages: 1
[    0.051022] VPMU disabled by hypervisor.
[    0.052053] Performance Events: unsupported p6 CPU model 62 no PMU driver, software events only.
[    0.056526] installing Xen timer for CPU 1
[    0.057559] NMI watchdog: disabled (cpu0): hardware events not enabled
[    0.058016] NMI watchdog: Shutting down hard lockup detector on all cpus
[    0.059102] x86: Booted up 1 node, 2 CPUs
[    0.060437] devtmpfs: initialized
[    0.066575] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.075028] futex hash table entries: 512 (order: 3, 32768 bytes)
[    0.076220] atomic64_test: passed for x86-64 platform with CX8 and with SSE
[    0.077015] pinctrl core: initialized pinctrl subsystem
[    0.078819] NET: Registered protocol family 16
[    0.079053] xen:grant_table: Grant tables using version 1 layout
[    0.080042] Grant table initialized
[    0.083584] ACPI: bus type PCI registered
[    0.084017] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.086121] PCI: Using configuration type 1 for base access
[    0.100261] ACPI: Added _OSI(Module Device)
[    0.104029] ACPI: Added _OSI(Processor Device)
[    0.106008] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.109009] ACPI: Added _OSI(Processor Aggregator Device)
[    0.112308] xen: registering gsi 9 triggering 0 polarity 1
[    0.119740] ACPI: Interpreter enabled
[    0.122027] ACPI: (supports S0 S3 S5)
[    0.124007] ACPI: Using IOAPIC for interrupt routing
[    0.128092] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.144014] random: fast init done
[    0.196521] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.197027] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MSI]
[    0.198032] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
[    0.199047] acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
[    0.202418] acpiphp: Slot [0] registered
[    0.203760] acpiphp: Slot [3] registered
[    0.204305] acpiphp: Slot [4] registered
[    0.205309] acpiphp: Slot [5] registered
[    0.206321] acpiphp: Slot [6] registered
[    0.207300] acpiphp: Slot [7] registered
[    0.208285] acpiphp: Slot [8] registered
[    0.209291] acpiphp: Slot [9] registered
[    0.210284] acpiphp: Slot [10] registered
[    0.211313] acpiphp: Slot [11] registered
[    0.212303] acpiphp: Slot [12] registered
[    0.213311] acpiphp: Slot [13] registered
[    0.214304] acpiphp: Slot [14] registered
[    0.215312] acpiphp: Slot [15] registered
[    0.216282] acpiphp: Slot [16] registered
[    0.217288] acpiphp: Slot [17] registered
[    0.218300] acpiphp: Slot [18] registered
[    0.219278] acpiphp: Slot [19] registered
[    0.220311] acpiphp: Slot [20] registered
[    0.221315] acpiphp: Slot [21] registered
[    0.222308] acpiphp: Slot [22] registered
[    0.223317] acpiphp: Slot [23] registered
[    0.224289] acpiphp: Slot [24] registered
[    0.225291] acpiphp: Slot [25] registered
[    0.226294] acpiphp: Slot [26] registered
[    0.227295] acpiphp: Slot [27] registered
[    0.228306] acpiphp: Slot [28] registered
[    0.229302] acpiphp: Slot [29] registered
[    0.230319] acpiphp: Slot [30] registered
[    0.231285] acpiphp: Slot [31] registered
[    0.232267] PCI host bridge to bus 0000:00
[    0.233016] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.234016] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.235016] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.236009] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfbffffff window]
[    0.237016] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.238141] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.240158] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.243136] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.243991] pci 0000:00:01.1: reg 0x20: [io  0xc400-0xc40f]
[    0.244366] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    0.245015] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.246013] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    0.247014] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.249171] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.249196] * Found PM-Timer Bug on the chipset. Due to workarounds for a bug,
[    0.249196] * this clock source is slow. Consider trying other clock sources
[    0.250976] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PIIX4 ACPI
[    0.252244] pci 0000:00:02.0: [5853:0001] type 00 class 0xff8000
[    0.252525] pci 0000:00:02.0: reg 0x10: [io  0xc000-0xc0ff]
[    0.252692] pci 0000:00:02.0: reg 0x14: [mem 0xf0000000-0xf0ffffff pref]
[    0.255154] pci 0000:00:03.0: [10ec:8139] type 00 class 0x020000
[    0.255397] pci 0000:00:03.0: reg 0x10: [io  0xc100-0xc1ff]
[    0.255566] pci 0000:00:03.0: reg 0x14: [mem 0xf1000000-0xf10000ff]
[    0.258135] pci 0000:00:04.0: [10ec:8139] type 00 class 0x020000
[    0.258376] pci 0000:00:04.0: reg 0x10: [io  0xc200-0xc2ff]
[    0.258535] pci 0000:00:04.0: reg 0x14: [mem 0xf1000100-0xf10001ff]
[    0.261153] pci 0000:00:05.0: [10ec:8139] type 00 class 0x020000
[    0.261392] pci 0000:00:05.0: reg 0x10: [io  0xc300-0xc3ff]
[    0.261561] pci 0000:00:05.0: reg 0x14: [mem 0xf1000200-0xf10002ff]
[    0.265148] ACPI: PCI Interrupt Link [LNKA] (IRQs *5 10 11)
[    0.267212] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
[    0.269106] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
[    0.271295] ACPI: PCI Interrupt Link [LNKD] (IRQs *5 10 11)
[    0.283096] APIC: NR_CPUS/possible_cpus limit of 2 reached. Processor 2/0x4 ignored.
[    0.284012] ACPI: Unable to map lapic to logical cpu number
[    0.285144] APIC: NR_CPUS/possible_cpus limit of 2 reached. Processor 3/0x6 ignored.
[    0.286012] ACPI: Unable to map lapic to logical cpu number
[    0.287136] APIC: NR_CPUS/possible_cpus limit of 2 reached. Processor 4/0x8 ignored.
[    0.288006] ACPI: Unable to map lapic to logical cpu number
[    0.289130] APIC: NR_CPUS/possible_cpus limit of 2 reached. Processor 5/0xa ignored.
[    0.290006] ACPI: Unable to map lapic to logical cpu number
[    0.291123] APIC: NR_CPUS/possible_cpus limit of 2 reached. Processor 6/0xc ignored.
[    0.292006] ACPI: Unable to map lapic to logical cpu number
[    0.293122] APIC: NR_CPUS/possible_cpus limit of 2 reached. Processor 7/0xe ignored.
[    0.294012] ACPI: Unable to map lapic to logical cpu number
[    0.295429] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.296266] xen:balloon: Initialising balloon driver
[    0.297156] xen_balloon: Initialising balloon driver
[    0.298510] vgaarb: loaded
[    0.300030] SCSI subsystem initialized
[    0.301097] libata version 3.00 loaded.
[    0.301225] ACPI: bus type USB registered
[    0.302127] usbcore: registered new interface driver usbfs
[    0.303083] usbcore: registered new interface driver hub
[    0.304072] usbcore: registered new device driver usb
[    0.305214] PCI: Using ACPI for IRQ routing
[    0.306017] PCI: pci_cache_line_size set to 64 bytes
[    0.306389] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
[    0.306392] e820: reserve RAM buffer [mem 0xa0062000-0xa3ffffff]
[    0.306876] NetLabel: Initializing
[    0.307015] NetLabel:  domain hash size = 128
[    0.308012] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.309083] NetLabel:  unlabeled traffic allowed by default
[    0.310138] clocksource: Switched to clocksource xen
[    0.342718] VFS: Disk quotas dquot_6.6.0
[    0.346478] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.353038] hugetlbfs: disabling because there are no supported hugepage sizes
[    0.358418] pnp: PnP ACPI init
[    0.360917] system 00:00: [mem 0x00000000-0x0009ffff] could not be reserved
[    0.367491] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.367692] system 00:01: [io  0x08a0-0x08a3] has been reserved
[    0.371943] system 00:01: [io  0x0cc0-0x0ccf] has been reserved
[    0.376091] system 00:01: [io  0x04d0-0x04d1] has been reserved
[    0.379396] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.379420] xen: registering gsi 8 triggering 1 polarity 0
[    0.379529] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.379570] xen: registering gsi 12 triggering 1 polarity 0
[    0.379676] pnp 00:03: Plug and Play ACPI device, IDs PNP0f13 (active)
[    0.379700] xen: registering gsi 1 triggering 1 polarity 0
[    0.379795] pnp 00:04: Plug and Play ACPI device, IDs PNP0303 PNP030b (active)
[    0.379818] xen: registering gsi 6 triggering 1 polarity 0
[    0.379838] pnp 00:05: [dma 2]
[    0.379922] pnp 00:05: Plug and Play ACPI device, IDs PNP0700 (active)
[    0.379956] xen: registering gsi 4 triggering 1 polarity 0
[    0.379957] Already setup the GSI :4
[    0.381876] pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.381938] xen: registering gsi 7 triggering 1 polarity 0
[    0.382069] pnp 00:07: Plug and Play ACPI device, IDs PNP0400 (active)
[    0.382203] system 00:08: [io  0x10c0-0x1141] has been reserved
[    0.385923] system 00:08: [io  0xb044-0xb047] has been reserved
[    0.389831] system 00:08: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.397994] pnp: PnP ACPI: found 9 devices
[    0.431760] PM-Timer failed consistency check  (0xffffff) - aborting.
[    0.436438] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.436441] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.436443] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.436445] pci_bus 0000:00: resource 7 [mem 0xf0000000-0xfbffffff window]
[    0.436833] NET: Registered protocol family 2
[    0.440573] TCP established hash table entries: 32768 (order: 6, 262144 bytes)
[    0.445969] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
[    0.451306] TCP: Hash tables configured (established 32768 bind 32768)
[    0.455633] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.459106] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.462992] NET: Registered protocol family 1
[    0.465630] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.469965] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.473905] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    0.477437] PCI: CLS 0 bytes, default 64
[    0.477876] Trying to unpack rootfs image as initramfs...
[    0.555092] Freeing initrd memory: 18380K
[    0.563868] audit: initializing netlink subsys (disabled)
[    0.570317] audit: type=2000 audit(1520871023.914:1): initialized
[    0.578154] Initialise system trusted keyrings
[    0.584121] workingset: timestamp_bits=36 max_order=20 bucket_order=0
[    0.589705] zbud: loaded
[    0.592635] SELinux:  Registering netfilter hooks
[    1.013522] NET: Registered protocol family 38
[    1.016102] Key type asymmetric registered
[    1.019584] Asymmetric key parser 'x509' registered
[    1.022554] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    1.026943] io scheduler noop registered
[    1.029170] io scheduler deadline registered
[    1.031632] io scheduler cfq registered (default)
[    1.035582] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    1.039660] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    1.044518] intel_idle: does not run on family 6 model 62
[    1.044851] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    1.050219] ACPI: Power Button [PWRF]
[    1.052899] input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/input/input1
[    1.056972] ACPI: Sleep Button [SLPF]
[    1.059441] Warning: Processor Platform Limit not supported.
[    1.059677] GHES: HEST is not enabled!
[    1.063726] xen: registering gsi 24 triggering 0 polarity 1
[    1.063786] xen: --> pirq=24 -> irq=24 (gsi=24)
[    1.063952] xen-platform-pci 0000:00:02.0: Unable to set the evtchn callback err=-22
[    1.069741] xen-platform-pci: probe of 0000:00:02.0 failed with error -22
[    1.075236] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.081720] hpet_acpi_add: no address or irqs in _CRS
[    1.085960] Non-volatile memory driver v1.3
[    1.089000] Linux agpgart interface v0.103
[    1.092680] [drm] Initialized
[    1.106974] brd: module loaded
[    1.567054] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1fb669c0eb1, max_idle_ns: 440795279361 ns
[    1.757322] loop: module loaded
[    1.760711] ata_piix 0000:00:01.1: version 2.13
[    1.764167] scsi host0: ata_piix
[    1.767300] scsi host1: ata_piix
[    1.770906] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc400 irq 14
[    1.778642] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc408 irq 15
[    1.784817] libphy: Fixed MDIO Bus: probed
[    1.787732] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.791657] ehci-pci: EHCI PCI platform driver
[    1.794892] ehci-platform: EHCI generic platform driver
[    1.799101] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.803011] ohci-pci: OHCI PCI platform driver
[    1.806520] ohci-platform: OHCI generic platform driver
[    1.809639] uhci_hcd: USB Universal Host Controller Interface driver
[    1.813517] usbcore: registered new interface driver usbserial
[    1.817723] usbcore: registered new interface driver usbserial_generic
[    1.821578] usbserial: USB Serial support registered for generic
[    1.825280] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    1.831698] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.834581] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.838635] mousedev: PS/2 mouse device common for all mice
[    1.842920] rtc_cmos 00:02: rtc core: registered rtc_cmos as rtc0
[    1.846826] rtc_cmos 00:02: alarms up to one day, 114 bytes nvram
[    1.851185] device-mapper: uevent: version 1.0.3
[    1.855060] device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
[    1.855746] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
[    1.867553] ledtrig-cpu: registered to indicate activity on CPUs
[    1.871957] hidraw: raw HID events driver (C) Jiri Kosina
[    1.876244] usbcore: registered new interface driver usbhid
[    1.879810] usbhid: USB HID core driver
[    1.882491] drop_monitor: Initializing network drop monitor service
[    1.886398] ip_tables: (C) 2000-2006 Netfilter Core Team
[    1.889858] Initializing XFRM netlink socket
[    1.892745] NET: Registered protocol family 10
[    1.896235] mip6: Mobile IPv6
[    1.898674] NET: Registered protocol family 17
[    1.901677] mce: Unable to init device /dev/mcelog (rc: -16)
[    1.905369] microcode: sig=0x306e4, pf=0x1, revision=0x428
[    1.909594] microcode: Microcode Update Driver: v2.01 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
[    1.916271] AVX version of gcm_enc/dec engaged.
[    1.919850] AES CTR mode by8 optimization enabled
[    1.948019] ata1.00: ATA-7: QEMU HARDDISK, 0.10.2, max UDMA/100
[    1.954466] ata1.00: 73400320 sectors, multi 16: LBA48 
[    1.959218] ata1.01: ATA-7: QEMU HARDDISK, 0.10.2, max UDMA/100
[    1.964419] ata1.01: 2097152 sectors, multi 16: LBA48 
[    1.971611] ata1.00: configured for MWDMA2
[    1.980014] ata1.01: configured for MWDMA2
[    1.983283] registered taskstats version 1
[    1.986749] Loading compiled-in X.509 certificates
[    1.988278] ata2.00: ATA-7: QEMU HARDDISK, 0.10.2, max UDMA/100
[    1.988279] ata2.00: 104857600 sectors, multi 16: LBA48 
[    1.988283] ata2.01: ATA-7: QEMU HARDDISK, 0.10.2, max UDMA/100
[    1.988284] ata2.01: 8388608 sectors, multi 16: LBA48 
[    1.990546] ata2.00: configured for MWDMA2
[    1.995848] ata2.01: configured for MWDMA2
[    2.009291] scsi 0:0:0:0: Direct-Access     ATA      QEMU HARDDISK    .2   PQ: 0 ANSI: 5
[    2.030842] zswap: loaded using pool lzo/zbud
[    2.054634] sd 0:0:0:0: [sda] 73400320 512-byte logical blocks: (37.6 GB/35.0 GiB)
[    2.061370] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    2.062716] sd 0:0:0:0: [sda] Write Protect is off
[    2.062718] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.062760] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.065601]  sda: sda1 sda2
[    2.066671] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.087726] scsi 0:0:1:0: Direct-Access     ATA      QEMU HARDDISK    .2   PQ: 0 ANSI: 5
[    2.116390] Key type big_key registered
[    2.142816] Key type encrypted registered
[    2.147006] ima: No TPM chip found, activating TPM-bypass!
[    2.152816] rtc_cmos 00:02: setting system clock to 2018-03-12 16:10:25 UTC (1520871025)
[    2.165000] sd 0:0:1:0: [sdb] 2097152 512-byte logical blocks: (1.07 GB/1.00 GiB)
[    2.172421] sd 0:0:1:0: Attached scsi generic sg1 type 0
[    2.172810] scsi 1:0:0:0: Direct-Access     ATA      QEMU HARDDISK    .2   PQ: 0 ANSI: 5
[    2.186443] sd 0:0:1:0: [sdb] Write Protect is off
[    2.190452] sd 0:0:1:0: [sdb] Mode Sense: 00 3a 00 00
[    2.190508] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.199006]  sdb:
[    2.201146] sd 0:0:1:0: [sdb] Attached SCSI disk
[    2.215089] sd 1:0:0:0: [sdc] 104857600 512-byte logical blocks: (53.7 GB/50.0 GiB)
[    2.223120] sd 1:0:0:0: [sdc] Write Protect is off
[    2.223273] sd 1:0:0:0: Attached scsi generic sg2 type 0
[    2.223651] scsi 1:0:1:0: Direct-Access     ATA      QEMU HARDDISK    .2   PQ: 0 ANSI: 5
[    2.244435] sd 1:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    2.244500] sd 1:0:0:0: [sdc] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.262733] sd 1:0:1:0: Attached scsi generic sg3 type 0
[    2.268948]  sdc: sdc1
[    2.268979] sd 1:0:1:0: [sdd] 8388608 512-byte logical blocks: (4.29 GB/4.00 GiB)
[    2.269174] sd 1:0:1:0: [sdd] Write Protect is off
[    2.269179] sd 1:0:1:0: [sdd] Mode Sense: 00 3a 00 00
[    2.269232] sd 1:0:1:0: [sdd] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.300786]  sdd: sdd1
[    2.303168] sd 1:0:0:0: [sdc] Attached SCSI disk
[    2.303869] sd 1:0:1:0: [sdd] Attached SCSI disk
[    2.313328] Freeing unused kernel memory: 2420K
[    2.318093] Write protecting the kernel read-only data: 14336k
[    2.329258] Freeing unused kernel memory: 1564K
[    2.334208] Freeing unused kernel memory: 36K
[    2.348068] random: crng init done
[    2.407671] dracut: dracut-004-409.el6_8.2
[    2.443259] dracut: rd_NO_LUKS: removing cryptoluks activation
[    2.457148] dracut: rd_NO_LVM: removing LVM activation
[    2.498823] udev: starting version 147
[    2.504256] udevd (961): /proc/961/oom_adj is deprecated, please use /proc/961/oom_score_adj instead.
[    2.575252] clocksource: Switched to clocksource tsc
[    2.930285] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input4
[    3.056193] dracut: Starting plymouth daemon
[    3.100942] dracut: rd_NO_DM: removing DM RAID activation
[    3.123991] dracut: rd_NO_MD: removing MD RAID activation
[    7.627294] EXT4-fs (sda1): mounting ext3 file system using the ext4 subsystem
[    7.667595] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
[    7.755374] dracut: Mounted root filesystem /dev/sda1
[    7.928902] dracut: Loading SELinux policy
[    8.159548] audit: type=1404 audit(1520871031.505:2): enforcing=1 old_enforcing=0 auid=4294967295 ses=4294967295
[    9.533697] SELinux: 65536 avtab hash slots, 309308 rules.
[    9.658741] SELinux: 65536 avtab hash slots, 309308 rules.
[    9.858193] SELinux:  9 users, 12 roles, 4215 types, 237 bools, 1 sens, 1024 cats
[    9.858198] SELinux:  81 classes, 309308 rules
[    9.869109] SELinux:  Permission validate_trans in class security not defined in policy.
[    9.876379] SELinux:  Permission module_load in class system not defined in policy.
[    9.883243] SELinux:  Permission execmod in class dir not defined in policy.
[    9.889512] SELinux:  Permission execmod in class lnk_file not defined in policy.
[    9.895747] SELinux:  Permission execmod in class blk_file not defined in policy.
[    9.902265] SELinux:  Permission execmod in class sock_file not defined in policy.
[    9.908678] SELinux:  Permission execmod in class fifo_file not defined in policy.
[    9.915007] SELinux:  Class netlink_iscsi_socket not defined in policy.
[    9.920431] SELinux:  Class netlink_fib_lookup_socket not defined in policy.
[    9.926317] SELinux:  Class netlink_connector_socket not defined in policy.
[    9.932058] SELinux:  Class netlink_netfilter_socket not defined in policy.
[    9.937821] SELinux:  Class netlink_generic_socket not defined in policy.
[    9.943445] SELinux:  Class netlink_scsitransport_socket not defined in policy.
[    9.949462] SELinux:  Class netlink_rdma_socket not defined in policy.
[    9.954836] SELinux:  Class netlink_crypto_socket not defined in policy.
[    9.960400] SELinux:  Permission syslog in class capability2 not defined in policy.
[    9.966554] SELinux:  Permission wake_alarm in class capability2 not defined in policy.
[    9.973121] SELinux:  Permission block_suspend in class capability2 not defined in policy.
[    9.980004] SELinux:  Permission audit_read in class capability2 not defined in policy.
[    9.986462] SELinux:  Permission attach_queue in class tun_socket not defined in policy.
[    9.993072] SELinux:  Class binder not defined in policy.
[    9.997441] SELinux:  Class cap_userns not defined in policy.
[   10.002181] SELinux:  Class cap2_userns not defined in policy.
[   10.006731] SELinux: the above unknown classes and permissions will be allowed
[   10.012627] SELinux:  Completing initialization.
[   10.012628] SELinux:  Setting up existing superblocks.
[   10.062918] audit: type=1403 audit(1520871033.408:3): policy loaded auid=4294967295 ses=4294967295
[   10.089097] dracut: 
[   11.119788] dracut: Switching root
[   14.967320] udev: starting version 147
[   15.762194] piix4_smbus 0000:00:01.3: SMBus base address uninitialized - upgrade BIOS or use force_addr=0xaddr
[   15.997451] 8139cp: 8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
[   16.010897] xen: registering gsi 28 triggering 0 polarity 1
[   16.011052] xen: --> pirq=28 -> irq=28 (gsi=28)
[   16.028948] 8139cp 0000:00:03.0 eth0: RTL-8139C+ at 0xffffc90000c39000, <MAC redacted>, IRQ 28
[   16.050098] xen: registering gsi 32 triggering 0 polarity 1
[   16.050177] xen: --> pirq=32 -> irq=32 (gsi=32)
[   16.066293] 8139cp 0000:00:04.0 eth1: RTL-8139C+ at 0xffffc90000c41100, <MAC redacted>, IRQ 32
[   16.081314] xen: registering gsi 36 triggering 0 polarity 1
[   16.081391] xen: --> pirq=36 -> irq=36 (gsi=36)
[   16.105505] 8139cp 0000:00:05.0 eth2: RTL-8139C+ at 0xffffc90000c51200, <MAC redacted>, IRQ 36
[   16.225809] 8139too: 8139too Fast Ethernet driver 0.9.28
[   16.688440] input: PC Speaker as /devices/platform/pcspkr/input/input5
[   18.441863] FUJITSU Extended Socket Network Device Driver - version 1.1 - Copyright (c) 2015 FUJITSU LIMITED
[   18.635762] parport_pc 00:07: reported by Plug and Play ACPI
[   18.640496] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
[   18.743346] parport_pc parport_pc.956: Unable to set coherent dma mask: disabling DMA
[   18.749960] parport_pc parport_pc.888: Unable to set coherent dma mask: disabling DMA
[   18.756332] parport_pc parport_pc.632: Unable to set coherent dma mask: disabling DMA
[   22.733190] ppdev: user-space parallel port driver
[   23.935913] bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
[   23.990688] Bridge firewalling registered
[   24.363450] drbd: initialized. Version: 8.4.7 (api:1/proto:86-101)
[   24.368316] drbd: srcversion: 0904DF2CCF7283ACE07D07A 
[   24.372082] drbd: registered as block device major 147
[   24.426811] Ebtables v2.0 registered
[   24.871749] fuse init (API version 7.26)
[   24.969317] pps_core: LinuxPPS API ver. 1 registered
[   24.976804] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   25.040235] PTP clock support registered
[   25.333504] md: raid10 personality registered for level 10
[   25.464028] raid6: sse2x1   gen()  2972 MB/s
[   25.484024] raid6: sse2x1   xor()  4708 MB/s
[   25.504024] raid6: sse2x2   gen()  5882 MB/s
[   25.524027] raid6: sse2x2   xor()  5244 MB/s
[   25.543020] raid6: sse2x4   gen()  8351 MB/s
[   25.563021] raid6: sse2x4   xor()  6347 MB/s
[   25.566486] raid6: using algorithm sse2x4 gen() 8351 MB/s
[   25.570846] raid6: .... xor() 6347 MB/s, rmw enabled
[   25.574794] raid6: using ssse3x2 recovery algorithm
[   25.618504] async_tx: api initialized (async)
[   25.707777] xor: automatically using best checksumming function   avx       
[   25.760155] md: raid6 personality registered for level 6
[   25.767541] md: raid5 personality registered for level 5
[   25.774704] md: raid4 personality registered for level 4
[   25.925387] tun: Universal TUN/TAP device driver, 1.6
[   25.931889] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[   26.095503] xen:xen_evtchn: Event-channel device installed
[   26.447826] blktap_device_init: blktap device major 252
[   26.454670] blktap_ring_init: blktap ring major: 242
[   26.558641] xen_pciback: backend is vpci
[   29.852900] EXT4-fs (sda1): re-mounted. Opts: (null)
[   30.814741] EXT4-fs (dm-3): warning: maximal mount count reached, running e2fsck is recommended
[   30.878069] EXT4-fs (dm-3): mounted filesystem with ordered data mode. Opts: (null)
[   30.902582] EXT4-fs (dm-6): warning: maximal mount count reached, running e2fsck is recommended
[   30.926168] EXT4-fs (dm-6): mounted filesystem with ordered data mode. Opts: (null)
[   34.644952] ip6_tables: (C) 2000-2006 Netfilter Core Team
[   35.095813] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
[   36.676471] 8139cp 0000:00:03.0 eth0: link up, 100Mbps, full-duplex, lpa 0x05E1
[   36.692702] xenbr0: port 1(eth0) entered blocking state
[   36.697035] xenbr0: port 1(eth0) entered disabled state
[   36.701596] device eth0 entered promiscuous mode
[   36.826618] 8139cp 0000:00:04.0 eth1: link up, 100Mbps, full-duplex, lpa 0x05E1
[   36.835350] xenbr1: port 1(eth1) entered blocking state
[   36.840708] xenbr1: port 1(eth1) entered disabled state
[   36.845829] device eth1 entered promiscuous mode
[   37.033156] 8139cp 0000:00:05.0 eth2: link up, 100Mbps, full-duplex, lpa 0x05E1
[   41.495752] audit: type=1400 audit(1520871064.841:4): avc:  denied  { create } for  pid=5181 comm="brctl" name="forward_delay" scontext=system_u:system_r:brctl_t:s0 tcontext=system_u:object_r:sysfs_t:s0 tclass=file permissive=0
[   41.528965] audit: type=1400 audit(1520871064.874:5): avc:  denied  { create } for  pid=5182 comm="brctl" name="stp_state" scontext=system_u:system_r:brctl_t:s0 tcontext=system_u:object_r:sysfs_t:s0 tclass=file permissive=0
[   41.556762] xenbr0: port 1(eth0) entered blocking state
[   41.561184] xenbr0: port 1(eth0) entered forwarding state
[   41.876575] audit: type=1400 audit(1520871065.222:6): avc:  denied  { create } for  pid=5227 comm="brctl" name="forward_delay" scontext=system_u:system_r:brctl_t:s0 tcontext=system_u:object_r:sysfs_t:s0 tclass=file permissive=0
[   41.907846] audit: type=1400 audit(1520871065.253:7): avc:  denied  { create } for  pid=5228 comm="brctl" name="stp_state" scontext=system_u:system_r:brctl_t:s0 tcontext=system_u:object_r:sysfs_t:s0 tclass=file permissive=0
[   42.008284] xenbr1: port 1(eth1) entered blocking state
[   42.015465] xenbr1: port 1(eth1) entered forwarding state
[   46.966276] audit: type=1305 audit(1520871070.312:8): audit_pid=5301 old=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:auditd_t:s0 res=1
[  199.244630] vif vif-2-0 myvif-emu: renamed from vif2.0
[  199.320610] xenbr0: port 2(myvif-emu) entered blocking state
[  199.323883] xenbr0: port 2(myvif-emu) entered disabled state
[  199.327432] device myvif-emu entered promiscuous mode
[  199.335814] IPv6: ADDRCONF(NETDEV_UP): myvif-emu: link is not ready
[  199.857838] vif vif-2-0 myvif-emu: Guest Rx ready
[  199.864316] IPv6: ADDRCONF(NETDEV_CHANGE): myvif-emu: link becomes ready
[  199.872692] xenbr0: port 2(myvif-emu) entered blocking state
[  199.880167] xenbr0: port 2(myvif-emu) entered forwarding state
[  199.900497] xen-blkback: backend/vbd/2/768: using 1 queues, protocol 1 (x86_64-abi) 
[  229.998517] xenbr0: port 2(myvif-emu) entered disabled state
[  230.016369] xenbr0: port 2(myvif-emu) entered disabled state
[  230.022710] device myvif-emu left promiscuous mode
[  230.028113] xenbr0: port 2(myvif-emu) entered disabled state

--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=myguest

type = 'hvm'
memory = 256
vcpus = 1
cpus = 'all,^0-0'
cpu_weight=256
name = 'myguest'
pae = 1
nx = 1
acpi = 1
viridian = 0
xen_platform_pci = 1
apic = 1
device_model_stubdomain_override = 1
boot = 'c'
sdl = 0
usb = 0
vnc = 0
nographic = 1
vga = "none"
vncpasswd = ''
serial = 'pty'
vif = ['vifname=myvif, mac=redacted, model=e1000, type=ioemu, ip=redacted, bridge=xenbr0']
disk = ['phy:/var/lib/ganeti/instance-disks/myguest:0,hda,w']
on_poweroff = 'destroy'
on_reboot = 'destroy'
on_crash = 'destroy'


--=-=-=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=-=-=--
