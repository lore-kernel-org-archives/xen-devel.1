From: Andy Smith <andy@strugglers.net>
Subject: Sporadic PV guest malloc.c assertion failures and
 segfaults unless pv-l1tf=false is set
Date: Sun, 25 Nov 2018 06:18:49 +0000
Message-ID: <20181125061849.GI4569@bitfolk.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="zn5D3Gb14AXjeTqb"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--zn5D3Gb14AXjeTqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Last weekend I deployed a hypervisor built from 4.10.1 release
plus the most recent XSAs (which were under embargo at that time).
Previously to this I had only gone as far as XSA-267, having taken a
decision to wait before applying later XSAs. So, this most recent
deployment included the fixes for XSA-273 for the first time.

Over the course of this past week, some guests started to experience
sporadic assertion failures in libc/malloc.c or strange segmentation
violations. In most cases it is not easily reproducible, but I got a
report from one guest administrator that their php-fpm process is
reliably segfaulting immediately. For example:

[19-Nov-2018 06:39:56] WARNING: [pool www] child 3682 exited on signal 11 (SIGSEGV) after 18.601413 seconds from start
[19-Nov-2018 06:39:56] NOTICE: [pool www] child 3683 started
[19-Nov-2018 06:40:16] WARNING: [pool www] child 3683 exited on signal 11 (SIGSEGV) after 20.364357 seconds from start
[19-Nov-2018 06:40:16] NOTICE: [pool www] child 3684 started
[19-Nov-2018 06:43:43] WARNING: [pool www] child 3426 exited on signal 11 (SIGSEGV) after 1327.885798 seconds from start
[19-Nov-2018 06:43:43] NOTICE: [pool www] child 3739 started
[19-Nov-2018 06:43:59] WARNING: [pool www] child 3739 exited on signal 11 (SIGSEGV) after 15.922980 seconds from start

The failures that mention malloc.c are happening in multiple
different binaries, including grep, perl and shells. They look like
this:

