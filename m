From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: Building PVH mini-os with libc support
Date: Thu, 28 Dec 2017 18:33:23 +0000
Message-ID: <CADNMjEDCKZoeKQ5bEwJo0okmCgm-Jn0OgbP85+qfc1YJfUinfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5805772116071742085=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sfng=dy=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1eUczi-0003tj-3I
 for xen-devel@lists.xenproject.org; Thu, 28 Dec 2017 18:33:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: minios-devel@lists.xenproject.org, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============5805772116071742085==
Content-Type: multipart/alternative; boundary="001a114922d246065105616ac0ff"

--001a114922d246065105616ac0ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I am trying to build PVH mini-os with libc support. These are the steps I
have followed so far:

1. Xen repo (master: commit id: d2f86bf604698806d311cc251c1b66fbb752673c)

2. mini-os repo (master: commit id:
0b4b7897e08b967a09bed2028a79fabff82342dd)
3. Made the following modifications in the xen repo to build c-stubdom:



diff --git a/stubdom/Makefile b/stubdom/Makefile

index f45eeabd8b..aa21904019 100644

--- a/stubdom/Makefile

+++ b/stubdom/Makefile

@@ -61,7 +61,7 @@ TARGET_CPPFLAGS +=3D -I$(XEN_ROOT)/xen/include



 TARGET_LDFLAGS +=3D -nostdlib
-L$(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/lib



-TARGETS=3D$(STUBDOM_TARGETS)

+TARGETS=3D$(STUBDOM_TARGETS) c



 STUBDOMPATH=3D"stubdompath.sh"

 genpath-target =3D $(call buildmakevars2file,$(STUBDOMPATH))

diff --git a/stubdom/c/minios.cfg b/stubdom/c/minios.cfg

index e69de29bb2..cacde0cbca 100644

--- a/stubdom/c/minios.cfg

+++ b/stubdom/c/minios.cfg

@@ -0,0 +1,18 @@

+CONFIG_PARAVIRT=3Dn

+CONFIG_START_NETWORK ?=3D y

+CONFIG_SPARSE_BSS ?=3D y

+CONFIG_QEMU_XS_ARGS ?=3D n

+CONFIG_PCIFRONT ?=3D n

+CONFIG_BLKFRONT ?=3D y

+CONFIG_TPMFRONT ?=3D n

+CONFIG_TPM_TIS ?=3D n

+CONFIG_TPMBACK ?=3D n

+CONFIG_NETFRONT ?=3D y

+CONFIG_FBFRONT ?=3D y

+CONFIG_KBDFRONT ?=3D y

+CONFIG_CONSFRONT ?=3D y

+CONFIG_XENBUS ?=3D y

+CONFIG_XC ?=3Dy

+CONFIG_BALLOON ?=3D n



4. $ cd $(XEN_ROOT)
5. $ make; sudo make instal
6. Reboot host
7. $ cd $(XEN_ROOT)/stubdom
8. $ make c-stubdom
9. Used the following configuration file to create the domain:



type=3D"pvh"

memory=3D512

vcpu=3D1

name=3D"minios"

kernel=3D"/home/balvisio/xen/stubdom/mini-os-x86_64-c/mini-os.gz"




When I create the domain it crashes during the bootstrap process with a
triple fault. The following are the dmesg logs (note that "Xen Minimal OS
(hvm)!" is printed and the domain crashes after that line in setup.c):




(XEN) grant_table.c:1688:d0v3 Expanding d360 grant table from 0 to 1 frames

(XEN) HVM360 save: CPU

(XEN) HVM360 save: PIC

(XEN) HVM360 save: IOAPIC

(XEN) HVM360 save: LAPIC

(XEN) HVM360 save: LAPIC_REGS

(XEN) HVM360 save: PCI_IRQ

(XEN) HVM360 save: ISA_IRQ

(XEN) HVM360 save: PCI_LINK

(XEN) HVM360 save: PIT

(XEN) HVM360 save: RTC

(XEN) HVM360 save: HPET

(XEN) HVM360 save: PMTIMER

(XEN) HVM360 save: MTRR

(XEN) HVM360 save: VIRIDIAN_DOMAIN

(XEN) HVM360 save: CPU_XSAVE

(XEN) HVM360 save: VIRIDIAN_VCPU

(XEN) HVM360 save: VMCE_VCPU

(XEN) HVM360 save: TSC_ADJUST

(XEN) HVM360 restore: CPU 0

(d360) Bootstrapping...

(XEN) Dom360 callback via changed to Direct Vector 0x20

(d360) Xen Minimal OS (hvm)!

(XEN) d360v0 Triple fault - invoking HVM shutdown action 1

(XEN) *** Dumping Dom360 vcpu#0 state: ***

(XEN) ----[ Xen-4.10.0-rc  x86_64  debug=3Dy   Not tainted ]----

(XEN) CPU:    7

(XEN) RIP:    0008:[<0000000000056fc8>]

(XEN) RFLAGS: 0000000000010006   CONTEXT: hvm guest (d360v0)

(XEN) rax: 00000000000bfe75   rbx: 00000000000bfe75   rcx: 0000000000000000

(XEN) rdx: 0000000000000017   rsi: 00000000000bfe60   rdi: 0000000000000000

(XEN) rbp: 00000000000bfec0   rsp: 00000000000bfe60   r8:  0000000000000000

(XEN) r9:  0000000000089982   r10: 0000000000000016   r11: 0000000000000000

(XEN) r12: 0000000000000017   r13: 0000000000000016   r14: 0000000000000000

(XEN) r15: 0d8b4c1575ff8548   cr0: 0000000080000011   cr4: 0000000000000220

(XEN) cr3: 0000000000099000   cr2: 0000000000000000

(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000

(XEN) ds: 0033   es: 0033   fs: 0033   gs: 0033   ss: 0000   cs: 0008





Any help on this would be greatly appreciated. In addition to this I have
noticed that even fter installing Xen and rebooting the host, the initial
=E2=80=98xl dmesg=E2=80=99 logs show that Xen tries to launch unsuccessfull=
y domains
created before the system was rebooted. I am not sure if these two issues
are related but I pasting a trace of the logs (these dmesg logs are seen
just after rebooting the host before attempting anything else):



root@debianxen:/home/balvisio# xl dmesg

(XEN) parameter "placeholder" unknown!

 Xen 4.10.0-rc

(XEN) Xen version 4.10.0-rc (balvisio@us.oracle.com) (gcc (Debian 6.3.0-18)
6.3.0 20170516) debug=3Dy  Thu Dec 28 09:53:12 PST 2017

(XEN) Latest ChangeSet: Thu Nov 16 21:34:02 2017 +0000 git:d2f86bf604-dirty

(XEN) Bootloader: GRUB 2.02~beta3-5

(XEN) Command line: placeholder

(XEN) Xen image load base address: 0

(XEN) Video information:

(XEN)  VGA is text mode 80x25, font 8x16

(XEN)  VBE/DDC methods: none; EDID transfer time: 0 seconds

(XEN)  EDID info not retrieved because no DDC retrieval method detected

(XEN) Disc information:

(XEN)  Found 2 MBR signatures

(XEN)  Found 2 EDD information structures

(XEN) Xen-e820 RAM map:

(XEN)  0000000000000000 - 000000000009a400 (usable)

(XEN)  000000000009a400 - 00000000000a0000 (reserved)

(XEN)  00000000000e0000 - 0000000000100000 (reserved)

(XEN)  0000000000100000 - 00000000bf406000 (usable)

(XEN)  00000000bf406000 - 00000000bf452000 (ACPI NVS)

(XEN)  00000000bf452000 - 00000000bf45a000 (ACPI data)

(XEN)  00000000bf45a000 - 00000000bf477000 (reserved)

(XEN)  00000000bf477000 - 00000000bf478000 (ACPI NVS)

(XEN)  00000000bf478000 - 00000000bf489000 (reserved)

(XEN)  00000000bf489000 - 00000000bf48c000 (ACPI NVS)

(XEN)  00000000bf48c000 - 00000000bf4ad000 (reserved)

(XEN)  00000000bf4ad000 - 00000000bf4af000 (usable)

(XEN)  00000000bf4af000 - 00000000bf503000 (reserved)

(XEN)  00000000bf503000 - 00000000bf50d000 (ACPI NVS)

(XEN)  00000000bf50d000 - 00000000bf533000 (reserved)

(XEN)  00000000bf533000 - 00000000bf576000 (ACPI NVS)

(XEN)  00000000bf576000 - 00000000bf800000 (usable)

(XEN)  00000000fed1c000 - 00000000fed40000 (reserved)

(XEN)  00000000ff000000 - 0000000100000000 (reserved)

(XEN)  0000000100000000 - 0000000440000000 (usable)

(XEN) New Xen image base address: 0xbee00000

(XEN) ACPI: RSDP 000F0450, 0024 (r2 SUPERM)

(XEN) ACPI: XSDT BF452078, 0074 (r1 SUPERM SMCI--MB        1 AMI     10013)

(XEN) ACPI: FACP BF458B38, 00F4 (r4 SUPERM SMCI--MB        1 AMI     10013)

(XEN) ACPI: DSDT BF452180, 69B8 (r2 SUPERM SMCI--MB        0 INTL 20051117)

(XEN) ACPI: FACS BF50AF80, 0040

(XEN) ACPI: APIC BF458C30, 0092 (r3 SUPERM SMCI--MB        1 AMI     10013)

(XEN) ACPI: SSDT BF458CC8, 01D6 (r1 AMICPU     PROC        1 MSFT  3000001)

(XEN) ACPI: MCFG BF458EA0, 003C (r1 SUPERM SMCI--MB        1 MSFT       97)

(XEN) ACPI: HPET BF458EE0, 0038 (r1 SUPERM SMCI--MB        1 AMI.        4)

(XEN) ACPI: SPMI BF458F18, 0040 (r5 A M I   OEMSPMI        0 AMI.        0)

(XEN) ACPI: EINJ BF458F58, 0130 (r1    AMI AMI EINJ        0             0)

(XEN) ACPI: ERST BF459088, 0210 (r1  AMIER AMI ERST        0             0)

(XEN) ACPI: HEST BF459298, 00A8 (r1    AMI AMI HEST        0             0)

(XEN) ACPI: BERT BF459340, 0030 (r1    AMI AMI BERT        0             0)

(XEN) System RAM: 16374MB (16767152kB)

(XEN) No NUMA configuration found

(XEN) Faking a node at 0000000000000000-0000000440000000

(XEN) Domain heap initialised

(XEN) CPU Vendor: Intel, Family 6 (0x6), Model 42 (0x2a), Stepping 7 (raw
000206a7)

(XEN) found SMP MP-table at 000fcd80

(XEN) DMI 2.7 present.

(XEN) Using APIC driver default

(XEN) ACPI: PM-Timer IO Port: 0x408 (32 bits)

(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]

(XEN) ACPI: 32/64X FACS address mismatch in FADT -
bf50af80/0000000000000000, using 32

(XEN) ACPI:             wakeup_vec[bf50af8c], vec_size[20]

(XEN) ACPI: Local APIC address 0xfee00000

(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x01] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x03] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x05] enabled)

