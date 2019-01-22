From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Wed, 23 Jan 2019 00:39:21 +0100
Message-ID: <5ae1965e-9e31-b796-5a37-dfd211b3bd98@eikelenboom.it>
References: <cafa45db-e775-b212-ad12-90236f151bb5@eikelenboom.it>
 <20190118125058.4old2fc2zvzyue6f@mac>
 <afe9a3e2-5f4d-367a-7f16-02a4f4797e70@eikelenboom.it>
 <20190118175638.u7snykyof4awzirf@mac>
 <0a54429f-59a2-d9a2-a3d8-8177187ccad9@eikelenboom.it>
 <20190122161412.7eruziomkm3etpet@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------A70EEBBFE7A14EE55910A6D5"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4T/=P6=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gm5cP-0007j8-VQ
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 23:38:11 +0000
In-Reply-To: <20190122161412.7eruziomkm3etpet@mac>
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
--------------A70EEBBFE7A14EE55910A6D5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 22/01/2019 17:14, Roger Pau Monné wrote:
> On Sun, Jan 20, 2019 at 11:09:25PM +0100, Sander Eikelenboom wrote:
>> On 18/01/2019 18:56, Roger Pau Monné wrote:
>>> On Fri, Jan 18, 2019 at 03:17:57PM +0100, Sander Eikelenboom wrote:
>>>> On 18/01/2019 13:50, Roger Pau Monné wrote:
>>>>> On Fri, Jan 18, 2019 at 01:03:04PM +0100, Sander Eikelenboom wrote:
>>>>>> Hi Roger,
>>>>>>
>>>>>> I gave PVH dom0 a spin, see how far I would get.
>>>>>
>>>>> Thanks!
>>>>>
>>>>>> With current xen-unstable unfortunately not that far, i got the splat below.
>>>>>
>>>>> Yes, this was already reported:
>>>>>
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2019-01/msg01030.html
>>>>>> If you need more info, would like me to test a patch (or some other git tree/branch), 
>>>>>> I will be happy to give it a spin !
>>>>>
>>>>> Paul is working on a fix, but in the meantime just removing the
>>>>> assertions should be fine:
>>>>>
>>>>> ---8<---
>>>>> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
>>>>> index bd1af35a13..98e6fc35e2 100644
>>>>> --- a/xen/drivers/passthrough/iommu.c
>>>>> +++ b/xen/drivers/passthrough/iommu.c
>>>>> @@ -321,9 +321,6 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>>>      if ( !iommu_enabled || !hd->platform_ops )
>>>>>          return 0;
>>>>>  
>>>>> -    ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
>>>>> -    ASSERT(IS_ALIGNED(mfn_x(mfn), (1ul << page_order)));
>>>>> -
>>>>>      for ( i = 0; i < (1ul << page_order); i++ )
>>>>>      {
>>>>>          rc = hd->platform_ops->map_page(d, dfn_add(dfn, i), mfn_add(mfn, i),
>>>>>
>>>>
>>>> I gave that a spin and i now get a seemingly endless stream of IO_PAGE_FAULTs
>>>
>>> You shouldn't get those page faults since they are for addresses that
>>> belong to a reserved region, and that should be mapped into the p2m.
>>> I've just tested on my AMD box and I'm also seeing errors (albeit
>>> different ones), so I guess something broke since I last fixed PVH
>>> Dom0 to boot on AMD hardware.
>>>
>>> I've also tested commit:
>>>
>>> commit fad6ba64a8c98bebb9374f390cc255fac05237ab (HEAD)
>>> Author: Roger Pau Monné <roger.pau@citrix.com>
>>> Date:   Fri Nov 30 12:10:00 2018 +0100
>>> amd/iommu: skip host bridge devices when updating IOMMU page tables
>>>
>>> And it works on my AMD box and I'm able to boot as a PVH Dom0. Can you
>>> give this commit a spin?
>>>
>>> Thanks, Roger.
>>>
>>
>> Hi Roger,
>>
>> Tested that commit, but that didn't help.
> 
> Thanks! Sorry for the delay, I got sidetracked with something else.

No problem, it's not too urgent and probably a busy time with the remaining 4.12 stuff.
 
> Can you please post the serial log when using the above commit?

Sure, I attached a log of:
 - fad6ba64a8c98bebb9374f390cc255fac05237ab  dom0 PVH unsuccesful boot
 - fad6ba64a8c98bebb9374f390cc255fac05237ab  dom0 PV    succesful boot


>> I added some debug logging (to xen-unstable + Paul's patch) and found out the devices that are giving
>> the IO_PAGE_FAULTs are the onboard USB controllers (0x90 0x92 0x98 0xa5).
>>
>> If I skip calling "amd_iommu_setup_domain_device" for these devices I can at least get it to boot a linux kernel 
>> (which than gives problems with the SATA controller, but that would be a next step). The patch I used is below.
>>
>> I attached the output from lspci -vvvknn, perhaps you can spot something odd ?
>> When booting dom0 as PV instead of PVH everything boots and works fine.
> 
> There's definitely something wrong in Xen, so workarounds won't get
> you very far. This needs to be properly fixed in the hypervisor.

I thought it perhaps could help by seeing if there was any pattern in the devices for
which i get the IO_PAGE_FAULTs (since the commit you referred to is specifically about
host bridges).

--
Sander

> Thanks, Roger.
> 

--------------A70EEBBFE7A14EE55910A6D5
Content-Type: text/x-log;
 name="boot-dom0-pv.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="boot-dom0-pv.log"

 __  __            _  _    _ ____                     _        _     _      
 \ \/ /___ _ __   | || |  / |___ \    _   _ _ __  ___| |_ __ _| |__ | | ___ 
  \  // _ \ '_ \  | || |_ | | __) |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
  /  \  __/ | | | |__   _|| |/ __/|__| |_| | | | \__ \ || (_| | |_) | |  __/
 /_/\_\___|_| |_|    |_|(_)_|_____|   \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
                                                                            
(XEN) [000000208be6fc2d] Xen version 4.12-unstable (root@dyndns.org) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Wed Jan 23 00:05:49 CET 2019
(XEN) [00000020938a0d12] Latest ChangeSet: Fri Nov 30 12:10:00 2018 +0100 git:fad6ba64a8
(XEN) [0000002098009f1b] Bootloader: GRUB 2.02~beta3-5+deb9u1
(XEN) [000000209b20721d] Command line: dom0_mem=2048M,max:2048M loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64
(XEN) [00000020a8d05a75] Xen image load base address: 0
(XEN) [00000020aba40518] Video information:
(XEN) [00000020addf48b2]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [00000020b1252c7b]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [00000020b50379b5] Disc information:
(XEN) [00000020b73206aa]  Found 4 MBR signatures
(XEN) [00000020b9acd772]  Found 4 EDD information structures
(XEN) [00000020bcbff633] Xen-e820 RAM map:
(XEN) [00000020beee82eb]  0000000000000000 - 0000000000096400 (usable)
(XEN) [00000020c28082ea]  0000000000096400 - 00000000000a0000 (reserved)
(XEN) [00000020c62bfdf5]  00000000000e4000 - 0000000000100000 (reserved)
(XEN) [00000020c9d77e9d]  0000000000100000 - 00000000c7f90000 (usable)
(XEN) [00000020cd69831b]  00000000c7f90000 - 00000000c7f9e000 (ACPI data)
(XEN) [00000020d121a74a]  00000000c7f9e000 - 00000000c7fe0000 (ACPI NVS)
(XEN) [00000020d4cd120a]  00000000c7fe0000 - 00000000c8000000 (reserved)
(XEN) [00000020d878a1a5]  00000000ffe00000 - 0000000100000000 (reserved)
(XEN) [00000020dc24086e]  0000000100000000 - 0000000538000000 (usable)
(XEN) [00000020e52c8ff6] New Xen image base address: 0xc7800000
(XEN) [00000020e865a6d0] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [00000020eb92280d] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [00000020f054e982] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [00000020f517a1ce] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [00000020f9da6412] ACPI: FACS C7F9E000, 0040
(XEN) [00000020fc6e9d76] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000002101315866] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000002105f414db] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [000000210ab6d5cd] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [000000210f79938b] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [00000021143c5243] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000002118ff0ab6] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [000000211dc1cac5] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000002122848b25] System RAM: 20479MB (20970648kB)
(XEN) [000000212cb7754a] SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) [000000212fa4659d] SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) [00000021329179a3] SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) [00000021357e760d] SRAT: PXM 0 -> APIC 03 -> Node 0
(XEN) [00000021386b8205] SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) [000000213b58801a] SRAT: PXM 0 -> APIC 05 -> Node 0
(XEN) [000000213e45959a] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000002140e6587e] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000002143ecc3ba] SRAT: Node 0 PXM 0 100000000-538000000
(XEN) [0000002147260d4a] NUMA: Allocated memnodemap from 5334dc000 - 5334e2000
(XEN) [000000214b1d9b96] NUMA: Using 8 for the hash shift.
(XEN) [0000002192c51890] Domain heap initialised
(XEN) [00000021953fdfe0] Allocated console ring of 128 KiB.
(XEN) [00000021ab644cc5] vesafb: framebuffer at 0xd0000000, mapped to 0xffff82c000201000, using 6144k, total 16384k
(XEN) [00000021b131a235] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [00000021b54f6d95] vesafb: Truecolor: size=0:8:8:8, shift=0:16:8:0
(XEN) [00000021b8fb9380] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [00000021c313209e] found SMP MP-table at 000ff780
(XEN) [00000021c5e69aad] DMI present.
(XEN) [00000021c7d5af3a] Using APIC driver default
(XEN) [00000021ca69e48d] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [00000021cdafcc3a] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [00000021d1e6d665] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [00000021d5d1d0ba] ACPI: Local APIC address 0xfee00000
(XEN) [00000021d8e4fcd2] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) [00000021dcb6797a] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) [00000021e088138d] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
(XEN) [00000021e4599df6] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) [00000021e82b20ed] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
(XEN) [00000021ebfcaca5] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
(XEN) [00000021efce2c02] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [00000021f3df3bd2] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [00000021f8491ad6] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [00000021fc66d08e] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000002200dd5f75] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000002204fb134d] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [00000022093232d3] ACPI: IRQ0 used by override.
(XEN) [000000220bec7c90] ACPI: IRQ2 used by override.
(XEN) [000000220ea6b1e6] ACPI: IRQ9 used by override.
(XEN) [000000221160edce] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [0000002214f2f886] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [00000022182c319d] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [000000221cd58e5d] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000002220744d8d] ERST table was not found
(XEN) [0000002222fbbb88] Using ACPI (MADT) for SMP configuration information
(XEN) [0000002226d9f2c2] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [000000222a068c1d] IRQ limits: 56 GSI, 1112 MSI/MSI-X
(XEN) [000000222d0ce366] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc
(XEN) [00000022315d5dc6] traps.c:1574: GPF (0000): ffff82d08042cb7c [probe_cpuid_faulting+0xe/0xa2] -> ffff82d0803858b2
(XEN) [00000022375d93d2] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [000000223b15bab3] Speculative mitigation facilities:
(XEN) [000000223e1c148a]   Hardware features:
(XEN) [000000224070d0ba]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [00000022444ef950]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN) [000000224860071e]   Support for HVM VMs: RSB
(XEN) [000000224b00d0aa]   Support for PV VMs: RSB
(XEN) [000000224d950b2a]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [00000022524b05c8]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [00000022560fe0c2] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000002259fada80] Initializing Credit2 scheduler
(XEN) [000000225cce72c3]  load_precision_shift: 18
(XEN) [000000225f629aaa]  load_window_shift: 30
(XEN) [0000002261d0bf90]  underload_balance_tolerance: 0
(XEN) [0000002264b11850]  overload_balance_tolerance: -3
(XEN) [00000022679156ee]  runqueues arrangement: socket
(XEN) [000000226a64fbde]  cap enforcement granularity: 10ms
(XEN) [000000226d6b737a] load tracking window length 1073741824 ns
(XEN) [0000002270cab436] Adding cpu 0 to runqueue 0
(XEN) [00000022736b8e60]  First cpu on runqueue, activating
(XEN) [000000227fead868] Platform timer is 14.318MHz HPET
(XEN) [    3.002605] Detected 3200.144 MHz processor.
(XEN) [    3.019037] Initing memory sharing.
(XEN) [    3.030995] alt table ffff82d08046ebf8 -> ffff82d080470a36
(XEN) [    3.049675] AMD-Vi: Found MSI capability block at 0x54
(XEN) [    3.066576] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.088673] AMD-Vi: Using IVHD type 0x10
(XEN) [    3.101934] AMD-Vi: ACPI Table:
(XEN) [    3.112853] AMD-Vi:  Signature IVRS
(XEN) [    3.124812] AMD-Vi:  Length 0x108
(XEN) [    3.136252] AMD-Vi:  Revision 0x1
(XEN) [    3.156545] AMD-Vi:  CheckSum 0x65
(XEN) [    3.177017] AMD-Vi:  OEM_Id AMD  
(XEN) [    3.197258] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.219291] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.241807] AMD-Vi:  Creator_Id AMD 
(XEN) [    3.262685] AMD-Vi:  Creator_Revision 0
(XEN) [    3.284276] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.313447] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.340524] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.363130] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.390949] AMD-Vi: IVHD Device Entry: type 0x3 id 0xe00 flags 0
(XEN) [    3.419015] AMD-Vi:  Dev_Id Range: 0xe00 -> 0xe01
(XEN) [    3.443181] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.470961] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.498987] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.526715] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.554678] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.582338] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.610263] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.637873] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.665771] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.693447] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    3.721419] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    3.745494] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    3.773248] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    3.801223] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    3.829172] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    3.857161] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    3.885110] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    3.913070] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    3.940800] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    3.968759] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    3.992693] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    4.020224] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.047759] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.071183] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.098727] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.122063] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.150388] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.177972] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.205518] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.233038] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.261065] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.287832] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.315402] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.343026] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.370689] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.398651] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.426392] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.449972] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.476428] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.504480] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.533364] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.560702] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.590301] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.618198] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.646172] I/O virtualisation enabled
(XEN) [    4.667557]  - Dom0 mode: Relaxed
(XEN) [    4.687550] Interrupt remapping enabled
(XEN) [    4.709078] nr_sockets: 1
(XEN) [    4.727173] ENABLING IO-APIC IRQs
(XEN) [    4.747113]  -> Using new ACK method
(XEN) [    4.768043] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2019-01-22 23:21:50.707] HVM: ASIDs enabled.
(XEN) [2019-01-22 23:21:50.716] SVM: Supported advanced features:
(XEN) [2019-01-22 23:21:50.725]  - Nested Page Tables (NPT)
(XEN) [2019-01-22 23:21:50.735]  - Last Branch Record (LBR) Virtualisation
(XEN) [2019-01-22 23:21:50.744]  - Next-RIP Saved on #VMEXIT
(XEN) [2019-01-22 23:21:50.754]  - Pause-Intercept Filter
(XEN) [2019-01-22 23:21:50.764] HVM: SVM enabled
(XEN) [2019-01-22 23:21:50.773] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-01-22 23:21:50.783] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2019-01-22 23:21:45.003] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:21:50.813] Adding cpu 1 to runqueue 0
(XEN) [2019-01-22 23:21:45.003] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:21:50.842] Adding cpu 2 to runqueue 0
(XEN) [2019-01-22 23:21:45.003] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:21:50.872] Adding cpu 3 to runqueue 0
(XEN) [2019-01-22 23:21:45.003] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:21:50.902] Adding cpu 4 to runqueue 0
(XEN) [2019-01-22 23:21:45.003] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:21:50.933] Adding cpu 5 to runqueue 0
(XEN) [2019-01-22 23:21:50.942] Brought up 6 CPUs
(XEN) [2019-01-22 23:21:50.956] build-id: a2d07921dfeed9e8af66a837936b5d24c5df646c
(XEN) [2019-01-22 23:21:50.966] Running stub recovery selftests...
(XEN) [2019-01-22 23:21:50.976] traps.c:1574: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080385412
(XEN) [2019-01-22 23:21:50.986] traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080385412
(XEN) [2019-01-22 23:21:50.996] traps.c:1094: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080385412
(XEN) [2019-01-22 23:21:51.026] ACPI sleep modes: S3
(XEN) [2019-01-22 23:21:51.037] VPMU: disabled
(XEN) [2019-01-22 23:21:51.047] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2019-01-22 23:21:51.057] mcheck_poll: Machine check polling timer started.
(XEN) [2019-01-22 23:21:51.067] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2019-01-22 23:21:51.077] Dom0 has maximum 632 PIRQs
(XEN) [2019-01-22 23:21:51.088] Multiple initrd candidates, picking module #1
(XEN) [2019-01-22 23:21:51.098] NX (Execute Disable) protection active
(XEN) [2019-01-22 23:21:51.108] *** Building a PV Dom0 ***
(XEN) [2019-01-22 23:21:51.375] ELF: phdr: paddr=0x1000000 memsz=0x1907000
(XEN) [2019-01-22 23:21:51.386] ELF: phdr: paddr=0x2a00000 memsz=0x640000
(XEN) [2019-01-22 23:21:51.396] ELF: phdr: paddr=0x3040000 memsz=0x21f18
(XEN) [2019-01-22 23:21:51.406] ELF: phdr: paddr=0x3062000 memsz=0x3c4000
(XEN) [2019-01-22 23:21:51.416] ELF: memory: 0x1000000 -> 0x3426000
(XEN) [2019-01-22 23:21:51.427] ELF: note: GUEST_OS = "linux"
(XEN) [2019-01-22 23:21:51.437] ELF: note: GUEST_VERSION = "2.6"
(XEN) [2019-01-22 23:21:51.447] ELF: note: XEN_VERSION = "xen-3.0"
(XEN) [2019-01-22 23:21:51.457] ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) [2019-01-22 23:21:51.467] ELF: note: INIT_P2M = 0x8000000000
(XEN) [2019-01-22 23:21:51.478] ELF: note: ENTRY = 0xffffffff83062180
(XEN) [2019-01-22 23:21:51.488] ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) [2019-01-22 23:21:51.498] ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb"
(XEN) [2019-01-22 23:21:51.508] ELF: note: SUPPORTED_FEATURES = 0x8801
(XEN) [2019-01-22 23:21:51.519] ELF: note: PAE_MODE = "yes"
(XEN) [2019-01-22 23:21:51.529] ELF: note: LOADER = "generic"
(XEN) [2019-01-22 23:21:51.539] ELF: note: unknown (0xd)
(XEN) [2019-01-22 23:21:51.549] ELF: note: SUSPEND_CANCEL = 0x1
(XEN) [2019-01-22 23:21:51.559] ELF: note: MOD_START_PFN = 0x1
(XEN) [2019-01-22 23:21:51.569] ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) [2019-01-22 23:21:51.580] ELF: note: PADDR_OFFSET = 0
(XEN) [2019-01-22 23:21:51.590] ELF: note: PHYS32_ENTRY = 0x1000350
(XEN) [2019-01-22 23:21:51.600] ELF: Found PVH image
(XEN) [2019-01-22 23:21:51.610] ELF: addresses:
(XEN) [2019-01-22 23:21:51.620]     virt_base        = 0xffffffff80000000
(XEN) [2019-01-22 23:21:51.630]     elf_paddr_offset = 0x0
(XEN) [2019-01-22 23:21:51.641]     virt_offset      = 0xffffffff80000000
(XEN) [2019-01-22 23:21:51.651]     virt_kstart      = 0xffffffff81000000
(XEN) [2019-01-22 23:21:51.661]     virt_kend        = 0xffffffff83426000
(XEN) [2019-01-22 23:21:51.672]     virt_entry       = 0xffffffff83062180
(XEN) [2019-01-22 23:21:51.682]     p2m_base         = 0x8000000000
(XEN) [2019-01-22 23:21:51.693]  Xen  kernel: 64-bit, lsb, compat32
(XEN) [2019-01-22 23:21:51.703]  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x3426000
(XEN) [2019-01-22 23:21:51.715] PHYSICAL MEMORY ARRANGEMENT:
(XEN) [2019-01-22 23:21:51.725]  Dom0 alloc.:   0000000520000000->0000000524000000 (501413 pages to be allocated)
(XEN) [2019-01-22 23:21:51.736]  Init. ramdisk: 00000005366a1000->0000000537ffb703
(XEN) [2019-01-22 23:21:51.747] VIRTUAL MEMORY ARRANGEMENT:
(XEN) [2019-01-22 23:21:51.758]  Loaded kernel: ffffffff81000000->ffffffff83426000
(XEN) [2019-01-22 23:21:51.769]  Init. ramdisk: 0000000000000000->0000000000000000
(XEN) [2019-01-22 23:21:51.780]  Phys-Mach map: 0000008000000000->0000008000400000
(XEN) [2019-01-22 23:21:51.790]  Start info:    ffffffff83426000->ffffffff834264b4
(XEN) [2019-01-22 23:21:51.801]  Xenstore ring: 0000000000000000->0000000000000000
(XEN) [2019-01-22 23:21:51.812]  Console ring:  0000000000000000->0000000000000000
(XEN) [2019-01-22 23:21:51.823]  Page tables:   ffffffff83427000->ffffffff83446000
(XEN) [2019-01-22 23:21:51.834]  Boot stack:    ffffffff83446000->ffffffff83447000
(XEN) [2019-01-22 23:21:51.844]  TOTAL:         ffffffff80000000->ffffffff83800000
(XEN) [2019-01-22 23:21:51.855]  ENTRY ADDRESS: ffffffff83062180
(XEN) [2019-01-22 23:21:51.867] Dom0 has maximum 6 VCPUs
(XEN) [2019-01-22 23:21:51.877] ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82907000
(XEN) [2019-01-22 23:21:51.909] ELF: phdr 1 at 0xffffffff82a00000 -> 0xffffffff83040000
(XEN) [2019-01-22 23:21:51.925] ELF: phdr 2 at 0xffffffff83040000 -> 0xffffffff83061f18
(XEN) [2019-01-22 23:21:51.936] ELF: phdr 3 at 0xffffffff83062000 -> 0xffffffff831a1000
(XEN) [2019-01-22 23:21:53.462] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.473] AMD-Vi: Setup I/O page table: device id = 0x2, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.484] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.496] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.507] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.519] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.531] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.543] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.555] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.567] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.579] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.592] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.605] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.618] AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.631] AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.644] AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.658] AMD-Vi: Setup I/O page table: device id = 0xa2, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.671] AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.685] AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.699] AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.713] AMD-Vi: Setup I/O page table: device id = 0xa8, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.728] AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.742] AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.757] AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) [2019-01-22 23:21:53.772] AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) [2019-01-22 23:21:53.786] AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) [2019-01-22 23:21:53.801] AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) [2019-01-22 23:21:53.815] AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) [2019-01-22 23:21:53.830] AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.845] AMD-Vi: Setup I/O page table: device id = 0x401, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.860] AMD-Vi: Setup I/O page table: device id = 0x402, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.876] AMD-Vi: Setup I/O page table: device id = 0x403, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.891] AMD-Vi: Setup I/O page table: device id = 0x404, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.907] AMD-Vi: Setup I/O page table: device id = 0x405, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.923] AMD-Vi: Setup I/O page table: device id = 0x406, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.939] AMD-Vi: Setup I/O page table: device id = 0x407, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.955] AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.972] AMD-Vi: Setup I/O page table: device id = 0x608, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:53.989] AMD-Vi: Setup I/O page table: device id = 0x610, type = 0x2, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.006] AMD-Vi: Setup I/O page table: device id = 0x700, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.023] AMD-Vi: Setup I/O page table: device id = 0x800, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.040] AMD-Vi: Setup I/O page table: device id = 0x900, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.057] AMD-Vi: Setup I/O page table: device id = 0x901, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.075] AMD-Vi: Setup I/O page table: device id = 0x902, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.093] AMD-Vi: Setup I/O page table: device id = 0x903, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.111] AMD-Vi: Setup I/O page table: device id = 0x904, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.129] AMD-Vi: Setup I/O page table: device id = 0x905, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.147] AMD-Vi: Setup I/O page table: device id = 0x906, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.165] AMD-Vi: Setup I/O page table: device id = 0x907, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.184] AMD-Vi: Setup I/O page table: device id = 0xa00, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.202] AMD-Vi: Setup I/O page table: device id = 0xb00, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.221] AMD-Vi: Setup I/O page table: device id = 0xc00, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.240] AMD-Vi: Setup I/O page table: device id = 0xd00, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.259] AMD-Vi: Setup I/O page table: device id = 0xe00, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.278] AMD-Vi: Setup I/O page table: device id = 0xe01, type = 0x1, root table = 0x4a9cf2000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:21:54.304] Initial low memory virq threshold set at 0x4000 pages.
(XEN) [2019-01-22 23:21:54.323] Scrubbing Free RAM in background
(XEN) [2019-01-22 23:21:54.342] Std. Loglevel: All
(XEN) [2019-01-22 23:21:54.361] Guest Loglevel: All
(XEN) [2019-01-22 23:21:54.380] Xen is relinquishing VGA console.
(XEN) [2019-01-22 23:21:54.483] *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) [2019-01-22 23:21:54.484] Freed 476kB init memory
mapping kernel into physical memory
about to get started...
[    0.000000] Linux version 4.20.2-20190115-thp-doflr+ (root@serveerstertje) (gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Tue Jan 15 11:51:49 CET 2019
[    0.000000] Command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x0000000000095fff] usable
[    0.000000] Xen: [mem 0x0000000000096400-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000080069fff] usable
[    0.000000] Xen: [mem 0x00000000c7f90000-0x00000000c7f9dfff] ACPI data
[    0.000000] Xen: [mem 0x00000000c7f9e000-0x00000000c7fdffff] ACPI NVS
[    0.000000] Xen: [mem 0x00000000c7fe0000-0x00000000c7ffffff] reserved
[    0.000000] Xen: [mem 0x00000000f6000000-0x00000000f6003fff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] Xen: [mem 0x00000000fec20000-0x00000000fec20fff] reserved
[    0.000000] Xen: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] Xen: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] e820: remove [mem 0x80000000-0xfffffffffffffffe] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x0000000000095fff] usable
[    0.000000] user: [mem 0x0000000000096400-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x000000007fffffff] usable
[    0.000000] user: [mem 0x00000000c7f90000-0x00000000c7f9dfff] ACPI data
[    0.000000] user: [mem 0x00000000c7f9e000-0x00000000c7fdffff] ACPI NVS
[    0.000000] user: [mem 0x00000000c7fe0000-0x00000000c7ffffff] reserved
[    0.000000] user: [mem 0x00000000f6000000-0x00000000f6003fff] reserved
[    0.000000] user: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] user: [mem 0x00000000fec20000-0x00000000fec20fff] reserved
[    0.000000] user: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] user: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] user: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] SMBIOS 2.5 present.
[    0.000000] DMI: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[    0.000000] Hypervisor detected: Xen PV
[    0.023405] tsc: Fast TSC calibration using PIT
[    0.023407] tsc: Detected 3200.037 MHz processor
[    0.023408] tsc: Detected 3200.144 MHz TSC
[    0.033522] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.033524] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.046560] AGP: No AGP bridge found
[    0.046680] last_pfn = 0x80000 max_arch_pfn = 0x400000000
[    0.046681] Disabled
[    0.046682] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.046686] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC  
[    0.046723] check: Scanning 1 areas for low memory corruption
[    0.046728] Base memory trampoline at [(____ptrval____)] 90000 size 24576
[    0.046977] BRK [0x03401000, 0x03401fff] PGTABLE
[    0.046978] BRK [0x03402000, 0x03402fff] PGTABLE
[    0.047414] BRK [0x03403000, 0x03403fff] PGTABLE
[    0.047612] BRK [0x03404000, 0x03404fff] PGTABLE
[    0.047810] BRK [0x03405000, 0x03405fff] PGTABLE
[    0.048008] BRK [0x03406000, 0x03406fff] PGTABLE
[    0.242058] RAMDISK: [mem 0x04000000-0x0595afff]
[    0.242112] ACPI: Early table checksum verification disabled
[    0.242890] ACPI: RSDP 0x00000000000FB100 000014 (v00 ACPIAM)
[    0.242898] ACPI: RSDT 0x00000000C7F90000 000048 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.242920] ACPI: FACP 0x00000000C7F90200 000084 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.242958] ACPI: DSDT 0x00000000C7F905E0 009427 (v01 A7640  A7640100 00000100 INTL 20051117)
[    0.242965] ACPI: FACS 0x00000000C7F9E000 000040
[    0.242972] ACPI: APIC 0x00000000C7F90390 000088 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.242979] ACPI: MCFG 0x00000000C7F90420 00003C (v01 7640MS OEMMCFG  20100913 MSFT 00000097)
[    0.242986] ACPI: SLIC 0x00000000C7F90460 000176 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.242992] ACPI: OEMB 0x00000000C7F9E040 000072 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.243000] ACPI: SRAT 0x00000000C7F9A5E0 000108 (v03 AMD    FAM_F_10 00000002 AMD  00000001)
[    0.243006] ACPI: HPET 0x00000000C7F9A6F0 000038 (v01 7640MS OEMHPET  20100913 MSFT 00000097)
[    0.243013] ACPI: IVRS 0x00000000C7F9A730 000108 (v01 AMD    RD890S   00202031 AMD  00000000)
[    0.243020] ACPI: SSDT 0x00000000C7F9A840 000DA4 (v01 A M I  POWERNOW 00000001 AMD  00000001)
[    0.243040] ACPI: Local APIC address 0xfee00000
[    0.243043] Setting APIC routing to Xen PV.
[    0.243099] NUMA turned off
[    0.243100] Faking a node at [mem 0x0000000000000000-0x000000007fffffff]
[    0.243107] NODE_DATA(0) allocated [mem 0x7fc17000-0x7fc20fff]
[    0.246979] Zone ranges:
[    0.246983]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.246985]   DMA32    [mem 0x0000000001000000-0x000000007fffffff]
[    0.246986]   Normal   empty
[    0.246987] Movable zone start for each node
[    0.246989] Early memory node ranges
[    0.246990]   node   0: [mem 0x0000000000001000-0x0000000000095fff]
[    0.246991]   node   0: [mem 0x0000000000100000-0x000000007fffffff]
[    0.246995] Zeroed struct page in unavailable ranges: 107 pages
[    0.246997] Initmem setup node 0 [mem 0x0000000000001000-0x000000007fffffff]
[    0.246999] On node 0 totalpages: 524181
[    0.247001]   DMA zone: 64 pages used for memmap
[    0.247002]   DMA zone: 21 pages reserved
[    0.247003]   DMA zone: 3989 pages, LIFO batch:0
[    0.247820]   DMA32 zone: 8128 pages used for memmap
[    0.247821]   DMA32 zone: 520192 pages, LIFO batch:63
[    0.264853] p2m virtual area at (____ptrval____), size is 600000
[    0.270847] Remapped 106 page(s)
[    0.271828] ACPI: PM-Timer IO Port: 0x808
[    0.271834] ACPI: Local APIC address 0xfee00000
[    0.271887] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
[    0.271893] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
[    0.271901] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.271904] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.271908] ACPI: IRQ0 used by override.
[    0.271910] ACPI: IRQ9 used by override.
[    0.271916] Using ACPI (MADT) for SMP configuration information
[    0.271920] ACPI: HPET id: 0x8300 base: 0xfed00000
[    0.271928] smpboot: Allowing 6 CPUs, 0 hotplug CPUs
[    0.271950] [mem 0x80000000-0xc7f8ffff] available for PCI devices
[    0.271953] Booting paravirtualized kernel on Xen
[    0.271955] Xen version: 4.12-unstable (preserve-AD)
[    0.271960] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.421648] random: get_random_bytes called from start_kernel+0x91/0x443 with crng_init=0
[    0.421660] setup_percpu: NR_CPUS:6 nr_cpumask_bits:6 nr_cpu_ids:6 nr_node_ids:1
[    0.422475] percpu: Embedded 43 pages/cpu @(____ptrval____) s139032 r8192 d28904 u262144
[    0.422482] pcpu-alloc: s139032 r8192 d28904 u262144 alloc=1*2097152
[    0.422483] pcpu-alloc: [0] 0 1 2 3 4 5 - - 
[    0.422561] xen: PV spinlocks enabled
[    0.422565] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
[    0.422572] Built 1 zonelists, mobility grouping on.  Total pages: 515968
[    0.422573] Policy zone: DMA32
[    0.422577] Kernel command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.422774] You have booted with nomodeset. This means your GPU drivers are DISABLED
[    0.422775] Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly
[    0.422776] Unless you actually understand what nomodeset does, you should reboot without enabling it
[    0.484649] software IO TLB: mapped [mem 0x79400000-0x7d400000] (64MB)
[    0.497773] Memory: 1925652K/2096724K available (18436K kernel code, 1355K rwdata, 5148K rodata, 1360K init, 2428K bss, 171072K reserved, 0K cma-reserved)
[    0.497903] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.498272] rcu: Hierarchical RCU implementation.
[    0.498275] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.498295] Using NULL legacy PIC
[    0.498296] NR_IRQS: 4352, nr_irqs: 1016, preallocated irqs: 0
[    0.498333] xen:events: Using FIFO-based ABI
[    0.498364] xen: --> pirq=1 -> irq=1 (gsi=1)
[    0.498372] xen: --> pirq=2 -> irq=2 (gsi=2)
[    0.498376] xen: --> pirq=3 -> irq=3 (gsi=3)
[    0.498381] xen: --> pirq=4 -> irq=4 (gsi=4)
[    0.498385] xen: --> pirq=5 -> irq=5 (gsi=5)
[    0.498390] xen: --> pirq=6 -> irq=6 (gsi=6)
[    0.498394] xen: --> pirq=7 -> irq=7 (gsi=7)
[    0.498398] xen: --> pirq=8 -> irq=8 (gsi=8)
[    0.498403] xen: --> pirq=9 -> irq=9 (gsi=9)
[    0.498407] xen: --> pirq=10 -> irq=10 (gsi=10)
[    0.498412] xen: --> pirq=11 -> irq=11 (gsi=11)
[    0.498416] xen: --> pirq=12 -> irq=12 (gsi=12)
[    0.498421] xen: --> pirq=13 -> irq=13 (gsi=13)
[    0.498425] xen: --> pirq=14 -> irq=14 (gsi=14)
[    0.498430] xen: --> pirq=15 -> irq=15 (gsi=15)
[    0.498484] Console: colour dummy device 80x25
[    0.498657] printk: console [tty0] enabled
[    0.499104] printk: console [hvc0] enabled
[    0.499126] ACPI: Core revision 20181003
[    0.504576] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.504663] Xen: using vcpuop timer interface
[    0.504693] installing Xen timer for CPU 0
[    0.505007] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2e20d250fd6, max_idle_ns: 440795345108 ns
[    0.505059] Calibrating delay loop (skipped), value calculated using timer frequency.. 6402.96 BogoMIPS (lpj=10667146)
[    0.505068] pid_max: default: 32768 minimum: 301
[    0.506098] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.506578] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.506615] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.506636] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.506975] mce: CPU supports 2 MCE banks
[    0.506994] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
[    0.506998] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
[    0.507004] Spectre V2 : Mitigation: Full AMD retpoline
[    0.507007] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.507214] Freeing SMP alternatives memory: 52K
[    0.510971] cpu 0 spinlock event irq 57
[    0.510997] VPMU disabled by hypervisor.
[    0.511187] Performance Events: PMU not available due to virtualization, using software events only.
[    0.511257] rcu: Hierarchical SRCU implementation.
[    0.511344] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.511476] smp: Bringing up secondary CPUs ...
[    0.511599] installing Xen timer for CPU 1
[    0.511924] cpu 1 spinlock event irq 69
[    0.511924] installing Xen timer for CPU 2
[    0.512218] cpu 2 spinlock event irq 76
[    0.512218] installing Xen timer for CPU 3
[    0.512218] cpu 3 spinlock event irq 83
[    0.512218] installing Xen timer for CPU 4
[    0.512218] cpu 4 spinlock event irq 90
[    0.512218] installing Xen timer for CPU 5
[    0.512218] cpu 5 spinlock event irq 97
[    0.512218] smp: Brought up 1 node, 6 CPUs
[    0.512218] smpboot: Max logical packages: 1
[    0.512218] devtmpfs: initialized
[    0.515369] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.515369] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.515480] xor: measuring software checksum speed
[    0.548360]    prefetch64-sse: 17346.000 MB/sec
[    0.581692]    generic_sse: 16286.400 MB/sec
[    0.581696] xor: using function: prefetch64-sse (17346.000 MB/sec)
[    0.581936] NET: Registered protocol family 16
[    0.581957] xen:grant_table: Grant tables using version 1 layout
[    0.581975] Grant table initialized
[    0.582416] node 0 link 0: io port [1000, ffffff]
[    0.582416] TOM: 00000000c8000000 aka 3200M
[    0.582416] Fam 10h mmconf [mem 0xe0000000-0xefffffff]
[    0.582416] node 0 link 0: mmio [e0000000, efffffff] ==> none
[    0.582416] node 0 link 0: mmio [f0000000, ffffffff]
[    0.582416] node 0 link 0: mmio [a0000, bffff]
[    0.582416] node 0 link 0: mmio [c8000000, dfffffff]
[    0.582416] TOM2: 0000000538000000 aka 21376M
[    0.582416] bus: [bus 00-07] on node 0 link 0
[    0.582416] bus: 00 [io  0x0000-0xffff]
[    0.582416] bus: 00 [mem 0xf0000000-0xffffffff]
[    0.582416] bus: 00 [mem 0x000a0000-0x000bffff]
[    0.582416] bus: 00 [mem 0xc8000000-0xdfffffff]
[    0.582416] bus: 00 [mem 0x538000000-0xfcffffffff]
[    0.582416] ACPI: bus type PCI registered
[    0.582416] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.582416] PCI: not using MMCONFIG
[    0.582416] PCI: Using configuration type 1 for base access
[    0.582416] PCI: Using configuration type 1 for extended access
[    0.590847] cryptd: max_cpu_qlen set to 10[    3.476663] xen: registering gsi 47 triggering 0 polarity 1
[    3.482936] Already setup the GSI :47
[    3.489370] xen: registering gsi 47 triggering 0 polarity 1
[    3.495656] Already setup the GSI :47
[    3.502108] xen: registering gsi 48 triggering 0 polarity 1
[    3.508492] Already setup the GSI :48
[    4.531910] pciback 0000:0a:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x10a)
[    4.538532] pciback 0000:0a:00.0: restoring config space at offset 0x10 (was 0x4, writing 0xfe5fe004)
[    4.545112] pciback 0000:0a:00.0: restoring config space at offset 0xc (was 0x0, writing 0x10)
[    4.551653] pciback 0000:0a:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100102)
[    4.558250] xen: registering gsi 28 triggering 0 polarity 1
[    4.564752] Already setup the GSI :28
[    5.598697] pciback 0000:0d:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x10b)
[    5.605372] pciback 0000:0d:00.0: restoring config space at offset 0x10 (was 0x4, writing 0xfe8fe004)
[    5.611940] pciback 0000:0d:00.0: restoring config space at offset 0xc (was 0x0, writing 0x10)
[    5.618436] pciback 0000:0d:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100102)
[    5.625039] xen: registering gsi 16 triggering 0 polarity 1
[    5.631422] Already setup the GSI :16
[    5.668521] pciback 0000:00:14.2: restoring config space at offset 0x3c (was 0x100, writing 0x10a)
[    5.674999] pciback 0000:00:14.2: restoring config space at offset 0x10 (was 0x4, writing 0xfdef8004)
[    5.681368] pciback 0000:00:14.2: restoring config space at offset 0xc (was 0x0, writing 0x4010)
[    5.687710] pciback 0000:00:14.2: restoring config space at offset 0x4 (was 0x4100000, writing 0x4100006)
[    5.694090] xen_pciback: backend is vpci
[    5.700599] xen_acpi_processor: Uploading Xen processor PM info
[    5.707672] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
(XEN) [2019-01-22 23:22:00.202] d0: Forcing read-only access to MFN fed00
[    5.714740] hpet_acpi_add: no address or irqs in _CRS
[    5.721335] Linux agpgart interface v0.103
[    5.727701] agpgart-amd64 0000:00:00.0: runtime IRQ mapping not provided by arch
[    5.734185] agpgart-amd64 0000:00:00.2: runtime IRQ mapping not provided by arch
[    5.740589] agpgart-amd64 0000:00:11.0: runtime IRQ mapping not provided by arch
[    5.746935] agpgart-amd64 0000:00:12.0: runtime IRQ mapping not provided by arch
[    5.753190] agpgart-amd64 0000:00:12.2: runtime IRQ mapping not provided by arch
[    5.759366] agpgart-amd64 0000:00:13.0: runtime IRQ mapping not provided by arch
[    5.765521] agpgart-amd64 0000:00:13.2: runtime IRQ mapping not provided by arch
[    5.771530] agpgart-amd64 0000:00:14.0: runtime IRQ mapping not provided by arch
[    5.777447] agpgart-amd64 0000:00:14.3: runtime IRQ mapping not provided by arch
[    5.783260] agpgart-amd64 0000:00:14.4: runtime IRQ mapping not provided by arch
[    5.789004] agpgart-amd64 0000:00:14.5: runtime IRQ mapping not provided by arch
[    5.794639] agpgart-amd64 0000:00:16.0: runtime IRQ mapping not provided by arch
[    5.800204] agpgart-amd64 0000:00:16.2: runtime IRQ mapping not provided by arch
[    5.805682] agpgart-amd64 0000:00:18.0: runtime IRQ mapping not provided by arch
[    5.811005] agpgart-amd64 0000:00:18.1: runtime IRQ mapping not provided by arch
[    5.816129] agpgart-amd64 0000:00:18.2: runtime IRQ mapping not provided by arch
[    5.821102] agpgart-amd64 0000:00:18.3: runtime IRQ mapping not provided by arch
[    5.826018] agpgart-amd64 0000:00:18.4: runtime IRQ mapping not provided by arch
[    5.830896] agpgart-amd64 0000:0e:00.0: runtime IRQ mapping not provided by arch
[    5.835762] agpgart-amd64 0000:0e:00.1: runtime IRQ mapping not provided by arch
[    5.840530] agpgart-amd64 0000:0c:00.0: runtime IRQ mapping not provided by arch
[    5.845109] agpgart-amd64 0000:0b:00.0: runtime IRQ mapping not provided by arch
[    5.849639] agpgart-amd64 0000:07:00.0: runtime IRQ mapping not provided by arch
[    5.854072] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is 60 seconds).
[    5.858589] [drm] VGACON disable radeon kernel modesetting.
[    5.863054] [drm:radeon_init] *ERROR* No UMS support in radeon module!
[    5.870847] brd: module loaded
[    5.883662] loop: module loaded
[    5.888307] ahci 0000:00:11.0: runtime IRQ mapping not provided by arch
[    5.892848] ahci 0000:00:11.0: version 3.0
[    5.897374] xen: registering gsi 19 triggering 0 polarity 1
[    5.901843] xen: --> pirq=19 -> irq=19 (gsi=19)
[    5.906514] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
[    5.911074] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo pmp pio slum part 
[    5.915657] ahci 0000:00:11.0: both AHCI_HFLAG_MULTI_MSI flag set and custom irq handler implemented
[    5.921201] scsi host0: ahci
[    5.926122] scsi host1: ahci
[    5.930965] scsi host2: ahci
[    5.935511] scsi host3: ahci
[    5.940105] scsi host4: ahci
[    5.944711] scsi host5: ahci
[    5.949003] ata1: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff100 irq 113
[    5.953230] ata2: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff180 irq 114
[    5.957379] ata3: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff200 irq 115
[    5.961363] ata4: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff280 irq 116
[    5.965313] ata5: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff300 irq 117
[    5.969242] ata6: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff380 irq 118
[    5.973179] ahci 0000:07:00.0: runtime IRQ mapping not provided by arch
[    5.977084] xen: registering gsi 38 triggering 0 polarity 1
[    5.980900] Already setup the GSI :38
[    5.984688] ahci 0000:07:00.0: AHCI 0001.0000 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
[    5.988564] ahci 0000:07:00.0: flags: 64bit ncq sntf led only pmp fbs pio slum part sxs 
[    5.992481] ahci 0000:07:00.0: port 0 can do FBS, forcing FBSCP
[    5.996412] ahci 0000:07:00.0: port 1 can do FBS, forcing FBSCP
[    6.000457] scsi host6: ahci
[    6.004461] scsi host7: ahci
[    6.008139] ata7: SATA max UDMA/133 abar m2048@0xfe2ff800 port 0xfe2ff900 irq 121
[    6.011845] ata8: SATA max UDMA/133 abar m2048@0xfe2ff800 port 0xfe2ff980 irq 121
[    6.015750] tun: Universal TUN/TAP device driver, 1.6
[    6.019501] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[    6.023238] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    6.027083] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    6.030984] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    6.034986] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    6.039101] igb: Copyright (c) 2007-2014 Intel Corporation.
[    6.043312] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k
[    6.047713] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    6.052205] r8169 0000:0c:00.0: runtime IRQ mapping not provided by arch
[    6.056923] xen: registering gsi 46 triggering 0 polarity 1
[    6.061629] Already setup the GSI :46
[    6.066351] r8169 0000:0c:00.0: enabling Mem-Wr-Inval
[    6.073753] libphy: r8169: probed
[    6.079131] r8169 0000:0c:00.0 eth0: RTL8168d/8111d, 40:61:86:f4:67:d9, XID 281000c0, IRQ 122
[    6.084263] r8169 0000:0c:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    6.089582] r8169 0000:0b:00.0: runtime IRQ mapping not provided by arch
[    6.094973] xen: registering gsi 51 triggering 0 polarity 1
[    6.100421] xen: --> pirq=51 -> irq=51 (gsi=51)
[    6.105900] r8169 0000:0b:00.0: enabling Mem-Wr-Inval
[    6.113575] libphy: r8169: probed
[    6.119649] r8169 0000:0b:00.0 eth1: RTL8168d/8111d, 40:61:86:f4:67:d8, XID 281000c0, IRQ 123
[    6.125519] r8169 0000:0b:00.0 eth1: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    6.131576] PPP generic driver version 2.4.2
[    6.137550] PPP BSD Compression module registered
[    6.143341] PPP Deflate Compression module registered
[    6.149127] PPP MPPE Compression module registered
[    6.154824] NET: Registered protocol family 24
[    6.160582] usbcore: registered new interface driver ath9k_htc
[    6.166370] usbcore: registered new interface driver rt2500usb
[    6.172096] usbcore: registered new interface driver rt73usb
[    6.177736] usbcore: registered new interface driver rt2800usb
[    6.183325] usbcore: registered new interface driver rtl8187
[    6.188813] usbcore: registered new interface driver rtl8192cu
[    6.194250] usbcore: registered new interface driver rtl8xxxu
[    6.199489] xen_netfront: Initialising Xen virtual ethernet driver
[    6.204847] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    6.210178] ehci-pci: EHCI PCI platform driver
[    6.215538] ehci-pci 0000:00:12.2: runtime IRQ mapping not provided by arch
[    6.221148] xen: registering gsi 17 triggering 0 polarity 1
[    6.226771] Already setup the GSI :17
[    6.232470] QUIRK: Enable AMD PLL fix
[    6.238044] ehci-pci 0000:00:12.2: enabling bus mastering
[    6.243797] ehci-pci 0000:00:12.2: EHCI Host Controller
[    6.249652] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus number 1
[    6.255507] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    6.261540] ehci-pci 0000:00:12.2: debug port 1
[    6.267670] ehci-pci 0000:00:12.2: enabling Mem-Wr-Inval
[    6.273680] ehci-pci 0000:00:12.2: irq 17, io mem 0xfdeff400
[    6.285960] ata4: SATA link down (SStatus 0 SControl 300)
[    6.291763] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
[    6.291905] ata2: SATA link down (SStatus 0 SControl 300)
[    6.297684] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
[    6.309401] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    6.315368] usb usb1: Product: EHCI Host Controller
[    6.321304] usb usb1: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ehci_hcd
[    6.327416] usb usb1: SerialNumber: 0000:00:12.2
[    6.327438] ata7: SATA link down (SStatus 0 SControl 370)
[    6.333681] hub 1-0:1.0: USB hub found
[    6.339673] ata8: SATA link down (SStatus 0 SControl 370)
[    6.345728] hub 1-0:1.0: 5 ports detected
[    6.358106] ehci-pci 0000:00:13.2: runtime IRQ mapping not provided by arch
[    6.364339] xen: registering gsi 17 triggering 0 polarity 1
[    6.370458] Already setup the GSI :17
[    6.376525] ehci-pci 0000:00:13.2: enabling bus mastering
[    6.382595] ehci-pci 0000:00:13.2: EHCI Host Controller
[    6.388610] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2
[    6.394550] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    6.400550] ehci-pci 0000:00:13.2: debug port 1
[    6.406490] ehci-pci 0000:00:13.2: enabling Mem-Wr-Inval
[    6.412330] ehci-pci 0000:00:13.2: irq 17, io mem 0xfdeff800
[    6.428510] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
[    6.434352] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
[    6.440191] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    6.445118] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    6.445974] usb usb2: Product: EHCI Host Controller
[    6.457564] usb usb2: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ehci_hcd
[    6.458480] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    6.463444] usb usb2: SerialNumber: 0000:00:13.2
[    6.469300] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    6.475581] hub 2-0:1.0: USB hub found
[    6.480916] ata6: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    6.486665] hub 2-0:1.0: 5 ports detected
[    6.498189] ata5.00: supports DRM functions and may not be fully accessible
[    6.498358] ehci-pci 0000:00:16.2: runtime IRQ mapping not provided by arch
[    6.504067] ata6.00: supports DRM functions and may not be fully accessible
[    6.510077] xen: registering gsi 17 triggering 0 polarity 1
[    6.515917] ata1.00: ATA-8: HGST HDN724040ALE640, MJAOA5E0, max UDMA/133
[    6.515919] ata1.00: 7814037168 sectors, multi 0: LBA48 NCQ (depth 32), AA
[    6.515941] ata5.00: ATA-9: TOSHIBA THNSFJ256GCSU, JULA1102, max UDMA/100
[    6.521936] Already setup the GSI :17
[    6.527965] ata5.00: 500118192 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    6.534145] ehci-pci 0000:00:16.2: enabling bus mastering
[    6.540322] ata3.00: ATA-8: Hitachi HDS722020ALA330, JKAOA20N, max UDMA/133
[    6.546713] ehci-pci 0000:00:16.2: EHCI Host Controller
[    6.553064] ata3.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 32), AA
[    6.559652] ehci-pci 0000:00:16.2: new USB bus registered, assigned bus number 3
[    6.579434] ata1.00: configured for UDMA/133
[    6.586048] ehci-pci 0000:00:16.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    6.586098] ehci-pci 0000:00:16.2: debug port 1
[    6.592615] ata6.00: ATA-10: Crucial_CT525MX300SSD1,  M0CR031, max UDMA/133
[    6.592909] scsi 0:0:0:0: Direct-Access     ATA      HGST HDN724040AL A5E0 PQ: 0 ANSI: 5
[    6.593168] sd 0:0:0:0: Attached scsi generic sg0 type 0
[    6.593297] sd 0:0:0:0: [sda] 7814037168 512-byte logical blocks: (4.00 TB/3.64 TiB)
[    6.593299] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    6.593326] sd 0:0:0:0: [sda] Write Protect is off
[    6.593329] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    6.593375] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    6.599521] ehci-pci 0000:00:16.2: enabling Mem-Wr-Inval
[    6.606089] ata6.00: 1025610768 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    6.612901] ehci-pci 0000:00:16.2: irq 17, io mem 0xfdeffc00
[    6.633879] ata3.00: configured for UDMA/133
[    6.651831] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
[    6.654449] ata5.00: supports DRM functions and may not be fully accessible
[    6.654684] scsi 2:0:0:0: Direct-Access     ATA      Hitachi HDS72202 A20N PQ: 0 ANSI: 5
[    6.654919] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    6.654988] sd 2:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
[    6.654998] sd 2:0:0:0: [sdb] Write Protect is off
[    6.654999] sd 2:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    6.655042] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    6.661575]  sdb: sdb1
[    6.661603] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
[    6.661604] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    6.661605] usb usb3: Product: EHCI Host Controller
[    6.661607] usb usb3: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ehci_hcd
[    6.661608] usb usb3: SerialNumber: 0000:00:16.2
[    6.661764] hub 3-0:1.0: USB hub found
[    6.661771] hub 3-0:1.0: 4 ports detected
[    6.668552] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    6.669200] ata6.00: supports DRM functions and may not be fully accessible
[    6.669394] ata5.00: configured for UDMA/100
[    6.669737] scsi 4:0:0:0: Direct-Access     ATA      TOSHIBA THNSFJ25 1102 PQ: 0 ANSI: 5
[    6.669961] sd 4:0:0:0: Attached scsi generic sg2 type 0
[    6.670005] sd 4:0:0:0: [sdc] 500118192 512-byte logical blocks: (256 GB/238 GiB)
[    6.670044] sd 4:0:0:0: [sdc] Write Protect is off
[    6.670046] sd 4:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    6.670104] sd 4:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    6.670867]  sdc: sdc1
[    6.671277]  sda: sda1 sda2 sda3 sda4
[    6.671282] sd 4:0:0:0: [sdc] Attached SCSI disk
[    6.671900] ata6.00: configured for UDMA/133
[    6.672119] sd 0:0:0:0: [sda] Attached SCSI disk
[    6.672120] scsi 5:0:0:0: Direct-Access     ATA      Crucial_CT525MX3 R031 PQ: 0 ANSI: 5
[    6.672294] sd 5:0:0:0: Attached scsi generic sg3 type 0
[    6.672322] ata6.00: Enabling discard_zeroes_data
[    6.672448] sd 5:0:0:0: [sdd] 1025610768 512-byte logical blocks: (525 GB/489 GiB)
[    6.672472] sd 5:0:0:0: [sdd] Write Protect is off
[    6.672473] sd 5:0:0:0: [sdd] Mode Sense: 00 3a 00 00
[    6.672517] sd 5:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    6.672771] ata6.00: Enabling discard_zeroes_data
[    6.674873]  sdd: sdd1 sdd2 sdd3 sdd4
[    6.675267] ata6.00: Enabling discard_zeroes_data
[    6.675624] sd 5:0:0:0: [sdd] Attached SCSI disk
[    6.675867] sd 2:0:0:0: [sdb] Attached SCSI disk
[    6.682512] ohci-pci: OHCI PCI platform driver
[    6.991255] ohci-pci 0000:00:12.0: runtime IRQ mapping not provided by arch
[    6.998049] xen: registering gsi 18 triggering 0 polarity 1
[    7.004623] Already setup the GSI :18
[    7.011202] ohci-pci 0000:00:12.0: enabling bus mastering
[    7.017718] ohci-pci 0000:00:12.0: OHCI PCI host controller
[    7.024206] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus number 4
[    7.030723] ohci-pci 0000:00:12.0: irq 18, io mem 0xfdef7000
[    7.096052] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.104393] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.112766] usb usb4: Product: OHCI PCI host controller
[    7.121163] usb usb4: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.129021] usb usb4: SerialNumber: 0000:00:12.0
[    7.135585] hub 4-0:1.0: USB hub found
[    7.141974] hub 4-0:1.0: 5 ports detected
[    7.148580] ohci-pci 0000:00:13.0: runtime IRQ mapping not provided by arch
[    7.155064] xen: registering gsi 18 triggering 0 polarity 1
[    7.161444] Already setup the GSI :18
[    7.167764] ohci-pci 0000:00:13.0: enabling bus mastering
[    7.174041] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    7.180324] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus number 5
[    7.186671] ohci-pci 0000:00:13.0: irq 18, io mem 0xfdefc000
[    7.252702] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.260887] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.268555] usb usb5: Product: OHCI PCI host controller
[    7.274744] usb usb5: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.280948] usb usb5: SerialNumber: 0000:00:13.0
[    7.287226] hub 5-0:1.0: USB hub found
[    7.293401] hub 5-0:1.0: 5 ports detected
[    7.299742] ohci-pci 0000:00:14.5: runtime IRQ mapping not provided by arch
[    7.306018] xen: registering gsi 18 triggering 0 polarity 1
[    7.312211] Already setup the GSI :18
[    7.318430] ohci-pci 0000:00:14.5: enabling bus mastering
[    7.324625] ohci-pci 0000:00:14.5: OHCI PCI host controller
[    7.330829] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus number 6
[    7.337132] ohci-pci 0000:00:14.5: irq 18, io mem 0xfdefd000
[    7.402715] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.410677] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.418568] usb usb6: Product: OHCI PCI host controller
[    7.426419] usb usb6: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.432756] usb usb6: SerialNumber: 0000:00:14.5
[    7.439043] hub 6-0:1.0: USB hub found
[    7.445127] hub 6-0:1.0: 2 ports detected
[    7.451459] ohci-pci 0000:00:16.0: runtime IRQ mapping not provided by arch
[    7.457742] xen: registering gsi 18 triggering 0 polarity 1
[    7.463945] Already setup the GSI :18
[    7.470159] ohci-pci 0000:00:16.0: enabling bus mastering
[    7.476368] ohci-pci 0000:00:16.0: OHCI PCI host controller
[    7.482548] ohci-pci 0000:00:16.0: new USB bus registered, assigned bus number 7
[    7.488777] ohci-pci 0000:00:16.0: irq 18, io mem 0xfdefe000
[    7.552722] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.560670] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.568283] usb usb7: Product: OHCI PCI host controller
[    7.574427] usb usb7: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.580574] usb usb7: SerialNumber: 0000:00:16.0
[    7.586923] hub 7-0:1.0: USB hub found
[    7.593088] hub 7-0:1.0: 4 ports detected
[    7.599503] uhci_hcd: USB Universal Host Controller Interface driver
[    7.605841] usbcore: registered new interface driver usblp
[    7.612159] usbcore: registered new interface driver usb-storage
[    7.618437] usbcore: registered new interface driver cp210x
[    7.624529] usbserial: USB Serial support registered for cp210x
[    7.630657] usbcore: registered new interface driver cypress_m8
[    7.636768] usbserial: USB Serial support registered for DeLorme Earthmate USB
[    7.642988] usbserial: USB Serial support registered for HID->COM RS232 Adapter
[    7.649170] usbserial: USB Serial support registered for Nokia CA-42 V2 Adapter
[    7.655287] usbcore: registered new interface driver mos7720
[    7.661350] usbserial: USB Serial support registered for Moschip 2 port adapter
[    7.667455] usbcore: registered new interface driver mos7840
[    7.673506] usbserial: USB Serial support registered for Moschip 7840/7820 USB Serial Driver
[    7.679678] i8042: PNP: No PS/2 controller found.
[    7.685807] i8042: Probing ports directly.
[    7.692386] serio: i8042 KBD port at 0x60,0x64 irq 1
[    7.698536] serio: i8042 AUX port at 0x60,0x64 irq 12
[    7.704833] mousedev: PS/2 mouse device common for all mice
[    7.711103] rtc_cmos 00:02: RTC can wake from S4
[    7.717355] rtc_cmos 00:02: registered as rtc0
[    7.723346] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram
[    7.729565] piix4_smbus 0000:00:14.0: runtime IRQ mapping not provided by arch
[    7.735774] ACPI Warning: SystemIO range 0x0000000000000B00-0x0000000000000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\SOR1) (20181003/utaddress-213)
[    7.748628] ACPI: This conflict may cause random problems and system instability
[    7.755096] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.761793] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[    7.768479] piix4_smbus 0000:00:14.0: Using register 0x2c for SMBus port selection
[    7.775227] ACPI Warning: SystemIO range 0x0000000000000B20-0x0000000000000B28 conflicts with OpRegion 0x0000000000000B20-0x0000000000000B2F (\SOR2) (20181003/utaddress-213)
[    7.789172] ACPI: This conflict may cause random problems and system instability
[    7.796308] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.803544] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[    7.811038] IR NEC protocol handler initialized
[    7.818414] IR RC5(x/sz) protocol handler initialized
[    7.825769] IR RC6 protocol handler initialized
[    7.833175] IR JVC protocol handler initialized
[    7.840409] IR Sony protocol handler initialized
[    7.847611] IR SANYO protocol handler initialized
[    7.854726] IR Sharp protocol handler initialized
[    7.861777] IR MCE Keyboard/mouse protocol handler initialized
[    7.868890] IR XMP protocol handler initialized
[    7.875877] cx25821: driver loaded
[    7.882839] usbcore: registered new interface driver stk1160
[    7.889964] usbcore: registered new interface driver em28xx
[    7.896965] em28xx: Registered (Em28xx v4l2 Extension) extension
[    7.903988] f71805f: Unsupported Fintek device, skipping
[    7.911067] f71882fg: Found f71889ed chip at 0x600, revision 16
[    7.918097] ACPI Warning: SystemIO range 0x0000000000000600-0x0000000000000607 conflicts with OpRegion 0x0000000000000605-0x0000000000000606 (\HMOR) (20181003/utaddress-213)
[    7.932799] ACPI: This conflict may cause random problems and system instability
[    7.940310] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.948044] f71882fg f71882fg.1536: Fan: 1 is in duty-cycle mode
[    7.955638] f71882fg f71882fg.1536: Fan: 2 is in duty-cycle mode
[    7.958521] usb 7-3: new low-speed USB device number 2 using ohci-pci
[    7.963156] f71882fg f71882fg.1536: Fan: 3 is in duty-cycle mode
[    7.978096] f71882fg f71882fg.1536: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    8.023750] k10temp 0000:00:18.3: runtime IRQ mapping not provided by arch
[    8.033422] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    8.043708] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
[    8.052475] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    8.060591] xen_wdt xen_wdt: initialized (timeout=60s, nowayout=0)
[    8.069048] device-mapper: ioctl: 4.39.0-ioctl (2018-04-03) initialised: dm-devel@redhat.com
[    8.077479] Bluetooth: HCI UART driver ver 2.3
[    8.085622] Bluetooth: HCI UART protocol H4 registered
[    8.093717] Bluetooth: HCI UART protocol BCSP registered
[    8.101765] Bluetooth: HCI UART protocol ATH3K registered
[    8.109912] usbcore: registered new interface driver bcm203x
[    8.117957] usbcore: registered new interface driver bpa10x
[    8.125895] usbcore: registered new interface driver bfusb
[    8.133753] usbcore: registered new interface driver btusb
[    8.141451] usbcore: registered new interface driver ath3k
[    8.149248] hidraw: raw HID events driver (C) Jiri Kosina
[    8.155579] usb 7-3: New USB device found, idVendor=046d, idProduct=c517, b[   27.439531] EXT4-fs (dm-25): mounted filesystem with ordered data mode. Opts: (null)
[   28.861637] RTL8211B Gigabit Ethernet r8169-c00:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-c00:00, irq=IGNORE)
[   29.046204] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   29.054857] RTL8211B Gigabit Ethernet r8169-b00:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-b00:00, irq=IGNORE)
[   29.213007] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
[   30.938514] r8169 0000:0c:00.0 eth0: Link is Up - 1Gbps/Full - flow control off
[   30.946834] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   31.324622] r8169 0000:0b:00.0 eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   31.335808] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   41.866888] EXT4-fs (dm-25): re-mounted. Opts: discard,barrier=1,errors=remount-ro
[   43.210068] Adding 4194300k swap on /dev/mapper/serveerstertje_ssd-swap.  Priority:-2 extents:1 across:4194300k SS
[   44.061834] EXT4-fs (sdd2): mounted filesystem with ordered data mode. Opts: discard,barrier=1,errors=remount-ro
[   44.100016] EXT4-fs (dm-28): warning: maximal mount count reached, running e2fsck is recommended
[   44.134556] EXT4-fs (dm-28): mounted filesystem with ordered data mode. Opts: barrier=1,errors=remount-ro

