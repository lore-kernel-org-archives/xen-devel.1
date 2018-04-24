From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: 4.11.0 RC1 panic
Date: Tue, 24 Apr 2018 18:06:31 +0200
Message-ID: <20180424160631.GA7526@mail.soc.lip6.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2pqh=hn=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fB0zF-0006ze-Ur
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 16:40:14 +0000
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/lip6) with ESMTP id w3OGe63l011726
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 18:40:06 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id w3OGe6E2014576
 for <xen-devel@lists.xenproject.org>; Tue, 24 Apr 2018 18:40:06 +0200 (MEST)
Resent-Message-ID: <20180424164006.GA6735@mail.soc.lip6.fr>
Resent-To: xen-devel@lists.xenproject.org
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
Cc: julien.grall@linaro.org
List-Id: xen-devel@lists.xenproject.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
I tested xen 4.11.0 rc1 with NetBSD as dom0.
I could boot a NetBSD PV domU without problem, but at shutdown time (poweroff
in the domU), I got a Xen panic:
(XEN) Assertion 'cpu < nr_cpu_ids' failed at ...1/work/xen-4.11.0-rc1/xen/include/xen/cpumask.h:97

A xl destroy instead of poweroff gives the same result.

This happens with both 32bitsPAE and 64bits domU. This doens't seem to
happen with HVM domUs.

Attached are a cut-n-paste of the panic, and the output of xl demsg.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=xen-panic