(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] enabled)

(XEN) ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])

(XEN) ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])

(XEN) IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23

(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)

(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)

(XEN) ACPI: IRQ0 used by override.

(XEN) ACPI: IRQ2 used by override.

(XEN) ACPI: IRQ9 used by override.

(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs

(XEN) ACPI: HPET id: 0x8086a701 base: 0xfed00000

(XEN) Xen ERST support is initialized.

(XEN) HEST: Table parsing has been initialized

(XEN) Using ACPI (MADT) for SMP configuration information

(XEN) SMP: Allowing 8 CPUs (0 hotplug CPUs)

(XEN) IRQ limits: 24 GSI, 1528 MSI/MSI-X

(XEN) Not enabling x2APIC: depends on iommu_supports_eim.

(XEN) xstate: size: 0x340 and states: 0x7

(XEN) mce_intel.c:782: MCA Capability: firstbank 0, extended MCE MSR 0,
BCAST, CMCI

(XEN) CPU0: Intel machine check reporting enabled

(XEN) Using scheduler: SMP Credit Scheduler (credit)

(XEN) Platform timer is 14.318MHz HPET

(XEN) Detected 3192.768 MHz processor.

(XEN) Initing memory sharing.

(XEN) alt table ffff82d080451778 -> ffff82d080452d98

(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff

(XEN) PCI: Not using MCFG for segment 0000 bus 00-ff

(XEN) I/O virtualisation disabled

(XEN) nr_sockets: 1

(XEN) Enabled directed EOI with ioapic_ack_old on!

(XEN) ENABLING IO-APIC IRQs

(XEN)  -> Using old ACK method

(XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1

(XEN) TSC deadline timer enabled

(XEN) Allocated console ring of 64 KiB.

(XEN) mwait-idle: MWAIT substates: 0x1120

(XEN) mwait-idle: v0.4.1 model 0x2a

(XEN) mwait-idle: lapic_timer_reliable_states 0xffffffff

(XEN) VMX: Supported advanced features:

(XEN)  - APIC MMIO access virtualisation

(XEN)  - APIC TPR shadow

(XEN)  - Extended Page Tables (EPT)

(XEN)  - Virtual-Processor Identifiers (VPID)

(XEN)  - Virtual NMI

(XEN)  - MSR direct-access bitmap

(XEN)  - Unrestricted Guest

(XEN) HVM: ASIDs enabled.

(XEN) HVM: VMX enabled

(XEN) HVM: Hardware Assisted Paging (HAP) detected

(XEN) HVM: HAP page sizes: 4kB, 2MB

(XEN) Brought up 8 CPUs

(XEN) build-id: bca1c3697611c869f348a4b7c4bfe326d0cbbc25

(XEN) Running stub recovery selftests...

(XEN) traps.c:1540: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] ->
ffff82d08036d2f2

(XEN) traps.c:739: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] ->
ffff82d08036d2f2

(XEN) traps.c:1076: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] ->
ffff82d08036d2f2

(XEN) ACPI sleep modes: S3

(XEN) VPMU: disabled

(XEN) mcheck_poll: Machine check polling timer started.

(XEN) Dom0 has maximum 792 PIRQs

(XEN) grant_table.c:1688:IDLEv0 Expanding d0 grant table from 0 to 1 frames

(XEN) NX (Execute Disable) protection active

(XEN) *** LOADING DOMAIN 0 ***

(XEN) ELF: phdr: paddr=3D0x1000000 memsz=3D0xaca000

(XEN) ELF: phdr: paddr=3D0x1c00000 memsz=3D0x11e000

