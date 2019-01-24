From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Thu, 24 Jan 2019 12:55:06 +0100
Message-ID: <823f206d-1838-1ed9-0c9f-aaea5afaff3e@eikelenboom.it>
References: <20190118125058.4old2fc2zvzyue6f@mac>
 <afe9a3e2-5f4d-367a-7f16-02a4f4797e70@eikelenboom.it>
 <20190118175638.u7snykyof4awzirf@mac>
 <0a54429f-59a2-d9a2-a3d8-8177187ccad9@eikelenboom.it>
 <20190122161412.7eruziomkm3etpet@mac>
 <5ae1965e-9e31-b796-5a37-dfd211b3bd98@eikelenboom.it>
 <20190123182500.fc3nsnjisnbr6qbb@mac>
 <d9272bac-54d6-f4b3-7573-412ac0f048b3@eikelenboom.it>
 <20190124075021.pqwgywacacsun7zd@mac>
 <4da92f88-34ea-30fb-9ff2-5ef72455dab7@eikelenboom.it>
 <20190124101100.iuflmkbbuol3eluz@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------49EF4ECE078FD0005878639F"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O4/o=QA=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gmdZU-0007UC-T8
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 11:53:25 +0000
In-Reply-To: <20190124101100.iuflmkbbuol3eluz@mac>
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
--------------49EF4ECE078FD0005878639F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 24/01/2019 11:11, Roger Pau Monné wrote:
> On Thu, Jan 24, 2019 at 10:25:33AM +0100, Sander Eikelenboom wrote:
>> On 24/01/2019 08:50, Roger Pau Monné wrote:
>>> On Wed, Jan 23, 2019 at 08:56:48PM +0100, Sander Eikelenboom wrote:
>>>> On 23/01/2019 19:25, Roger Pau Monné wrote:
>>>>> On Wed, Jan 23, 2019 at 12:39:21AM +0100, Sander Eikelenboom wrote:
>>>>>> On 22/01/2019 17:14, Roger Pau Monné wrote:
>>>>>>> On Sun, Jan 20, 2019 at 11:09:25PM +0100, Sander Eikelenboom wrote:
>>>>>>>> On 18/01/2019 18:56, Roger Pau Monné wrote:
>>>>>>>>> On Fri, Jan 18, 2019 at 03:17:57PM +0100, Sander Eikelenboom wrote:
>>>>>>>>>> On 18/01/2019 13:50, Roger Pau Monné wrote:
>>>>>>>>>>> On Fri, Jan 18, 2019 at 01:03:04PM +0100, Sander Eikelenboom wrote:
>>>>>>>>>>>> Hi Roger,
>>>>>>>>>>>>
>>>>>>>>>>>> I gave PVH dom0 a spin, see how far I would get.
>>>>>>>>>>>
>>>>>>>>>>> Thanks!
>>>>>>>>>>>
>>>>>>>>>>>> With current xen-unstable unfortunately not that far, i got the splat below.
>>>>>>>>>>>
>>>>>>>>>>> Yes, this was already reported:
>>>>>>>>>>>
>>>>>>>>>>> https://lists.xenproject.org/archives/html/xen-devel/2019-01/msg01030.html
>>>>>>>>>>>> If you need more info, would like me to test a patch (or some other git tree/branch), 
>>>>>>>>>>>> I will be happy to give it a spin !
>>>>>>>>>>>
>>>>>>>>>>> Paul is working on a fix, but in the meantime just removing the
>>>>>>>>>>> assertions should be fine:
>>>>>>>>>>>
>>>>>>>>>>> ---8<---
>>>>>>>>>>> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
>>>>>>>>>>> index bd1af35a13..98e6fc35e2 100644
>>>>>>>>>>> --- a/xen/drivers/passthrough/iommu.c
>>>>>>>>>>> +++ b/xen/drivers/passthrough/iommu.c
>>>>>>>>>>> @@ -321,9 +321,6 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>>>>>>>>>      if ( !iommu_enabled || !hd->platform_ops )
>>>>>>>>>>>          return 0;
>>>>>>>>>>>  
>>>>>>>>>>> -    ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
>>>>>>>>>>> -    ASSERT(IS_ALIGNED(mfn_x(mfn), (1ul << page_order)));
>>>>>>>>>>> -
>>>>>>>>>>>      for ( i = 0; i < (1ul << page_order); i++ )
>>>>>>>>>>>      {
>>>>>>>>>>>          rc = hd->platform_ops->map_page(d, dfn_add(dfn, i), mfn_add(mfn, i),
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I gave that a spin and i now get a seemingly endless stream of IO_PAGE_FAULTs
>>>>>>>>>
>>>>>>>>> You shouldn't get those page faults since they are for addresses that
>>>>>>>>> belong to a reserved region, and that should be mapped into the p2m.
>>>>>>>>> I've just tested on my AMD box and I'm also seeing errors (albeit
>>>>>>>>> different ones), so I guess something broke since I last fixed PVH
>>>>>>>>> Dom0 to boot on AMD hardware.
>>>>>>>>>
>>>>>>>>> I've also tested commit:
>>>>>>>>>
>>>>>>>>> commit fad6ba64a8c98bebb9374f390cc255fac05237ab (HEAD)
>>>>>>>>> Author: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>>> Date:   Fri Nov 30 12:10:00 2018 +0100
>>>>>>>>> amd/iommu: skip host bridge devices when updating IOMMU page tables
>>>>>>>>>
>>>>>>>>> And it works on my AMD box and I'm able to boot as a PVH Dom0. Can you
>>>>>>>>> give this commit a spin?
>>>>>>>>>
>>>>>>>>> Thanks, Roger.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Roger,
>>>>>>>>
>>>>>>>> Tested that commit, but that didn't help.
>>>>>>>
>>>>>>> Thanks! Sorry for the delay, I got sidetracked with something else.
>>>>>>
>>>>>> No problem, it's not too urgent and probably a busy time with the remaining 4.12 stuff.
>>>>>>  
>>>>>>> Can you please post the serial log when using the above commit?
>>>>>>
>>>>>> Sure, I attached a log of:
>>>>>>  - fad6ba64a8c98bebb9374f390cc255fac05237ab  dom0 PVH unsuccesful boot
>>>>>>  - fad6ba64a8c98bebb9374f390cc255fac05237ab  dom0 PV    succesful boot
>>>>>
>>>>> Thanks. So you get the same IO page faults.
>>>>>
>>>>> I don't seem to be able to reproduce this behaviour on my AMD box, but
>>>>> that might be just luck. I've been finding some issues today related
>>>>> to the IOMMU, could you give the following patch a spin and paste the
>>>>> serial log that you get.
>>>>
>>>> Hi Roger,
>>>>
>>>> Sure, on top of what ?
>>>> - fad6ba64a8c98bebb9374f390cc255fac05237ab ?
>>>> - xen-unstable ?
>>>> - xen-unstable + Paul's patch ?
>>>
>>> Hello,
>>>
>>> Sorry for not proving the right context, let's try on top of
>>> xen-unstable + Paul's patch.
>>>
>>> Thanks, Roger.
>>>
>>
>> Seems to be giving the same result (stream of IO_PAGE_FAULTs), serial
>> log attached.
> 
> Thanks, I think I've figured out what's wrong. I've prepared a git
> branch for you to test:
> 
> git://xenbits.xen.org/people/royger/xen.git iommu-fixes
> 
> Could you give this a try?
> 
> Thanks, Roger.

Hi Roger,

The good news is, with that branch, dom0 boots on both PVH and PV !
The bad news is, I can't boot up a PVH guest (but perhaps this warrants a separate mail thread / change of subject):

xc: error: panic: xc_dom_boot.c:159: xc_dom_boot_domU_map: failed to mmap domU pages 0x1000+0x2426 [mmap, errno=22 (Invalid argument)]: Internal error
libxl: error: libxl_dom.c:760:libxl__build_dom: xc_dom_build_image failed: Invalid argument
libxl: error: libxl_create.c:1286:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
libxl: error: libxl_domain.c:1038:libxl__destroy_domid: Domain 1:Non-existant domain
libxl: error: libxl_domain.c:993:domain_destroy_callback: Domain 1:Unable to destroy guest
libxl: error: libxl_domain.c:920:domain_destroy_cb: Domain 1:Destruction of domain failed

There is more in the attached serial.log

Thanks so far !

--
Sander



--------------49EF4ECE078FD0005878639F
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
                                                      
(XEN) [0000001a41372175] Xen version 4.12.0-rc (root@dyndns.org) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Thu Jan 24 12:07:44 CET 2019
(XEN) [0000001a48a77436] Latest ChangeSet: Thu Jan 24 11:06:47 2019 +0100 git:01d35e14c2
(XEN) [0000001a4d1e0dfe] Bootloader: GRUB 2.02~beta3-5+deb9u1
(XEN) [0000001a503dc5b8] Command line: dom0_mem=2048M,max:2048M loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64 dom0=pvh
(XEN) [0000001a5e5ff47d] Xen image load base address: 0
(XEN) [0000001a61339ec3] Video information:
(XEN) [0000001a636ee26d]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [0000001a66b4c53a]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [0000001a6a93162e] Disc information:
(XEN) [0000001a6cc1a8c3]  Found 4 MBR signatures
(XEN) [0000001a6f3c5a0a]  Found 4 EDD information structures
(XEN) [0000001a724f91e8] Xen-e820 RAM map:
(XEN) [0000001a747e2472]  0000000000000000 - 0000000000096400 (usable)
(XEN) [0000001a7810319a]  0000000000096400 - 00000000000a0000 (reserved)
(XEN) [0000001a7bbb9b2b]  00000000000e4000 - 0000000000100000 (reserved)
(XEN) [0000001a7f670945]  0000000000100000 - 00000000c7f90000 (usable)
(XEN) [0000001a82f93525]  00000000c7f90000 - 00000000c7f9e000 (ACPI data)
(XEN) [0000001a86b14f65]  00000000c7f9e000 - 00000000c7fe0000 (ACPI NVS)
(XEN) [0000001a8a5cb95a]  00000000c7fe0000 - 00000000c8000000 (reserved)
(XEN) [0000001a8e082712]  00000000ffe00000 - 0000000100000000 (reserved)
(XEN) [0000001a91b3b5f2]  0000000100000000 - 0000000538000000 (usable)
(XEN) [0000001a9abdfe7a] New Xen image base address: 0xc7800000
(XEN) [0000001a9df7266b] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [0000001aa123c1a2] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001aa5e67935] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001aaaa9300a] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [0000001aaf6bfffb] ACPI: FACS C7F9E000, 0040
(XEN) [0000001ab20026d5] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001ab6c2d34e] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000001abb859b95] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001ac0486343] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001ac50b2e83] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [0000001ac9cddd4a] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000001ace90af15] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [0000001ad35361c8] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000001ad8162600] System RAM: 20479MB (20970648kB)
(XEN) [0000001ae24a227a] SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) [0000001ae537405a] SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) [0000001ae8243a7e] SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) [0000001aeb113445] SRAT: PXM 0 -> APIC 03 -> Node 0
(XEN) [0000001aedfe4cd0] SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) [0000001af0eb4512] SRAT: PXM 0 -> APIC 05 -> Node 0
(XEN) [0000001af3d84aab] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000001af67924d2] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000001af97fa625] SRAT: Node 0 PXM 0 100000000-538000000
(XEN) [0000001afcb8d9fd] NUMA: Allocated memnodemap from 5334dc000 - 5334e2000
(XEN) [0000001b00b0774d] NUMA: Using 8 for the hash shift.
(XEN) [0000001b4815ef5e] Domain heap initialised
(XEN) [0000001b4a90a2f5] Allocated console ring of 128 KiB.
(XEN) [0000001b60b51cb0] vesafb: framebuffer at 0xd0000000, mapped to 0xffff82c000201000, using 6144k, total 16384k
(XEN) [0000001b66827e08] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [0000001b6aa019a3] vesafb: Truecolor: size=0:8:8:8, shift=0:16:8:0
(XEN) [0000001b6e4c5b3e] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [0000001b785e3d98] found SMP MP-table at 000ff780
(XEN) [0000001b7b31ac8a] DMI present.
(XEN) [0000001b7d20d8fd] Using APIC driver default
(XEN) [0000001b7fb4f40d] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [0000001b82fad4fe] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [0000001b8731e8f8] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [0000001b8b1ced9b] ACPI: Local APIC address 0xfee00000
(XEN) [0000001b8e3008fb] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) [0000001b92018af2] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) [0000001b95d31802] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
(XEN) [0000001b99a496c2] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) [0000001b9d7613ea] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
(XEN) [0000001ba147bace] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
(XEN) [0000001ba5192a80] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [0000001ba92a30cb] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [0000001bad942a48] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [0000001bb1b1d142] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000001bb6287536] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000001bba462ee3] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [0000001bbe7d2e0d] ACPI: IRQ0 used by override.
(XEN) [0000001bc137758e] ACPI: IRQ2 used by override.
(XEN) [0000001bc3f1b3be] ACPI: IRQ9 used by override.
(XEN) [0000001bc6abef6e] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [0000001bca3e0773] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [0000001bcd772dd8] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [0000001bd2209dad] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000001bd5bf4652] ERST table was not found
(XEN) [0000001bd846d3c5] Using ACPI (MADT) for SMP configuration information
(XEN) [0000001bdc251332] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [0000001bdf518382] IRQ limits: 56 GSI, 1112 MSI/MSI-X
(XEN) [0000001be257ebae] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc
(XEN) [0000001be6a8690b] traps.c:1574: GPF (0000): ffff82d080425cd6 [probe_cpuid_faulting+0xe/0xa2] -> ffff82d0803808b2
(XEN) [0000001beca8945a] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [0000001bf060c28a] Speculative mitigation facilities:
(XEN) [0000001bf367301b]   Hardware features:
(XEN) [0000001bf5bbc8f3]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [0000001bf99a15ee]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN) [0000001bfdab1f98]   Support for HVM VMs: RSB
(XEN) [0000001c004bf6a0]   Support for PV VMs: RSB
(XEN) [0000001c02e023fa]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [0000001c07961cee]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [0000001c0b5ae91a] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000001c0f45f2cb] Initializing Credit2 scheduler
(XEN) [0000001c12197a2e]  load_precision_shift: 18
(XEN) [0000001c14ada5e3]  load_window_shift: 30
(XEN) [0000001c171bc86b]  underload_balance_tolerance: 0
(XEN) [0000001c19fc1aa8]  overload_balance_tolerance: -3
(XEN) [0000001c1cdc615b]  runqueues arrangement: socket
(XEN) [0000001c1fb02183]  cap enforcement granularity: 10ms
(XEN) [0000001c22b670fe] load tracking window length 1073741824 ns
(XEN) [0000001c2615c9a0] Adding cpu 0 to runqueue 0
(XEN) [0000001c28b6a858]  First cpu on runqueue, activating
(XEN) [0000001c3535e28e] Platform timer is 14.318MHz HPET
(XEN) [    3.031978] Detected 3200.147 MHz processor.
(XEN) [    3.048437] Initing memory sharing.
(XEN) [    3.060395] alt table ffff82d080467c70 -> ffff82d080469a92
(XEN) [    3.079075] AMD-Vi: Found MSI capability block at 0x54
(XEN) [    3.095975] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.118073] AMD-Vi: Using IVHD type 0x10
(XEN) [    3.131333] AMD-Vi: ACPI Table:
(XEN) [    3.142252] AMD-Vi:  Signature IVRS
(XEN) [    3.154210] AMD-Vi:  Length 0x108
(XEN) [    3.165651] AMD-Vi:  Revision 0x1
(XEN) [    3.185839] AMD-Vi:  CheckSum 0x65
(XEN) [    3.206208] AMD-Vi:  OEM_Id AMD  
(XEN) [    3.226306] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.248235] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.270645] AMD-Vi:  Creator_Id AMD 
(XEN) [    3.291420] AMD-Vi:  Creator_Revision 0
(XEN) [    3.312895] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.341961] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.368934] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.391450] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.419165] AMD-Vi: IVHD Device Entry: type 0x3 id 0xe00 flags 0
(XEN) [    3.447140] AMD-Vi:  Dev_Id Range: 0xe00 -> 0xe01
(XEN) [    3.471177] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.498852] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.526774] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.554398] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.582268] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.609840] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.637645] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.665165] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.692959] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.720531] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    3.748414] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    3.772384] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    3.800048] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    3.827892] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    3.855710] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    3.883569] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    3.911413] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    3.939270] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    3.966907] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    3.994766] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    4.018606] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    4.046061] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.073490] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.096786] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.124240] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.147484] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.175704] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.203199] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.230638] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.258094] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.286070] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.312732] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.340212] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.367745] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.395317] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.423188] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.450836] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.474327] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.500677] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.528625] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.557407] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.584651] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.614187] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.642020] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.669994] I/O virtualisation enabled
(XEN) [    4.691288]  - Dom0 mode: Relaxed
(XEN) [    4.711189] Interrupt remapping enabled
(XEN) [    4.732612] nr_sockets: 1
(XEN) [    4.750616] ENABLING IO-APIC IRQs
(XEN) [    4.770543]  -> Using new ACK method
(XEN) [    4.791446] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2019-01-24 11:43:09.683] HVM: ASIDs enabled.
(XEN) [2019-01-24 11:43:09.693] SVM: Supported advanced features:
(XEN) [2019-01-24 11:43:09.702]  - Nested Page Tables (NPT)
(XEN) [2019-01-24 11:43:09.712]  - Last Branch Record (LBR) Virtualisation
(XEN) [2019-01-24 11:43:09.721]  - Next-RIP Saved on #VMEXIT
(XEN) [2019-01-24 11:43:09.731]  - Pause-Intercept Filter
(XEN) [2019-01-24 11:43:09.740] HVM: SVM enabled
(XEN) [2019-01-24 11:43:09.749] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-01-24 11:43:09.759] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2019-01-24 11:43:03.974] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 11:43:09.789] Adding cpu 1 to runqueue 0
(XEN) [2019-01-24 11:43:03.974] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 11:43:09.818] Adding cpu 2 to runqueue 0
(XEN) [2019-01-24 11:43:03.974] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 11:43:09.848] Adding cpu 3 to runqueue 0
(XEN) [2019-01-24 11:43:03.974] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 11:43:09.878] Adding cpu 4 to runqueue 0
(XEN) [2019-01-24 11:43:03.974] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-01-24 11:43:09.908] Adding cpu 5 to runqueue 0
(XEN) [2019-01-24 11:43:09.917] Brought up 6 CPUs
(XEN) [2019-01-24 11:43:09.931] build-id: c2c52a7048eabd1b067ea605826f1dd68abbbde5
(XEN) [2019-01-24 11:43:09.941] Running stub recovery selftests...
(XEN) [2019-01-24 11:43:09.950] traps.c:1574: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-01-24 11:43:09.960] traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080380412
(XEN) [2019-01-24 11:43:09.970] traps.c:1094: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-01-24 11:43:10.001] ACPI sleep modes: S3
(XEN) [2019-01-24 11:43:10.011] VPMU: disabled
(XEN) [2019-01-24 11:43:10.021] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2019-01-24 11:43:10.031] mcheck_poll: Machine check polling timer started.
(XEN) [2019-01-24 11:43:10.041] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2019-01-24 11:43:10.051] Dom0 has maximum 632 PIRQs
(XEN) [2019-01-24 11:43:10.063] Multiple initrd candidates, picking module #1
(XEN) [2019-01-24 11:43:10.073] NX (Execute Disable) protection active
(XEN) [2019-01-24 11:43:10.083] *** Building a PVH Dom0 ***
(XEN) [2019-01-24 11:43:10.176] AMD-Vi: update_paging_mode Try to access pdev_list without aquiring pcidevs_lock.
(XEN) [2019-01-24 11:43:10.425] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.436] AMD-Vi: Setup I/O page table: device id = 0x2, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.447] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.458] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.469] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.480] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.492] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.504] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.515] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.528] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.540] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.552] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.565] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.578] AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.591] AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.604] AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.617] AMD-Vi: Setup I/O page table: device id = 0xa2, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.630] AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.644] AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.658] AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.672] AMD-Vi: Setup I/O page table: device id = 0xa8, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.686] AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.701] AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.715] AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) [2019-01-24 11:43:10.730] AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) [2019-01-24 11:43:10.744] AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) [2019-01-24 11:43:10.759] AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) [2019-01-24 11:43:10.774] AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) [2019-01-24 11:43:10.788] AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.804] AMD-Vi: Setup I/O page table: device id = 0x401, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.819] AMD-Vi: Setup I/O page table: device id = 0x402, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.835] AMD-Vi: Setup I/O page table: device id = 0x403, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.850] AMD-Vi: Setup I/O page table: device id = 0x404, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.866] AMD-Vi: Setup I/O page table: device id = 0x405, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.883] AMD-Vi: Setup I/O page table: device id = 0x406, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.899] AMD-Vi: Setup I/O page table: device id = 0x407, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.916] AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.932] AMD-Vi: Setup I/O page table: device id = 0x608, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.949] AMD-Vi: Setup I/O page table: device id = 0x610, type = 0x2, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.966] AMD-Vi: Setup I/O page table: device id = 0x700, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:10.983] AMD-Vi: Setup I/O page table: device id = 0x800, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.001] AMD-Vi: Setup I/O page table: device id = 0x900, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.018] AMD-Vi: Setup I/O page table: device id = 0x901, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.036] AMD-Vi: Setup I/O page table: device id = 0x902, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.054] AMD-Vi: Setup I/O page table: device id = 0x903, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.071] AMD-Vi: Setup I/O page table: device id = 0x904, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.090] AMD-Vi: Setup I/O page table: device id = 0x905, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.108] AMD-Vi: Setup I/O page table: device id = 0x906, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.126] AMD-Vi: Setup I/O page table: device id = 0x907, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.145] AMD-Vi: Setup I/O page table: device id = 0xa00, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.164] AMD-Vi: Setup I/O page table: device id = 0xb00, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.182] AMD-Vi: Setup I/O page table: device id = 0xc00, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.201] AMD-Vi: Setup I/O page table: device id = 0xd00, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.220] AMD-Vi: Setup I/O page table: device id = 0xe00, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.296] AMD-Vi: Setup I/O page table: device id = 0xe01, type = 0x1, root table = 0x423ae7000, domain = 0, paging mode = 3
(XEN) [2019-01-24 11:43:11.639] WARNING: PVH is an experimental mode with limited functionality
(XEN) [2019-01-24 11:43:11.658] Initial low memory virq threshold set at 0x4000 pages.
(XEN) [2019-01-24 11:43:11.678] Scrubbing Free RAM in background
(XEN) [2019-01-24 11:43:11.697] Std. Loglevel: All
(XEN) [2019-01-24 11:43:11.716] Guest Loglevel: All
(XEN) [2019-01-24 11:43:11.735] Xen is relinquishing VGA console.
(XEN) [2019-01-24 11:43:11.837] *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) [2019-01-24 11:43:11.838] Freed 476kB init memory
(XEN) [2019-01-24 11:43:12.125] Dom0 callback via changed to Direct Vector 0xf3
[    0.000000] Linux version 4.20.2-20190115-thp-doflr+ (root@serveerstertje) (gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Tue Jan 15 11:51:49 CET 2019
[    0.000000] Command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000095fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000096400-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000080069ed7] usable
[    0.000000] BIOS-e820: [mem 0x0000000080069ed8-0x0000000080069f8f] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000008006a000-0x00000000c7f8ffff] unusable
[    0.000000] BIOS-e820: [mem 0x00000000c7f90000-0x00000000c7f9dfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000c7f9e000-0x00000000c7fdffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000c7fe0000-0x00000000c7ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000537ffffff] unusable
[    0.000000] e820: remove [mem 0x80000000-0xfffffffffffffffe] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x0000000000095fff] usable
[    0.000000] user: [mem 0x0000000000096400-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x000000007fffffff] usable
[    0.000000] user: [mem 0x0000000080069ed8-0x0000000080069f8f] ACPI data
[    0.000000] user: [mem 0x000000008006a000-0x00000000c7f8ffff] unusable
[    0.000000] user: [mem 0x00000000c7f90000-0x00000000c7f9dfff] ACPI data
[    0.000000] user: [mem 0x00000000c7f9e000-0x00000000c7fdffff] ACPI NVS
[    0.000000] user: [mem 0x00000000c7fe0000-0x00000000c7ffffff] reserved
[    0.000000] user: [mem 0x00000000ffe00000-0x00000000ffffffff] reserved
[    0.000000] user: [mem 0x0000000100000000-0x0000000537ffffff] unusable
[    0.000000] SMBIOS 2.5 present.
[    0.000000] DMI: MSI MS-7640/890FXA-GD70 (MS-7640)  , BIOS V1.8B1 09/13/2010
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.12.
[    0.000006] HVMOP_pagetable_dying not supported
[    0.052065] tsc: Fast TSC calibration failed
[    0.052066] tsc: Detected 3200.146 MHz processor
[    0.062147] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.062148] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.077044] AGP: No AGP bridge found
[    0.077179] last_pfn = 0x80000 max_arch_pfn = 0x400000000
[    0.077236] MTRR default type: uncachable
[    0.077238] MTRR fixed ranges enabled:
[    0.077239]   00000-9FFFF write-back
[    0.077240]   A0000-EFFFF uncachable
[    0.077241]   F0000-FFFFF write-protect
[    0.077242] MTRR variable ranges enabled:
[    0.077243]   0 base 000000000000 mask FFFF80000000 write-back
[    0.077245]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.077246]   2 base 0000C0000000 mask FFFFF8000000 write-back
[    0.077247]   3 disabled
[    0.077248]   4 disabled
[    0.077248]   5 disabled
[    0.077249]   6 disabled
[    0.077250]   7 disabled
[    0.077250] TOM2: 0000000538000000 aka 21376M
[    0.083288] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.085462] e820: update [mem 0xc8000000-0xffffffff] usable ==> reserved
[    0.085494] check: Scanning 1 areas for low memory corruption
[    0.085499] Base memory trampoline at [(____ptrval____)] 90000 size 24576
[    0.085517] Using GB pages for direct mapping
[    0.085520] BRK [0x03401000, 0x03401fff] PGTABLE
[    0.085523] BRK [0x03402000, 0x03402fff] PGTABLE
[    0.085525] BRK [0x03403000, 0x03403fff] PGTABLE
[    0.085730] RAMDISK: [mem 0x03426000-0x04d80fff]
[    0.085744] ACPI: Early table checksum verification disabled
[    0.085749] ACPI: RSDP 0x0000000080069ED8 000024 (v02 ACPIAM)
[    0.085752] ACPI: XSDT 0x0000000080069EFC 00004C (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.085758] ACPI: APIC 0x0000000080069F48 0000B8 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.085763] ACPI: FACP 0x00000000C7F90200 000084 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.085791] ACPI: DSDT 0x00000000C7F905E0 009427 (v01 A7640  A7640100 00000100 INTL 20051117)
[    0.085794] ACPI: FACS 0x00000000C7F9E000 000040
[    0.085798] ACPI: MCFG 0x00000000C7F90420 00003C (v01 7640MS OEMMCFG  20100913 MSFT 00000097)
[    0.085803] ACPI: SLIC 0x00000000C7F90460 000176 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.085807] ACPI: SSDT 0x00000000C7F9A840 000DA4 (v01 A M I  POWERNOW 00000001 AMD  00000001)
[    0.085820] ACPI: Local APIC address 0xfee00000
[    0.085971] Scanning NUMA topology in Northbridge 24
[    0.086002] No NUMA configuration found
[    0.086003] Faking a node at [mem 0x0000000000000000-0x000000007fffffff]
[    0.086009] NODE_DATA(0) allocated [mem 0x7fff6000-0x7fffffff]
[    0.086032] Zone ranges:
[    0.086033]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.086034]   DMA32    [mem 0x0000000001000000-0x000000007fffffff]
[    0.086035]   Normal   empty
[    0.086037] Movable zone start for each node
[    0.086038] Early memory node ranges
[    0.086039]   node   0: [mem 0x0000000000001000-0x0000000000095fff]
[    0.086040]   node   0: [mem 0x0000000000100000-0x000000007fffffff]
[    0.086045] Zeroed struct page in unavailable ranges: 107 pages
[    0.086046] Initmem setup node 0 [mem 0x0000000000001000-0x000000007fffffff]
[    0.086048] On node 0 totalpages: 524181
[    0.086049]   DMA zone: 64 pages used for memmap
[    0.086050]   DMA zone: 21 pages reserved
[    0.086051]   DMA zone: 3989 pages, LIFO batch:0
[    0.086748]   DMA32 zone: 8128 pages used for memmap
[    0.086749]   DMA32 zone: 520192 pages, LIFO batch:63
[    0.104680] ACPI: PM-Timer IO Port: 0x808
[    0.104684] ACPI: Local APIC address 0xfee00000
[    0.104753] IOAPIC[0]: apic_id 6, version 17, address 0xfec00000, GSI 0-23
[    0.104792] IOAPIC[1]: apic_id 7, version 17, address 0xfec20000, GSI 24-55
[    0.104796] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.104798] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.104799] ACPI: IRQ0 used by override.
[    0.104801] ACPI: IRQ9 used by override.
[    0.104803] Using ACPI (MADT) for SMP configuration information
[    0.104811] smpboot: Allowing 6 CPUs, 0 hotplug CPUs
[    0.104829] [mem 0xc8000000-0xffdfffff] available for PCI devices
[    0.104830] Booting paravirtualized kernel on Xen PVH
[    0.104835] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.253934] random: get_random_bytes called from start_kernel+0x91/0x443 with crng_init=0
[    0.253944] setup_percpu: NR_CPUS:6 nr_cpumask_bits:6 nr_cpu_ids:6 nr_node_ids:1
[    0.254735] percpu: Embedded 43 pages/cpu @(____ptrval____) s139032 r8192 d28904 u262144
[    0.254740] pcpu-alloc: s139032 r8192 d28904 u262144 alloc=1*2097152
[    0.254741] pcpu-alloc: [0] 0 1 2 3 4 5 - - 
[    0.254795] xen: PV spinlocks enabled
[    0.254799] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
[    0.254805] Built 1 zonelists, mobility grouping on.  Total pages: 515968
[    0.254806] Policy zone: DMA32
[    0.254808] Kernel command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.255001] You have booted with nomodeset. This means your GPU drivers are DISABLED
[    0.255002] Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly
[    0.255003] Unless you actually understand what nomodeset does, you should reboot without enabling it
[    0.255090] AGP: Checking aperture...
[    0.270078] AGP: No AGP bridge found
[    0.270087] AGP: Node 0: aperture [bus addr 0x46e000000-0x46fffffff] (32MB)
[    0.270088] Aperture beyond 4GB. Ignoring.
[    0.282529] Memory: 1999828K/2096724K available (18436K kernel code, 1355K rwdata, 5148K rodata, 1360K init, 2428K bss, 96896K reserved, 0K cma-reserved)
[    0.282605] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.282691] rcu: Hierarchical RCU implementation.
[    0.282694] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.282714] Using NULL legacy PIC
[    0.282716] NR_IRQS: 4352, nr_irqs: 1016, preallocated irqs: 0
[    0.282834] xen:events: Using FIFO-based ABI
[    0.282862] xen:events: Xen HVM callback vector for event delivery is enabled
[    0.282917] Console: colour dummy device 80x25
[    0.283099] printk: console [tty0] enabled
[    0.285008] printk: console [hvc0] enabled
[    0.285035] ACPI: Core revision 20181003
[    0.289292] Failed to register legacy timer interrupt
[    0.289321] APIC: Switch to symmetric I/O mode setup
[    0.289501] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2e20d3dff46, max_idle_ns: 440795288937 ns
[    0.289539] Calibrating delay loop (skipped), value calculated using timer frequency.. 6402.97 BogoMIPS (lpj=10667153)
[    0.289564] pid_max: default: 32768 minimum: 301
[    0.290290] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.290669] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.290716] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.290745] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.291080] mce: CPU supports 2 MCE banks
[    0.291123] process: using AMD E400 aware idle routine
[    0.291140] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
[    0.291154] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
[    0.291171] Spectre V2 : Mitigation: Full AMD retpoline
[    0.291185] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.291397] Freeing SMP alternatives memory: 52K
[    0.292861] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.292861] Xen: using vcpuop timer interface
[    0.292861] installing Xen timer for CPU 0
[    0.292861] smpboot: CPU0: AMD Phenom(tm) II X6 1090T Processor (family: 0x10, model: 0xa, stepping: 0x0)
[    0.292861] cpu 0 spinlock event irq 29
[    0.292861] Performance Events: PMU not available due to virtualization, using software events only.
[    0.292861] rcu: Hierarchical SRCU implementation.
[    0.292861] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.292861] smp: Bringing up secondary CPUs ...
[    0.292861] installing Xen timer for CPU 1
[    0.292861] x86: Booting SMP configuration:
[    0.292861] .... node  #0, CPUs:      #1
[    0.295270] cpu 1 spinlock event irq 35
[    0.295270] installing Xen timer for CPU 2
[    0.295270]  #2
[    0.299614] cpu 2 spinlock event irq 41
[    0.299700] installing Xen timer for CPU 3
[    0.299799]  #3
[    0.305275] cpu 3 spinlock event irq 47
[    0.305275] installing Xen timer for CPU 4
[    0.305275]  #4
[    0.396298] cpu 4 spinlock event irq 53
[    0.396350] installing Xen timer for CPU 5
[    0.396470]  #5
[    0.401854] cpu 5 spinlock event irq 59
[    0.401854] smp: Brought up 1 node, 6 CPUs
[    0.401854] smpboot: Max logical packages: 2
[    0.401854] smpboot: Total of 6 processors activated (38434.53 BogoMIPS)
[    0.403088] devtmpfs: initialized
[    0.403977] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.404018] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.404170] xor: measuring software checksum speed
[    0.436200]    prefetch64-sse: 16962.000 MB/sec
[    0.469535]    generic_sse: 16267.200 MB/sec
[    0.469549] xor: using function: prefetch64-sse (16962.000 MB/sec)
[    0.470019] NET: Registered protocol family 16
[    0.470055] xen:grant_table: Grant tables using version 1 layout
[    0.470098] Grant table initialized
[    0.470575] cpuidle: using governor ladder
[    0.470575] random: fast init done
[    0.470575] cpuidle: using governor menu
[    0.470575] node 0 link 0: io port [1000, ffffff]
[    0.470575] TOM: 00000000c8000000 aka 3200M
[    0.470575] Fam 10h mmconf [mem 0xe0000000-0xefffffff]
[    0.470575] node 0 link 0: mmio [e0000000, efffffff] ==> none
[    0.470575] node 0 link 0: mmio [f0000000, ffffffff]
[    0.470575] node 0 link 0: mmio [a0000, bffff]
[    0.470575] node 0 link 0: mmio [c8000000, dfffffff]
[    0.470575] TOM2: 0000000538000000 aka 21376M
[    0.470575] bus: [bus 00-07] on node 0 link 0
[    0.470575] bus: 00 [io  0x0000-0xffff]
[    0.470575] bus: 00 [mem 0xf0000000-0xffffffff]
[    0.470575] bus: 00 [mem 0x000a0000-0x000bffff]
[    0.470575] bus: 00 [mem 0xc8000000-0xdfffffff]
[    0.470575] bus: 00 [mem 0x538000000-0xfcffffffff]
[    0.470575] ACPI: bus type PCI registered
[    0.470575] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.470575] PCI: not using MMCONFIG
[    0.470575] PCI: Using configuration type 1 for base access
[    0.470575] PCI: Using configuration type 1 for extended access
[    0.478764] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.478764] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.478764] cryptd: max_cpu_qlen set to 1000
[    0.532887] raid6: sse2x1   gen()  3878 MB/s
[    0.590515] raid6: sse2x1   xor()  4925 MB/s
[    0.648272] raid6: sse2x2   gen()  6499 MB/s
[    0.706032] raid6: sse2x2   xor()  8415 MB/s
[    0.760312] raid6: sse2x4   gen()  7037 MB/s
[    0.817976] raid6: sse2x4   xor()  3966 MB/s
[    0.817992] raid6: using algorithm sse2x4 gen() 7037 MB/s
[    0.818006] raid6: .... xor() 3966 MB/s, rmw enabled
[    0.818020] raid6: using intx1 recovery algorithm
[    0.819554] ACPI: Added _OSI(Module Device)
[    0.819554] ACPI: Added _OSI(Processor Device)
[    0.819554] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.819554] ACPI: Added _OSI(Processor Aggregator Device)
[    0.819554] ACPI: Added _OSI(Linux-Dell-Video)
[    0.819554] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.826503] ACPI: 2 ACPI AML tables successfully acquired and loaded
(XEN) [2019-01-24 11:43:12.742] d0: bind: m_gsi=9 g_gsi=9
[    0.827717] ACPI: Interpreter enabled
[    0.827717] ACPI: (supports S0 S5)
[    0.827717] ACPI: Using IOAPIC for interrupt routing
[    0.827717] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.830227] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
[    0.830295] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.830458] ACPI: Enabled 9 GPEs in block 00 to 1F
[    0.837635] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.837680] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.837998] acpi PNP0A03:00: _OSC: platform does not support [LTR]
[    0.838261] acpi PNP0A03:00: _OSC: OS now controls [PME AER PCIeCapability]
[    0.838444] PCI host bridge to bus 0000:00
[    0.838462] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.838479] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.838498] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.838517] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000dffff window]
[    0.838539] pci_bus 0000:00: root bus resource [mem 0xc8000000-0xdfffffff window]
[    0.838575] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfebfffff window]
[    0.838598] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.838614] pci_bus 0000:00: scanning bus
[    0.838661] pci 0000:00:00.0: [1002:5a11] type 00 class 0x060000
[    0.838959] pci 0000:00:00.0: Failed to add - passthrough o[    3.811979] Freeing initrd memory: 25964K
[    3.812122] agpgart-amd64 0000:00:00.0: runtime IRQ mapping not provided by arch
[    3.812294] agpgart-amd64 0000:00:00.2: runtime IRQ mapping not provided by arch
[    3.812368] agpgart-amd64 0000:00:02.0: runtime IRQ mapping not provided by arch
[    3.812444] agpgart-amd64 0000:00:03.0: runtime IRQ mapping not provided by arch
[    3.812514] agpgart-amd64 0000:00:05.0: runtime IRQ mapping not provided by arch
[    3.812596] agpgart-amd64 0000:00:06.0: runtime IRQ mapping not provided by arch
[    3.812658] agpgart-amd64 0000:00:09.0: runtime IRQ mapping not provided by arch
[    3.812723] agpgart-amd64 0000:00:0a.0: runtime IRQ mapping not provided by arch
[    3.812789] agpgart-amd64 0000:00:0c.0: runtime IRQ mapping not provided by arch
[    3.812851] agpgart-amd64 0000:00:0d.0: runtime IRQ mapping not provided by arch
[    3.812939] agpgart-amd64 0000:00:11.0: runtime IRQ mapping not provided by arch
[    3.813002] agpgart-amd64 0000:00:12.0: runtime IRQ mapping not provided by arch
[    3.813056] agpgart-amd64 0000:00:12.2: runtime IRQ mapping not provided by arch
[    3.813119] agpgart-amd64 0000:00:13.0: runtime IRQ mapping not provided by arch
[    3.813173] agpgart-amd64 0000:00:13.2: runtime IRQ mapping not provided by arch
[    3.813233] agpgart-amd64 0000:00:14.0: runtime IRQ mapping not provided by arch
[    3.813287] agpgart-amd64 0000:00:14.3: runtime IRQ mapping not provided by arch
[    3.813342] agpgart-amd64 0000:00:14.4: runtime IRQ mapping not provided by arch
[    3.813395] agpgart-amd64 0000:00:14.5: runtime IRQ mapping not provided by arch
[    3.813450] agpgart-amd64 0000:00:15.0: runtime IRQ mapping not provided by arch
[    3.813516] agpgart-amd64 0000:00:16.0: runtime IRQ mapping not provided by arch
[    3.813570] agpgart-amd64 0000:00:16.2: runtime IRQ mapping not provided by arch
[    3.813630] agpgart-amd64 0000:00:18.0: runtime IRQ mapping not provided by arch
[    3.813686] agpgart-amd64 0000:00:18.1: runtime IRQ mapping not provided by arch
[    3.813739] agpgart-amd64 0000:00:18.2: runtime IRQ mapping not provided by arch
[    3.813794] agpgart-amd64 0000:00:18.3: runtime IRQ mapping not provided by arch
[    3.813858] agpgart-amd64 0000:00:18.4: runtime IRQ mapping not provided by arch
[    3.813912] agpgart-amd64 0000:0e:00.0: runtime IRQ mapping not provided by arch
[    3.813973] agpgart-amd64 0000:0e:00.1: runtime IRQ mapping not provided by arch
[    3.814160] agpgart-amd64 0000:0c:00.0: runtime IRQ mapping not provided by arch
[    3.814235] agpgart-amd64 0000:0b:00.0: runtime IRQ mapping not provided by arch
[    3.814303] agpgart-amd64 0000:05:00.0: runtime IRQ mapping not provided by arch
[    3.814366] agpgart-amd64 0000:06:01.0: runtime IRQ mapping not provided by arch
[    3.814428] agpgart-amd64 0000:06:02.0: runtime IRQ mapping not provided by arch
[    3.814490] agpgart-amd64 0000:07:00.0: runtime IRQ mapping not provided by arch
[    3.816169] check: Scanning for low memory corruption every 60 seconds
[    3.833970] AVX or AES-NI instructions are not detected.
[    3.833989] CPU feature 'AVX registers' is not supported.
[    3.834003] CPU feature 'AVX registers' is not supported.
[    3.834015] AVX2 or AES-NI instructions are not detected.
[    3.834028] AVX2 instructions are not detected.
[    3.834323] Initialise system trusted keyrings
[    3.834424] workingset: timestamp_bits=38 max_order=19 bucket_order=0
[    3.837430] ntfs: driver 2.1.32 [Flags: R/W].
[    3.837539] fuse init (API version 7.28)
[    3.838540] gfs2: GFS2 installed
[    3.838654] FS-Cache: Netfs 'ceph' registered for caching
[    3.838676] ceph: loaded (mds proto 32)
[    3.870236] Key type asymmetric registered
[    3.870253] Asymmetric key parser 'x509' registered
[    3.870289] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    3.870427] io scheduler noop registered
[    3.870441] io scheduler deadline registered (default)
[    3.870469] io scheduler cfq registered
[    3.870482] io scheduler mq-deadline registered (default)
[    3.870496] io scheduler kyber registered
[    3.870575] io scheduler bfq registered
[    3.870865] crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
[    3.870881] crc32: self tests passed, processed 225944 bytes in 129306 nsec
[    3.871034] crc32c: CRC_LE_BITS = 64
[    3.871047] crc32c: self tests passed, processed 225944 bytes in 64580 nsec
[    3.880807] crc32_combine: 8373 self tests passed
[    3.890535] crc32c_combine: 8373 self tests passed
[    3.891070] pcieport 0000:00:02.0: runtime IRQ mapping not provided by arch
[    3.891363] pcieport 0000:00:02.0: Signaling PME with IRQ 67
[    3.891664] pcieport 0000:00:03.0: runtime IRQ mapping not provided by arch
[    3.891794] pcieport 0000:00:03.0: Signaling PME with IRQ 68
[    3.892059] pcieport 0000:00:05.0: runtime IRQ mapping not provided by arch
[    3.892325] pcieport 0000:00:05.0: Signaling PME with IRQ 69
[    3.892448] pcieport 0000:00:06.0: runtime IRQ mapping not provided by arch
[    3.892645] pcieport 0000:00:06.0: Signaling PME with IRQ 70
[    3.892781] pcieport 0000:00:09.0: runtime IRQ mapping not provided by arch
[    3.892944] pcieport 0000:00:09.0: Signaling PME with IRQ 71
[    3.893063] pcieport 0000:00:0a.0: runtime IRQ mapping not provided by arch
[    3.893197] pcieport 0000:00:0a.0: Signaling PME with IRQ 72
[    3.893434] pcieport 0000:00:0c.0: runtime IRQ mapping not provided by arch
[    3.893647] pcieport 0000:00:0c.0: Signaling PME with IRQ 73
[    3.893752] pcieport 0000:00:0d.0: runtime IRQ mapping not provided by arch
[    3.893873] pcieport 0000:00:0d.0: Signaling PME with IRQ 74
[    3.894005] pcieport 0000:00:15.0: runtime IRQ mapping not provided by arch
[    3.894209] pcieport 0000:00:15.0: Signaling PME with IRQ 75
[    3.894490] pcieport 0000:05:00.0: runtime IRQ mapping not provided by arch
[    3.894676] pcieport 0000:06:01.0: runtime IRQ mapping not provided by arch
[    3.894795] pcieport 0000:06:02.0: runtime IRQ mapping not provided by arch
[    3.895126] usbcore: registered new interface driver udlfb
[    3.895242] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    3.895293] ACPI: Power Button [PWRB]
[    3.895386] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    3.895434] ACPI: Power Button [PWRF]
[    3.895946] xen:xen_evtchn: Event-channel device installed
[    4.819770] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2e20d3dff46, max_idle_ns: 440795288937 ns
[    4.819975] clocksource: Switched to clocksource tsc
[    4.926399] pciback 0000:08:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x107)
[    4.926453] pciback 0000:08:00.0: restoring config space at offset 0x10 (was 0x4, writing 0xfe3fe004)
[    4.926484] pciback 0000:08:00.0: restoring config space at offset 0xc (was 0x0, writing 0x10)
[    4.926514] pciback 0000:08:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100102)
[    5.966400] pciback 0000:0a:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x10a)
[    5.966449] pciback 0000:0a:00.0: restoring config space at offset 0x10 (was 0x4, writing 0xfe5fe004)
[    5.966478] pciback 0000:0a:00.0: restoring config space at offset 0xc (was 0x0, writing 0x10)
[    5.966506] pciback 0000:0a:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100102)
[    7.006406] pciback 0000:0d:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x10b)
[    7.006455] pciback 0000:0d:00.0: restoring config space at offset 0x10 (was 0x4, writing 0xfe8fe004)
[    7.006484] pciback 0000:0d:00.0: restoring config space at offset 0xc (was 0x0, writing 0x10)
[    7.006512] pciback 0000:0d:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100102)
[    7.039736] pciback 0000:00:14.2: restoring config space at offset 0x3c (was 0x100, writing 0x10a)
[    7.039785] pciback 0000:00:14.2: restoring config space at offset 0x10 (was 0x4, writing 0xfdef8004)
[    7.039814] pciback 0000:00:14.2: restoring config space at offset 0xc (was 0x0, writing 0x4010)
[    7.039842] pciback 0000:00:14.2: restoring config space at offset 0x4 (was 0x4100000, writing 0x4100006)
[    7.040055] xen_pciback: backend is vpci
[    7.040294] xen_acpi_processor: Uploading Xen processor PM info
[    7.041030] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    7.041666] hpet_acpi_add: no address or irqs in _CRS
[    7.041902] Linux agpgart interface v0.103
[    7.041940] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is 60 seconds).
[    7.042012] [drm] VGACON disable radeon kernel modesetting.
[    7.042031] [drm:radeon_init] *ERROR* No UMS support in radeon module!
[    7.045357] brd: module loaded
[    7.053674] loop: module loaded
[    7.053961] ahci 0000:00:11.0: runtime IRQ mapping not provided by arch
[    7.053991] ahci 0000:00:11.0: version 3.0
[    7.054360] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6 Gbps 0x3f impl SATA mode
[    7.054385] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo pmp pio slum part 
[    7.055146] scsi host0: ahci
[    7.055468] scsi host1: ahci
[    7.055687] scsi host2: ahci
[    7.055906] scsi host3: ahci
[    7.056122] scsi host4: ahci
[    7.056418] scsi host5: ahci
[    7.056514] ata1: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff100 irq 78
[    7.056543] ata2: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff180 irq 78
[    7.056566] ata3: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff200 irq 78
[    7.056588] ata4: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff280 irq 78
[    7.056611] ata5: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff300 irq 78
[    7.056633] ata6: SATA max UDMA/133 abar m1024@0xfdeff000 port 0xfdeff380 irq 78
[    7.056727] ahci 0000:07:00.0: runtime IRQ mapping not provided by arch
[    7.056965] ahci 0000:07:00.0: AHCI 0001.0000 32 slots 2 ports 6 Gbps 0x3 impl SATA mode
[    7.056994] ahci 0000:07:00.0: flags: 64bit ncq sntf led only pmp fbs pio slum part sxs 
[    7.057021] ahci 0000:07:00.0: port 0 can do FBS, forcing FBSCP
[    7.057080] ahci 0000:07:00.0: port 1 can do FBS, forcing FBSCP
[    7.057492] scsi host6: ahci
[    7.057718] scsi host7: ahci
[    7.057830] ata7: SATA max UDMA/133 abar m2048@0xfe2ff800 port 0xfe2ff900 irq 79
[    7.057856] ata8: SATA max UDMA/133 abar m2048@0xfe2ff800 port 0xfe2ff980 irq 79
[    7.058032] tun: Universal TUN/TAP device driver, 1.6
[    7.058161] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[    7.058187] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    7.058223] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    7.058245] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    7.058290] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    7.058314] igb: Copyright (c) 2007-2014 Intel Corporation.
[    7.058351] igbvf: Intel(R) Gigabit Virtual Function Network Driver - version 2.4.0-k
[    7.058374] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    7.058419] r8169 0000:0c:00.0: runtime IRQ mapping not provided by arch
[    7.058525] r8169 0000:0c:00.0: enabling Mem-Wr-Inval
[    7.060171] libphy: r8169: probed
[    7.060684] r8169 0000:0c:00.0 eth0: RTL8168d/8111d, 40:61:86:f4:67:d9, XID 281000c0, IRQ 81
[    7.060716] r8169 0000:0c:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    7.060794] r8169 0000:0b:00.0: runtime IRQ mapping not provided by arch
[    7.060900] r8169 0000:0b:00.0: enabling Mem-Wr-Inval
[    7.062080] libphy: r8169: probed
[    7.062568] r8169 0000:0b:00.0 eth1: RTL8168d/8111d, 40:61:86:f4:67:d8, XID 281000c0, IRQ 83
[    7.062597] r8169 0000:0b:00.0 eth1: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    7.062693] PPP generic driver version 2.4.2
[    7.062797] PPP BSD Compression module registered
[    7.062813] PPP Deflate Compression module registered
[    7.062837] PPP MPPE Compression module registered
[    7.062853] NET: Registered protocol family 24
[    7.062908] usbcore: registered new interface driver ath9k_htc
[    7.062941] usbcore: registered new interface driver rt2500usb
[    7.062976] usbcore: registered new interface driver rt73usb
[    7.063008] usbcore: registered new interface driver rt2800usb
[    7.063055] usbcore: registered new interface driver rtl8187
[    7.063106] usbcore: registered new interface driver rtl8192cu
[    7.063246] usbcore: registered new interface driver rtl8xxxu
[    7.063272] xen_netfront: Initialising Xen virtual ethernet driver
[    7.063407] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    7.063427] ehci-pci: EHCI PCI platform driver
[    7.063449] ehci-pci 0000:00:12.2: runtime IRQ mapping not provided by arch
[    7.063588] QUIRK: Enable AMD PLL fix
[    7.063619] ehci-pci 0000:00:12.2: enabling bus mastering
[    7.063654] ehci-pci 0000:00:12.2: EHCI Host Controller
[    7.063843] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus number 1
[    7.063901] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    7.063940] ehci-pci 0000:00:12.2: debug port 1
[    7.063977] ehci-pci 0000:00:12.2: enabling Mem-Wr-Inval
(XEN) [2019-01-24 11:43:18.912] d0: bind: m_gsi=17 g_gsi=17
[    7.064095] ehci-pci 0000:00:12.2: irq 17, io mem 0xfdeff400
[    7.076461] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
[    7.076572] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
[    7.076596] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.076618] usb usb1: Product: EHCI Host Controller
[    7.076633] usb usb1: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ehci_hcd
[    7.076654] usb usb1: SerialNumber: 0000:00:12.2
[    7.076948] hub 1-0:1.0: USB hub found
[    7.076969] hub 1-0:1.0: 5 ports detected
[    7.077188] ehci-pci 0000:00:13.2: runtime IRQ mapping not provided by arch
[    7.077312] ehci-pci 0000:00:13.2: enabling bus mastering
[    7.077347] ehci-pci 0000:00:13.2: EHCI Host Controller
[    7.077421] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus number 2
[    7.077445] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    7.077495] ehci-pci 0000:00:13.2: debug port 1
[    7.077527] ehci-pci 0000:00:13.2: enabling Mem-Wr-Inval
[    7.077547] ehci-pci 0000:00:13.2: irq 17, io mem 0xfdeff800
[    7.089754] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
[    7.089907] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
[    7.089930] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.089952] usb usb2: Product: EHCI Host Controller
[    7.089967] usb usb2: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ehci_hcd
[    7.089988] usb usb2: SerialNumber: 0000:00:13.2
[    7.090216] hub 2-0:1.0: USB hub found
[    7.090234] hub 2-0:1.0: 5 ports detected
[    7.090454] ehci-pci 0000:00:16.2: runtime IRQ mapping not provided by arch
[    7.090567] ehci-pci 0000:00:16.2: enabling bus mastering
[    7.090604] ehci-pci 0000:00:16.2: EHCI Host Controller
[    7.090778] ehci-pci 0000:00:16.2: new USB bus registered, assigned bus number 3
[    7.090804] ehci-pci 0000:00:16.2: applying AMD SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    7.090842] ehci-pci 0000:00:16.2: debug port 1
[    7.090878] ehci-pci 0000:00:16.2: enabling Mem-Wr-Inval
[    7.090899] ehci-pci 0000:00:16.2: irq 17, io mem 0xfdeffc00
[    7.103060] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
[    7.103276] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
[    7.103299] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.103321] usb usb3: Product: EHCI Host Controller
[    7.103336] usb usb3: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ehci_hcd
[    7.103357] usb usb3: SerialNumber: 0000:00:16.2
[    7.103593] hub 3-0:1.0: USB hub found
[    7.103611] hub 3-0:1.0: 4 ports detected
[    7.103808] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    7.103844] ohci-pci: OHCI PCI platform driver
[    7.103870] ohci-pci 0000:00:12.0: runtime IRQ mapping not provided by arch
[    7.103986] ohci-pci 0000:00:12.0: enabling bus mastering
[    7.104018] ohci-pci 0000:00:12.0: OHCI PCI host controller
[    7.104189] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus number 4
(XEN) [2019-01-24 11:43:18.952] d0: bind: m_gsi=18 g_gsi=18
[    7.104317] ohci-pci 0000:00:12.0: irq 18, io mem 0xfdef7000
[    7.163783] usb usb4: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.163806] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.163826] usb usb4: Product: OHCI PCI host controller
[    7.163839] usb usb4: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.163858] usb usb4: SerialNumber: 0000:00:12.0
[    7.164011] hub 4-0:1.0: USB hub found
[    7.164034] hub 4-0:1.0: 5 ports detected
[    7.164265] ohci-pci 0000:00:13.0: runtime IRQ mapping not provided by arch
[    7.164376] ohci-pci 0000:00:13.0: enabling bus mastering
[    7.164403] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    7.164482] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus number 5
[    7.164518] ohci-pci 0000:00:13.0: irq 18, io mem 0xfdefc000
[    7.223787] usb usb5: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.223811] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.223830] usb usb5: Product: OHCI PCI host controller
[    7.223844] usb usb5: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.223862] usb usb5: SerialNumber: 0000:00:13.0
[    7.224019] hub 5-0:1.0: USB hub found
[    7.224045] hub 5-0:1.0: 5 ports detected
[    7.224265] ohci-pci 0000:00:14.5: runtime IRQ mapping not provided by arch
[    7.224375] ohci-pci 0000:00:14.5: enabling bus mastering
[    7.224401] ohci-pci 0000:00:14.5: OHCI PCI host controller
[    7.224496] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus number 6
[    7.224532] ohci-pci 0000:00:14.5: irq 18, io mem 0xfdefd000
[    7.283791] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.283814] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.283833] usb usb6: Product: OHCI PCI host controller
[    7.283847] usb usb6: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.283867] usb usb6: SerialNumber: 0000:00:14.5
[    7.284153] hub 6-0:1.0: USB hub found
[    7.284176] hub 6-0:1.0: 2 ports detected
[    7.284374] ohci-pci 0000:00:16.0: runtime IRQ mapping not provided by arch
[    7.284480] ohci-pci 0000:00:16.0: enabling bus mastering
[    7.284506] ohci-pci 0000:00:16.0: OHCI PCI host controller
[    7.284681] ohci-pci 0000:00:16.0: new USB bus registered, assigned bus number 7
[    7.284719] ohci-pci 0000:00:16.0: irq 18, io mem 0xfdefe000
[    7.343806] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 4.20
[    7.343830] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    7.343849] usb usb7: Product: OHCI PCI host controller
[    7.343863] usb usb7: Manufacturer: Linux 4.20.2-20190115-thp-doflr+ ohci_hcd
[    7.343881] usb usb7: SerialNumber: 0000:00:16.0
[    7.344027] hub 7-0:1.0: USB hub found
[    7.344049] hub 7-0:1.0: 4 ports detected
[    7.344305] uhci_hcd: USB Universal Host Controller Interface driver
[    7.344406] usbcore: registered new interface driver usblp
[    7.344453] usbcore: registered new interface driver usb-storage
[    7.344504] usbcore: registered new interface driver cp210x
[    7.344533] usbserial: USB Serial support registered for cp210x
[    7.344574] usbcore: registered new interface driver cypress_m8
[    7.344603] usbserial: USB Serial support registered for DeLorme Earthmate USB
[    7.344637] usbserial: USB Serial support registered for HID->COM RS232 Adapter
[    7.344671] usbserial: USB Serial support registered for Nokia CA-42 V2 Adapter
[    7.344709] usbcore: registered new interface driver mos7720
[    7.344739] usbserial: USB Serial support registered for Moschip 2 port adapter
[    7.344776] usbcore: registered new interface driver mos7840
[    7.344806] usbserial: USB Serial support registered for Moschip 7840/7820 USB Serial Driver
[    7.344884] i8042: PNP: No PS/2 controller found.
[    7.344902] i8042: Probing ports directly.
(XEN) [2019-01-24 11:43:19.193] d0: bind: m_gsi=12 g_gsi=12
(XEN) [2019-01-24 11:43:19.193] d0: bind: m_gsi=1 g_gsi=1
[    7.345645] serio: i8042 KBD port at 0x60,0x64 irq 1
[    7.345675] serio: i8042 AUX port at 0x60,0x64 irq 12
[    7.345887] mousedev: PS/2 mouse device common for all mice
[    7.346069] rtc_cmos 00:02: RTC can wake from S4
(XEN) [2019-01-24 11:43:19.194] d0: bind: m_gsi=8 g_gsi=8
[    7.366386] rtc_cmos 00:02: registered as rtc0
[    7.366428] rtc_cmos 00:02: alarms up to one month, y3k, 114 bytes nvram
[    7.366603] piix4_smbus 0000:00:14.0: runtime IRQ mapping not provided by arch
[    7.366651] ACPI Warning: SystemIO range 0x0000000000000B00-0x0000000000000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\SOR1) (20181003/utaddress-213)
[    7.366703] ACPI: This conflict may cause random problems and system instability
[    7.366725] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[    7.366759] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[    7.366787] piix4_smbus 0000:00:14.0[   27.796631] EXT4-fs (dm-25): mounted filesystem with ordered data mode. Opts: (null)
[   28.405671] RTL8211B Gigabit Ethernet r8169-c00:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-c00:00, irq=IGNORE)
[   28.553087] r8169 0000:0c:00.0 eth0: No native access to PCI extended config space, falling back to CSI
[   28.554332] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[   28.555082] RTL8211B Gigabit Ethernet r8169-b00:00: attached PHY driver [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=r8169-b00:00, irq=IGNORE)
[   28.707390] IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
[   30.483674] r8169 0000:0c:00.0 eth0: Link is Up - 1Gbps/Full - flow control off
[   30.483723] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   30.805860] r8169 0000:0b:00.0 eth1: Link is Up - 1Gbps/Full - flow control rx/tx
[   30.805946] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   42.848737] EXT4-fs (dm-25): re-mounted. Opts: discard,barrier=1,errors=remount-ro
[   43.011679] Adding 4194300k swap on /dev/mapper/serveerstertje_ssd-swap.  Priority:-2 extents:1 across:4194300k SS
[   43.400285] EXT4-fs (sdd2): mounted filesystem with ordered data mode. Opts: discard,barrier=1,errors=remount-ro
[   43.434165] EXT4-fs (dm-28): warning: maximal mount count reached, running e2fsck is recommended
[   43.468882] EXT4-fs (dm-28): mounted filesystem with ordered data mode. Opts: barrier=1,errors=remount-ro
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x679be:0 -> -22 (0x422c00)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:679be mfn:422c00 fgfn:1000 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6abaf:0 -> -22 (0x422c01)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6abaf mfn:422c01 fgfn:1001 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x7b227:0 -> -22 (0x422c02)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7b227 mfn:422c02 fgfn:1002 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x61d82:0 -> -22 (0x422c03)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:61d82 mfn:422c03 fgfn:1003 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6a4d3:0 -> -22 (0x422c04)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6a4d3 mfn:422c04 fgfn:1004 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x73d4f:0 -> -22 (0x422c05)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:73d4f mfn:422c05 fgfn:1005 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x73eba:0 -> -22 (0x422c06)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:73eba mfn:422c06 fgfn:1006 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6a3b4:0 -> -22 (0x422c07)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6a3b4 mfn:422c07 fgfn:1007 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6c026:0 -> -22 (0x422c08)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6c026 mfn:422c08 fgfn:1008 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x7aa06:0 -> -22 (0x422c09)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7aa06 mfn:422c09 fgfn:1009 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x785a4:0 -> -22 (0x422c0a)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:785a4 mfn:422c0a fgfn:100a td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x61dcb:0 -> -22 (0x422c0b)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:61dcb mfn:422c0b fgfn:100b td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x7ac40:0 -> -22 (0x422c0c)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7ac40 mfn:422c0c fgfn:100c td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x691d3:0 -> -22 (0x422c0d)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:691d3 mfn:422c0d fgfn:100d td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x73fec:0 -> -22 (0x422c0e)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:73fec mfn:422c0e fgfn:100e td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x7a267:0 -> -22 (0x422c0f)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7a267 mfn:422c0f fgfn:100f td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6ab37:0 -> -22 (0x422c10)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6ab37 mfn:422c10 fgfn:1010 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x68eed:0 -> -22 (0x422c11)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:68eed mfn:422c11 fgfn:1011 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x69cdb:0 -> -22 (0x422c12)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:69cdb mfn:422c12 fgfn:1012 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x7ac3b:0 -> -22 (0x422c13)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7ac3b mfn:422c13 fgfn:1013 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x7c4ab:0 -> -22 (0x422c14)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7c4ab mfn:422c14 fgfn:1014 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x639fa:0 -> -22 (0x422c15)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:639fa mfn:422c15 fgfn:1015 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6a0c1:0 -> -22 (0x422c16)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6a0c1 mfn:422c16 fgfn:1016 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x70447:0 -> -22 (0x422c17)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:70447 mfn:422c17 fgfn:1017 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x60ef7:0 -> -22 (0x422c18)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:60ef7 mfn:422c18 fgfn:1018 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x63875:0 -> -22 (0x422c19)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:63875 mfn:422c19 fgfn:1019 td:0 fd:1
(XEN) [2019-01-24 11:45:18.515] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.515] p2m.c:1264:d0v3 p2m_set_entry: 0x6b39a:0 -> -22 (0x422c1a)
(XEN) [2019-01-24 11:45:18.515] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6b39a mfn:422c1a fgfn:101a td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x70249:0 -> -22 (0x422c1b)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:70249 mfn:422c1b fgfn:101b td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x61deb:0 -> -22 (0x422c1c)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:61deb mfn:422c1c fgfn:101c td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x78c68:0 -> -22 (0x422c1d)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:78c68 mfn:422c1d fgfn:101d td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x67994:0 -> -22 (0x422c1e)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:67994 mfn:422c1e fgfn:101e td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x61dad:0 -> -22 (0x422c1f)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:61dad mfn:422c1f fgfn:101f td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x62eab:0 -> -22 (0x422c20)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:62eab mfn:422c20 fgfn:1020 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x664de:0 -> -22 (0x422c21)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:664de mfn:422c21 fgfn:1021 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x69d89:0 -> -22 (0x422c22)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:69d89 mfn:422c22 fgfn:1022 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x73d02:0 -> -22 (0x422c23)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:73d02 mfn:422c23 fgfn:1023 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x628d6:0 -> -22 (0x422c24)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:628d6 mfn:422c24 fgfn:1024 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x799fb:0 -> -22 (0x422c25)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:799fb mfn:422c25 fgfn:1025 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x7bc7d:0 -> -22 (0x422c26)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7bc7d mfn:422c26 fgfn:1026 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6c229:0 -> -22 (0x422c27)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6c229 mfn:422c27 fgfn:1027 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x7c9dc:0 -> -22 (0x422c28)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7c9dc mfn:422c28 fgfn:1028 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6b29b:0 -> -22 (0x422c29)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6b29b mfn:422c29 fgfn:1029 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6a0e6:0 -> -22 (0x422c2a)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6a0e6 mfn:422c2a fgfn:102a td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x7af8c:0 -> -22 (0x422c2b)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7af8c mfn:422c2b fgfn:102b td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x799ff:0 -> -22 (0x422c2c)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:799ff mfn:422c2c fgfn:102c td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x7aa03:0 -> -22 (0x422c2d)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7aa03 mfn:422c2d fgfn:102d td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x7acfd:0 -> -22 (0x422c2e)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:7acfd mfn:422c2e fgfn:102e td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x628d9:0 -> -22 (0x422c2f)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:628d9 mfn:422c2f fgfn:102f td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x62b52:0 -> -22 (0x422c30)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:62b52 mfn:422c30 fgfn:1030 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6ca9d:0 -> -22 (0x422c31)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6ca9d mfn:422c31 fgfn:1031 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6ca63:0 -> -22 (0x422c32)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6ca63 mfn:422c32 fgfn:1032 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6320c:0 -> -22 (0x422c33)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6320c mfn:422c33 fgfn:1033 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x61c7d:0 -> -22 (0x422c34)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:61c7d mfn:422c34 fgfn:1034 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x6656b:0 -> -22 (0x422c35)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:6656b mfn:422c35 fgfn:1035 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:1264:d0v3 p2m_set_entry: 0x612a5:0 -> -22 (0x422c36)
(XEN) [2019-01-24 11:45:18.516] p2m.c:2932:d0v3 set_foreign_p2m_entry failed. gpfn:612a5 mfn:422c36 fgfn:1036 td:0 fd:1
(XEN) [2019-01-24 11:45:18.516] p2m-pt.c:536:d0v3 Unimplemented foreign p2m type.
(XEN) [2019-01-24 11:45:18.516] p2m.c:[  210.398792] reboot: Restarting system
(XEN) [2019-01-24 11:46:42.047] Hardware Dom0 shutdown: rebooting machine

--------------49EF4ECE078FD0005878639F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------49EF4ECE078FD0005878639F--
