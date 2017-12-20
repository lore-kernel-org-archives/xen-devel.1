From: "Alex Braunegg" <alex.braunegg@gmail.com>
Subject: [BUG] kernel bug encountered at
	drivers/net/xen-netback/netback.c:430!
Date: Thu, 21 Dec 2017 08:03:35 +1100
Message-ID: <5a3ad02d.8d1f620a.9ccee.023a@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0049_01D37A32.35E3EE80"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7+kr=dq=gmail.com=alex.braunegg@srs-us1.protection.inumbo.net>)
 id 1eRlWk-0000KA-FI
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 21:03:46 +0000
Received: by mail-pf0-x242.google.com with SMTP id v26so13058155pfl.7
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 13:03:44 -0800 (PST)
Received: from DELLE5450 (203-206-112-99.dyn.iinet.net.au. [203.206.112.99])
 by smtp.gmail.com with ESMTPSA id l13sm36021391pfj.73.2017.12.20.13.03.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 20 Dec 2017 13:03:41 -0800 (PST)
Content-Language: en-au
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

This is a multi-part message in MIME format.

------=_NextPart_000_0049_01D37A32.35E3EE80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

I experienced the following bug whilst using a Xen VM. What happened was
that this morning a single Xen VM suddenly terminated without cause with the
following being logged in dmesg. 

Only 1 VM experienced an issue (out of 2 which were running), the other
remained up and fully functional until I attempted to restart the crashed VM
which triggered the kernel bug.

Kernel:	4.14.6
Xen:		4.8.2

============================================================================
=========

