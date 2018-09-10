From: Olaf Hering <olaf@aepfle.de>
Subject: v4.19-rc3, wrong pageflags in dom0
Date: Mon, 10 Sep 2018 14:49:07 +0200
Message-ID: <20180910144907.774bee93.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3143657715909434048=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=b1bd=ly=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fzLcz-0003ny-0z
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 12:49:17 +0000
Received: from sender by smtp.strato.de (RZmta 44.0 AUTH)
 with ESMTPSA id L0862bu8ACnDMsF
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 10 Sep 2018 14:49:13 +0200 (CEST)
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

--===============3143657715909434048==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/PKS_TJcZixc31/BpiHX84Jk"; protocol="application/pgp-signature"

--Sig_/PKS_TJcZixc31/BpiHX84Jk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

After reboot I tried to start my HVM domU, this is what I get in dom0:



Welcome to SUSE Linux Enterprise Server 12 SP2  (x86_64) - Kernel 4.19.321-=
default-bug1106594 (hvc0).


stein-schneider login: (XEN) HVM1 save: CPU
(XEN) HVM1 save: PIC
(XEN) HVM1 save: IOAPIC
(XEN) HVM1 save: LAPIC
(XEN) HVM1 save: LAPIC_REGS
(XEN) HVM1 save: PCI_IRQ
(XEN) HVM1 save: ISA_IRQ
(XEN) HVM1 save: PCI_LINK
(XEN) HVM1 save: PIT
(XEN) HVM1 save: RTC
(XEN) HVM1 save: HPET
(XEN) HVM1 save: PMTIMER
(XEN) HVM1 save: MTRR
(XEN) HVM1 save: VIRIDIAN_DOMAIN
(XEN) HVM1 save: CPU_XSAVE
(XEN) HVM1 save: VIRIDIAN_VCPU
(XEN) HVM1 save: VMCE_VCPU
(XEN) HVM1 save: TSC_ADJUST
(XEN) HVM1 restore: CPU 0
(d1) HVM Loader
(d1) Detected Xen v4.7.6_04-43.39
(d1) Xenbus rings @0xfeffc000, event channel 1
(d1) System requested SeaBIOS
(d1) CPU speed is 2667 MHz
(d1) Relocating guest memory for lowmem MMIO space disabled
(d1) PCI-ISA link 0 routed to IRQ5
(d1) PCI-ISA link 1 routed to IRQ10
(d1) PCI-ISA link 2 routed to IRQ11
(d1) PCI-ISA link 3 routed to IRQ5
(d1) pci dev 01:3 INTA->IRQ10
(d1) pci dev 02:0 INTA->IRQ11
(d1) pci dev 04:0 INTA->IRQ5
(d1) No RAM in high memory; setting high_mem resource base to 100000000
(d1) pci dev 03:0 bar 10 size 002000000: 0f0000008
(d1) pci dev 02:0 bar 14 size 001000000: 0f2000008
(d1) pci dev 04:0 bar 30 size 000040000: 0f3000000
(d1) pci dev 03:0 bar 30 size 000010000: 0f3040000
(d1) pci dev 03:0 bar 14 size 000001000: 0f3050000
(d1) pci dev 02:0 bar 10 size 000000100: 00000c001
(d1) pci dev 04:0 bar 10 size 000000100: 00000c101
(d1) pci dev 04:0 bar 14 size 000000100: 0f3051000
(d1) pci dev 01:1 bar 20 size 000000010: 00000c201
(d1) Multiprocessor initialisation:
(d1)  - CPU0 ... 40-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1)  - CPU1 ... 40-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1)  - CPU2 ... 40-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1)  - CPU3 ... 40-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d1) Writing SMBIOS tables ...
(d1) Loading SeaBIOS ...
(d1) Creating MP tables ...
(d1) Loading ACPI ...
(d1) vm86 TSS at fc00a200
(d1) BIOS map:
(d1)  10000-100e3: Scratch space
(d1)  c0000-fffff: Main BIOS
(d1) E820 table:
(d1)  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d1)  HOLE: 00000000:000a0000 - 00000000:000c0000
(d1)  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d1)  [02]: 00000000:00100000 - 00000000:37000000: RAM
(d1)  HOLE: 00000000:37000000 - 00000000:fc000000
(d1)  [03]: 00000000:fc000000 - 00000001:00000000: RESERVED
(d1) Invoking SeaBIOS ...
(d1) SeaBIOS (version rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org)
(d1) BUILD: gcc: (SUSE Linux) 4.8.5 binutils: (GNU Binutils; SUSE Linux Ent=
erprise 1
(d1) 2) 2.29.1
(d1)
(d1) Found Xen hypervisor signature at 40000000
(d1) Running on QEMU (i440fx)
(d1) xen: copy e820...
(d1) Relocating init from 0x000dc280 to 0x36fad700 (size 75888)
(d1) Found 7 PCI devices (max PCI bus is 00)
(d1) Allocated Xen hypercall page at 36fff000
(d1) Detected Xen v4.7.6_04-43.39
(d1) xen: copy BIOS tables...
(d1) Copying SMBIOS entry point from 0x00010020 to 0x000f6d20
(d1) Copying MPTABLE from 0xfc0011c0/fc0011d0 to 0x000f6c00
(d1) Copying PIR from 0x00010040 to 0x000f6b80
(d1) Copying ACPI RSDP from 0x000100c0 to 0x000f6b50
(d1) Using pmtimer, ioport 0xb008
(d1) Scan for VGA option rom
(d1) Running option rom at c000:0003
(d1) pmm call arg1=3D0
(d1) Turning on vga text mode console
(d1) SeaBIOS (version rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org)
(d1) Machine UUID 53e79f11-89b1-4905-af9e-97185830c046
(d1) All threads complete.
(d1) Found 0 lpt ports
(d1) Found 1 serial ports
(d1) ATA controller 1 at 1f0/3f4/0 (irq 14 dev 9)
(d1) ATA controller 2 at 170/374/0 (irq 15 dev 9)
(d1) ata0-0: QEMU HARDDISK ATA-7 Hard-Disk (3072 MiBytes)
(d1) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@0
(d1) PS2 keyboard initialized
(d1) All threads complete.
(d1) Scan for option roms
(d1) Running option rom at c980:0003
(d1) pmm call arg1=3D1
(d1) pmm call arg1=3D0
(d1) pmm call arg1=3D1
(d1) pmm call arg1=3D0
(d1) Searching bootorder for: /pci@i0cf8/*@4
(d1)
(d1) Press ESC for boot menu.
(d1)
(d1) Searching bootorder for: HALT
(d1) drive 0x000f6ae0: PCHS=3D6241/16/63 translation=3Dlarge LCHS=3D780/128=
/63 s=3D6291456
(d1) Space available for UMB: ca800-ee000, f6540-f6ae0
(d1) Returned 258048 bytes of ZoneHigh
(d1) e820 map has 6 items:
(d1)   0: 0000000000000000 - 000000000009fc00 =3D 1 RAM
(d1)   1: 000000000009fc00 - 00000000000a0000 =3D 2 RESERVED
(d1)   2: 00000000000f0000 - 0000000000100000 =3D 2 RESERVED
(d1)   3: 0000000000100000 - 0000000036fff000 =3D 1 RAM
(d1)   4: 0000000036fff000 - 0000000037000000 =3D 2 RESERVED
(d1)   5: 00000000fc000000 - 0000000100000000 =3D 2 RESERVED
(d1) enter handle_19:
(d1)   NULL
(d1) Booting from Hard Disk...
(d1) Booting from 0000:7c00
(XEN) d1v0 Triple fault - invoking HVM shutdown action 1
(XEN) *** Dumping Dom1 vcpu#0 state: ***
(XEN) ----[ Xen-4.7.6_04-43.39  x86_64  debug=3Dn  Not tainted ]----
(XEN) CPU:    2
(XEN) RIP:    0008:[<0000000036e1fba8>]
(XEN) RFLAGS: 0000000000210046   CONTEXT: hvm guest (d1v0)
(XEN) rax: 0000000000000000   rbx: 00000000ffffffff   rcx: 0000000000000a63
(XEN) rdx: 0000000036e1ff19   rsi: 00000000ffffffff   rdi: 0000000000000eb4
(XEN) rbp: 000000000007faec   rsp: 000000000007fae0   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
(XEN) cr3: 0000000000000000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0010   es: 0010   fs: 0010   gs: 0010   ss: 0010   cs: 0008
[  223.019451] page:ffffea007bed9040 count:1 mapcount:-1 mapping:0000000000=
000000 index:0x0
[  223.019489] flags: 0x2ffff800001214(referenced|dirty|owner_priv_1|privat=
e)
(XEN) HVM2 save: CPU
(XEN) HVM2 save: PIC
(XEN) HVM2 save: IOAPIC
(XEN) HVM2 save: LAPIC
(XEN) HVM2 save: LAPIC_REGS
(XEN) HVM2 save: PCI_IRQ
(XEN) HVM2 save: ISA_IRQ
(XEN) HVM2 save: PCI_LINK
(XEN) HVM2 save: PIT
(XEN) HVM2 save: RTC
(XEN) HVM2 save: HPET
(XEN) HVM2 save: PMTIMER
(XEN) HVM2 save: MTRR
(XEN) HVM2 save: VIRIDIAN_DOMAIN
(XEN) HVM2 save: CPU_XSAVE
(XEN) HVM2 save: VIRIDIAN_VCPU
(XEN) HVM2 save: VMCE_VCPU
(XEN) HVM2 save: TSC_ADJUST
(XEN) HVM2 restore: CPU 0
[  227.141171] general protection fault: 0000 [#1] PREEMPT SMP NOPTI
[  227.141186] CPU: 4 PID: 2206 Comm: block Tainted: G    B       E     4.1=
9.321-default-bug1106594 #5
[  227.141194] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  227.141207] RIP: e030:clear_page_rep+0x7/0x10
[  227.141214] Code: 89 47 10 89 c8 eb e7 48 8b 04 24 48 89 47 10 eb d5 48 =
8b 04 24 48 89 47 08 48 89 47 10 eb c7 90 90 90 90 b9 00 02 00 00 31 c0 <f3=
> 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00
[  227.141229] RSP: e02b:ffffc900477a3cd0 EFLAGS: 00010246
[  227.141236] RAX: 0000000000000000 RBX: ffff881fdf4a80c8 RCX: 00000000000=
00200
[  227.141243] RDX: 0000000000028108 RSI: ffffffff811ee2cb RDI: ffe70ff7d2a=
03000
[  227.141250] RBP: ffff881fdf4a80c8 R08: ffffffffffffffcf R09: 0000000001d=
eeb51
[  227.141257] R10: 0000000000000000 R11: 000000000000a746 R12: ffff881fdf4=
a8108
[  227.141265] R13: ffff881efa6da0c0 R14: ffff881f9efddb80 R15: ffff881f9ef=
ddb80
[  227.141277] FS:  00007fe4f7205700(0000) GS:ffff881fdf500000(0000) knlGS:=
0000000000000000
[  227.141285] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.141292] CR2: 00000000006a5458 CR3: 0000001ef992a000 CR4: 00000000000=
02660
[  227.141302] Call Trace:
[  227.141312]  get_page_from_freelist+0x3f1/0x1040
[  227.141322]  __alloc_pages_nodemask+0xd1/0x260
[  227.141330]  __get_free_pages+0xd/0x30
[  227.141337]  xen_pgd_alloc+0x59/0x120
[  227.141344]  pgd_alloc+0x66/0x1a0
[  227.141351]  mm_init+0x1c9/0x2f0
[  227.141359]  __do_execve_file.isra.35+0x26a/0x8a0
[  227.141367]  ? getname_kernel+0xf0/0x100
[  227.141373]  __x64_sys_execve+0x44/0x50
[  227.141381]  do_syscall_64+0x5d/0x110
[  227.141388]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  227.141396] RIP: 0033:0x7fe4f66896b7
[  227.141401] Code: ff ff 76 df 89 c6 f7 de 64 41 89 32 eb d5 89 c6 f7 de =
64 41 89 32 eb db 66 2e 0f 1f 84 00 00 00 00 00 90 b8 3b 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a1 27 2e 00 f7 d8 64 89 01 48
[  227.141416] RSP: 002b:00007ffeb592ffd8 EFLAGS: 00000206 ORIG_RAX: 000000=
000000003b
[  227.141424] RAX: ffffffffffffffda RBX: 0000000001e68dc0 RCX: 00007fe4f66=
896b7
[  227.141431] RDX: 0000000001e6a3f0 RSI: 0000000001e6aa80 RDI: 0000000001e=
68dc0
[  227.141439] RBP: 0000000001e6aa80 R08: 0000000000000002 R09: 0000000001e=
64610
[  227.141446] R10: 00000000fc2c9fc5 R11: 0000000000000206 R12: 00000000000=
00000
[  227.141453] R13: 0000000001e6a3f0 R14: 0000000001e68dc0 R15: 0000000001e=
69f00
[  227.141461] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  227.141562] ---[ end trace 99720d82363be8ce ]---
[  227.141573] RIP: e030:clear_page_rep+0x7/0x10
[  227.141584] Code: 89 47 10 89 c8 eb e7 48 8b 04 24 48 89 47 10 eb d5 48 =
8b 04 24 48 89 47 08 48 89 47 10 eb c7 90 90 90 90 b9 00 02 00 00 31 c0 <f3=
> 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00
[  227.141606] RSP: e02b:ffffc900477a3cd0 EFLAGS: 00010246
[  227.141619] RAX: 0000000000000000 RBX: ffff881fdf4a80c8 RCX: 00000000000=
00200
[  227.141629] RDX: 0000000000028108 RSI: ffffffff811ee2cb RDI: ffe70ff7d2a=
03000
[  227.141638] RBP: ffff881fdf4a80c8 R08: ffffffffffffffcf R09: 0000000001d=
eeb51
[  227.141648] R10: 0000000000000000 R11: 000000000000a746 R12: ffff881fdf4=
a8108
[  227.141659] R13: ffff881efa6da0c0 R14: ffff881f9efddb80 R15: ffff881f9ef=
ddb80
[  227.141676] FS:  00007fe4f7205700(0000) GS:ffff881fdf500000(0000) knlGS:=
0000000000000000
[  227.141688] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.141697] CR2: 00000000006a5458 CR3: 0000001ef992a000 CR4: 00000000000=
02660
[  227.141714] note: block[2206] exited with preempt_count 1
[  227.141850] general protection fault: 0000 [#2] PREEMPT SMP NOPTI
[  227.141862] CPU: 4 PID: 2206 Comm: block Tainted: G    B D     E     4.1=
9.321-default-bug1106594 #5
[  227.141874] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  227.141887] RIP: e030:get_page_from_freelist+0x26c/0x1040
[  227.141898] Code: 48 8b 03 48 39 c3 0f 84 3e 03 00 00 48 8b 03 48 bb 00 =
02 00 00 00 00 ad de 48 be 00 01 00 00 00 00 ad de 48 8b 08 48 8b 50 08 <48=
> 89 51 08 48 89 0a 48 89 58 08 48 89 c3 48 89 30 83 6d 00 01 48
[  227.141899] RSP: e02b:ffffc900477a3bd8 EFLAGS: 00010097
[  227.141901] RAX: ffffea007bed9048 RBX: dead000000000200 RCX: dead0000000=
00100
[  227.141902] RDX: ffff881fdf5280d0 RSI: dead000000000100 RDI: 00000000004=
00200
[  227.141903] RBP: ffff881fdf5280c0 R08: 0000000000000125 R09: 0000000001d=
eeb51
[  227.141905] R10: 0000000000000000 R11: 0720072007200720 R12: 00000000000=
00000
[  227.141906] R13: ffffc900477a3cc8 R14: ffff881f9efdecc0 R15: ffff881f9ef=
ddb80
[  227.141912] FS:  00007fe4f7205700(0000) GS:ffff881fdf500000(0000) knlGS:=
0000000000000000
[  227.141994] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.141995] CR2: 00000000006a5458 CR3: 000000000220a000 CR4: 00000000000=
02660
[  227.141999] Call Trace:
[  227.142005]  ? xen_make_pte+0x13/0x20
[  227.142033]  ? __raw_callee_save_xen_make_pte+0x11/0x1e
[  227.142036]  __alloc_pages_nodemask+0xd1/0x260
[  227.142039]  __get_free_pages+0xd/0x30
[  227.142043]  __tlb_remove_page_size+0x4d/0x80
[  227.142074]  unmap_page_range+0x60a/0xb50
[  227.142081]  unmap_vmas+0x42/0x90
[  227.142085]  exit_mmap+0xa2/0x170
[  227.142102]  mmput+0x4a/0x110
[  227.142104]  do_exit+0x25d/0xb50
[  227.142107]  ? __x64_sys_execve+0x44/0x50
[  227.142110]  rewind_stack_do_exit+0x17/0x20
[  227.142113] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  227.142180] ---[ end trace 99720d82363be8cf ]---
[  227.142236] RIP: e030:clear_page_rep+0x7/0x10
[  227.142238] Code: 89 47 10 89 c8 eb e7 48 8b 04 24 48 89 47 10 eb d5 48 =
8b 04 24 48 89 47 08 48 89 47 10 eb c7 90 90 90 90 b9 00 02 00 00 31 c0 <f3=
> 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00
[  227.142239] RSP: e02b:ffffc900477a3cd0 EFLAGS: 00010246
[  227.142241] RAX: 0000000000000000 RBX: ffff881fdf4a80c8 RCX: 00000000000=
00200
[  227.142242] RDX: 0000000000028108 RSI: ffffffff811ee2cb RDI: ffe70ff7d2a=
03000
[  227.142243] RBP: ffff881fdf4a80c8 R08: ffffffffffffffcf R09: 0000000001d=
eeb51
[  227.142244] R10: 0000000000000000 R11: 000000000000a746 R12: ffff881fdf4=
a8108
[  227.142245] R13: ffff881efa6da0c0 R14: ffff881f9efddb80 R15: ffff881f9ef=
ddb80
[  227.142251] FS:  00007fe4f7205700(0000) GS:ffff881fdf500000(0000) knlGS:=
0000000000000000
[  227.142343] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.142345] CR2: 00000000006a5458 CR3: 000000000220a000 CR4: 00000000000=
02660
[  227.142349] Fixing recursive fault but reboot is needed!
[  227.142351] BUG: scheduling while atomic: block/2206/0x00000002
[  227.142351] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  227.142382] CPU: 4 PID: 2206 Comm: block Tainted: G    B D     E     4.1=
9.321-default-bug1106594 #5
[  227.142383] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  227.142385] Call Trace:
[  227.142511]  dump_stack+0x78/0xb3
[  227.142516]  __schedule_bug+0x5c/0x69
[  227.142519]  __schedule+0x783/0x8b0
[  227.142523]  ? printk+0x48/0x4a
[  227.142526]  schedule+0x3c/0x90
[  227.142528]  do_exit+0xabc/0xb50
[  227.142531]  ? __x64_sys_execve+0x44/0x50
[  227.142533]  rewind_stack_do_exit+0x17/0x20
[  227.142772] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  227.142783] PGD 1fd72ad067 P4D 1fd72ad067 PUD 1fcfcf0067 PMD 0
[  227.142792] Oops: 0000 [#3] PREEMPT SMP NOPTI
[  227.142799] CPU: 2 PID: 809 Comm: rs:main Q:Reg Tainted: G    B D W   E =
    4.19.321-default-bug1106594 #5
[  227.142808] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  227.142819] RIP: e030:get_page_from_freelist+0x265/0x1040
[  227.142826] Code: 48 c1 e3 04 48 01 eb 48 8b 03 48 39 c3 0f 84 3e 03 00 =
00 48 8b 03 48 bb 00 02 00 00 00 00 ad de 48 be 00 01 00 00 00 00 ad de <48=
> 8b 08 48 8b 50 08 48 89 51 08 48 89 0a 48 89 58 08 48 89 c3 48
[  227.142842] RSP: e02b:ffffc9004702b960 EFLAGS: 00010086
[  227.142848] RAX: 0000000000000000 RBX: dead000000000200 RCX: 00000000000=
00002
[  227.142855] RDX: ffff881f9efe8cd0 RSI: dead000000000100 RDI: 00000000000=
44250
[  227.142863] RBP: ffff881fdf4a80c0 R08: 0000000000002000 R09: 0000000001d=
eeb51
[  227.142870] R10: 0000000000000000 R11: ffff881fdabef041 R12: 00000000000=
00002
[  227.142877] R13: ffffc9004702ba50 R14: ffff881f9efe8cd0 R15: ffff881f9ef=
ddb80
[  227.142889] FS:  00007f17b508e700(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  227.142897] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.142904] CR2: 0000000000000000 CR3: 0000001fced1a000 CR4: 00000000000=
02660
[  227.142913] Call Trace:
[  227.142921]  ? __switch_to_asm+0x40/0x70
[  227.142927]  ? __switch_to_asm+0x34/0x70
[  227.142932]  ? __switch_to_asm+0x40/0x70
[  227.142938]  __alloc_pages_nodemask+0xd1/0x260
[  227.142947]  cache_grow_begin+0x6c/0x710
[  227.142955]  ____cache_alloc.part.64+0x1dc/0x299
[  227.142962]  kmem_cache_alloc+0x21a/0x220
[  227.142970]  alloc_buffer_head+0x1a/0x90
[  227.142976]  alloc_page_buffers+0xb2/0x170
[  227.142983]  create_empty_buffers+0x19/0x110
[  227.142991]  ext4_block_write_begin+0x4e1/0x5a0
[  227.142999]  ? preempt_count_sub+0x50/0x60
[  227.143006]  ? ext4_journalled_invalidatepage+0x20/0x20
[  227.143012]  ? kmem_cache_alloc+0x20a/0x220
[  227.143020]  ? jbd2__journal_start+0xe9/0x200
[  227.143027]  ext4_da_write_begin+0x185/0x4b0
[  227.143034]  ? ext4_da_write_end+0x132/0x2c0
[  227.143042]  generic_perform_write+0xb2/0x190
[  227.143051]  __generic_file_write_iter+0x184/0x1c0
[  227.143058]  ext4_file_write_iter+0xb6/0x3e0
[  227.143066]  ? tty_write+0x1c1/0x290
[  227.143071]  ? process_echoes+0x70/0x70
[  227.143078]  __vfs_write+0xee/0x170
[  227.143085]  vfs_write+0xad/0x1a0
[  227.143091]  ksys_write+0x42/0x90
[  227.143098]  do_syscall_64+0x5d/0x110
[  227.143104]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  227.143110] RIP: 0033:0x7f17b9a47dcd
[  227.143115] Code: c5 20 00 00 75 10 b8 01 00 00 00 0f 05 48 3d 01 f0 ff =
ff 73 31 c3 48 83 ec 08 e8 ae fc ff ff 48 89 04 24 b8 01 00 00 00 0f 05 <48=
> 8b 3c 24 48 89 c2 e8 f7 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
[  227.143130] RSP: 002b:00007f17b508d4c0 EFLAGS: 00000293 ORIG_RAX: 000000=
0000000001
[  227.143139] RAX: ffffffffffffffda RBX: 00007f17a001a080 RCX: 00007f17b9a=
47dcd
[  227.143146] RDX: 0000000000000d06 RSI: 00007f17a001a080 RDI: 00000000000=
00008
[  227.143153] RBP: 0000000000000000 R08: 0000000000000000 R09: 00000000000=
041ac
[  227.143161] R10: 000000000000419c R11: 0000000000000293 R12: 00007f17a00=
064c0
[  227.143168] R13: 00007f17b508d4e0 R14: 0000000000000000 R15: 00000000000=
00d06
[  227.143176] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  227.143242] CR2: 0000000000000000
[  227.143248] ---[ end trace 99720d82363be8d0 ]---
[  227.143255] RIP: e030:clear_page_rep+0x7/0x10
[  227.143261] Code: 89 47 10 89 c8 eb e7 48 8b 04 24 48 89 47 10 eb d5 48 =
8b 04 24 48 89 47 08 48 89 47 10 eb c7 90 90 90 90 b9 00 02 00 00 31 c0 <f3=
> 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00
[  227.143275] RSP: e02b:ffffc900477a3cd0 EFLAGS: 00010246
[  227.143282] RAX: 0000000000000000 RBX: ffff881fdf4a80c8 RCX: 00000000000=
00200
[  227.143289] RDX: 0000000000028108 RSI: ffffffff811ee2cb RDI: ffe70ff7d2a=
03000
[  227.143296] RBP: ffff881fdf4a80c8 R08: ffffffffffffffcf R09: 0000000001d=
eeb51
[  227.143304] R10: 0000000000000000 R11: 000000000000a746 R12: ffff881fdf4=
a8108
[  227.143311] R13: ffff881efa6da0c0 R14: ffff881f9efddb80 R15: ffff881f9ef=
ddb80
[  227.143322] FS:  00007f17b508e700(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  227.143330] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.143336] CR2: 0000000000000000 CR3: 0000001fced1a000 CR4: 00000000000=
02660
[  227.143387] general protection fault: 0000 [#4] PREEMPT SMP NOPTI
[  227.143396] CPU: 2 PID: 255 Comm: kworker/2:2 Tainted: G    B D W   E   =
  4.19.321-default-bug1106594 #5
[  227.143405] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  227.143414] Workqueue: events free_work
[  227.143421] RIP: e030:free_unref_page_commit+0x63/0xa0
[  227.143427] Code: 0b 41 83 f8 04 74 4b b9 01 00 00 00 48 8b 50 58 65 48 =
03 15 7f 33 e2 7e 48 83 c1 01 48 8d 77 08 48 c1 e1 04 48 01 d1 4c 8b 01 <49=
> 89 70 08 48 89 4f 10 4c 89 47 08 48 89 31 8b 32 8d 4e 01 3b 4a
[  227.143442] RSP: e02b:ffffc90047093e28 EFLAGS: 00010082
[  227.143448] RAX: ffff881f9efddb80 RBX: ffffea007f62ef00 RCX: ffff881fdf4=
a80d0
[  227.143455] RDX: ffff881fdf4a80c0 RSI: ffffea007f62ef08 RDI: ffffea007f6=
2ef00
[  227.143462] RBP: 0000000001fd8bbc R08: dead000000000100 R09: 00000000000=
00008
[  227.143471] R10: ffffffff82368420 R11: 0000000000000018 R12: 00000000000=
00201
[  227.143478] R13: ffff881fdf4a8600 R14: 0000000000000000 R15: 0ffff881fdf=
4a860
[  227.143489] FS:  00007f17b508e700(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  227.143497] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.143504] CR2: 0000000000000000 CR3: 0000001fced1a000 CR4: 00000000000=
02660
[  227.143513] Call Trace:
[  227.143519]  free_unref_page+0x59/0x90
[  227.143526]  __vunmap+0x6c/0xc0
[  227.143532]  free_work+0x26/0x30
[  227.143538]  process_one_work+0x15c/0x3a0
[  227.143545]  worker_thread+0x46/0x3d0
[  227.143551]  ? _raw_spin_unlock_irqrestore+0x2e/0x59
[  227.143559]  kthread+0xf[  247.494824] general protection fault: 0000 [#=
8] PREEMPT SMP NOPTI
[  247.494847] CPU: 2 PID: 1760 Comm: cron Tainted: G    B D W   E     4.19=
.321-default-bug1106594 #5
[  247.494856] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  247.494866] RIP: e030:get_page_from_freelist+0x265/0x1040
[  247.494872] Code: 48 c1 e3 04 48 01 eb 48 8b 03 48 39 c3 0f 84 3e 03 00 =
00 48 8b 03 48 bb 00 02 00 00 00 00 ad de 48 be 00 01 00 00 00 00 ad de <48=
> 8b 08 48 8b 50 08 48 89 51 08 48 89 0a 48 89 58 08 48 89 c3 48
[  247.494888] RSP: e02b:ffffc90047233c08 EFLAGS: 00010002
[  247.494894] RAX: dead000000000100 RBX: dead000000000200 RCX: 00000000000=
00002
[  247.494902] RDX: ffff881f9efdecc0 RSI: dead000000000100 RDI: 00000000006=
080c0
[  247.494909] RBP: ffff881fdf4a80c0 R08: 0000000000000000 R09: 0000000001d=
eea7e
[  247.494916] R10: 0000000000000000 R11: 000000000000a746 R12: 00000000000=
00000
[  247.494924] R13: ffffc90047233cf8 R14: ffff881f9efdecc0 R15: ffff881f9ef=
ddb80
[  247.494935] FS:  00007f8892f38800(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  247.494943] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  247.494950] CR2: 00007f8892f43000 CR3: 0000001fcdfd2000 CR4: 00000000000=
02660
[  247.494960] Call Trace:
[  247.494968]  __alloc_pages_nodemask+0xd1/0x260
[  247.494975]  __get_free_pages+0xd/0x30
[  247.494982]  xen_pgd_alloc+0x59/0x120
[  247.494988]  pgd_alloc+0x66/0x1a0
[  247.494994]  mm_init+0x1c9/0x2f0
[  247.495001]  copy_process.part.33+0x1a59/0x1ff0
[  247.495008]  ? tlb_finish_mmu+0x1f/0x30
[  247.495014]  ? unmap_region+0xc6/0xf0
[  247.495021]  ? security_file_free+0x22/0x30
[  247.495028]  _do_fork+0xe5/0x390
[  247.495034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[  247.495041]  do_syscall_64+0x5d/0x110
[  247.495047]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  247.495054] RIP: 0033:0x7f88923e9343
[  247.495059] Code: f7 d8 64 89 04 25 d4 02 00 00 64 4c 8b 0c 25 10 00 00 =
00 31 d2 4d 8d 91 d0 02 00 00 31 f6 bf 11 00 20 01 b8 38 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 0f 87 9c 01 00 00 85 c0 41 89 c5 0f 85 a6 01 00
[  247.495074] RSP: 002b:00007fff28c7ac10 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000038
[  247.495083] RAX: ffffffffffffffda RBX: 00007fff28c7ac10 RCX: 00007f88923=
e9343
[  247.495090] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000012=
00011
[  247.495098] RBP: 00007fff28c7ac50 R08: 00000000000006e0 R09: 00007f8892f=
38800
[  247.495105] R10: 00007f8892f38ad0 R11: 0000000000000246 R12: 00000000000=
006e0
[  247.495112] R13: 0000000000000000 R14: 000000000186c675 R15: 00000000000=
01c20
[  247.495121] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  247.495187] ---[ end trace 99720d82363be8d5 ]---
[  247.495194] RIP: e030:clear_page_rep+0x7/0x10
[  247.495200] Code: 89 47 10 89 c8 eb e7 48 8b 04 24 48 89 47 10 eb d5 48 =
8b 04 24 48 89 47 08 48 89 47 10 eb c7 90 90 90 90 b9 00 02 00 00 31 c0 <f3=
> 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00
[  247.495215] RSP: e02b:ffffc900477a3cd0 EFLAGS: 00010246
[  247.495221] RAX: 0000000000000000 RBX: ffff881fdf4a80c8 RCX: 00000000000=
00200
[  247.495260] RDX: 0000000000028108 RSI: ffffffff811ee2cb RDI: ffe70ff7d2a=
03000
[  247.495267] RBP: ffff881fdf4a80c8 R08: ffffffffffffffcf R09: 0000000001d=
eeb51
[  247.495274] R10: 0000000000000000 R11: 000000000000a746 R12: ffff881fdf4=
a8108
[  247.495281] R13: ffff881efa6da0c0 R14: ffff881f9efddb80 R15: ffff881f9ef=
ddb80
[  247.495293] FS:  00007f8892f38800(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  247.495301] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  247.495307] CR2: 00007f8892f43000 CR3: 0000001fcdfd2000 CR4: 00000000000=
02660
[  247.495514] general protection fault: 0000 [#9] PREEMPT SMP NOPTI
[  247.495523] CPU: 2 PID: 1760 Comm: cron Tainted: G    B D W   E     4.19=
.321-default-bug1106594 #5
[  247.495531] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  247.495541] RIP: e030:get_page_from_freelist+0x265/0x1040
[  247.495547] Code: 48 c1 e3 04 48 01 eb 48 8b 03 48 39 c3 0f 84 3e 03 00 =
00 48 8b 03 48 bb 00 02 00 00 00 00 ad de 48 be 00 01 00 00 00 00 ad de <48=
> 8b 08 48 8b 50 08 48 89 51 08 48 89 0a 48 89 58 08 48 89 c3 48
[  247.495562] RSP: e02b:ffffc90047233bd8 EFLAGS: 00010002
[  247.495568] RAX: dead000000000100 RBX: dead000000000200 RCX: 00000000000=
00002
[  247.495576] RDX: ffff881f9efdecc0 RSI: dead000000000100 RDI: 00000000004=
00200
[  247.495583] RBP: ffff881fdf4a80c0 R08: fffffffffffffff9 R09: 0000000001d=
eea7e
[  247.495590] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00000
[  247.495598] R13: ffffc90047233cc8 R14: ffff881f9efdecc0 R15: ffff881f9ef=
ddb80
[  247.495609] FS:  00007f8892f38800(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  247.495617] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  247.495623] CR2: 00007f8892f43000 CR3: 000000000220a000 CR4: 00000000000=
02660
[  247.495633] Call Trace:
[  247.495640]  ? xen_make_pte+0x13/0x20
[  247.495646]  ? __raw_callee_save_xen_make_pte+0x11/0x1e
[  247.495653]  __alloc_pages_nodemask+0xd1/0x260
[  247.495660]  __get_free_pages+0xd/0x30
[  247.495666]  __tlb_remove_page_size+0x4d/0x80
[  247.495673]  unmap_page_range+0x60a/0xb50
[  247.495680]  unmap_vmas+0x42/0x90
[  247.495686]  exit_mmap+0xa2/0x170
[  247.495693]  mmput+0x4a/0x110
[  247.495698]  do_exit+0x25d/0xb50
[  247.495704]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[  247.495711]  rewind_stack_do_exit+0x17/0x20
[  247.495717] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  247.495783] ---[ end trace 99720d82363be8d6 ]---
[  247.495790] RIP: e030:clear_page_rep+0x7/0x10
[  247.495796] Code: 89 47 10 89 c8 eb e7 48 8b 04 24 48 89 47 10 eb d5 48 =
8b 04 24 48 89 47 08 48 89 47 10 eb c7 90 90 90 90 b9 00 02 00 00 31 c0 <f3=
> 48 ab c3 0f 1f 44 00 00 31 c0 b9 40 00 00 00 66 0f 1f 84 00 00
[  247.495811] RSP: e02b:ffffc900477a3cd0 EFLAGS: 00010246
[  247.495817] RAX: 0000000000000000 RBX: ffff881fdf4a80c8 RCX: 00000000000=
00200
[  247.495824] RDX: 0000000000028108 RSI: ffffffff811ee2cb RDI: ffe70ff7d2a=
03000
[  247.495831] RBP: ffff881fdf4a80c8 R08: ffffffffffffffcf R09: 0000000001d=
eeb51
[  247.495839] R10: 0000000000000000 R11: 000000000000a746 R12: ffff881fdf4=
a8108
[  247.495846] R13: ffff881efa6da0c0 R14: ffff881f9efddb80 R15: ffff881f9ef=
ddb80
[  247.495857] FS:  00007f8892f38800(0000) GS:ffff881fdf480000(0000) knlGS:=
0000000000000000
[  247.495865] CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
[  247.495871] CR2: 00007f8892f43000 CR3: 000000000220a000 CR4: 00000000000=
02660
[  247.495881] Fixing recursive fault but reboot is needed!
[  247.495887] BUG: scheduling while atomic: cron/1760/0x00000002
[  247.495893] Modules linked in: tun(E) loop(E) nfsv3(E) nfs_acl(E) nfs(E)=
 lockd(E) grace(E) sunrpc(E) fscache(E) ebtable_filter(E) ebtables(E) ip6ta=
ble_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) af_p=
acket(E) br_netfilter(E) bridge(E) stp(E) llc(E) xen_acpi_processor(E) xen_=
pciback(E) xen_netback(E) xen_blkback(E) xen_gntalloc(E) xen_gntdev(E) xen_=
evtchn(E) btrfs(E) xor(E) zlib_deflate(E) raid6_pq(E) libcrc32c(E) gpio_ich=
(E) lpc_ich(E) i7core_edac(E) intel_powerclamp(E) coretemp(E) crc32c_intel(=
E) pcspkr(E) button(E) xenfs(E) xen_privcmd(E) igb(E) ptp(E) pps_core(E) i2=
c_algo_bit(E) dca(E) xen_netfront(E) xen_blkfront(E) sg(E) dm_multipath(E) =
dm_mod(E)
[  247.495958] CPU: 2 PID: 1760 Comm: cron Tainted: G    B D W   E     4.19=
.321-default-bug1106594 #5
[  247.495967] Hardware name: HP ProLiant SL160z G6 /ProLiant SL160z G6 , B=
IOS O33 07/28/2009
[  247.495974] Call Trace:
[  247.495980]  dump_stack+0x78/0xb3
[  247.495986]  __schedule_bug+0x5c/0x69
[  247.495993]  __schedule+0x783/0x8b0
[  247.495999]  ? printk+0x48/0x4a
[  247.496005]  schedule+0x3c/0x90
[  247.496010]  do_exit+0xabc/0xb50
[  247.496016]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[  247.496023]  rewind_stack_do_exit+0x17/0x20



After that, the dom0 is not usable anymore, even dmesg(1) hangs.
I will see if xen-4.9 works any better.

Olaf

--Sig_/PKS_TJcZixc31/BpiHX84Jk
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5ZoQwAKCRBdQqD6ppg2
fkRLAKDCVWyiNNvS2LTMcXW8Ak0HWC0UpACfYXGEt1RDCtifiBdvttNd+DFjCe0=
=1ClA
-----END PGP SIGNATURE-----

--Sig_/PKS_TJcZixc31/BpiHX84Jk--


--===============3143657715909434048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3143657715909434048==--