(XEN) ELF: phdr: paddr=3D0x1d1e000 memsz=3D0x19418

(XEN) ELF: phdr: paddr=3D0x1d38000 memsz=3D0x223000

(XEN) ELF: memory: 0x1000000 -> 0x1f5b000

(XEN) ELF: note: GUEST_OS =3D "linux"

(XEN) ELF: note: GUEST_VERSION =3D "2.6"

(XEN) ELF: note: XEN_VERSION =3D "xen-3.0"

(XEN) ELF: note: VIRT_BASE =3D 0xffffffff80000000

(XEN) ELF: note: INIT_P2M =3D 0x8000000000

(XEN) ELF: note: ENTRY =3D 0xffffffff81d38180

(XEN) ELF: note: HYPERCALL_PAGE =3D 0xffffffff81001000

(XEN) ELF: note: FEATURES =3D
"!writable_page_tables|pae_pgdir_above_4gb|writable_descriptor_tables|auto_=
translated_physmap|supervisor_mode_kernel"

(XEN) ELF: note: SUPPORTED_FEATURES =3D 0x90d

(XEN) ELF: note: PAE_MODE =3D "yes"

(XEN) ELF: note: LOADER =3D "generic"

(XEN) ELF: note: unknown (0xd)

(XEN) ELF: note: SUSPEND_CANCEL =3D 0x1

(XEN) ELF: note: MOD_START_PFN =3D 0x1

(XEN) ELF: note: HV_START_LOW =3D 0xffff800000000000

(XEN) ELF: note: PADDR_OFFSET =3D 0

(XEN) ELF: addresses:

(XEN)     virt_base        =3D 0xffffffff80000000

(XEN)     elf_paddr_offset =3D 0x0

(XEN)     virt_offset      =3D 0xffffffff80000000

(XEN)     virt_kstart      =3D 0xffffffff81000000

(XEN)     virt_kend        =3D 0xffffffff81f5b000

(XEN)     virt_entry       =3D 0xffffffff81d38180

(XEN)     p2m_base         =3D 0x8000000000

(XEN)  Xen  kernel: 64-bit, lsb, compat32