(XEN) Assertion 'cpu < nr_cpu_ids' failed at ...1/work/xen-4.11.0-rc1/xen/include/xen/cpumask.h:97
(XEN) ----[ Xen-4.11-rcnb0  x86_64  debug=y   Tainted:  C   ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d080289333>] put_page_from_l1e+0x1a3/0x1f0
(XEN) RFLAGS: 0000000000010282   CONTEXT: hypervisor (d0v0)
(XEN) rax: 00000000ffffffff   rbx: ffff8300beaad000   rcx: 0000000000000004
(XEN) rdx: ffff8300bf077fff   rsi: 007fffffffffffff   rdi: ffff8300beaad5d0
(XEN) rbp: ffff82d080382380   rsp: ffff8300bf0779b8   r8:  0000000000000000
(XEN) r9:  0000000000000200   r10: 4000000000000000   r11: ffff82e004207040
(XEN) r12: ffff830213404000   r13: ffff82e004207040   r14: ffff830213404000
(XEN) r15: 1000000000000000   cr0: 000000008005003b   cr4: 00000000000026e0
(XEN) cr3: 000000022f0f6000   cr2: 00007f7ff60ce7a0
(XEN) fsb: 00007f7ff7ff36c0   gsb: ffffffff80ca42c0   gss: 0000000000000000
(XEN) ds: 003f   es: 003f   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d080289333> (put_page_from_l1e+0x1a3/0x1f0):
(XEN)  3b 05 cf 9c 1c 00 72 02 <0f> 0b 89 c2 83 e2 3f 48 8d 7a 01 48 c1 e7 05 48
(XEN) Xen stack trace from rsp=ffff8300bf0779b8:
(XEN)    0000000000000050 ffff820040016000 ffff830213404000 0000000000000000
(XEN)    10ffffffffffffff ffff82d080288780 0000001600000000 0000000100000000
(XEN)    0000000001000000 2400000000000001 ffff82e0042070a0 ffff82e004207080
(XEN)    00ffffffffffffff 10ffffffffffffff 1000000000000000 ffff82d080288e07
(XEN)    00000000002070c0 ffff8300bf077fff ffff830213404000 ffff82e0042070a0
(XEN)    ffff82e004207080 ffff830213404000 0000000000000001 ffff82004001e000
(XEN)    0200000000000000 ffff82d08028945f 0000000000000000 ffff82e004207080
(XEN)    ffff82d080288869 0000000000210384 0000000000000206 ffff8300bf077fff
(XEN)    4100000000000001 ffff82e004207080 ffff82e004207060 00ffffffffffffff
(XEN)    10ffffffffffffff 1000000000000000 ffff82d080288e07 000000010100ff22
(XEN)    ffff8300bf077fff ffff8300bedfc000 ffff82e004207080 ffff82e004207060
(XEN)    ffff830213404000 ffff820040011000 00000000ffffffff ffff820040011000
(XEN)    ffff82d080288540 0000000000000000 ffff82e004207060 ffff830213404000
(XEN)    ffff820040011000 ffff82d0802889eb 0000000000210383 ffff830213404000
(XEN)    ffff82d080280c49 6100000000000001 ffff82e004207060 ffff82e00411a0c0
(XEN)    00ffffffffffffff 10ffffffffffffff 1000000000000000 ffff82d080288e07
(XEN)    000000010136d82b ffff8300bf077fff 0000000000000000 ffff82e004207060
(XEN)    ffff82e00411a0c0 0000000000208d06 0000000000000000 00000000ffffffff
(XEN)    ffff830213404000 ffff82d080289146 0000000000000140 ffff82e00411a0c0
(XEN)    ffff82d080288b95 ffff820040001000 ffffffffffffffc0 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d080289333>] put_page_from_l1e+0x1a3/0x1f0
(XEN)    [<ffff82d080288780>] free_page_type+0x210/0x790
(XEN)    [<ffff82d080288e07>] mm.c#_put_page_type+0x107/0x340
(XEN)    [<ffff82d08028945f>] mm.c#put_page_from_l2e+0xdf/0x110
(XEN)    [<ffff82d080288869>] free_page_type+0x2f9/0x790
(XEN)    [<ffff82d080288e07>] mm.c#_put_page_type+0x107/0x340
(XEN)    [<ffff82d080288540>] mm.c#put_page_from_l3e+0x1a0/0x1d0
(XEN)    [<ffff82d0802889eb>] free_page_type+0x47b/0x790
(XEN)    [<ffff82d080280c49>] do_IRQ+0x5e9/0x630
(XEN)    [<ffff82d080288e07>] mm.c#_put_page_type+0x107/0x340
(XEN)    [<ffff82d080289146>] mm.c#put_page_from_l4e+0x106/0x130
(XEN)    [<ffff82d080288b95>] free_page_type+0x625/0x790
(XEN)    [<ffff82d080288e07>] mm.c#_put_page_type+0x107/0x340
(XEN)    [<ffff82d08028949f>] put_page_type_preemptible+0xf/0x10
(XEN)    [<ffff82d080272b3b>] domain.c#relinquish_memory+0xab/0x460
(XEN)    [<ffff82d0802810d7>] pirq_guest_eoi+0x27/0x30
(XEN)    [<ffff82d080276b43>] domain_relinquish_resources+0x203/0x290
(XEN)    [<ffff82d0802068bd>] domain_kill+0xbd/0x150
(XEN)    [<ffff82d0802039e3>] do_domctl+0x7d3/0x1a90
(XEN)    [<ffff82d08026ee50>] do_physdev_op_compat+0/0x70
(XEN)    [<ffff82d080203210>] do_domctl+0/0x1a90
(XEN)    [<ffff82d080367145>] pv_hypercall+0x1f5/0x430
(XEN)    [<ffff82d08036d432>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08036d43e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d08036d432>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08036d43e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d08036d432>] lstar_enter+0xa2/0x120
(XEN)    [<ffff82d08036d43e>] lstar_enter+0xae/0x120
(XEN)    [<ffff82d08036d49f>] lstar_enter+0x10f/0x120
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'cpu < nr_cpu_ids' failed at ...1/work/xen-4.11.0-rc1/xen/include/xen/cpumask.h:97
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=xen-dmesg

(XEN) parameter "gnttab_max_nr_frames" unknown!
 Xen 4.11-rcnb0