vif vif-2-0 vif2.0: Trying to unmap invalid handle! pending_idx: 0x3f
------------[ cut here ]------------
kernel BUG at drivers/net/xen-netback/netback.c:430!
invalid opcode: 0000 [#1] SMP
Modules linked in: xt_physdev(E) iptable_filter(E) ip_tables(E)
xen_netback(E) nfsd(E) lockd(E) grace(E) nfs_acl(E) auth_rpcgss(E) sunrpc(E)
ipmi_si(E) ipmi_msghandler(E) zfs(POE) zcommon(POE) znvpair(POE) icp(POE)
spl(OE) zavl(POE) zunicode(POE) k10temp(E) tpm_infineon(E) sp5100_tco(E)
i2c_piix4(E) i2c_core(E) ohci_pci(E) ohci_hcd(E) tg3(E) ptp(E) pps_core(E)
sg(E) raid1(E) sd_mod(E) ata_generic(E) pata_acpi(E) pata_atiixp(E) ahci(E)
libahci(E) dm_mirror(E) dm_region_hash(E) dm_log(E) dm_mod(E) dax(E)
CPU: 0 PID: 13163 Comm: vif2.0-q0-deall Tainted: P           OE
4.14.6-1.el6.x86_64 #1
Hardware name: HP ProLiant MicroServer, BIOS O41     10/01/2013
task: ffff8800595cc980 task.stack: ffffc900028e0000
RIP: e030:xenvif_tx_dealloc_action+0x1bb/0x230 [xen_netback]
RSP: e02b:ffffc900028e3c68 EFLAGS: 00010292
RAX: 0000000000000045 RBX: ffffc90002969000 RCX: 0000000000000000
RDX: ffff88007f4146e8 RSI: ffff88007f40db38 RDI: ffff88007f40db38
RBP: ffffc900028e3e98 R08: 000000000000037b R09: 000000000000037c
R10: 0000000000000001 R11: 0000000000000000 R12: ffffc90002972730
R13: 0000160000000000 R14: aaaaaaaaaaaaaaab R15: ffffc9000099bbe8
FS:  00007fee260ff9a0(0000) GS:ffff88007f400000(0000) knlGS:0000000000000000
CS:  e033 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffff600400 CR3: 0000000062815000 CR4: 0000000000000660
Call Trace:
 ? error_exit+0x5/0x20
 ? __update_load_avg_cfs_rq+0x176/0x180
 ? xen_mc_flush+0x87/0x120
 ? xen_load_sp0+0x84/0xa0
 ? __switch_to+0x1c1/0x360
 ? finish_task_switch+0x78/0x240
 ? __schedule+0x192/0x496
 ? _raw_spin_lock_irqsave+0x1a/0x3c
 ? _raw_spin_lock_irqsave+0x1a/0x3c
 ? _raw_spin_unlock_irqrestore+0x11/0x20
 xenvif_dealloc_kthread+0x68/0xf0 [xen_netback]
 ? do_wait_intr+0x80/0x80
 ? xenvif_map_frontend_data_rings+0xe0/0xe0 [xen_netback]
 kthread+0x106/0x140
 ? kthread_destroy_worker+0x60/0x60
 ? kthread_destroy_worker+0x60/0x60
 ret_from_fork+0x25/0x30
Code: 89 df 49 83 c4 02 e8 e5 f5 ff ff 4d 39 ec 75 e8 eb a2 48 8b 43 20 48
c7 c6 10 3b 55 a0 48 8b b8 20 03 00 00 31 c0 e8 85 b9 06 e1 <0f> 0b 0f 0b 48
8b 53 20 89 c1 48 c7 c6 48 3b 55 a0 31 c0 45 31 
RIP: xenvif_tx_dealloc_action+0x1bb/0x230 [xen_netback] RSP:
ffffc900028e3c68
---[ end trace 7d827dae67002ffc ]---

============================================================================
=========

The section of relevant kernel code is:

============================================================================
=========

static inline void xenvif_grant_handle_reset(struct xenvif_queue *queue,
                                             u16 pending_idx)
{
        if (unlikely(queue->grant_tx_handle[pending_idx] ==
                     NETBACK_INVALID_HANDLE)) {
                netdev_err(queue->vif->dev,
                           "Trying to unmap invalid handle! pending_idx:
0x%x\n",
                           pending_idx);
                BUG();
        }
        queue->grant_tx_handle[pending_idx] = NETBACK_INVALID_HANDLE;
}

============================================================================
=========

In an attempt to recover from this situation I restarted / destroyed (xl
restart <vmname> / xl destroy <vmname>) the VM to recover it's state and the
following error messages were logged at the console:

============================================================================
=========

libxl: error: libxl_exec.c:129:libxl_report_child_exitstatus:
/etc/xen/scripts/block remove [25271] died due to fatal signal Segmentation
fault
libxl: error: libxl_device.c:1080:device_backend_callback: unable to remove
device with path /local/domain/0/backend/vif/2/0
libxl: error: libxl.c:1647:devices_destroy_cb: libxl__devices_destroy failed
for 2

============================================================================
=========

After which the physical system hung, then the physical system restarted
with nothing else logged and everything came back OK & operational including
the VM that crashed.

Further details (xl dmesg, xl info) attached.

Best regards,

Alex Braunegg

------=_NextPart_000_0049_01D37A32.35E3EE80
Content-Type: text/plain;
	name="xl-dmesg.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="xl-dmesg.txt"

 Xen 4.8.2
(XEN) Xen version 4.8.2 (<redacted>) (gcc (GCC) 4.6.2 20111027 (Red Hat =
4.6.2-1)) debug=3Dn  Sun Dec 17 14:32:09 EST 2017
(XEN) Latest ChangeSet:=20
(XEN) Bootloader: GNU GRUB 0.97
(XEN) Command line: dom0_mem=3D2048M,max:2048M cpufreq=3Dxen =
dom0_max_vcpus=3D1 dom0_vcpus_pin
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN)  EDID info not retrieved because of reasons unknown
(XEN) Disc information:
(XEN)  Found 7 MBR signatures
(XEN)  Found 6 EDD information structures
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009d000 (usable)
(XEN)  000000000009d000 - 00000000000a0000 (reserved)
(XEN)  00000000000e2000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 00000000ddf90000 (usable)
(XEN)  00000000ddf9e000 - 00000000ddfa0000 type 9
(XEN)  00000000ddfa0000 - 00000000ddfaa600 (ACPI data)
(XEN)  00000000ddfaa600 - 00000000ddfe0000 (ACPI NVS)
(XEN)  00000000ddfe0000 - 00000000de000000 (reserved)
(XEN)  00000000e0000000 - 00000000f0000000 (reserved)
(XEN)  00000000ffa00000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000220000000 (usable)
(XEN) ACPI: RSDP 000F8F50, 0024 (r2 HP    )
(XEN) ACPI: XSDT DDFA0100, 007C (r1 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: FACP DDFA0290, 00F4 (r3 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: DSDT DDFA0620, 6868 (r1 HP     ProLiant        6 INTL =
20051117)
(XEN) ACPI: FACS DDFAE000, 0040
(XEN) ACPI: APIC DDFA0390, 0072 (r1 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: MCFG DDFA0410, 003C (r1 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: SPMI DDFA0450, 0041 (r5 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: OEMB DDFAE040, 0072 (r1 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: HPET DDFAB4E0, 0038 (r1 HP     ProLiant 20131001 HP         =
97)
(XEN) ACPI: EINJ DDFAB520, 0130 (r1  AMIER AMI_EINJ 20131001 HP         =
97)
(XEN) ACPI: BERT DDFAB6B0, 0030 (r1  AMIER AMI_BERT 20131001 HP         =
97)
(XEN) ACPI: ERST DDFAB6E0, 01B0 (r1  AMIER AMI_ERST 20131001 HP         =
97)
(XEN) ACPI: HEST DDFAB890, 00A8 (r1  AMIER ABC_HEST 20131001 HP         =
97)
(XEN) ACPI: SSDT DDFAB940, 052A (r1 HP     ProLiant        1 AMD         =
1)
(XEN) System RAM: 8159MB (8354996kB)
(XEN) Domain heap initialised
(XEN) IOAPIC[0]: apic_id 2, version 33, address 0xfec00000, GSI 0-23
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) Failed to get Error Log Address Range.
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2196.371 MHz processor.
(XEN) Initing memory sharing.
(XEN) AMD-Vi: IOMMU not found!
(XEN) I/O virtualisation disabled
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) Allocated console ring of 16 KiB.
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Brought up 2 CPUs
(XEN) Xenoprofile: AMD IBS detected (0x1f)
(XEN) Dom0 has maximum 216 PIRQs
(XEN) *** LOADING DOMAIN 0 ***
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x1ff4000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000210000000->0000000214000000 (497047 pages =
to be allocated)
(XEN)  Init. ramdisk: 000000021d597000->000000021ffff800
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff81ff4000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000400000
(XEN)  Start info:    ffffffff81ff4000->ffffffff81ff44b4
(XEN)  Page tables:   ffffffff81ff5000->ffffffff8200a000
(XEN)  Boot stack:    ffffffff8200a000->ffffffff8200b000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82400000
(XEN)  ENTRY ADDRESS: ffffffff81d01180
(XEN) Dom0 has maximum 1 VCPUs
(XEN) Scrubbing Free RAM on 1 nodes using 2 CPUs
(XEN) ..................................done.
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: Errors and warnings
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) Xen is relinquishing VGA console.
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch =
input to Xen)
(XEN) Freed 316kB init memory
------=_NextPart_000_0049_01D37A32.35E3EE80
Content-Type: text/plain;
	name="xl-info.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="xl-info.txt"

host                   : <redacted>
release                : 4.14.6-1.el6.x86_64
version                : #1 SMP Sun Dec 17 09:56:11 EST 2017
machine                : x86_64
nr_cpus                : 2
max_cpu_id             : 3
nr_nodes               : 1
cores_per_socket       : 2
threads_per_core       : 1
cpu_mhz                : 2196
hw_caps                : =
178bf3ff:80802001:efd3fbff:000837ff:00000000:00000000:00000000:00000100
virt_caps              : hvm
total_memory           : 8159
free_memory            : 2921
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 8
xen_extra              : .2
xen_version            : 4.8.2
xen_caps               : xen-3.0-x86_64 xen-3.0-x86_32p hvm-3.0-x86_32 =
hvm-3.0-x86_32p hvm-3.0-x86_64=20
xen_scheduler          : credit
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :=20
xen_commandline        : dom0_mem=3D2048M,max:2048M cpufreq=3Dxen =
dom0_max_vcpus=3D1 dom0_vcpus_pin
cc_compiler            : gcc (GCC) 4.6.2 20111027 (Red Hat 4.6.2-1)
cc_compile_by          : mockbuild
cc_compile_domain      : <redacted>
cc_compile_date        : Sun Dec 17 14:32:09 EST 2017
build_id               : 83b9fac55c85d3ae6f228e672157a37347d25677
xend_config_format     : 4
------=_NextPart_000_0049_01D37A32.35E3EE80
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

------=_NextPart_000_0049_01D37A32.35E3EE80--