(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x1f5b000

(XEN) PHYSICAL MEMORY ARRANGEMENT:

(XEN)  Dom0 alloc.:   000000042e000000->0000000430000000 (4099048 pages to
be allocated)

(XEN)  Init. ramdisk: 000000043ed4d000->000000043ffffa9c

(XEN) VIRTUAL MEMORY ARRANGEMENT:

(XEN)  Loaded kernel: ffffffff81000000->ffffffff81f5b000

(XEN)  Init. ramdisk: 0000000000000000->0000000000000000

(XEN)  Phys-Mach map: 0000008000000000->0000008001f5f4d8

(XEN)  Start info:    ffffffff81f5b000->ffffffff81f5b4b4

(XEN)  Page tables:   ffffffff81f5c000->ffffffff81f6f000

(XEN)  Boot stack:    ffffffff81f6f000->ffffffff81f70000

(XEN)  TOTAL:         ffffffff80000000->ffffffff82000000

(XEN)  ENTRY ADDRESS: ffffffff81d38180

(XEN) Dom0 has maximum 8 VCPUs

(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81aca000

(XEN) ELF: phdr 1 at 0xffffffff81c00000 -> 0xffffffff81d1e000

(XEN) ELF: phdr 2 at 0xffffffff81d1e000 -> 0xffffffff81d37418

(XEN) ELF: phdr 3 at 0xffffffff81d38000 -> 0xffffffff81e82000

(XEN) Initial low memory virq threshold set at 0x4000 pages.

(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs

(XEN) ..................................done.

(XEN) Std. Loglevel: All

(XEN) Guest Loglevel: All

(XEN) Xen is relinquishing VGA console.

(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)

(XEN) Freed 456kB init memory

(XEN) PCI add device 0000:00:00.0

(XEN) PCI add device 0000:00:01.0

(XEN) PCI add device 0000:00:16.0

(XEN) PCI add device 0000:00:16.1

(XEN) PCI add device 0000:00:1a.0

(XEN) PCI add device 0000:00:1d.0

(XEN) PCI add device 0000:00:1e.0

(XEN) PCI add device 0000:00:1f.0

(XEN) PCI add device 0000:00:1f.2

(XEN) PCI add device 0000:00:1f.3

(XEN) PCI add device 0000:01:00.0

(XEN) PCI add device 0000:01:00.1

(XEN) PCI add device 0000:02:03.0

(XEN) PCI: Using MCFG for segment 0000 bus 00-ff

(XEN) d0: Forcing read-only access to MFN fed00

(XEN) traps.c:1540: GPF (0000): ffff82d080363383
[emul-priv-op.c#read_msr+0x370/0x45c] -> ffff82d08036d9b2

(XEN) traps.c:1540: GPF (0000): ffff82d080363383
[emul-priv-op.c#read_msr+0x370/0x45c] -> ffff82d08036d9b2

(XEN) traps.c:1540: GPF (0000): ffff82d080363383
[emul-priv-op.c#read_msr+0x370/0x45c] -> ffff82d08036d9b2

(XEN) grant_table.c:1688:d0v3 Expanding d1 grant table from 0 to 1 frames

(XEN) HVM1 restore: CPU 0

(XEN) HVM1 restore: CPU 1

(XEN) HVM1 restore: PIC 0

(XEN) HVM1 restore: PIC 1

(XEN) HVM1 restore: IOAPIC 0

(XEN) HVM1 restore: LAPIC 0

(XEN) HVM1 restore: LAPIC 1

(XEN) HVM1 restore: LAPIC_REGS 0

(XEN) HVM1 restore: LAPIC_REGS 1

(XEN) HVM1 restore: PCI_IRQ 0

(XEN) HVM1 restore: ISA_IRQ 0

(XEN) HVM1 restore: PCI_LINK 0

(XEN) HVM1 restore: PIT 0

(XEN) HVM1 restore: RTC 0

(XEN) HVM1 restore: HPET 0

(XEN) HVM1 restore: PMTIMER 0

(XEN) HVM1 restore: MTRR 0

(XEN) HVM1 restore: MTRR 1

(XEN) HVM1 restore: CPU_XSAVE 0

(XEN) HVM1 restore: CPU_XSAVE 1

(XEN) HVM1 restore: VMCE_VCPU 0

(XEN) HVM1 restore: VMCE_VCPU 1

(XEN) HVM1 restore: TSC_ADJUST 0

(XEN) HVM1 restore: TSC_ADJUST 1

(XEN) grant_table.c:1688:d0v1 Expanding d2 grant table from 0 to 1 frames

(d2) Bootstrapping...

(d2) Xen Minimal OS (pv)!

(d2)   start_info: 0x574000(VA)

(d2)     nr_pages: 0x2000

(d2)   shared_inf: 0x06183000(MA)

(d2)      pt_base: 0x577000(VA)

(d2) nr_pt_frames: 0x7

(d2)     mfn_list: 0x564000(VA)

(d2)    mod_start: 0x0(VA)

(d2)      mod_len: 0

(d2)        flags: 0x0

(d2)     cmd_line:  -d 1

(d2)        stack: 0x523140-0x543140

(d2) MM: Init

(d2)       _text: 0x0(VA)

(d2)      _etext: 0x117ec2(VA)

(d2)    _erodata: 0x14a000(VA)

(d2)      _edata: 0x14ab68(VA)

(d2) stack start: 0x523140(VA)

(d2)        _end: 0x563e78(VA)

(d2)   start_pfn: 57e

(d2)     max_pfn: 2000

(d2) Mapping memory range 0x57e000 - 0x2000000

(d2) setting 0x0-0x14a000 readonly

(d2) skipped 1000

(d2) MM: Initialise page allocator for 58a000(58a000)-2000000(2000000)

(d2)     Adding memory range 58b000-2000000

(d2) MM: done

(d2) Demand map pfns at 100000000000-108000000000.

(d2) Heap resides at 200000000000-208000000000.

(d2) Initialising timer interface

(d2) Initialising console ... done.

(XEN) grant_table.c:1688:d2v0 Expanding d2 grant table from 1 to 4 frames

(d2) gnttab_table mapped at 0x100000000000.

(d2) Initialising scheduler

(d2) Thread "Idle": pointer: 0x0x200000000050, stack: 0x0x5a0000

(d2) Thread "xenstore": pointer: 0x0x200000000800, stack: 0x0x5b0000

(d2) xenbus initialised on irq 1

(d2) Thread "shutdown": pointer: 0x0x200000000fb0, stack: 0x0x5c0000

(d2) main.c: dummy main: par=3D0x0

(d2) Thread "main": pointer: 0x0x200000001760, stack: 0x0x5d0000

(d2) sparsing 3MB at 181000

(d2) Thread "pcifront": pointer: 0x0x200000003c70, stack: 0x0x5e0000

(d2) pcifront_watches: waiting for backend path to appear
device/pci/0/backend

(d2) dom vm is at /vm/9389f006-0389-4aa8-ad4b-61eeea31676b

(d2) ************************ NETFRONT for device/vif/0 **********

(d2)

(d2)

(d2) net TX ring size 256

(d2) net RX ring size 256

(d2) backend at /local/domain/0/backend/vif/2/0

(d2) mac is 00:16:3e:05:84:95

(d2) **************************

(d2) tap_open((null)) -> 3

(d2) xs_daemon_open -> 4, 0x14a6c8

(d2) ******************* BLKFRONT for /local/domain/2/device/vbd/51712
**********

(d2)

(d2)

(d2) backend at /local/domain/0/backend/vbd/2/51712

(d2) 209715200 sectors of 512 bytes

(d2) **************************

(d2) blk_open(/local/domain/2/device/vbd/51712) -> 5

(d2) xs_watch(device-model/1/logdirty/cmd, logdirty)

(d2) xs_watch(device-model/1/command, dm-command)

(d2) xs_watch(/local/domain/1/cpu, vcpu-set)

(d2) xs_read(/local/domain/0/backend/pci/1/0/msitranslate): ENOENT

(d2) xs_read(/local/domain/0/backend/pci/1/0/power_mgmt): ENOENT

(d2) xs_watch(/local/domain/0/backend/console/1, be:0x139dbc:1:0x164e20)

(d2) xs_directory(/local/domain/0/backend/console/1): EACCES

(d2) xs_watch(/local/domain/0/backend/vkbd/1, be:0x136601:1:0x164dc0)

(d2) xs_directory(/local/domain/0/backend/vkbd/1): EACCES

(d2) xs_read(device-model/1/disable_pf): ENOENT

(d2) xs_watch(/local/domain/1/log-throttling,
/local/domain/1/log-throttling)

(d2) ******************* CONSFRONT for device/console/2 **********

(d2)

(d2)

(d2) backend at /local/domain/0/backend/console/2/2

(d2) **************************

(d2) fd(7) =3D open_savefile




Thanks,


Bruno

--001a114922d246065105616ac0ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">



















<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><font size=3D"2"><span style=3D"color:black">Hello=
 all,</span><span style=3D"color:black"><br></span></font></p><p class=3D"g=
mail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.0001pt;font-fami=
ly:Calibri"><font size=3D"2"><span style=3D"color:black"></span><span style=
=3D"font-family:arial,helvetica,sans-serif"><span style=3D"color:black">I a=
m trying to build PVH mini-os with libc
support. These are the steps I have followed so far:</span></span></font></=
p><p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.0=
001pt;font-family:Calibri"><font size=3D"2"><span style=3D"font-family:aria=
l,helvetica,sans-serif"><span style=3D"color:black"></span><span style=3D"c=
olor:black"><span>1.<span style=3D"font-style:normal;font-weight:normal;lin=
e-height:normal;font-size-adjust:none;font-stretch:normal;font-feature-sett=
ings:normal;font-kerning:auto;font-synthesis:weight style;font-variant:norm=
al"> </span></span></span><span style=3D"color:black">Xen
repo (master: commit id:=C2=A0d2f86bf604698806d311cc251c1b66fbb752673c)</sp=
an><br></span></font></p><p class=3D"gmail-MsoNormal" style=3D"line-height:=
16pt;margin:0in 0in 0.0001pt"><font size=3D"2"><span style=3D"font-family:a=
rial,helvetica,sans-serif"><span style=3D"color:black"><span></span></span>=
</span></font></p><span style=3D"font-family:arial,helvetica,sans-serif"><f=
ont size=3D"2"><span style=3D"color:black">2. mini-os
repo (master: commit id:=C2=A0</span><span style=3D"color:black">0b4b7897e0=
8b967a09bed2028a79fabff82342dd)</span><span style=3D"color:black"></span><s=
pan style=3D"color:black"></span></font><font size=3D"1"><font size=3D"2"><=
span style=3D"color:black"><span><span style=3D"font-style:normal;font-weig=
ht:normal;line-height:normal;font-size-adjust:none;font-stretch:normal;font=
-feature-settings:normal;font-kerning:auto;font-synthesis:weight style;font=
-variant:normal"><br>3. </span></span></span><span style=3D"color:black">Ma=
de the following modifications in the xen repo to build c-stubdom:</span></=
font><span style=3D"color:black"></span></font>

</span><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt"><span=
 style=3D"font-family:arial,helvetica,sans-serif"><font size=3D"1"><span st=
yle=3D"color:black">=C2=A0</span></font></span></p>



<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">diff
--git a/stubdom/Makefile b/stubdom/Makefile</span><span style=3D"font-famil=
y:Menlo;color:black"></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">inde=
x
f45eeabd8b..aa21904019 100644</span><span style=3D"font-family:Menlo;color:=
black"></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">---
a/stubdom/Makefile</span><span style=3D"font-family:Menlo;color:black"></sp=
an></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+++
b/stubdom/Makefile</span><span style=3D"font-family:Menlo;color:black"></sp=
an></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">@@ -=
61,7 +61,7 @@
TARGET_CPPFLAGS +=3D -I$(XEN_ROOT)/xen/include</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span>TARGET_LDFLAGS +=3D -nostdlib
-L$(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/lib</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">-TAR=
GETS=3D$(STUBDOM_TARGETS)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+TAR=
GETS=3D$(STUBDOM_TARGETS)
c</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span>STUBDOMPATH=3D&quot;stubdompath.sh&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span>genpath-target =3D
$(call buildmakevars2file,$(STUBDOMPATH))</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">diff
--git a/stubdom/c/minios.cfg b/stubdom/c/minios.cfg</span><span style=3D"fo=
nt-family:Menlo;color:black"></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">inde=
x
e69de29bb2..cacde0cbca 100644</span><span style=3D"font-family:Menlo;color:=
black"></span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">---
a/stubdom/c/minios.cfg</span><span style=3D"font-family:Menlo;color:black">=
</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+++
b/stubdom/c/minios.cfg</span><span style=3D"font-family:Menlo;color:black">=
</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">@@ -=
0,0 +1,18 @@</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_PARAVIRT=3Dn</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_START_NETWORK ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_SPARSE_BSS ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_QEMU_XS_ARGS ?=3D n</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_PCIFRONT ?=3D n</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_BLKFRONT ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_TPMFRONT ?=3D n</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_TPM_TIS ?=3D n</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_TPMBACK ?=3D n</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_NETFRONT ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_FBFRONT ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_KBDFRONT ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_CONSFRONT ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_XENBUS ?=3D y</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_XC ?=3Dy</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">+CON=
FIG_BALLOON ?=3D n</span></font></p><p class=3D"gmail-MsoNormal" style=3D"m=
argin:0in 0in 0.0001pt"><font size=3D"2"><span style=3D"font-family:arial,h=
elvetica,sans-serif"><span style=3D"color:black"><br></span></span></font><=
/p><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt"><font siz=
e=3D"2"><span style=3D"font-family:arial,helvetica,sans-serif"><span style=
=3D"color:black"></span><br><span style=3D"color:black"><span style=3D"colo=
r:black"><span><span style=3D"font-style:normal;font-weight:normal;line-hei=
ght:normal;font-size-adjust:none;font-stretch:normal;font-feature-settings:=
normal;font-kerning:auto;font-synthesis:weight style;font-variant:normal">
</span></span></span><span style=3D"color:black">4. $
cd $(XEN_ROOT)</span></span></span></font></p><font size=3D"2"><span style=
=3D"font-family:arial,helvetica,sans-serif"><span style=3D"color:black">5. =
</span><span style=3D"color:black"><span><span style=3D"font-style:normal;f=
ont-weight:normal;line-height:normal;font-size-adjust:none;font-stretch:nor=
mal;font-feature-settings:normal;font-kerning:auto;font-synthesis:weight st=
yle;font-variant:normal"></span></span></span><span style=3D"color:black">$
make; sudo make instal<span><span style=3D"font-style:normal;font-weight:no=
rmal;line-height:normal;font-size-adjust:none;font-stretch:normal;font-feat=
ure-settings:normal;font-kerning:auto;font-synthesis:weight style;font-vari=
ant:normal"></span></span></span><span style=3D"color:black"><span><span st=
yle=3D"font-style:normal;font-weight:normal;line-height:normal;font-size-ad=
just:none;font-stretch:normal;font-feature-settings:normal;font-kerning:aut=
o;font-synthesis:weight style;font-variant:normal"><br>6. </span></span></s=
pan><span style=3D"color:black">Reboot</span><span style=3D"color:black"><s=
pan> host<br></span></span><span style=3D"color:black"><span><span style=3D=
"font-style:normal;font-weight:normal;line-height:normal;font-size-adjust:n=
one;font-stretch:normal;font-feature-settings:normal;font-kerning:auto;font=
-synthesis:weight style;font-variant:normal"></span></span></span><span sty=
le=3D"color:black"><span><span style=3D"font-style:normal;font-weight:norma=
l;line-height:normal;font-size-adjust:none;font-stretch:normal;font-feature=
-settings:normal;font-kerning:auto;font-synthesis:weight style;font-variant=
:normal">7.
</span></span></span><span style=3D"color:black">$
cd $(XEN_ROOT)/stubdom</span><span style=3D"color:black"><span></span></spa=
n><span style=3D"color:black"><span><span style=3D"font-style:normal;font-w=
eight:normal;line-height:normal;font-size-adjust:none;font-stretch:normal;f=
ont-feature-settings:normal;font-kerning:auto;font-synthesis:weight style;f=
ont-variant:normal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
<br>8. </span></span></span><span style=3D"color:black">$
make c-stubdom</span><span style=3D"color:black"><br>9. </span><span style=
=3D"color:black">Used the
following configuration file to create the domain:</span></span></font>

<span style=3D"font-family:arial,helvetica,sans-serif"></span><p class=3D"g=
mail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:Calibri"><font=
 size=3D"1"><span style=3D"color:black">=C2=A0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">type=
=3D&quot;pvh&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">memo=
ry=3D512</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">vcpu=
=3D1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">name=
=3D&quot;minios&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">kern=
el=3D&quot;/home/balvisio/xen/stubdom/mini-os-x86_64-c/mini-os.gz&quot;</sp=
an></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">=C2=
=A0</span></font></p>



<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"2"><br></font></p><p class=3D"gmail-MsoNormal" style=
=3D"margin:0in 0in 0.0001pt;font-family:Calibri"><font size=3D"2"><span sty=
le=3D"color:black">When I create the domain it crashes during
the bootstrap process with a triple fault. The following are the dmesg logs=
 (note that </span></font><font size=3D"2"><span style=3D"color:black"><fon=
t size=3D"1"><span style=3D"font-family:Menlo;color:black">&quot;Xen Minima=
l OS
(hvm)!&quot;</span></font> is printed and the domain crashes after that lin=
e in setup.c):</span></font>

</p><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-fami=
ly:Calibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">=
=C2=A0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><br>=
</span></font></p><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.00=
01pt;font-family:Calibri"><font size=3D"1"><span style=3D"font-family:Menlo=
;color:black">(XEN)
grant_table.c:1688:d0v3 Expanding d360 grant table from 0 to 1 frames</span=
></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: CPU</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: PIC</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: IOAPIC</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: LAPIC</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save:
LAPIC_REGS</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: PCI_IRQ</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: ISA_IRQ</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: PCI_LINK</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: PIT</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: RTC</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: HPET</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: PMTIMER</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save: MTRR</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save:
VIRIDIAN_DOMAIN</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save:
CPU_XSAVE</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save:
VIRIDIAN_VCPU</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save:
VMCE_VCPU</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 save:
TSC_ADJUST</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM360 restore: CPU 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d36=
0) Bootstrapping...</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Dom360 callback via
changed to Direct Vector 0x20</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d36=
0) Xen Minimal OS
(hvm)!</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) d360v0 Triple fault -
invoking HVM shutdown action 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) *** Dumping Dom360
vcpu#0 state: ***</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ----[
Xen-4.10.0-rc<span>=C2=A0 </span>x86_64<span>=C2=A0 </span>debug=3Dy<span>=
=C2=A0=C2=A0
</span>Not tainted ]----</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) CPU:<span>=C2=A0=C2=A0=C2=A0 </span>7</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) RIP:<span>=C2=A0=C2=A0=C2=A0 </span>0008:[&lt;0000000000056fc8&gt;]</span=
></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) RFLAGS:
0000000000010006<span>=C2=A0=C2=A0 </span>CONTEXT: hvm guest
(d360v0)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) rax:
00000000000bfe75<span>=C2=A0=C2=A0 </span>rbx:
00000000000bfe75<span>=C2=A0=C2=A0 </span>rcx: 0000000000000000</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) rdx:
0000000000000017<span>=C2=A0=C2=A0 </span>rsi:
00000000000bfe60<span>=C2=A0=C2=A0 </span>rdi: 0000000000000000</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) rbp:
00000000000bfec0<span>=C2=A0=C2=A0 </span>rsp:
00000000000bfe60<span>=C2=A0=C2=A0 </span>r8:<span>=C2=A0 </span>0000000000=
000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) r9:<span>=C2=A0 </span>0000000000089982<span>=C2=A0 </span><span>=C2=A0</=
span>r10:
0000000000000016<span>=C2=A0=C2=A0 </span>r11: 0000000000000000</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) r12:
0000000000000017<span>=C2=A0=C2=A0 </span>r13:
0000000000000016<span>=C2=A0=C2=A0 </span>r14: 0000000000000000</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) r15:
0d8b4c1575ff8548<span>=C2=A0=C2=A0 </span>cr0:
0000000080000011<span>=C2=A0=C2=A0 </span>cr4: 0000000000000220</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) cr3:
0000000000099000<span>=C2=A0=C2=A0 </span>cr2: 0000000000000000</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) fsb:
0000000000000000<span>=C2=A0=C2=A0 </span>gsb:
0000000000000000<span>=C2=A0=C2=A0 </span>gss: 0000000000000000</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ds: 0033<span>=C2=A0=C2=A0
</span>es: 0033<span>=C2=A0=C2=A0 </span>fs: 0033<span>=C2=A0=C2=A0 </span>=
gs: 0033<span>=C2=A0=C2=A0
</span>ss: 0000<span>=C2=A0=C2=A0 </span>cs: 0008</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">=C2=
=A0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt"><span style=
=3D"font-family:arial,helvetica,sans-serif"><font size=3D"1"><span style=3D=
"color:black">=C2=A0</span></font></span></p><span style=3D"font-family:ari=
al,helvetica,sans-serif">