grep: malloc.c:2372: sysmalloc: Assertion `(old_top == (((mbinptr) (((char *) &((av)->bins[((1) - 1) * 2])) - __builtin_offsetof (struct malloc_chunk, fd)))) && old_size == 0) || ((unsigned long) (old_size) >= (unsigned long)((((__builtin_offsetof (struct malloc_chunk, fd_nextsize))+((2 *(sizeof(size_t))) - 1)) & ~((2 *(sizeof(size_t))) - 1))) && ((old_top)->size & 0x1) && ((unsigned long) old_end & pagemask) == 0)' failed.

I have not been able to reproduce these problems when I boot the
hypervisor with pv-l1tf=false. The php-fpm one was previously
reproducible 100% of the time. The other cases are very hard to
trigger but with pv-l1tf=false I am not able to at all.

I have since checked out staging-4.10 and am experiencing the same
thing, so I'm fairly confident it is not something I've introduced
when applying XSA patches.

My workload is several hundred PV guests across 9 servers with two
different types of Intel CPU. The guests are of many different Linux
distributions, probably a 70/30 split between 32- and 64-bit. I have
so far only encountered this with 64-bit guests running Debian
jessie and stretch, less than 10 guests are affected (so far
reported), and all of them trigger the "d1 L1TF-vulnerable L1e
000000006a6ff960 - Shadowing" warning in dmesg (though there are
hundreds of others which trigger it yet seem unaffected). There is
an unconfirmed report from 64-bit Gentoo.

In the text for XSA-273 it says:

    "Shadowing comes with a workload-dependent performance hit to
    the guest.  Once the guest kernel software updates have been
    applied, a well behaved guest will not write vulnerable PTEs,
    and will therefore avoid the performance penalty (or crash)
    entirely."

Does anyone have a reference to what is needed in the Linux kernel
for that? Perhaps I can see what the status of that is within kernel
upstream / Debian and then get past the problem by getting an
updated guest kernel onto affected guests.

Also:

    "This behaviour is active by default for guests on affected
    hardware (controlled by `pv-l1tf=`), but is disabled by default
    for dom0. Dom0's exemption is because of instabilities when
    being shadowed, which are under investigation"

I have not had these issues in any of my 9 dom0s which are all
64-bit Debian jessie. Since these L1TF fixes are not active for
dom0, that makes sense. Are the observed dom0 instabilities similar
to what I am seeing in some guests?

Any suggestions for further debugging? I have attached an "xl
dmesg".

Cheers,
Andy

--zn5D3Gb14AXjeTqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.txt"

(XEN) parameter "placeholder" unknown!
 __  __            _  _    _  ___   _____                   
 \ \/ /___ _ __   | || |  / |/ _ \ |___ /    _ __  _ __ ___ 
  \  // _ \ '_ \  | || |_ | | | | |  |_ \ __| '_ \| '__/ _ \
  /  \  __/ | | | |__   _|| | |_| | ___) |__| |_) | | |  __/
 /_/\_\___|_| |_|    |_|(_)_|\___(_)____/   | .__/|_|  \___|
                                            |_|             
(XEN) Xen version 4.10.3-pre (andy@bitfolk.com) (gcc (Debian 4.9.2-10+deb8u1) 4.9.2) debug=n  Sun Nov 25 05:48:03 UTC 2018
(XEN) Latest ChangeSet: Tue Nov 20 15:45:04 2018 +0100 git:b6e203b
(XEN) Bootloader: GRUB 2.02~beta2-22+deb8u1
(XEN) Command line: placeholder dom0_mem=2048M,max:4096M dom0_max_vcpus=2 com1=115200,8n1,0x2f8,10 console=com1,vga ucode=scan serial_tx_buffer=256k loglvl=info
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: none; EDID transfer time: 1 seconds
(XEN)  EDID info not retrieved because no DDC retrieval method detected
(XEN) Disc information:
(XEN)  Found 2 MBR signatures
(XEN)  Found 5 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 0000000000098800 (usable)
(XEN)  0000000000098800 - 00000000000a0000 (reserved)
(XEN)  00000000000e0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000078f6a000 (usable)
(XEN)  0000000078f6a000 - 0000000079858000 (reserved)
(XEN)  0000000079858000 - 0000000079d47000 (ACPI NVS)
(XEN)  0000000079d47000 - 0000000090000000 (reserved)
(XEN)  00000000fed1c000 - 00000000fed45000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000004080000000 (usable)
(XEN) New Xen image base address: 0x78800000
(XEN) ACPI: RSDP 000F05B0, 0024 (r2 SUPERM)
(XEN) ACPI: XSDT 798A80A0, 00BC (r1                  1072009 AMI     10013)
(XEN) ACPI: FACP 798D8E48, 010C (r5 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: DSDT 798A81F0, 30C53 (r2 SUPERM SMCI--MB  1072009 INTL 20091013)
(XEN) ACPI: FACS 79D45F80, 0040
(XEN) ACPI: APIC 798D8F58, 0138 (r3 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: FPDT 798D9090, 0044 (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: FIDT 798D90D8, 009C (r1 SUPERM SMCI--MB  1072009 AMI     10013)
(XEN) ACPI: SPMI 798D9178, 0040 (r5 SUPERM SMCI--MB        0 AMI.        0)
(XEN) ACPI: MCFG 798D91B8, 003C (r1 SUPERM SMCI--MB  1072009 MSFT       97)
(XEN) ACPI: UEFI 798D91F8, 0042 (r1 SUPERM SMCI--MB  1072009             0)
(XEN) ACPI: HPET 798D9240, 0038 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: WDDT 798D9278, 0040 (r1 SUPERM SMCI--MB        0 INTL 20091013)
(XEN) ACPI: SSDT 798D92B8, 1717F (r2 SUPERM    PmMgt        1 INTL 20120913)
(XEN) ACPI: NITR 798F0438, 0071 (r2 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: SSDT 798F04B0, 264C (r2 SUPERM SpsNm           2 INTL 20120913)
(XEN) ACPI: SSDT 798F2B00, 0064 (r2 SUPERM SpsNvs          2 INTL 20120913)
(XEN) ACPI: PRAD 798F2B68, 0102 (r2 SUPERM SMCI--MB        2 INTL 20120913)
(XEN) ACPI: DMAR 798F2C70, 00C4 (r1 SUPERM SMCI--MB        1 INTL 20091013)
(XEN) ACPI: HEST 798F2D38, 027C (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: BERT 798F2FB8, 0030 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: ERST 798F2FE8, 0230 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) ACPI: EINJ 798F3218, 0130 (r1 SUPERM SMCI--MB        1 INTL        1)
(XEN) System RAM: 262031MB (268319752kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000004080000000
(XEN) Domain heap initialised
(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 79 (0x4f), Stepping 1 (raw 000406f1)
(XEN) found SMP MP-table at 000fcd20
(XEN) DMI 3.0 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x408 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 79d45f80/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[79d45f8c], vec_size[20]
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x08] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x0a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x0c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x0e] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x05] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x07] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x09] lapic_id[0x09] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x0b] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x0d] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x0f] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x01] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x02] address[0xfec01000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 2, version 32, address 0xfec01000, GSI 24-47
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) Enabling APIC mode:  Phys.  Using 2 I/O APICs
(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 16 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 48 GSI, 3040 MSI/MSI-X
(XEN) Not enabling x2APIC (upon firmware request)
(XEN) microcode: CPU0 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 17, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 18, using 0x1
(XEN) CMCI: threshold 0x2 too large for CPU0 bank 19, using 0x1
(XEN) CPU0: Intel machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features: IBRS/IBPB STIBP L1D_FLUSH SSBD
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: IBRS- SSBD-, Other: IBPB L1D_FLUSH
(XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 46, Safe address 300000000000
(XEN)   Support for VMs: PV: MSR_SPEC_CTRL RSB EAGER_FPU, HVM: MSR_SPEC_CTRL RSB EAGER_FPU
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 3400.011 MHz processor.
(XEN) Initing memory sharing.
(XEN) alt table ffff82d080420bb8 -> ffff82d080422670
(XEN) PCI: MCFG configuration 0: base 80000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at 80000000 reserved in E820
(XEN) PCI: Using MCFG for segment 0000 bus 00-ff
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Allocated console ring of 64 KiB.
(XEN) VMX: Supported advanced features:
(XEN)  - APIC MMIO access virtualisation
(XEN)  - APIC TPR shadow
(XEN)  - Extended Page Tables (EPT)
(XEN)  - Virtual-Processor Identifiers (VPID)
(XEN)  - Virtual NMI
(XEN)  - MSR direct-access bitmap
(XEN)  - Unrestricted Guest
(XEN)  - APIC Register Virtualization
(XEN)  - Virtual Interrupt Delivery
(XEN)  - Posted Interrupt Processing
(XEN)  - VMCS shadowing
(XEN)  - VM Functions
(XEN)  - Virtualisation Exceptions
(XEN)  - Page Modification Logging
(XEN) HVM: ASIDs enabled.
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) microcode: CPU2 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) microcode: CPU4 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) microcode: CPU6 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) microcode: CPU8 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) microcode: CPU10 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) microcode: CPU12 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) microcode: CPU14 updated from revision 0xb00001d to 0xb00002e, date = 2018-04-19 
(XEN) Brought up 16 CPUs
(XEN) build-id: dc0cee6d0c848a3b9f273129ba6af4c566ddfab7
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Dom0 has maximum 432 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** LOADING DOMAIN 0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x1f34000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000004008000000->000000400c000000 (506553 pages to be allocated)
(XEN)  Init. ramdisk: 000000407fab9000->000000407ffffee7
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff81f34000
(XEN)  Init. ramdisk: ffffffff81f34000->ffffffff8247aee7
(XEN)  Phys-Mach map: ffffffff8247b000->ffffffff8287b000
(XEN)  Start info:    ffffffff8287b000->ffffffff8287b4b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff8287c000->ffffffff82895000
(XEN)  Boot stack:    ffffffff82895000->ffffffff82896000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82c00000
(XEN)  ENTRY ADDRESS: ffffffff819151f0
(XEN) Dom0 has maximum 2 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 8 CPUs
(XEN) ..................................................................................................................................................................................................................................................................done.
(XEN) Std. Loglevel: Errors, warnings and info
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) ***************************************************
(XEN) Booted on L1TF-vulnerable hardware with SMT/Hyperthreading
(XEN) enabled.  Please assess your configuration and choose an
(XEN) explicit 'smt=<bool>' setting.  See XSA-273.
(XEN) ***************************************************
(XEN) 3... 2... 1... 
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input to Xen)
(XEN) Freed 472kB init memory
(XEN) d1 L1TF-vulnerable L1e 000000006a6ff960 - Shadowing

--zn5D3Gb14AXjeTqb
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--zn5D3Gb14AXjeTqb--
