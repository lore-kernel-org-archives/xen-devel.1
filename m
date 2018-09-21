From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Current staging crashes on boot on an AMD EPYC 7251
Date: Fri, 21 Sep 2018 13:48:37 +0300
Message-ID: <a18e6e4b-36ce-17a5-5bec-f14c60544d6c@bitdefender.com>
References: <79af1936-5093-d101-d3a5-2abd444551e8@bitdefender.com>
 <20180921101545.th2ncxhjg4qk6rfu@mac.bytemobile.com>
 <5BA4CACC02000078001EA7F2@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------727AC5CDCB3114805F7E8FA0"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qbiu=md=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g3Izc-0004X4-3n
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 10:49:00 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 60EC0305FFAB
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 13:48:56 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 4516F7FC21
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 13:48:56 +0300 (EEST)
In-Reply-To: <5BA4CACC02000078001EA7F2@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------727AC5CDCB3114805F7E8FA0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 9/21/18 1:41 PM, Jan Beulich wrote:
>>>> On 21.09.18 at 12:15, <roger.pau@citrix.com> wrote:
>> On Fri, Sep 21, 2018 at 12:45:18PM +0300, Razvan Cojocaru wrote:
>>> While doing my best to make sure what I understand to be George's
>>> proposed changes for the altp2m series I've tried to boot Xen staging on
>>> an AMD host, but it crashes in an unrelated place (I've tested this by
>>> stashing my changes and booting a "vanilla" staging):
>>
>> Can you apply the following debug patch and paste the full boot log?
> 
> Well, not having provided the full boot log right away is clearly
> unhelpful, as from that alone we should be able to tell what's
> going on here (unless we e.g. screw up the E820 map somewhere).
> However, it is already clear that ...
> 
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -465,6 +465,8 @@ unsigned int page_get_ram_type(mfn_t mfn)
>>              break;
>>  
>>          default:
>> +printk("[%#lx, %#lx) type: %u\n", e820.map[i].addr,
>> +       e820.map[i].addr + e820.map[i].size, e820.map[i].type);
>>              ASSERT_UNREACHABLE();
> 
> ... this assertion needs to go away, as it would trigger for both
> E820_TYPE_PMEM and E820_TYPE_PRAM (using the Linux
> naming), or the unnamed type 6 mentioned in their header. It
> would also trigger for types which may get added down the road.

I have attached the full log, as requested by Roger.


Thanks,
Razvan

--------------727AC5CDCB3114805F7E8FA0
Content-Type: text/x-log;
 name="epyc_crash2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="epyc_crash2.log"

Loading Xen xen ...
WARNING: no console will be available to OS
Loading Linux 4.4.0-135-generic ...
Loading initial ramdisk ...
 Xen 4.12-unstable