</span><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt"><font=
 size=3D"2"><span style=3D"font-family:arial,helvetica,sans-serif"><span st=
yle=3D"color:black">Any help on this would be greatly appreciated. In
addition to this I have noticed that even fter installing Xen and rebooting=
 the
host, the initial =E2=80=98xl dmesg=E2=80=99 logs show that Xen tries to la=
unch unsuccessfully
domains created before the system was rebooted. I am not sure if these two
issues are related but I pasting a trace of the logs (these dmesg logs are =
seen
just after rebooting the host before attempting anything else):</span></spa=
n></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">=C2=
=A0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">root=
@debianxen:/home/balvisio#
xl dmesg</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) parameter
&quot;placeholder&quot; unknown!</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span>Xen 4.10.0-rc</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Xen version 4.10.0-rc
(<a href=3D"mailto:balvisio@us.oracle.com">balvisio@us.oracle.com</a>) (gcc=
 (Debian 6.3.0-18) 6.3.0 20170516) debug=3Dy<span>=C2=A0 </span>Thu Dec 28 =
09:53:12 PST 2017</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Latest ChangeSet: Thu
Nov 16 21:34:02 2017 +0000 git:d2f86bf604-dirty</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Bootloader: GRUB
2.02~beta3-5</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Command line:
placeholder</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Xen image load base
address: 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Video information:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>VGA is text mode 80x25, font 8x16</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>VBE/DDC methods: none; EDID transfer time: 0
seconds</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>EDID info not retrieved because no DDC
retrieval method detected</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Disc information:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Found 2 MBR signatures</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Found 2 EDD information structures</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Xen-e820 RAM map:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>0000000000000000 - 000000000009a400 (usable)</span></f=
ont></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>000000000009a400 - 00000000000a0000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000000e0000 - 0000000000100000 (reserved)</span><=
/font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>0000000000100000 - 00000000bf406000 (usable)</span></f=
ont></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf406000 - 00000000bf452000 (ACPI
NVS)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf452000 - 00000000bf45a000 (ACPI
data)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf45a000 - 00000000bf477000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf477000 - 00000000bf478000 (ACPI
NVS)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf478000 - 00000000bf489000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf489000 - 00000000bf48c000 (ACPI
NVS)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf48c000 - 00000000bf4ad000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf4ad000 - 00000000bf4af000 (usable)</span></f=
ont></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf4af000 - 00000000bf503000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf503000 - 00000000bf50d000 (ACPI
NVS)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf50d000 - 00000000bf533000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf533000 - 00000000bf576000 (ACPI
NVS)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000bf576000 - 00000000bf800000 (usable)</span></f=
ont></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000fed1c000 - 00000000fed40000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>00000000ff000000 - 0000000100000000
(reserved)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>0000000100000000 - 0000000440000000 (usable)</span></f=
ont></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) New Xen image base
address: 0xbee00000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: RSDP 000F0450,
0024 (r2 SUPERM)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: XSDT BF452078,
0074 (r1 SUPERM SMCI--MB<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
span>1
AMI<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>10013)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: FACP BF458B38,
00F4 (r4 SUPERM SMCI--MB<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
span>1
AMI<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>10013)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: DSDT BF452180,
69B8 (r2 SUPERM SMCI--MB<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
span>0 INTL
20051117)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: FACS BF50AF80,
0040</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: APIC BF458C30,
0092 (r3 SUPERM SMCI--MB<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
span>1
AMI<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>10013)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: SSDT BF458CC8,
01D6 (r1 AMICPU<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>PROC<span>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>1 MSFT<span>=C2=A0
</span>3000001)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: MCFG BF458EA0,
003C (r1 SUPERM SMCI--MB<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
span>1
MSFT<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>97)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: HPET BF458EE0,
0038 (r1 SUPERM SMCI--MB<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </=
span>1
AMI.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>4)</span></font=
></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: SPMI BF458F18,
0040 (r5 A M I<span>=C2=A0=C2=A0 </span>OEMSPMI<span>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 </span>0 AMI.<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 </span>0)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: EINJ BF458F58,
0130 (r1<span>=C2=A0=C2=A0=C2=A0 </span>AMI AMI EINJ<span>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: ERST BF459088,
0210 (r1<span>=C2=A0 </span>AMIER AMI ERST<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 </span>0<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: HEST BF459298,
00A8 (r1<span>=C2=A0=C2=A0=C2=A0 </span>AMI AMI HEST<span>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: BERT BF459340,
0030 (r1<span>=C2=A0=C2=A0=C2=A0 </span>AMI AMI BERT<span>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>0)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) System RAM: 16374MB
(16767152kB)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) No NUMA configuration
found</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Faking a node at
0000000000000000-0000000440000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Domain heap
initialised</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) CPU Vendor: Intel,
Family 6 (0x6), Model 42 (0x2a), Stepping 7 (raw 000206a7)</span></font></p=
>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) found SMP MP-table at
000fcd80</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) DMI 2.7 present.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Using APIC driver
default</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: PM-Timer IO
Port: 0x408 (32 bits)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: SLEEP INFO:
pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: 32/64X FACS
address mismatch in FADT - bf50af80/0000000000000000, using 32</span></font=
></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI:<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 </span>wakeup_vec[bf50af8c], vec_size[20]</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: Local APIC
address 0xfee00000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x01] lapic_id[0x00] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x02] lapic_id[0x02] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x03] lapic_id[0x04] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x04] lapic_id[0x06] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x05] lapic_id[0x01] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x06] lapic_id[0x03] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x07] lapic_id[0x05] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC
(acpi_id[0x08] lapic_id[0x07] enabled)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: LAPIC_NMI
(acpi_id[0xff] high edge lint[0x1])</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: IOAPIC
(id[0x00] address[0xfec00000] gsi_base[0])</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) IOAPIC[0]: apic_id 0,
version 32, address 0xfec00000, GSI 0-23</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: INT_SRC_OVR
(bus 0 bus_irq 0 global_irq 2 dfl dfl)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: INT_SRC_OVR
(bus 0 bus_irq 9 global_irq 9 high level)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: IRQ0 used by
override.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: IRQ2 used by
override.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: IRQ9 used by
override.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Enabling APIC
mode:<span>=C2=A0 </span>Flat.<span>=C2=A0 </span>Using 1 I/O APICs</span><=
/font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI: HPET id:
0x8086a701 base: 0xfed00000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Xen ERST support is
initialized.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HEST: Table parsing
has been initialized</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Using ACPI (MADT) for
SMP configuration information</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) SMP: Allowing 8 CPUs
(0 hotplug CPUs)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) IRQ limits: 24 GSI,
1528 MSI/MSI-X</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Not enabling x2APIC: depends
on iommu_supports_eim.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) xstate: size: 0x340
and states: 0x7</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) mce_intel.c:782: MCA
Capability: firstbank 0, extended MCE MSR 0, BCAST, CMCI</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) CPU0: Intel machine
check reporting enabled</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Using scheduler: SMP
Credit Scheduler (credit)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Platform timer is
14.318MHz HPET</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Detected 3192.768 MHz
processor.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Initing memory
sharing.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) alt table
ffff82d080451778 -&gt; ffff82d080452d98</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI: MCFG
configuration 0: base e0000000 segment 0000 buses 00 - ff</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI: Not using MCFG
for segment 0000 bus 00-ff</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) I/O virtualisation
disabled</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) nr_sockets: 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Enabled directed EOI
with ioapic_ack_old on!</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ENABLING IO-APIC IRQs</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>-&gt; Using old ACK method</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ..TIMER: vector=3D0xF0
apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) TSC deadline timer
enabled</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Allocated console
ring of 64 KiB.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) mwait-idle: MWAIT
substates: 0x1120</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) mwait-idle: v0.4.1
model 0x2a</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) mwait-idle:
lapic_timer_reliable_states 0xffffffff</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) VMX: Supported
advanced features:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- APIC MMIO access virtualisation</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- APIC TPR shadow</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- Extended Page Tables (EPT)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- Virtual-Processor Identifiers (VPID)</span></font></=
p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- Virtual NMI</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- MSR direct-access bitmap</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>- Unrestricted Guest</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM: ASIDs enabled.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM: VMX enabled</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM: Hardware
Assisted Paging (HAP) detected</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM: HAP page sizes:
4kB, 2MB</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Brought up 8 CPUs</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) build-id:
bca1c3697611c869f348a4b7c4bfe326d0cbbc25</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Running stub recovery
selftests...</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) traps.c:1540: GPF
(0000): ffff82d0bffff041 [ffff82d0bffff041] -&gt; ffff82d08036d2f2</span></=
font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) traps.c:739: Trap 12:
ffff82d0bffff040 [ffff82d0bffff040] -&gt; ffff82d08036d2f2</span></font></p=
>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) traps.c:1076: Trap 3:
ffff82d0bffff041 [ffff82d0bffff041] -&gt; ffff82d08036d2f2</span></font></p=
>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ACPI sleep modes: S3</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) VPMU: disabled</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) mcheck_poll: Machine
check polling timer started.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Dom0 has maximum 792
PIRQs</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)
grant_table.c:1688:IDLEv0 Expanding d0 grant table from 0 to 1 frames</span=
></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) NX (Execute Disable)
protection active</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) *** LOADING DOMAIN 0
***</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr:
paddr=3D0x1000000 memsz=3D0xaca000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr:
paddr=3D0x1c00000 memsz=3D0x11e000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr:
paddr=3D0x1d1e000 memsz=3D0x19418</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr:
paddr=3D0x1d38000 memsz=3D0x223000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: memory:
0x1000000 -&gt; 0x1f5b000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: GUEST_OS =3D
&quot;linux&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
GUEST_VERSION =3D &quot;2.6&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
XEN_VERSION =3D &quot;xen-3.0&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: VIRT_BASE
=3D 0xffffffff80000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: INIT_P2M =3D
0x8000000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: ENTRY =3D
0xffffffff81d38180</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
HYPERCALL_PAGE =3D 0xffffffff81001000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: FEATURES =3D
&quot;!writable_page_tables|pae_pgdir_above_4gb|writable_descriptor_tables|=
auto_translated_physmap|supervisor_mode_kernel&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
SUPPORTED_FEATURES =3D 0x90d</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: PAE_MODE =3D
&quot;yes&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: LOADER =3D
&quot;generic&quot;</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note: unknown
(0xd)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
SUSPEND_CANCEL =3D 0x1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
MOD_START_PFN =3D 0x1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
HV_START_LOW =3D 0xffff800000000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: note:
PADDR_OFFSET =3D 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: addresses:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>virt_base<span>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 </span>=3D 0xffffffff80000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>elf_paddr_offset =3D 0x0</span></fon=
t></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>virt_offset<span>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 </span>=3D 0xffffffff80000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>virt_kstart<span>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 </span>=3D 0xffffffff81000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>virt_kend<span>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 </span>=3D 0xffffffff81f5b000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>virt_entry<span>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 </span>=3D 0xffffffff81d38180</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>p2m_base<span>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>=3D 0x8000000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Xen<span>=C2=A0
</span>kernel: 64-bit, lsb, compat32</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Dom0 kernel: 64-bit, PAE, lsb, paddr
0x1000000 -&gt; 0x1f5b000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PHYSICAL MEMORY
ARRANGEMENT:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Dom0 alloc.:<span>=C2=A0=C2=A0
</span>000000042e000000-&gt;0000000430000000 (4099048 pages to be allocated=
)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Init. ramdisk:
000000043ed4d000-&gt;000000043ffffa9c</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) VIRTUAL MEMORY
ARRANGEMENT:</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Loaded kernel:
ffffffff81000000-&gt;ffffffff81f5b000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Init. ramdisk: 0000000000000000-&gt;0000000000000000</=
span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Phys-Mach map:
0000008000000000-&gt;0000008001f5f4d8</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Start info:<span>=C2=A0=C2=A0=C2=A0
</span>ffffffff81f5b000-&gt;ffffffff81f5b4b4</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Page tables:<span>=C2=A0=C2=A0
</span>ffffffff81f5c000-&gt;ffffffff81f6f000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>Boot stack:<span>=C2=A0=C2=A0=C2=A0
</span>ffffffff81f6f000-&gt;ffffffff81f70000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>TOTAL:<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
</span>ffffffff80000000-&gt;ffffffff82000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)<span>=C2=A0 </span>ENTRY ADDRESS: ffffffff81d38180</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Dom0 has maximum 8
VCPUs</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr 0 at
0xffffffff81000000 -&gt; 0xffffffff81aca000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr 1 at
0xffffffff81c00000 -&gt; 0xffffffff81d1e000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr 2 at
0xffffffff81d1e000 -&gt; 0xffffffff81d37418</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) ELF: phdr 3 at
0xffffffff81d38000 -&gt; 0xffffffff81e82000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Initial low memory
virq threshold set at 0x4000 pages.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Scrubbing Free RAM on
1 nodes using 4 CPUs</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)
..................................done.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Std. Loglevel: All</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Guest Loglevel: All</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Xen is relinquishing
VGA console.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) *** Serial input
-&gt; DOM0 (type &#39;CTRL-a&#39; three times to switch input to Xen)</span=
></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) Freed 456kB init
memory</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:00.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:01.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:16.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:16.1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:1a.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:1d.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:1e.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:1f.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:1f.2</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:00:1f.3</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:01:00.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:01:00.1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI add device
0000:02:03.0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) PCI: Using MCFG for
segment 0000 bus 00-ff</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) d0: Forcing read-only
access to MFN fed00</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) traps.c:1540: GPF
(0000): ffff82d080363383 [emul-priv-op.c#read_msr+0x370/0x45c] -&gt;
ffff82d08036d9b2</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) traps.c:1540: GPF
(0000): ffff82d080363383 [emul-priv-op.c#read_msr+0x370/0x45c] -&gt;
ffff82d08036d9b2</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) traps.c:1540: GPF
(0000): ffff82d080363383 [emul-priv-op.c#read_msr+0x370/0x45c] -&gt;
ffff82d08036d9b2</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)
grant_table.c:1688:d0v3 Expanding d1 grant table from 0 to 1 frames</span><=
/font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: CPU 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: CPU 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: PIC 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: PIC 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: IOAPIC
0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: LAPIC 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: LAPIC 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
LAPIC_REGS 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
LAPIC_REGS 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: PCI_IRQ
0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: ISA_IRQ
0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
PCI_LINK 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: PIT 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: RTC 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: HPET 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: PMTIMER
0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: MTRR 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore: MTRR 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
CPU_XSAVE 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
CPU_XSAVE 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
VMCE_VCPU 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
VMCE_VCPU 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
TSC_ADJUST 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
) HVM1 restore:
TSC_ADJUST 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)
grant_table.c:1688:d0v1 Expanding d2 grant table from 0 to 1 frames</span><=
/font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Bootstrapping...</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Xen Minimal OS (pv)!</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0 </span>start_info: 0x574000(VA)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>nr_pages: 0x2000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0 </span>shared_inf: 0x06183000(MA)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>pt_base: 0x577000(VA)</span></f=
ont></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 nr_pt_frames: 0x7</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>mfn_list: 0x564000(VA)</span></font><=
/p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0 </span>mod_start: 0x0(VA)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>mod_len: 0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>flags: 0x0</span></=
font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>cmd_line:<span>=C2=A0
</span>-d 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>stack: 0x523140-0x5=
43140</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 MM: Init</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>_text: 0x0(VA)</span></fo=
nt></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>_etext: 0x117ec2(VA)</span></fo=
nt></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0 </span>_erodata: 0x14a000(VA)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>_edata: 0x14ab68(VA)</span></fo=
nt></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 stack start:
0x523140(VA)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span>_end: 0x563e78(VA)<=
/span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0 </span>start_pfn: 57e</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>max_pfn: 2000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Mapping memory range
0x57e000 - 0x2000000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 setting 0x0-0x14a000
readonly</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 skipped 1000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 MM: Initialise page
allocator for 58a000(58a000)-2000000(2000000)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
<span>=C2=A0=C2=A0=C2=A0=C2=A0 </span>Adding memory range 58b000-2000000</s=
pan></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 MM: done</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Demand map pfns at
100000000000-108000000000.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Heap resides at
200000000000-208000000000.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Initialising timer
interface</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Initialising console
... done.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(XEN=
)
grant_table.c:1688:d2v0 Expanding d2 grant table from 1 to 4 frames</span><=
/font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 gnttab_table mapped at
0x100000000000.</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Initialising scheduler</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Thread
&quot;Idle&quot;: pointer: 0x0x200000000050, stack: 0x0x5a0000</span></font=
></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Thread
&quot;xenstore&quot;: pointer: 0x0x200000000800, stack: 0x0x5b0000</span></=
font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 xenbus initialised on
irq 1</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Thread &quot;shutdown&quot;:
pointer: 0x0x200000000fb0, stack: 0x0x5c0000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 main.c: dummy main:
par=3D0x0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Thread
&quot;main&quot;: pointer: 0x0x200000001760, stack: 0x0x5d0000</span></font=
></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 sparsing 3MB at 181000</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 Thread
&quot;pcifront&quot;: pointer: 0x0x200000003c70, stack: 0x0x5e0000</span></=
font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 pcifront_watches:
waiting for backend path to appear device/pci/0/backend</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 dom vm is at
/vm/9389f006-0389-4aa8-ad4b-61eeea31676b</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
************************ NETFRONT for device/vif/0 **********</span></font>=
</p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 </span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 </span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 net TX ring size 256</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 net RX ring size 256</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 backend at
/local/domain/0/backend/vif/2/0</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 mac is
00:16:3e:05:84:95</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
**************************</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 tap_open((null)) -&gt;
3</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 xs_daemon_open -&gt;
4, 0x14a6c8</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 *******************
BLKFRONT for /local/domain/2/device/vbd/51712 **********</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 </span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 </span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 backend at
/local/domain/0/backend/vbd/2/51712</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 209715200 sectors of
512 bytes</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
**************************</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
blk_open(/local/domain/2/device/vbd/51712) -&gt; 5</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_watch(device-model/1/logdirty/cmd, logdirty)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_watch(device-model/1/command, dm-command)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_watch(/local/domain/1/cpu, vcpu-set)</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_read(/local/domain/0/backend/pci/1/0/msitranslate): ENOENT</span></font>=
</p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_read(/local/domain/0/backend/pci/1/0/power_mgmt): ENOENT</span></font></=
p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_watch(/local/domain/0/backend/console/1, be:0x139dbc:1:0x164e20)</span><=
/font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_directory(/local/domain/0/backend/console/1): EACCES</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_watch(/local/domain/0/backend/vkbd/1, be:0x136601:1:0x164dc0)</span></fo=
nt></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_directory(/local/domain/0/backend/vkbd/1): EACCES</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 xs_read(device-model/1/disable_pf):
ENOENT</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)
xs_watch(/local/domain/1/log-throttling, /local/domain/1/log-throttling)</s=
pan></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 *******************
CONSFRONT for device/console/2 **********</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 </span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 </span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 backend at
/local/domain/0/backend/console/2/2</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 **************************</span></font></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black">(d2)=
 fd(7) =3D open_savefile</span></font></p><p class=3D"gmail-MsoNormal" styl=
e=3D"margin:0in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span st=
yle=3D"font-family:Menlo;color:black"><br></span></font></p><p class=3D"gma=
il-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:Calibri"><font s=
ize=3D"1"><span style=3D"font-family:Menlo;color:black"><br></span></font><=
/p><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-famil=
y:Calibri"><font size=3D"1"><span style=3D"font-family:Menlo;color:black"><=
br></span></font></p><p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0=
.0001pt"><font size=3D"2"><span style=3D"font-family:arial,helvetica,sans-s=
erif"><span style=3D"color:black">Thanks,</span></span></font></p><p class=
=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt"><font size=3D"2"><sp=
an style=3D"font-family:arial,helvetica,sans-serif"><span style=3D"color:bl=
ack"><br></span></span></font></p><p class=3D"gmail-MsoNormal" style=3D"mar=
gin:0in 0in 0.0001pt;font-family:Calibri"><font size=3D"1"><span style=3D"f=
ont-family:Menlo;color:black"><font size=3D"2"><span style=3D"font-family:a=
rial,helvetica,sans-serif">Bruno</span></font><br></span></font></p>





</div>

--001a114922d246065105616ac0ff--


--===============5805772116071742085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5805772116071742085==--
