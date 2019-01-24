From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Thu, 24 Jan 2019 10:25:33 +0100
Message-ID: <4da92f88-34ea-30fb-9ff2-5ef72455dab7@eikelenboom.it>
References: <cafa45db-e775-b212-ad12-90236f151bb5@eikelenboom.it>
 <20190118125058.4old2fc2zvzyue6f@mac>
 <afe9a3e2-5f4d-367a-7f16-02a4f4797e70@eikelenboom.it>
 <20190118175638.u7snykyof4awzirf@mac>
 <0a54429f-59a2-d9a2-a3d8-8177187ccad9@eikelenboom.it>
 <20190122161412.7eruziomkm3etpet@mac>
 <5ae1965e-9e31-b796-5a37-dfd211b3bd98@eikelenboom.it>
 <20190123182500.fc3nsnjisnbr6qbb@mac>
 <d9272bac-54d6-f4b3-7573-412ac0f048b3@eikelenboom.it>
 <20190124075021.pqwgywacacsun7zd@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------9F658D5F4AEDAAC6F31439EB"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O4/o=QA=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gmbEq-0001N6-5i
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 09:23:56 +0000
In-Reply-To: <20190124075021.pqwgywacacsun7zd@mac>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------9F658D5F4AEDAAC6F31439EB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 24/01/2019 08:50, Roger Pau Monné wrote:
> On Wed, Jan 23, 2019 at 08:56:48PM +0100, Sander Eikelenboom wrote:
>> On 23/01/2019 19:25, Roger Pau Monné wrote:
>>> On Wed, Jan 23, 2019 at 12:39:21AM +0100, Sander Eikelenboom wrote:
>>>> On 22/01/2019 17:14, Roger Pau Monné wrote:
>>>>> On Sun, Jan 20, 2019 at 11:09:25PM +0100, Sander Eikelenboom wrote:
>>>>>> On 18/01/2019 18:56, Roger Pau Monné wrote:
>>>>>>> On Fri, Jan 18, 2019 at 03:17:57PM +0100, Sander Eikelenboom wrote:
>>>>>>>> On 18/01/2019 13:50, Roger Pau Monné wrote:
>>>>>>>>> On Fri, Jan 18, 2019 at 01:03:04PM +0100, Sander Eikelenboom wrote:
>>>>>>>>>> Hi Roger,
>>>>>>>>>>
>>>>>>>>>> I gave PVH dom0 a spin, see how far I would get.
>>>>>>>>>
>>>>>>>>> Thanks!
>>>>>>>>>
>>>>>>>>>> With current xen-unstable unfortunately not that far, i got the splat below.
>>>>>>>>>
>>>>>>>>> Yes, this was already reported:
>>>>>>>>>
>>>>>>>>> https://lists.xenproject.org/archives/html/xen-devel/2019-01/msg01030.html
>>>>>>>>>> If you need more info, would like me to test a patch (or some other git tree/branch), 
>>>>>>>>>> I will be happy to give it a spin !
>>>>>>>>>
>>>>>>>>> Paul is working on a fix, but in the meantime just removing the
>>>>>>>>> assertions should be fine:
>>>>>>>>>
>>>>>>>>> ---8<---
>>>>>>>>> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
>>>>>>>>> index bd1af35a13..98e6fc35e2 100644
>>>>>>>>> --- a/xen/drivers/passthrough/iommu.c
>>>>>>>>> +++ b/xen/drivers/passthrough/iommu.c
>>>>>>>>> @@ -321,9 +321,6 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>>>>>>>      if ( !iommu_enabled || !hd->platform_ops )
>>>>>>>>>          return 0;
>>>>>>>>>  
>>>>>>>>> -    ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
>>>>>>>>> -    ASSERT(IS_ALIGNED(mfn_x(mfn), (1ul << page_order)));
>>>>>>>>> -
>>>>>>>>>      for ( i = 0; i < (1ul << page_order); i++ )
>>>>>>>>>      {
>>>>>>>>>          rc = hd->platform_ops->map_page(d, dfn_add(dfn, i), mfn_add(mfn, i),
>>>>>>>>>
>>>>>>>>
>>>>>>>> I gave that a spin and i now get a seemingly endless stream of IO_PAGE_FAULTs
>>>>>>>
>>>>>>> You shouldn't get those page faults since they are for addresses that
>>>>>>> belong to a reserved region, and that should be mapped into the p2m.
>>>>>>> I've just tested on my AMD box and I'm also seeing errors (albeit
>>>>>>> different ones), so I guess something broke since I last fixed PVH
>>>>>>> Dom0 to boot on AMD hardware.
>>>>>>>
>>>>>>> I've also tested commit:
>>>>>>>
>>>>>>> commit fad6ba64a8c98bebb9374f390cc255fac05237ab (HEAD)
>>>>>>> Author: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>> Date:   Fri Nov 30 12:10:00 2018 +0100
>>>>>>> amd/iommu: skip host bridge devices when updating IOMMU page tables
>>>>>>>
>>>>>>> And it works on my AMD box and I'm able to boot as a PVH Dom0. Can you
>>>>>>> give this commit a spin?
>>>>>>>
>>>>>>> Thanks, Roger.
>>>>>>>
>>>>>>
>>>>>> Hi Roger,
>>>>>>
>>>>>> Tested that commit, but that didn't help.
>>>>>
>>>>> Thanks! Sorry for the delay, I got sidetracked with something else.
>>>>
>>>> No problem, it's not too urgent and probably a busy time with the remaining 4.12 stuff.
>>>>  
>>>>> Can you please post the serial log when using the above commit?
>>>>
>>>> Sure, I attached a log of:
>>>>  - fad6ba64a8c98bebb9374f390cc255fac05237ab  dom0 PVH unsuccesful boot
>>>>  - fad6ba64a8c98bebb9374f390cc255fac05237ab  dom0 PV    succesful boot
>>>
>>> Thanks. So you get the same IO page faults.
>>>
>>> I don't seem to be able to reproduce this behaviour on my AMD box, but
>>> that might be just luck. I've been finding some issues today related
>>> to the IOMMU, could you give the following patch a spin and paste the
>>> serial log that you get.
>>
>> Hi Roger,
>>
>> Sure, on top of what ?
>> - fad6ba64a8c98bebb9374f390cc255fac05237ab ?
>> - xen-unstable ?
>> - xen-unstable + Paul's patch ?
> 
> Hello,
> 
> Sorry for not proving the right context, let's try on top of
> xen-unstable + Paul's patch.
> 
> Thanks, Roger.
> 

Seems to be giving the same result (stream of IO_PAGE_FAULTs), serial
log attached.

--
Sander


--------------9F658D5F4AEDAAC6F31439EB
Content-Type: text/x-log;
 name="serial.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="serial.log"

 __  __            _  _    _ ____    ___              
 \ \/ /___ _ __   | || |  / |___ \  / _ \    _ __ ___ 
  \  // _ \ '_ \  | || |_ | | __) || | | |__| '__/ __|
  /  \  __/ | | | |__   _|| |/ __/ | |_| |__| | | (__ 
 /_/\_\___|_| |_|    |_|(_)_|_____(_)___/   |_|  \___|
                                                      
(XEN) [0000001a30a697f2] Xen version 4.12.0-rc (root@dyndns.org) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Thu Jan 24 10:03:25 CET 2019
(XEN) [0000001a3816dffb] Latest ChangeSet: Fri Dec 21 17:23:32 2018 +0000 git:e3b418ac49-dirty
(XEN) [0000001a3cd9af15] Bootloader: GRUB 2.02~beta3-5+deb9u1
(XEN) [0000001a3ff95f1e] Command line: dom0_mem=2048M,max:2048M loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64 dom0=pvh
(XEN) [0000001a4e1b904a] Xen image load base address: 0
(XEN) [0000001a50ef3340] Video information:
(XEN) [0000001a532a7533]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [0000001a567074be]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [0000001a5a4ea043] Disc information:
(XEN) [0000001a5c7d4c2a]  Found 4 MBR signatures
(XEN) [0000001a5ef7f8cb]  Found 4 EDD information structures
(XEN) [0000001a620b10b3] Xen-e820 RAM map:
(XEN) [0000001a6439bf7a]  0000000000000000 - 0000000000096400 (usable)
(XEN) [0000001a67cbc60e]  0000000000096400 - 00000000000a0000 (reserved)
(XEN) [0000001a6b772f6e]  00000000000e4000 - 0000000000100000 (reserved)
(XEN) [0000001a6f22b97a]  0000000000100000 - 00000000c7f90000 (usable)
(XEN) [0000001a72b4c33d]  00000000c7f90000 - 00000000c7f9e000 (ACPI data)
(XEN) [0000001a766cde9d]  00000000c7f9e000 - 00000000c7fe0000 (ACPI NVS)
(XEN) [0000001a7a18644d]  00000000c7fe0000 - 00000000c8000000 (reserved)
(XEN) [0000001a7dc3ca7e]  00000000ffe00000 - 0000000100000000 (reserved)
(XEN) [0000001a816f36bd]  0000000100000000 - 0000000538000000 (usable)
(XEN) [0000001a8a78f058] New Xen image base address: 0xc7800000
(XEN) [0000001a8db2388d] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [0000001a90dea37d] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001a95a17595] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001a9a642248] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [0000001a9f26e875] ACPI: FACS C7F9E000, 0040
(XEN) [0000001aa1bb070e] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001aa67dc9b8] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000001aab408aab] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001ab0034685] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001ab4c606e8] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [0000001ab988c898] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000001abe4b8a4b] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [0000001ac30e4b53] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000001ac7d121e0] System RAM: 20479MB (20970648kB)
(XEN) [0000001ad205da4d] SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) [0000001ad4f2d145] SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) [0000001ad7dfe15e] SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) [0000001adaccd1f2] SRAT: PXM 0 -> APIC 03 -> Node 0
(XEN) [0000001addb9e7d5] SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) [0000001ae0a6f1be] SRAT: PXM 0 -> APIC 05 -> Node 0
(XEN) [0000001ae393f50b] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000001ae634c215] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000001ae93b280e] SRAT: Node 0 PXM 0 100000000-538000000
(XEN) [0000001aec745175] NUMA: Allocated memnodemap from 5334dc000 - 5334e2000
(XEN) [0000001af06c11c5] NUMA: Using 8 for the hash shift.
(XEN) [0000001b36bd694e] Domain heap initialised
(XEN) [0000001b393816f5] Allocated console ring of 128 KiB.
(XEN) [0000001b4f5c8e4e] vesafb: framebuffer at 0xd0000000, mapped to 0xffff82c000201000, using 6144k, total 16384k
(XEN) [0000001b5529e436] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [0000001b5947a39d] vesafb: Truecolor: size=0:8:8:8, shift=0:16:8:0
(XEN) [0000001b5cf3cde5] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [0000001b67097280] found SMP MP-table at 000ff780
(XEN) [0000001b69dcf6b3] DMI present.
(XEN) [0000001b6bcc0a35] Using APIC driver default
(XEN) [0000001b6e603d02] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [0000001b71a62526] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [0000001b75dd3322] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [0000001b79c8344a] ACPI: Local APIC address 0xfee00000
(XEN) [0000001b7cdb3fcd] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) [0000001b80acdefa] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) [0000001b847e5de6] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
(XEN) [0000001b884fd94d] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) [0000001b8c216e32] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
(XEN) [0000001b8ff2ea0b] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
(XEN) [0000001b93c496bd] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [0000001b97d57f60] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [0000001b9c3f7153] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [0000001ba05d2c23] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000001ba4d3bb72] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000001ba8f15c35] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [0000001bad2895a3] ACPI: IRQ0 used by override.
(XEN) [0000001bafe2bf4a] ACPI: IRQ2 used by override.
(XEN) [0000001bb29d067d] ACPI: IRQ9 used by override.
(XEN) [0000001bb5573c1e] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [0000001bb8e94262] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [0000001bbc227d3a] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [0000001bc0cbed2b] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000001bc46ab05e] ERST table was not found
(XEN) [0000001bc6f21b7e] Using ACPI (MADT) for SMP configuration information
(XEN) [0000001bcad050e0] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [0000001bcdfccbcb] IRQ limits: 56 GSI, 1112 MSI/MSI-X
(XEN) [0000001bd1032fda] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc
(XEN) [0000001bd553c8db] traps.c:1574: GPF (0000): ffff82d080425cc6 [probe_cpuid_faulting+0xe/0xa2] -> ffff82d0803808b2
(XEN) [0000001bdb53d023] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [0000001bdf0c029a] Speculative mitigation facilities:
(XEN) [0000001be2125cf6]   Hardware features:
(XEN) [0000001be4670bda]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [0000001be8455bb8]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN) [0000001bec5651f2]   Support for HVM VMs: RSB
(XEN) [0000001beef74233]   Support for PV VMs: RSB
(XEN) [0000001bf18b5262]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [0000001bf64163da]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [0000001bfa0647ca] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000001bfdf13582] Initializing Credit2 scheduler
(XEN) [0000001c00c4c42a]  load_precision_shift: 18
(XEN) [0000001c0358f49e]  load_window_shift: 30
(XEN) [0000001c05c70930]  underload_balance_tolerance: 0
(XEN) [0000001c08a75680]  overload_balance_tolerance: -3
(XEN) [0000001c0b87bb90]  runqueues arrangement: socket
(XEN) [0000001c0e5b58ee]  cap enforcement granularity: 10ms
(XEN) [0000001c1161bf23] load tracking window length 1073741824 ns
(XEN) [0000001c14c117b8] Adding cpu 0 to runqueue 0
(XEN) [0000001c1761e618]  First cpu on runqueue, activating
(XEN) [0000001c23e11ca8] Platform timer is 14.318MHz HPET
(XEN) [    2.974919] Detected 3200.150 MHz processor.
(XEN) [    2.991142] Initing memory sharing.
(XEN) [    3.003102] alt table ffff82d080467c70 -> ffff82d080469a92
(XEN) [    3.021782] AMD-Vi: Found MSI capability block at 0x54
(XEN) [    3.038679] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.060780] AMD-Vi: Using IVHD type 0x10
(XEN) [    3.074038] AMD-Vi: ACPI Table:
(XEN) [    3.084957] AMD-Vi:  Signature IVRS
(XEN) [    3.096919] AMD-Vi:  Length 0x108
(XEN) [    3.108358] AMD-Vi:  Revision 0x1
(XEN) [    3.128650] AMD-Vi:  CheckSum 0x65
(XEN) [    3.149123] AMD-Vi:  OEM_Id AMD  
(XEN) [    3.169324] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.191357] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.213885] AMD-Vi:  Creator_Id AMD 
(XEN) [    3.234764] AMD-Vi:  Creator_Revision 0
(XEN) [    3.256342] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.285514] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.312590] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.335196] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.363016] AMD-Vi: IVHD Device Entry: type 0x3 id 0xe00 flags 0
(XEN) [    3.391094] AMD-Vi:  Dev_Id Range: 0xe00 -> 0xe01
(XEN) [    3.415234] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.443012] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.471041] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.498769] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.526730] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.554393] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.582302] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.609911] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.637808] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.665484] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    3.693473] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    3.717547] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    3.745276] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    3.773211] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    3.801133] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    3.829082] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    3.857031] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    3.884994] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    3.912721] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    3.940668] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    3.964601] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    3.992121] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.019653] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.043039] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.070584] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.093919] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.122232] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.149817] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.177362] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.204883] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.232907] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.259662] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.287232] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.314856] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.342519] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.370481] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.398223] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.421802] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.448256] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.476310] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.505181] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.532519] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.562119] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.590015] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.618042] I/O virtualisation enabled
(XEN) [    4.639426]  - Dom0 mode: Relaxed
(XEN) [    4.659432] Interrupt remapping enabled
(XEN) [    4.680960] nr_sockets: 1
(XEN) [    4.699052] ENABLING IO-APIC IRQs
(XEN) [    4.718993]  -> Using new ACK method
(XEN) [    4.739911] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2019-01-24 09:17:26.336] HVM: ASIDs enabled.
(XEN) [2019-01-24 09:17:26.345] SVM: Supported advanced features:
(XEN) [2019-01-24 09:17:26.354]  - Nested Page Tables (NPT)
(XEN) [2019-01-24 09:17:26.364]  - Last Branch Record (LBR) Virtualisation
(XEN) [2019-01-24 09:17:26.373]  - Next-RIP Saved on #VMEXIT
(XEN) [2019-01-24 09:17:26.383]  - Pause-Intercept Filter
(XEN) [2019-01-24 09:17:26.393] HVM: SVM enabled
(XEN) [2019-01-24 09:17:26.402] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-01-24 09:17:26.412] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2019-01-24 09:17:21.031] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 09:17:26.442] Adding cpu 1 to runqueue 0
(XEN) [2019-01-24 09:17:21.031] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 09:17:26.471] Adding cpu 2 to runqueue 0
(XEN) [2019-01-24 09:17:21.031] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 09:17:26.501] Adding cpu 3 to runqueue 0
(XEN) [2019-01-24 09:17:21.031] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 09:17:26.531] Adding cpu 4 to runqueue 0
(XEN) [2019-01-24 09:17:21.031] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 09:17:26.561] Adding cpu 5 to runqueue 0
(XEN) [2019-01-24 09:17:26.571] Brought up 6 CPUs
(XEN) [2019-01-24 09:17:26.585] build-id: c26e87a07e3ed0c5f661806303e0404634d0c274
(XEN) [2019-01-24 09:17:26.595] Running stub recovery selftests...
(XEN) [2019-01-24 09:17:26.604] traps.c:1574: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-01-24 09:17:26.615] traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080380412
(XEN) [2019-01-24 09:17:26.625] traps.c:1094: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-01-24 09:17:26.655] ACPI sleep modes: S3
(XEN) [2019-01-24 09:17:26.665] VPMU: disabled
(XEN) [2019-01-24 09:17:26.675] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2019-01-24 09:17:26.685] mcheck_poll: Machine check polling timer started.
(XEN) [2019-01-24 09:17:26.696] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2019-01-24 09:17:26.706] Dom0 has maximum 632 PIRQs
(XEN) [2019-01-24 09:17:26.718] Multiple initrd candidates, picking module #1
(XEN) [2019-01-24 09:17:26.728] NX (Execute Disable) protection active
(XEN) [2019-01-24 09:17:26.738] *** Building a PVH Dom0 ***
(XEN) [2019-01-24 09:17:26.895] AMD-Vi: update_paging_mode Try to access pdev_list without aquiring pcidevs_lock.
(XEN) [2019-01-24 09:17:27.226] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.237] AMD-Vi: Setup I/O page table: device id = 0x2, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.248] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.259] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.270] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.282] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.294] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.305] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.317] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.329] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.342] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.354] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:27.367] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.380] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.393] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.406] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.419] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.432] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.445] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.459] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.472] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.486] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.499] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.513] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.528] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.542] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.556] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.571] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.586] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.601] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.616] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.631] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.646] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.662] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.677] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.693] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.709] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.725] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.741] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.757] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.773] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.789] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.806] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-24 09:17:27.822] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.839] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.855] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.872] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.889] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.906] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.923] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.940] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.957] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:27.974] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:27.992] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.009] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.027] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.044] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.062] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.079] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.097] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.115] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.133] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.151] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.170] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.188] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.206] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.224] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.242] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.259] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.277] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.295] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.313] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.330] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.348] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.365] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-24 09:17:28.383] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.400] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.418] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.435] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.453] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.470] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.487] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.505] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.522] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.540] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.557] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.574] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.592] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.609] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.627] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.644] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.662] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.679] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.696] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.714] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.731] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.749] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.766] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.783] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.801] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.818] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.836] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.853] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.870] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.888] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.905] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.923] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-24 09:17:28.940] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.958] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:28.975] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:28.992] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.010] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.027] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.045] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.062] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.079] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.097] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.114] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.132] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.149] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.167] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.184] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.201] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.219] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.236] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.254] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.271] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.288] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.306] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.323] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.341] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.358] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.375] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.393] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.410] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.428] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.445] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.463] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.480] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-24 09:17:29.497] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.515] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.532] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.550] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.567] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.584] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.602] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.619] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.637] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.654] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.672] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.689] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.706] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.724] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.741] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.759] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.776] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.793] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.811] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.828] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.846] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.863] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.880] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.898] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.915] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.933] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.950] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:29.968] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:29.985] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.002] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.020] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.037] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-24 09:17:30.055] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.072] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.089] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.107] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.124] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.142] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.159] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.176] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.194] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.211] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.229] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.246] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.264] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.281] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.298] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.316] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.333] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.351] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.368] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.385] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.403] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.420] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.438] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.455] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.472] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.490] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.507] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.525] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.542] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.560] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:30.577] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.595] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:30.612] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:30.630] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:30.647] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:30.665] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:30.682] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:30.700] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.717] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.735] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:30.752] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:30.770] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:30.787] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:30.805] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:30.823] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:30.840] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.858] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:30.875] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:30.893] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-24 09:17:30.910] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-24 09:17:30.928] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-24 09:17:30.946] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-24 09:17:30.963] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-24 09:17:30.981] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:30.998] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.016] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:31.034] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.051] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.069] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.086] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.104] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.122] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:31.139] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.157] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:31.174] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.192] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.210] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.227] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.245] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.263] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:31.280] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.298] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:31.316] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.333] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.351] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.369] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.386] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.404] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:31.422] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.439] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.457] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-24 09:17:31.475] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-24 09:17:31.492] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-24 09:17:31.510] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-24 09:17:31.528] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-24 09:17:31.545] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:31.563] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.581] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:31.598] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.616] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.634] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.651] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.669] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.687] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:31.704] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.722] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:31.740] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.757] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.775] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.792] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.810] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-24 09:17:31.828] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-24 09:17:31.845] AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 09:17:31.863] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-24 09:17:31.881] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-24 09:17:31.899] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-24 09:17:31.916] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-24 09:17:31.934] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
--------------9F658D5F4AEDAAC6F31439EB
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------9F658D5F4AEDAAC6F31439EB--