--------------A70EEBBFE7A14EE55910A6D5
Content-Type: text/x-log;
 name="boot-dom0-pvh.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="boot-dom0-pvh.log"

 __  __            _  _    _ ____                     _        _     _      
 \ \/ /___ _ __   | || |  / |___ \    _   _ _ __  ___| |_ __ _| |__ | | ___ 
  \  // _ \ '_ \  | || |_ | | __) |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
  /  \  __/ | | | |__   _|| |/ __/|__| |_| | | | \__ \ || (_| | |_) | |  __/
 /_/\_\___|_| |_|    |_|(_)_|_____|   \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
                                                                            
(XEN) [0000001a4892bf73] Xen version 4.12-unstable (root@dyndns.org) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Wed Jan 23 00:05:49 CET 2019
(XEN) [0000001a5035db3e] Latest ChangeSet: Fri Nov 30 12:10:00 2018 +0100 git:fad6ba64a8
(XEN) [0000001a54ac6278] Bootloader: GRUB 2.02~beta3-5+deb9u1
(XEN) [0000001a57cc307b] Command line: dom0_mem=2048M,max:2048M loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64 dom0=pvh
(XEN) [0000001a65ee4dab] Xen image load base address: 0
(XEN) [0000001a68c1ecde] Video information:
(XEN) [0000001a6afd4a98]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [0000001a6e432645]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [0000001a72216b65] Disc information:
(XEN) [0000001a744ff112]  Found 4 MBR signatures
(XEN) [0000001a76cabdb8]  Found 4 EDD information structures
(XEN) [0000001a79dde218] Xen-e820 RAM map:
(XEN) [0000001a7c0c70e2]  0000000000000000 - 0000000000096400 (usable)
(XEN) [0000001a7f9e936a]  0000000000096400 - 00000000000a0000 (reserved)
(XEN) [0000001a8349fb4a]  00000000000e4000 - 0000000000100000 (reserved)
(XEN) [0000001a86f55e53]  0000000000100000 - 00000000c7f90000 (usable)
(XEN) [0000001a8a878162]  00000000c7f90000 - 00000000c7f9e000 (ACPI data)
(XEN) [0000001a8e3fb226]  00000000c7f9e000 - 00000000c7fe0000 (ACPI NVS)
(XEN) [0000001a91eb182a]  00000000c7fe0000 - 00000000c8000000 (reserved)
(XEN) [0000001a95967c4a]  00000000ffe00000 - 0000000100000000 (reserved)
(XEN) [0000001a9941fcf5]  0000000100000000 - 0000000538000000 (usable)
(XEN) [0000001aa24b18a5] New Xen image base address: 0xc7800000
(XEN) [0000001aa5844f50] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [0000001aa8b0d6c5] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001aad737d36] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001ab236484b] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [0000001ab6f90b16] ACPI: FACS C7F9E000, 0040
(XEN) [0000001ab98d28f2] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001abe4fe865] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000001ac312a352] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001ac7d57b85] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001acc983252] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [0000001ad15aee65] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000001ad61da7a5] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [0000001adae06472] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000001adfa330ab] System RAM: 20479MB (20970648kB)
(XEN) [0000001ae9d92c00] SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) [0000001aecc63436] SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) [0000001aefb3369d] SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) [0000001af2a03783] SRAT: PXM 0 -> APIC 03 -> Node 0
(XEN) [0000001af58d3aaa] SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) [0000001af87a3c25] SRAT: PXM 0 -> APIC 05 -> Node 0
(XEN) [0000001afb674e42] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000001afe0832ea] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000001b010e9fa5] SRAT: Node 0 PXM 0 100000000-538000000
(XEN) [0000001b0447ca4a] NUMA: Allocated memnodemap from 5334dc000 - 5334e2000
(XEN) [0000001b083f6d5d] NUMA: Using 8 for the hash shift.
(XEN) [0000001b4fe1c315] Domain heap initialised
(XEN) [0000001b525c9cca] Allocated console ring of 128 KiB.
(XEN) [0000001b6880f928] vesafb: framebuffer at 0xd0000000, mapped to 0xffff82c000201000, using 6144k, total 16384k
(XEN) [0000001b6e4e6be2] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [0000001b726c076b] vesafb: Truecolor: size=0:8:8:8, shift=0:16:8:0
(XEN) [0000001b7618648a] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [0000001b80306f2a] found SMP MP-table at 000ff780
(XEN) [0000001b8303f340] DMI present.
(XEN) [0000001b84f314aa] Using APIC driver default
(XEN) [0000001b87873b93] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [0000001b8acd0e00] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [0000001b8f044443] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [0000001b92ef3455] ACPI: Local APIC address 0xfee00000
(XEN) [0000001b96023953] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) [0000001b99d3c32a] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) [0000001b9da567d5] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
(XEN) [0000001ba176f21d] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) [0000001ba5487ce2] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
(XEN) [0000001ba919eb7b] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
(XEN) [0000001baceb8812] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [0000001bb0fc8f33] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [0000001bb566678d] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [0000001bb9842a6d] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000001bbdfabb03] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000001bc21867db] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [0000001bc64f826e] ACPI: IRQ0 used by override.
(XEN) [0000001bc909b9ad] ACPI: IRQ2 used by override.
(XEN) [0000001bcbc409ce] ACPI: IRQ9 used by override.
(XEN) [0000001bce7e3205] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [0000001bd21056fd] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [0000001bd5499323] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [0000001bd9f2e1fd] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000001bdd919af6] ERST table was not found
(XEN) [0000001be01913c2] Using ACPI (MADT) for SMP configuration information
(XEN) [0000001be3f73e5d] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [0000001be723ca3d] IRQ limits: 56 GSI, 1112 MSI/MSI-X
(XEN) [0000001bea2a377d] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc
(XEN) [0000001bee7ab892] traps.c:1574: GPF (0000): ffff82d08042cb7c [probe_cpuid_faulting+0xe/0xa2] -> ffff82d0803858b2
(XEN) [0000001bf47adcc2] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [0000001bf8330ac8] Speculative mitigation facilities:
(XEN) [0000001bfb397198]   Hardware features:
(XEN) [0000001bfd8e06fa]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [0000001c016c5880]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN) [0000001c057d4f30]   Support for HVM VMs: RSB
(XEN) [0000001c081e3e58]   Support for PV VMs: RSB
(XEN) [0000001c0ab25c9a]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [0000001c0f6858aa]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [0000001c132d40e2] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000001c1718341e] Initializing Credit2 scheduler
(XEN) [0000001c19ebc350]  load_precision_shift: 18
(XEN) [0000001c1c8007e3]  load_window_shift: 30
(XEN) [0000001c1eee053e]  underload_balance_tolerance: 0
(XEN) [0000001c21ce5d78]  overload_balance_tolerance: -3
(XEN) [0000001c24aeba9e]  runqueues arrangement: socket
(XEN) [0000001c27825a70]  cap enforcement granularity: 10ms
(XEN) [0000001c2a88c538] load tracking window length 1073741824 ns
(XEN) [0000001c2de7f8ee] Adding cpu 0 to runqueue 0
(XEN) [0000001c3088e3ca]  First cpu on runqueue, activating
(XEN) [0000001c3d082580] Platform timer is 14.318MHz HPET
(XEN) [    3.015069] Detected 3200.123 MHz processor.
(XEN) [    3.031488] Initing memory sharing.
(XEN) [    3.043445] alt table ffff82d08046ebf8 -> ffff82d080470a36
(XEN) [    3.062125] AMD-Vi: Found MSI capability block at 0x54
(XEN) [    3.079024] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.101124] AMD-Vi: Using IVHD type 0x10
(XEN) [    3.114383] AMD-Vi: ACPI Table:
(XEN) [    3.125305] AMD-Vi:  Signature IVRS
(XEN) [    3.137262] AMD-Vi:  Length 0x108
(XEN) [    3.148702] AMD-Vi:  Revision 0x1
(XEN) [    3.168996] AMD-Vi:  CheckSum 0x65
(XEN) [    3.189469] AMD-Vi:  OEM_Id AMD  
(XEN) [    3.209669] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.231703] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.254220] AMD-Vi:  Creator_Id AMD 
(XEN) [    3.275083] AMD-Vi:  Creator_Revision 0
(XEN) [    3.296663] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.325834] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.352910] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.375519] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.403338] AMD-Vi: IVHD Device Entry: type 0x3 id 0xe00 flags 0
(XEN) [    3.431442] AMD-Vi:  Dev_Id Range: 0xe00 -> 0xe01
(XEN) [    3.455568] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.483374] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.511426] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.539155] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.567118] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.594781] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.622677] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.650289] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.678172] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.705848] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    3.733822] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    3.757900] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    3.785627] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    3.813561] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    3.841486] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    3.869447] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    3.897422] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    3.925411] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    3.953138] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    3.981086] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    4.005019] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    4.032539] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.060071] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.083459] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.111003] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.134338] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.162650] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.190237] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.217769] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.245289] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.273342] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.300096] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.327667] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.355291] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.382952] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.410915] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.438655] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.462236] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.488691] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.516745] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.545615] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.572955] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.602555] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.630463] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.658478] I/O virtualisation enabled
(XEN) [    4.679875]  - Dom0 mode: Relaxed
(XEN) [    4.699869] Interrupt remapping enabled
(XEN) [    4.721409] nr_sockets: 1
(XEN) [    4.739503] ENABLING IO-APIC IRQs
(XEN) [    4.759444]  -> Using new ACK method
(XEN) [    4.780374] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2019-01-22 23:18:44.991] HVM: ASIDs enabled.
(XEN) [2019-01-22 23:18:45.001] SVM: Supported advanced features:
(XEN) [2019-01-22 23:18:45.010]  - Nested Page Tables (NPT)
(XEN) [2019-01-22 23:18:45.020]  - Last Branch Record (LBR) Virtualisation
(XEN) [2019-01-22 23:18:45.029]  - Next-RIP Saved on #VMEXIT
(XEN) [2019-01-22 23:18:45.039]  - Pause-Intercept Filter
(XEN) [2019-01-22 23:18:45.048] HVM: SVM enabled
(XEN) [2019-01-22 23:18:45.058] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-01-22 23:18:45.067] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2019-01-22 23:18:38.991] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:18:45.097] Adding cpu 1 to runqueue 0
(XEN) [2019-01-22 23:18:38.991] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:18:45.127] Adding cpu 2 to runqueue 0
(XEN) [2019-01-22 23:18:38.991] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:18:45.157] Adding cpu 3 to runqueue 0
(XEN) [2019-01-22 23:18:38.991] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:18:45.187] Adding cpu 4 to runqueue 0
(XEN) [2019-01-22 23:18:38.991] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-22 23:18:45.217] Adding cpu 5 to runqueue 0
(XEN) [2019-01-22 23:18:45.227] Brought up 6 CPUs
(XEN) [2019-01-22 23:18:45.240] build-id: a2d07921dfeed9e8af66a837936b5d24c5df646c
(XEN) [2019-01-22 23:18:45.250] Running stub recovery selftests...
(XEN) [2019-01-22 23:18:45.260] traps.c:1574: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080385412
(XEN) [2019-01-22 23:18:45.270] traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080385412
(XEN) [2019-01-22 23:18:45.280] traps.c:1094: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080385412
(XEN) [2019-01-22 23:18:45.311] ACPI sleep modes: S3
(XEN) [2019-01-22 23:18:45.321] VPMU: disabled
(XEN) [2019-01-22 23:18:45.331] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2019-01-22 23:18:45.341] mcheck_poll: Machine check polling timer started.
(XEN) [2019-01-22 23:18:45.352] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2019-01-22 23:18:45.362] Dom0 has maximum 632 PIRQs
(XEN) [2019-01-22 23:18:45.374] Multiple initrd candidates, picking module #1
(XEN) [2019-01-22 23:18:45.384] NX (Execute Disable) protection active
(XEN) [2019-01-22 23:18:45.394] *** Building a PVH Dom0 ***
(XEN) [2019-01-22 23:18:45.724] AMD-Vi: update_paging_mode Try to access pdev_list without aquiring pcidevs_lock.
(XEN) [2019-01-22 23:18:45.994] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.004] AMD-Vi: Setup I/O page table: device id = 0x2, type = 0x7, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.015] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.026] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.038] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.049] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.061] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.073] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.085] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.097] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.109] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.121] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:46.134] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.147] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.160] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.173] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:46.186] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.199] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.212] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.226] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.239] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.253] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.266] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.280] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.295] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.309] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.323] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.338] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.353] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.368] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.383] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.398] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.413] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.429] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.444] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.460] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.476] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.492] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.508] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.524] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.540] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.556] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.573] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.589] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.606] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.622] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.639] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.656] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:46.673] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.690] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.707] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.724] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.741] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.759] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.776] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.793] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.811] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.829] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.846] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.864] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.882] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.900] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.918] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.936] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.954] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:46.972] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:46.990] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.008] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.026] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.044] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.062] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.079] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.097] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.115] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.132] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.150] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.167] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.184] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.202] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.219] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:47.237] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.254] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.271] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.289] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.306] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.324] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.341] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.359] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.376] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.393] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.411] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.428] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.446] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.463] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.480] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.498] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.515] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.533] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.550] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.567] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.585] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.602] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.620] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.637] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.655] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.672] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.689] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.707] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.724] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.742] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.759] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.776] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:47.794] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.811] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.829] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.846] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.863] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.881] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.898] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.916] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.933] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.951] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:47.968] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:47.985] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.003] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.020] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.038] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.055] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.072] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.090] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.107] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.125] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.142] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.159] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.177] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.194] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.212] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.229] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.246] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.264] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.281] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.299] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.316] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.334] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:48.351] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.368] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.386] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.403] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.421] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.438] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.455] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.473] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.490] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.508] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.525] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.542] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.560] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.577] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.595] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.612] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.630] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.647] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.664] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.682] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.699] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.717] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.734] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.751] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.769] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.786] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.804] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.821] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.838] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.856] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.873] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.891] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:48.908] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.925] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.943] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.960] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:48.978] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:48.995] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.012] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.030] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.047] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.065] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.082] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.100] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.117] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.134] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.152] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.169] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.187] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.204] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.221] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.239] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.256] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.274] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.291] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.308] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.326] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:49.344] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.361] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.379] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:49.396] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:49.414] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:49.431] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:49.449] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:49.466] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:49.484] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.501] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.519] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:49.536] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:49.554] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:49.571] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:49.589] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:49.606] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:49.624] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.642] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.659] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:49.677] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:49.694] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:49.712] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:49.729] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:49.747] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:49.765] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.782] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.800] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:49.817] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:49.835] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:49.852] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:49.870] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:49.888] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:49.905] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:49.923] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:49.941] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:49.958] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:49.976] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:49.993] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:50.011] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:50.029] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:50.046] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:50.064] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.082] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:50.099] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:50.117] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.134] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.152] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.170] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.187] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:50.205] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.223] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:50.240] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:50.258] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.276] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.293] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.311] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.329] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:50.346] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.364] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:50.382] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:50.399] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.417] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.435] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.453] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.470] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:50.488] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.505] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.523] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:50.541] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:50.558] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.576] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.594] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.611] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.629] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:50.646] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.664] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:50.682] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:50.699] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.717] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.735] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:50.752] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:50.770] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:50.787] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:50.805] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = (XEN) [2019-01-22 23:18:52.942] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:52.960] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:52.977] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:52.995] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:53.013] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:18:53.030] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:53.048] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:53.065] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:53.083] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:53.101] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:53.118] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:53.136] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:53.153] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:53.171] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:53.189] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:53.206] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:53.224] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:53.241] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:53.259] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:53.277] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:53.294] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:53.312] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:53.329] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:53.347] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:53.365] AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:53.382] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:53.400] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:53.418] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:53.435] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:53.453] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:53.471] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:53.489] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:53.506] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:53.524] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:53.542] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:53.559] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:53.577] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:53.595] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:53.612] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:53.630] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:53.648] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:53.666] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:53.683] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:53.701] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:53.719] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:53.736] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:53.754] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:53.772] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:53.789] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:53.807] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:53.825] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:53.842] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:53.860] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:53.878] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:53.896] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:53.913] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:53.931] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:53.949] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:53.966] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:53.984] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:54.002] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:54.019] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:54.037] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:54.055] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:54.073] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:54.090] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:54.108] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:18:54.126] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:54.143] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:54.161] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:54.179] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:54.196] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:54.214] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:54.232] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:54.250] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:54.267] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:54.285] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:54.303] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:54.320] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:54.338] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:54.356] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:54.374] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:54.391] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:54.409] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:54.427] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:54.444] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:54.462] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:54.480] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:54.498] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:54.515] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:54.533] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:54.550] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:54.568] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:54.586] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:54.603] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:54.621] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:54.639] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:54.656] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:54.674] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:54.691] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:54.709] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:54.727] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:54.744] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:54.762] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:54.780] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:54.797] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:54.815] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:54.832] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:54.850] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:54.868] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:54.885] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:54.903] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:54.921] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:54.938] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:54.956] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:54.974] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:54.991] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:55.009] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:55.026] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:55.044] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:55.062] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:55.079] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:55.097] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:55.115] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:55.132] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:55.150] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:55.167] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:55.185] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:55.203] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:55.220] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:55.238] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:18:55.256] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:55.273] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:55.291] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:55.309] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:55.326] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:55.344] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:55.361] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:55.379] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:55.397] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:55.414] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:55.432] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:55.450] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:55.467] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:55.485] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:55.502] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:55.520] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:55.538] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:55.555] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:55.573] AMD-Vi: IO_PAGE_FAULT: domain = 0(XEN) [2019-01-22 23:18:57.711] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:57.729] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:57.747] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:57.764] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:57.782] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:57.800] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:57.817] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:57.835] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:57.852] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:57.870] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:57.888] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:57.905] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:57.923] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:57.941] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:57.958] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:57.976] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:57.993] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:58.011] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:58.029] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:58.046] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:58.064] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:58.082] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:58.099] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:58.117] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:58.135] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:58.152] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:58.170] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:58.187] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:58.205] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:58.223] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:58.240] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:58.258] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f40, flags = 0
(XEN) [2019-01-22 23:18:58.276] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f30, flags = 0x20
(XEN) [2019-01-22 23:18:58.293] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f40, flags = 0x20
(XEN) [2019-01-22 23:18:58.311] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f30, flags = 0x20
(XEN) [2019-01-22 23:18:58.328] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f40, flags = 0x20
(XEN) [2019-01-22 23:18:58.346] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:58.364] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:58.381] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:58.399] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:58.417] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:58.434] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:58.452] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:58.469] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:58.487] AMD-Vi: Setup I/O page table: device id = 0xa2, type = 0x7, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:18:58.505] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:58.523] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:58.540] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:58.558] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:58.576] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:58.594] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:58.611] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:58.629] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:58.647] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:58.664] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:18:58.682] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:58.700] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:58.718] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:58.735] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:58.753] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:58.771] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:58.788] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:58.806] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:58.824] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:58.842] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:58.859] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:58.877] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:58.895] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:58.912] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:58.930] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:58.948] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:58.966] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:58.983] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:59.001] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:59.019] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:59.036] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:59.054] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:59.072] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:59.090] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:59.107] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:59.125] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:59.143] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:59.161] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:59.178] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:59.196] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:59.214] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:59.231] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:59.249] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:59.267] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:59.285] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:59.302] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:59.320] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:59.338] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:59.355] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:59.373] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:59.391] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:59.409] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:18:59.426] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:59.444] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:59.462] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:18:59.479] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:18:59.497] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:18:59.515] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:59.533] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:59.550] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:59.568] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:59.586] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:18:59.604] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:18:59.621] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:59.639] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:59.657] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:59.674] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:59.692] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:59.709] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:59.727] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:59.745] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:18:59.762] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:18:59.780] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:18:59.798] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:18:59.815] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:59.833] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:59.851] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:18:59.868] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:18:59.886] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:18:59.903] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:18:59.921] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:18:59.939] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:18:59.956] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:18:59.974] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:18:59.992] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:00.009] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:00.027] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:00.045] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:00.062] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:00.080] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:00.097] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:00.115] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:00.133] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:00.150] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:00.168] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:00.186] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:00.203] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:00.221] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:00.239] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:00.256] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:00.274] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:00.291] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:00.309] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:00.327] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:00.344] AMD-Vi: IO_PAGE_FAULT: domain = 0, de(XEN) [2019-01-22 23:19:02.483] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:02.500] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:02.518] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:02.536] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:02.553] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:02.571] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:02.588] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:02.606] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:02.624] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:02.641] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:02.659] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:02.676] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:02.694] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:02.712] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:02.729] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:02.747] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:02.765] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:02.782] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:02.800] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:02.817] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:02.835] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:02.853] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:02.870] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:02.888] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:02.905] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:02.923] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:02.941] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:02.958] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:02.976] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:02.994] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:03.011] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:03.029] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:03.046] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:03.064] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:03.082] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:03.099] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:03.117] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:03.135] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:03.152] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:19:03.170] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:03.187] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:03.205] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:03.223] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:03.240] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:03.258] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:03.275] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:03.293] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:03.311] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:03.328] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:03.346] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:03.364] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:03.381] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:03.399] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:03.416] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:03.434] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:03.452] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:03.469] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:03.487] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:03.504] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:03.522] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:03.540] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:03.557] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:19:03.575] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:03.593] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:03.610] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:03.628] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:03.645] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:03.663] AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x463ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-22 23:19:03.681] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:03.699] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:03.716] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:03.734] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:03.752] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:03.769] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:03.787] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:03.805] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:19:03.823] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5180, flags = 0
(XEN) [2019-01-22 23:19:03.840] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5170, flags = 0x20
(XEN) [2019-01-22 23:19:03.858] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5180, flags = 0x20
(XEN) [2019-01-22 23:19:03.876] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5170, flags = 0x20
(XEN) [2019-01-22 23:19:03.893] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5180, flags = 0x20
(XEN) [2019-01-22 23:19:03.911] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:03.929] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:03.947] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:03.964] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:03.982] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:04.000] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:04.017] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:04.035] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:04.053] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:04.071] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:04.088] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:04.106] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:04.124] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:04.141] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:04.159] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:04.177] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:04.194] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:04.212] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:04.230] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:04.248] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:04.265] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:04.283] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:04.301] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:04.318] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:04.336] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:04.354] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:04.372] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:04.389] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:04.407] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:04.425] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:04.442] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:04.460] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:04.478] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:04.496] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:04.513] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:04.531] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:04.549] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:19:04.566] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:04.584] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:04.602] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:04.620] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:04.637] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:04.655] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:04.673] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:04.690] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:04.708] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:04.726] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:04.744] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:04.761] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:04.779] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:04.797] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:04.814] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:04.832] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:04.849] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:04.867] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:04.885] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:04.902] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:04.920] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:04.938] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:04.955] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:19:04.973] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:04.990] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:05.008] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:05.026] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:05.043] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:05.061] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:05.079] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:05.096] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:05.114] AMD-Vi: IO_PAGE_FAULT: domain = 0, device i(XEN) [2019-01-22 23:19:07.250] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:07.268] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:07.285] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:07.303] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:07.321] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:07.339] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:07.356] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:07.374] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:19:07.391] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:07.409] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:07.427] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:07.444] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:07.462] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:07.479] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:07.497] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:07.515] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:07.532] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:07.550] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:07.567] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:07.585] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:07.603] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:07.620] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:07.638] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:07.655] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:07.673] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:07.691] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:07.708] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:07.726] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:07.743] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:07.761] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:07.779] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:07.796] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:07.814] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:07.832] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:07.849] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:07.867] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:07.884] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:07.902] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:07.920] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:07.937] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:07.955] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:07.972] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:07.990] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:08.008] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:08.025] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:08.043] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:08.060] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:08.078] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:08.096] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:08.113] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:08.131] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:08.148] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:08.166] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:08.184] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:08.201] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:08.219] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:19:08.236] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:08.254] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:08.272] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:08.289] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:08.307] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:08.324] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:08.342] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:08.360] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:08.377] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:08.395] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:08.412] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:08.430] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5bc0, flags = 0
(XEN) [2019-01-22 23:19:08.448] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:08.465] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:08.483] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:08.500] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:08.518] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:08.536] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:08.553] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:08.571] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:08.588] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:08.606] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:08.624] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:08.641] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:19:08.659] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:08.676] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:08.694] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:08.712] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5130, flags = 0x20
(XEN) [2019-01-22 23:19:08.729] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0x20
(XEN) [2019-01-22 23:19:08.747] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:08.765] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:08.782] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:08.800] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:08.817] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:08.835] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:08.853] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:08.870] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:08.888] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:08.905] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:08.923] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:08.941] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:08.958] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:08.976] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:08.993] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:09.011] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:09.029] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:09.046] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:09.064] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:09.082] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:09.099] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:09.117] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:09.134] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:09.152] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:09.170] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:09.187] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:09.205] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:09.222] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:09.240] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:09.258] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:09.275] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:09.293] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:09.310] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:09.328] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:09.346] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:09.363] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:09.381] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:09.398] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:09.416] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:09.434] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:09.451] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:09.469] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:19:09.486] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:09.504] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:09.522] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:09.539] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:09.557] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:09.574] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:09.592] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:09.610] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:09.627] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:09.645] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:09.662] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:09.680] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:09.698] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:09.715] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5bc0, flags = 0
(XEN) [2019-01-22 23:19:09.733] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:09.750] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:09.768] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:09.786] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:09.803] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:09.821] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:09.838] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:09.856] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:09.873] AMD-Vi: IO_PAGE_FAULT: domain = 0, devi(XEN) [2019-01-22 23:19:12.002] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:12.020] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:12.038] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe57c0, flags = 0
(XEN) [2019-01-22 23:19:12.055] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:12.073] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:12.091] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:12.108] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:12.126] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:12.144] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:12.161] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:12.179] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:12.197] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:12.214] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:12.232] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe55c0, flags = 0
(XEN) [2019-01-22 23:19:12.250] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:12.268] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0
(XEN) [2019-01-22 23:19:12.285] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:12.303] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:12.321] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ef0, flags = 0x20
(XEN) [2019-01-22 23:19:12.338] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4f00, flags = 0x20
(XEN) [2019-01-22 23:19:12.356] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:12.374] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:12.391] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:12.409] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:12.427] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:12.444] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:12.462] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:12.480] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:12.497] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:12.515] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:12.533] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:12.551] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:12.568] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:12.586] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:12.604] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:12.621] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:12.639] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:12.657] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:12.674] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:12.692] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5140, flags = 0
(XEN) [2019-01-22 23:19:12.710] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5180, flags = 0
(XEN) [2019-01-22 23:19:12.727] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5170, flags = 0x20
(XEN) [2019-01-22 23:19:12.745] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5180, flags = 0x20
(XEN) [2019-01-22 23:19:12.763] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:12.780] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5170, flags = 0x20
(XEN) [2019-01-22 23:19:12.798] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5180, flags = 0x20
(XEN) [2019-01-22 23:19:12.816] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:12.834] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:12.851] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:12.869] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:12.887] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:12.904] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:12.922] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:12.940] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:12.957] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:12.975] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:12.993] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:13.010] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:13.028] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:13.046] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:13.063] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:13.081] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:13.099] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:13.116] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:13.134] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:13.151] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:13.169] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:13.187] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:13.204] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4e80, flags = 0
(XEN) [2019-01-22 23:19:13.222] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
(XEN) [2019-01-22 23:19:13.239] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:13.257] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:13.275] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4eb0, flags = 0x20
(XEN) [2019-01-22 23:19:13.292] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0x20
(XEN) [2019-01-22 23:19:13.310] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5780, flags = 0
(XEN) [2019-01-22 23:19:13.327] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50c0, flags = 0
(XEN) [2019-01-22 23:19:13.345] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0
(XEN) [2019-01-22 23:19:13.363] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:13.380] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:13.398] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b40, flags = 0
(XEN) [2019-01-22 23:19:13.415] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe50f0, flags = 0x20
(XEN) [2019-01-22 23:19:13.433] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x9a, fault address = 0xe5100, flags = 0x20
(XEN) [2019-01-22 23:19:13.451] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5540, flags = 0
(XEN) [2019-01-22 23:19:13.468] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x98, fault address = 0xe5740, flags = 0
(XEN) [2019-01-22 23:19:13.486] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0xa5, fault address = 0xe5b80, flags = 0
(XEN) [2019-01-22 23:19:13.503] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x90, fault address = 0xe5580, flags = 0
(XEN) [2019-01-22 23:19:13.521] AMD-Vi: IO_PAGE_FAULT: domain = 0, device id = 0x92, fault address = 0xe4ec0, flags = 0
--------------A70EEBBFE7A14EE55910A6D5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------A70EEBBFE7A14EE55910A6D5--