(XEN) Xen version 4.11-rcnb0 (bouyer@) (gcc (nb2 20150115) 4.8.5) debug=y  Tue Apr 24 16:10:25 MEST 2018
(XEN) Latest ChangeSet: 
(XEN) Console output is synchronous.
(XEN) Bootloader: unknown
(XEN) Command line: dom0_mem=512M console=com1 com1=9600,8n1 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 sync_console=1
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: none; EDID transfer time: 0 seconds
(XEN)  EDID info not retrieved because no DDC retrieval method detected
(XEN) Disc information:
(XEN)  Found 1 MBR signatures
(XEN)  Found 2 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009ec00 (usable)
(XEN)  00000000000f0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 00000000bf3ff800 (usable)
(XEN)  00000000bf3ff800 - 00000000bf453c00 (ACPI NVS)
(XEN)  00000000bf453c00 - 00000000bf455c00 (ACPI data)
(XEN)  00000000bf455c00 - 00000000c0000000 (reserved)
(XEN)  00000000e0000000 - 00000000fed00400 (reserved)
(XEN)  00000000fed20000 - 00000000feda0000 (reserved)
(XEN)  00000000fee00000 - 00000000fef00000 (reserved)
(XEN)  00000000ffb00000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000238000000 (usable)
(XEN) New Xen image base address: 0xbec00000
(XEN) ACPI: RSDP 000FEC00, 0024 (r2 DELL  )
(XEN) ACPI: XSDT 000FC5BB, 0074 (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: FACP 000FC6EB, 00F4 (r3 DELL    B9K           15 ASL        61)
(XEN) ACPI: DSDT FFF789A5, 45A0 (r1   DELL    dt_ex     1000 INTL 20050624)
(XEN) ACPI: FACS BF3FF800, 0040
(XEN) ACPI: SSDT FFF7D064, 00AA (r1   DELL    st_ex     1000 INTL 20050624)
(XEN) ACPI: APIC 000FC7DF, 0092 (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: BOOT 000FC871, 0028 (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: ASF! 000FC899, 0096 (r32 DELL    B9K           15 ASL        61)
(XEN) ACPI: MCFG 000FC92F, 003E (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: HPET 000FC96D, 0038 (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: TCPA 000FCBC9, 0032 (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: DMAR 000FCBFB, 0118 (r1 DELL    B9K           15 ASL        61)
(XEN) ACPI: SLIC 000FC9A5, 00C0 (r1 DELL    B9K           15 ASL        61)
(XEN) System RAM: 8051MB (8244852kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000238000000
(XEN) Domain heap initialised
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 15 (0xf), Stepping 11 (raw 000006fb)
(XEN) found SMP MP-table at 000fe710
(XEN) DMI 2.5 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI:             wakeup_vec[bf3ff80c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x05] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x07] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x01] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x02] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x03] disabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
(XEN) ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a301 base: 0xfed00000
(XEN) ERST table was not found
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (6 hotplug CPUs)
(XEN) IRQ limits: 24 GSI, 376 MSI/MSI-X
(XEN) mce_intel.c:782: MCA Capability: firstbank 1, extended MCE MSR 0, BCAST
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN) BTI mitigations: Thunk N/A, Others: RSB_NATIVE RSB_VMEXIT
(XEN) XPTI: enabled
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2327.503 MHz processor.
(XEN) Initing memory sharing.
(XEN) alt table ffff82d0804505b8 -> ffff82d080452252
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Intel VT-d iommu 2 supported page sizes: 4kB.
(XEN) traps.c:1569: GPF (0000): ffff82d0803f78fb [intel_vtd_setup+0x13b/0x4d0] -> ffff82d08036f2c0
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB.
(XEN) traps.c:1569: GPF (0000): ffff82d0803f78fb [intel_vtd_setup+0x13b/0x4d0] -> ffff82d08036f2c0
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB.
(XEN) traps.c:1569: GPF (0000): ffff82d0803f78fb [intel_vtd_setup+0x13b/0x4d0] -> ffff82d08036f2c0
(XEN) Intel VT-d iommu 3 supported page sizes: 4kB.
(XEN) traps.c:1569: GPF (0000): ffff82d0803f78fb [intel_vtd_setup+0x13b/0x4d0] -> ffff82d08036f2c0
(XEN) Intel VT-d Snoop Control not enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation not enabled.
(XEN) Intel VT-d Interrupt Remapping not enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables not enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping disabled
(XEN) nr_sockets: 4
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Allocated console ring of 16 KiB.
(XEN) mwait-idle: does not run on family 6 model 15
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN) HVM: ASIDs disabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) not detected
(XEN) Brought up 2 CPUs
(XEN) build-id: 58c1c38138780bc01086b1f3d58e825ea87f2dc1
(XEN) Running stub recovery selftests...
(XEN) traps.c:1569: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d08036f3f2
(XEN) traps.c:754: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d08036f3f2
(XEN) traps.c:1096: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d08036f3f2
(XEN) HPET: 0 timers usable for broadcast (4 total)
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 400 PIRQs
(XEN) grant_table.c:1769:IDLEv0 Expanding d0 grant table from 0 to 1 frames
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0xffffffff80000000 memsz=0xb828b8
(XEN) ELF: phdr: paddr=0xffffffff80c828c0 memsz=0x24e740
(XEN) ELF: memory: 0xffffffff80000000 -> 0xffffffff80ed1000
(XEN) ELF: __xen_guest: "GUEST_OS=NetBSD,GUEST_VER=4.99,XEN_VER=xen-3.0,LOADER=generic,VIRT_BASE=0xffffffff80000000,ELF_PADDR_OFFSET=0xffffffff80000000,VIRT_ENTRY=0xffffffff80100000,HYPERCALL_PAGE=0x00000101,BSD_SYMTAB=yes"
(XEN) ELF: GUEST_OS="NetBSD"
(XEN) ELF: GUEST_VER="4.99"
(XEN) ELF: XEN_VER="xen-3.0"
(XEN) ELF: LOADER="generic"
(XEN) ELF: VIRT_BASE="0xffffffff80000000"
(XEN) ELF: ELF_PADDR_OFFSET="0xffffffff80000000"
(XEN) ELF: VIRT_ENTRY="0xffffffff80100000"
(XEN) ELF: HYPERCALL_PAGE="0x00000101"
(XEN) ELF: BSD_SYMTAB="yes"
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0xffffffff80000000
(XEN)     virt_offset      = 0x0
(XEN)     virt_kstart      = 0xffffffff80000000
(XEN)     virt_kend        = 0xffffffff80ff4510
(XEN)     virt_entry       = 0xffffffff80100000
(XEN)     p2m_base         = 0xffffffffffffffff
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, lsb, paddr 0xffffffff80000000 -> 0xffffffff80ed1000
(XEN)  Dom0 symbol map 0xffffffff80ed1000 -> 0xffffffff80ff4510
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   000000022e000000->0000000230000000 (122880 pages to be allocated)
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff80000000->ffffffff80ff4510
(XEN)  Init. ramdisk: ffffffff80ff5000->ffffffff80ff5000
(XEN)  Phys-Mach map: ffffffff80ff5000->ffffffff810f5000
(XEN)  Start info:    ffffffff810f5000->ffffffff810f54b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff810f6000->ffffffff81103000
(XEN)  Boot stack:    ffffffff81103000->ffffffff81104000
(XEN)  TOTAL:         ffffffff80000000->ffffffff81400000
(XEN)  ENTRY ADDRESS: ffffffff80100000
(XEN) Dom0 has maximum 2 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff80000000 -> 0xffffffff80b828b8
(XEN) ELF: phdr 1 at 0xffffffff80c828c0 -> 0xffffffff80d1a578
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 2 CPUs
(XEN) ....................................done.
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
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 444kB init memory
(XEN) io_apic.c:2384: IO-APIC: apic=0, pin=0, irq=0
(XEN) IO-APIC: new_entry=000109f0
(XEN) IO-APIC: old_entry=00010000 pirq=-1
(XEN) IO-APIC: Attempt to modify IO-APIC pin for in-use IRQ!
(XEN) io_apic.c:2384: IO-APIC: apic=0, pin=2, irq=0
(XEN) IO-APIC: new_entry=000109f0
(XEN) IO-APIC: old_entry=000009f0 pirq=-1
(XEN) IO-APIC: Attempt to modify IO-APIC pin for in-use IRQ!
(XEN) io_apic.c:2384: IO-APIC: apic=0, pin=4, irq=4
(XEN) IO-APIC: new_entry=000109f1
(XEN) IO-APIC: old_entry=000009f1 pirq=-1
(XEN) IO-APIC: Attempt to modify IO-APIC pin for in-use IRQ!
(XEN) allocated vector b8 for irq 16
(XEN) allocated vector c0 for irq 17
(XEN) allocated vector c8 for irq 18
(XEN) allocated vector d0 for irq 19
(XEN) allocated vector d8 for irq 20
(XEN) allocated vector 21 for irq 21
(XEN) allocated vector 29 for irq 22
(XEN) allocated vector 31 for irq 23

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--uAKRQypu60I7Lcqm--