(XEN) Xen version 4.12-unstable (red@) (gcc (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609) debug=y  Fri Sep 21 13:39:06 EEST 2018
(XEN) Latest ChangeSet: Tue Sep 4 07:59:22 2018 +0300 git:3e828f8-dirty
(XEN) Bootloader: GRUB 2.02~beta2-36ubuntu3.18
(XEN) Command line: placeholder loglvl=all guest_loglvl=all altp2m=true dom0_mem=6000M,max:6000M ept=no-ad introspection_extn=true watchdog com1=115200,8n1 com2=115200,8n1 console=com1,com2,vga no-real-mode edd=off
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 0 EDD information structures
(XEN) Multiboot-e820 RAM map:
(XEN)  0000000000000000 - 00000000000a0000 (usable)
(XEN)  00000000000a0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 0000000031db0000 (usable)
(XEN)  0000000031db0000 - 0000000032000000 (reserved)
(XEN)  0000000032000000 - 00000000d9d9d000 (usable)
(XEN)  00000000d9d9d000 - 00000000d9e01000 (reserved)
(XEN)  00000000d9e01000 - 00000000d9ed2000 (usable)
(XEN)  00000000d9ed2000 - 00000000da227000 (ACPI NVS)
(XEN)  00000000da227000 - 00000000dabf2000 (reserved)
(XEN)  00000000dabf2000 - 00000000dacdf000 type 20
(XEN)  00000000dacdf000 - 00000000dc000000 (usable)
(XEN)  00000000dc000000 - 00000000e0000000 (reserved)
(XEN)  00000000e6f00000 - 00000000e6f80000 (reserved)
(XEN)  00000000e7000000 - 00000000e7080000 (reserved)
(XEN)  00000000e70f0000 - 00000000e70f1000 (reserved)
(XEN)  00000000e9300000 - 00000000e9380000 (reserved)
(XEN)  00000000e9400000 - 00000000e9480000 (reserved)
(XEN)  00000000e94f0000 - 00000000e94f1000 (reserved)
(XEN)  00000000eb700000 - 00000000eb780000 (reserved)
(XEN)  00000000eb800000 - 00000000eb880000 (reserved)
(XEN)  00000000eb8f0000 - 00000000eb8f1000 (reserved)
(XEN)  00000000eff00000 - 00000000eff80000 (reserved)
(XEN)  00000000efff0000 - 00000000efff1000 (reserved)
(XEN)  00000000fea00000 - 00000000feb00000 (reserved)
(XEN)  00000000fec00000 - 00000000fec01000 (reserved)
(XEN)  00000000fec10000 - 00000000fec11000 (reserved)
(XEN)  00000000fed00000 - 00000000fed01000 (reserved)
(XEN)  00000000fed40000 - 00000000fed45000 (reserved)
(XEN)  00000000fed80000 - 00000000fed90000 (reserved)
(XEN)  00000000fedc0000 - 00000000fedc1000 (reserved)
(XEN)  00000000fedc2000 - 00000000fedc6000 (reserved)
(XEN)  00000000fedc7000 - 00000000fedc8000 (reserved)
(XEN)  00000000fedc9000 - 00000000fedcb000 (reserved)
(XEN)  00000000fee00000 - 00000000fef00000 (reserved)
(XEN)  00000000ff000000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000c1f200000 (usable)
(XEN)  0000000c1f200000 - 0000000c20000000 (reserved)
(XEN) New Xen image base address: 0xdba00000
(XEN) ACPI: RSDP 000FCFF0, 0024 (r2 SUPERM)
(XEN) ACPI: XSDT D9ED20B8, 00EC (r1 SUPERM   SUPERM  3242016 AMI     10013)
(XEN) ACPI: FACP D9EDDC10, 0114 (r6                  3242016 AMI     10013)
(XEN) ACPI: DSDT D9ED2238, B9D1 (r2 SUPERM     SMCI  3242016 INTL 20120913)
(XEN) ACPI: FACS DA226E80, 0040
(XEN) ACPI: APIC D9EDDD28, 0482 (r4                  3242016 AMI     10013)
(XEN) ACPI: FPDT D9EDE1B0, 0044 (r1                  3242016 AMI     10013)
(XEN) ACPI: FIDT D9EDE1F8, 009C (r1 SUPERM     SMCI  3242016 AMI     10013)
(XEN) ACPI: SSDT D9EDE298, 00D2 (r2 SUPERM AMD ALIB        2 MSFT  4000000)
(XEN) ACPI: SPMI D9EDE370, 0041 (r5 SUPERM     SMCI        0 AMI.        0)
(XEN) ACPI: SSDT D9EDE3B8, 00FC (r2 SUPERM  CPUSSDT  3242016 AMI   3242016)
(XEN) ACPI: MCFG D9EDE4B8, 003C (r1 SUPERM     SMCI  3242016 MSFT    10013)
(XEN) ACPI: SSDT D9EDE4F8, 2314 (r1 SUPERM  AMD CPU        1 AMD         1)
(XEN) ACPI: SRAT D9EE0810, 01D0 (r3 SUPERM AMD SRAT        1 AMD         1)
(XEN) ACPI: MSCT D9EE09E0, 0064 (r1 SUPERM AMD MSCT        0 AMD         1)
(XEN) ACPI: SLIT D9EE0A48, 003C (r1 SUPERM AMD SLIT        1 AMD         1)
(XEN) ACPI: CRAT D9EE0A88, 1170 (r1 SUPERM AMD CRAT        1 AMD         1)
(XEN) ACPI: CDIT D9EE1BF8, 0038 (r1 SUPERM AMD CDIT        1 AMD         1)
(XEN) ACPI: BERT D9EE1C30, 0030 (r1 AMD    AMD BERT        1 AMD         1)
(XEN) ACPI: EINJ D9EE1C60, 0150 (r1 AMD    AMD EINJ        1 AMD         1)
(XEN) ACPI: HEST D9EE1DB0, 0608 (r1 AMD    AMD HEST        1 AMD         1)
(XEN) ACPI: HPET D9EE23B8, 0038 (r1 SUPERM     SMCI  3242016 AMI         5)
(XEN) ACPI: SSDT D9EE23F0, 0024 (r1 AMDFCH    FCHZP     1000 INTL 20120913)
(XEN) ACPI: UEFI D9EE2418, 0042 (r1                        0             0)
(XEN) ACPI: SPCR D9EE2460, 0050 (r2  A M I  APTIO V  3242016 AMI.    5000D)
(XEN) ACPI: BGRT D9EE24B0, 0038 (r1 SUPERM     SMCI  3242016 AMI     10013)
(XEN) ACPI: IVRS D9EE24E8, 01F0 (r2 SUPERM AMD IVRS        1 AMD         0)
(XEN) ACPI: SSDT D9EE26D8, 1630 (r1    AMD   CPMCMN        1 INTL 20120913)
(XEN) ACPI: WSMT D9EE3D08, 0028 (r1                  3242016 AMI     10013)
(XEN) System RAM: 49056MB (50234236kB)
(XEN) SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 08 -> Node 0
(XEN) SRAT: PXM 0 -> APIC 09 -> Node 0
(XEN) SRAT: PXM 1 -> APIC 10 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 11 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 18 -> Node 1
(XEN) SRAT: PXM 1 -> APIC 19 -> Node 1
(XEN) SRAT: PXM 2 -> APIC 20 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 21 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 28 -> Node 2
(XEN) SRAT: PXM 2 -> APIC 29 -> Node 2
(XEN) SRAT: PXM 3 -> APIC 30 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 31 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 38 -> Node 3
(XEN) SRAT: PXM 3 -> APIC 39 -> Node 3
(XEN) SRAT: Node 0 PXM 0 0-a0000
(XEN) SRAT: Node 0 PXM 0 100000-e0000000
(XEN) SRAT: Node 0 PXM 0 100000000-420000000
(XEN) SRAT: Node 1 PXM 1 420000000-c20000000
(XEN) NUMA: Allocated memnodemap from c02f2a000 - c02f37000
(XEN) NUMA: Using 8 for the hash shift.
(XEN) SRAT: Node 2 has no memory. BIOS Bug or mis-configured hardware?
(XEN) SRAT: Node 3 has no memory. BIOS Bug or mis-configured hardware?
(XEN) Domain heap initialised DMA width 32 bits
(XEN) CPU Vendor: AMD, Family 23 (0x17), Model 1 (0x1), Stepping 2 (raw 00800f12)
(XEN) found SMP MP-table at 000fcfe0
(XEN) DMI 2.8 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x808 (32 bits)
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - da226e80/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[da226e8c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x08] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x10] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x18] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x20] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x28] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x30] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x38] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x09] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x11] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x19] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x09] lapic_id[0x21] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x29] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x31] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x39] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x10] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x11] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x12] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x13] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x14] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x15] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x16] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x17] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x18] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x19] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x1a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x1b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x1c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x1d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x1e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x1f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x20] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x21] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x22] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x23] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x24] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x25] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x26] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x27] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x28] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x29] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x2a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x2b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x2c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x2d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x2e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x2f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x30] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x31] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x32] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x33] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x34] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x35] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x36] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x37] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x38] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x39] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x3a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x3b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x3c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x3d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x3e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x3f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x40] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x41] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x42] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x43] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x44] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x45] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x46] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x47] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x48] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x49] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x4a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x4b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x4c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x4d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x4e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x4f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x50] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x51] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x52] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x53] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x54] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x55] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x56] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x57] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x58] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x59] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x5a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x5b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x5c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x5d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x5e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x5f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x60] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x61] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x62] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x63] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x64] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x65] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x66] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x67] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x68] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x69] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x6a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x6b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x6c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x6d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x6e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x6f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x70] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x71] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x72] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x73] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x74] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x75] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x76] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x77] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x78] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x79] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x7a] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x7b] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x7c] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x7d] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x7e] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC (acpi_id[0x7f] lapic_id[0x00] disabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
(XEN) Overriding APIC driver with bigsmp
(XEN) ACPI: IOAPIC (id[0x80] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 128, version 33, address 0xfec00000, GSI 0-23
(XEN) ACPI: IOAPIC (id[0x81] address[0xefff0000] gsi_base[24])
(XEN) IOAPIC[1]: apic_id 129, version 33, address 0xefff0000, GSI 24-55
(XEN) ACPI: IOAPIC (id[0x82] address[0xeb8f0000] gsi_base[56])
(XEN) IOAPIC[2]: apic_id 130, version 33, address 0xeb8f0000, GSI 56-87
(XEN) ACPI: IOAPIC (id[0x83] address[0xe94f0000] gsi_base[88])
(XEN) IOAPIC[3]: apic_id 131, version 33, address 0xe94f0000, GSI 88-119
(XEN) ACPI: IOAPIC (id[0x84] address[0xe70f0000] gsi_base[120])
(XEN) IOAPIC[4]: apic_id 132, version 33, address 0xe70f0000, GSI 120-151
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Phys.  Using 5 I/O APICs
(XEN) ACPI: HPET id: 0x10228201 base: 0xfed00000
(XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 7f
(XEN) PCI: Not using MCFG for segment 0000 bus 00-7f
(XEN) ERST table was not found
(XEN) HEST: Table parsing has been initialized
(XEN) ACPI: BGRT: invalidating v1 image at 0xd6331018
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 128 CPUs (112 hotplug CPUs)
(XEN) IRQ limits: 152 GSI, 2936 MSI/MSI-X
(XEN) traps.c:1569: GPF (0000): ffff82d08042140d [probe_cpuid_faulting+0xe/0xa3] -> ffff82d080378882
(XEN) xstate: size: 0x340 and states: 0x7
(XEN) CPU0: AMD Fam17h machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN)   Support for HVM VMs: RSB
(XEN)   Support for PV VMs: RSB
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Platform timer is 14.318MHz HPET
(XEN) Detected 2100.045 MHz processor.
(XEN) Initing memory sharing.
(XEN) alt table ffff82d080462838 -> ffff82d08046463e
(XEN) AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN)  - Peripheral Page Service Request
(XEN)  - NX bit Supported
(XEN)  - Guest Translation
(XEN)  - Invalidate All Command
(XEN)  - Guest APIC supported
(XEN)  - Performance Counters
(XEN) AMD-Vi: IOMMU 0 Enabled.
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN)  - Peripheral Page Service Request
(XEN)  - NX bit Supported
(XEN)  - Guest Translation
(XEN)  - Invalidate All Command
(XEN)  - Guest APIC supported
(XEN)  - Performance Counters
(XEN) AMD-Vi: IOMMU 1 Enabled.
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN)  - Peripheral Page Service Request
(XEN)  - NX bit Supported
(XEN)  - Guest Translation
(XEN)  - Invalidate All Command
(XEN)  - Guest APIC supported
(XEN)  - Performance Counters
(XEN) AMD-Vi: IOMMU 2 Enabled.
(XEN) AMD-Vi: IOMMU Extended Features:
(XEN)  - Peripheral Page Service Request
(XEN)  - NX bit Supported
(XEN)  - Guest Translation
(XEN)  - Invalidate All Command
(XEN)  - Guest APIC supported
(XEN)  - Performance Counters
(XEN) AMD-Vi: IOMMU 3 Enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 11
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) Allocated console ring of 128 KiB.
(XEN) mwait-idle: does not run on family 23 model 1
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - Nested Page Tables (NPT)
(XEN)  - Last Branch Record (LBR) Virtualisation
(XEN)  - Next-RIP Saved on #VMEXIT
(XEN)  - VMCB Clean Bits
(XEN)  - DecodeAssists
(XEN)  - Virtual VMLOAD/VMSAVE
(XEN)  - Virtual GIF
(XEN)  - Pause-Intercept Filter
(XEN)  - Pause-Intercept Filter Threshold
(XEN)  - TSC Rate MSR
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) Brought up 16 CPUs
(XEN) Testing NMI watchdog on all CPUs: ok
(XEN) build-id: f29f4b5ed08e0a42ebc8a77aea98a0a9bc29fc07
(XEN) Running stub recovery selftests...
(XEN) traps.c:1569: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080378412
(XEN) traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080378412
(XEN) traps.c:1097: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080378412
(XEN) ACPI sleep modes: S3
(XEN) VPMU: disabled
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) xenoprof: Initialization failed. AMD processor family 23 is not supported
(XEN) Dom0 has maximum 1112 PIRQs
(XEN) NX (Execute Disable) protection active
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0x1000000 memsz=0xde9000
(XEN) ELF: phdr: paddr=0x1e00000 memsz=0x14a000
(XEN) ELF: phdr: paddr=0x1f4a000 memsz=0x184d8
(XEN) ELF: phdr: paddr=0x1f63000 memsz=0x2db000
(XEN) ELF: memory: 0x1000000 -> 0x223e000
(XEN) ELF: note: GUEST_OS = "linux"
(XEN) ELF: note: GUEST_VERSION = "2.6"
(XEN) ELF: note: XEN_VERSION = "xen-3.0"
(XEN) ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) ELF: note: INIT_P2M = 0x8000000000
(XEN) ELF: note: ENTRY = 0xffffffff81f631f0
(XEN) ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb|writable_descriptor_tables|auto_translated_physmap|supervisor_mode_kernel"
(XEN) ELF: note: SUPPORTED_FEATURES = 0x90d
(XEN) ELF: note: PAE_MODE = "yes"
(XEN) ELF: note: LOADER = "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL = 0x1
(XEN) ELF: note: MOD_START_PFN = 0x1
(XEN) ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET = 0
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0x0
(XEN)     virt_offset      = 0xffffffff80000000
(XEN)     virt_kstart      = 0xffffffff81000000
(XEN)     virt_kend        = 0xffffffff8223e000
(XEN)     virt_entry       = 0xffffffff81f631f0
(XEN)     p2m_base         = 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb, compat32
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x223e000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   00000003f4000000->00000003f8000000 (1509890 pages to be allocated)
(XEN)  Init. ramdisk: 0000000c1cc02000->0000000c1f1ffbda
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff8223e000
(XEN)  Init. ramdisk: 0000000000000000->0000000000000000
(XEN)  Phys-Mach map: 0000008000000000->0000008000bb8000
(XEN)  Start info:    ffffffff8223e000->ffffffff8223e4b4
(XEN)  Xenstore ring: 0000000000000000->0000000000000000
(XEN)  Console ring:  0000000000000000->0000000000000000
(XEN)  Page tables:   ffffffff8223f000->ffffffff82254000
(XEN)  Boot stack:    ffffffff82254000->ffffffff82255000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82400000
(XEN)  ENTRY ADDRESS: ffffffff81f631f0
(XEN) Dom0 has maximum 16 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81de9000
(XEN) ELF: phdr 1 at 0xffffffff81e00000 -> 0xffffffff81f4a000
(XEN) ELF: phdr 2 at 0xffffffff81f4a000 -> 0xffffffff81f624d8
(XEN) ELF: phdr 3 at 0xffffffff81f63000 -> 0xffffffff820ce000
(XEN) setup 0000:00:00.2 for d0 failed (-19)
(XEN) setup 0000:20:00.2 for d0 failed (-19)
(XEN) setup 0000:40:00.2 for d0 failed (-19)
(XEN) setup 0000:60:00.2 for d0 failed (-19)
(XEN) [0xdabf2000, 0xdacdf000) type: 20
(XEN) Assertion 'unreachable' failed at mm.c:470
(XEN) ----[ Xen-4.12-unstable  x86_64  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d080289034>] page_get_ram_type+0xaa/0xcf
(XEN) RFLAGS: 0000000000010292   CONTEXT: hypervisor
(XEN) rax: ffff82d0805bf3ac   rbx: 00000000000dabf2   rcx: 0000000000000000
(XEN) rdx: ffff82d080487fff   rsi: 000000000000000a   rdi: ffff82d08047c6b8
(XEN) rbp: ffff82d080487858   rsp: ffff82d080487848   r8:  ffff8303fb600000
(XEN) r9:  0000000000000002   r10: 0000000000000014   r11: 0000000000000002
(XEN) r12: ffff82d080391a54   r13: ffff8303fb342000   r14: 0000000000c1f200
(XEN) r15: 000ffffffffff000   cr0: 000000008005003b   cr4: 00000000001506e0
(XEN) cr3: 00000000dbe7b000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d080289034> (page_get_ram_type+0xaa/0xcf):
(XEN)  e8 15 00 e8 df 8e fc ff <0f> 0b 49 03 31 49 83 c0 14 4d 39 d8 75 93 85 c0
(XEN) Xen stack trace from rsp=ffff82d080487848:
(XEN)    00000000000dabf2 00000000000dabf2 ffff82d080487898 ffff82d08040d57c
(XEN)    ffff82d080487898 ffff8300d9bfa000 ffff8303fb342000 000000000017e1b8
(XEN)    0000000000177000 ffff8303fb342000 ffff82d0804878d8 ffff82d08040753c
(XEN)    ffff82d0804878d8 ffff8300d9bfa000 00000000000071b8 000000000017e1b8
(XEN)    0000000000177000 ffff8303fb342000 ffff82d080487d68 ffff82d080428c04
(XEN)    0000000000000000 ffff830000097ed0 ffffffff82400000 0000000000000015
(XEN)    0000000000000ff0 0000000000000000 00000003f6241000 ffff8303f6240000
(XEN)    ffffffff8223e000 ffff8303f6241000 0000000000000000 ffff8303f6242ff8
(XEN)    00000003f6253000 00000000000065fe ffff8303f6242000 ffffffff82255000
(XEN)    ffffffff81000000 00000000003f8000 ffffffff8223e000 00000003f6254000
(XEN)    ffff8303f6241090 00000000003f4000 ffffffff8223e000 00000000000025fe
(XEN)    0000000000002400 ffff830000097ed0 0000008000bb8000 00000000000065fe
(XEN)    ffff820040000000 0000008000000000 00000000000065fe 0000000000177000
(XEN)    0000000000000000 00000000000071b9 0000000000004000 ffff82d08045a7c0
(XEN)    ffff8300d9bfa000 00000000025fdbda 0000000000000000 ffff830c1b97be64
(XEN)    ffff830c1b97c068 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000001 ffff82d0803e5471 ffffffff81f631f0 0000000000000001
(XEN)    ffff82d0803e52bf ffffffff81001000 0000000000000001 ffff82d0803e5299
(XEN)    ffffffff80000000 0000000000000001 ffff82d0803e52b2 0000000000000000
(XEN)    0000000000000002 ffff82d0803e5401 ffff830c1b97bea0 0000000000000002
(XEN) Xen call trace:
(XEN)    [<ffff82d080289034>] page_get_ram_type+0xaa/0xcf
(XEN)    [<ffff82d08040d57c>] arch_iommu_hwdom_init+0x28a/0x2ac
(XEN)    [<ffff82d08040753c>] iommu_hwdom_init+0x1d5/0x1e4
(XEN)    [<ffff82d080428c04>] dom0_construct_pv+0x280b/0x28d7
(XEN)    [<ffff82d08042b9ed>] construct_dom0+0x99/0xae4
(XEN)    [<ffff82d08041c358>] __start_xen+0x25ec/0x2723
(XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55
(XEN) 
(XEN) 
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'unreachable' failed at mm.c:470
(XEN) ****************************************
(XEN) 
(XEN) Reboot in five seconds...
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.


--------------727AC5CDCB3114805F7E8FA0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------727AC5CDCB3114805F7E8FA0--
