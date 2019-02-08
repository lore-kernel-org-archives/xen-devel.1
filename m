From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Fri, 8 Feb 2019 20:36:54 +0100
Message-ID: <1d6f7531-b716-7391-21c1-2f5497b15811@eikelenboom.it>
References: <d9272bac-54d6-f4b3-7573-412ac0f048b3@eikelenboom.it>
 <20190124075021.pqwgywacacsun7zd@mac>
 <4da92f88-34ea-30fb-9ff2-5ef72455dab7@eikelenboom.it>
 <20190124101100.iuflmkbbuol3eluz@mac>
 <823f206d-1838-1ed9-0c9f-aaea5afaff3e@eikelenboom.it>
 <20190124120431.hdiojrypvost77pm@mac> <20190125143853.3lx7owqixflnygwj@mac>
 <d1414107-2fc8-f686-79ab-77bb38a60b89@eikelenboom.it>
 <20190208151053.573gy7jnr7jymu4e@mac>
 <0c10c9b7-5705-eb98-4ff7-eb1200aba86b@eikelenboom.it>
 <20190208164741.lfk2arp3ce66t65q@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------3FA4B773DB3F4A8D40139327"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aZLP=QP=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gsBvq-00065W-O6
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 19:35:27 +0000
In-Reply-To: <20190208164741.lfk2arp3ce66t65q@mac>
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
--------------3FA4B773DB3F4A8D40139327
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 08/02/2019 17:47, Roger Pau Monné wrote:
> On Fri, Feb 08, 2019 at 05:15:22PM +0100, Sander Eikelenboom wrote:
>> On 08/02/2019 16:10, Roger Pau Monné wrote:
>>> On Fri, Jan 25, 2019 at 07:44:40PM +0100, Sander Eikelenboom wrote:
>>>> On 25/01/2019 15:38, Roger Pau Monné wrote:
>>>>> On Thu, Jan 24, 2019 at 01:04:31PM +0100, Roger Pau Monné wrote:
>>>>> Sorry, fixing that error took longer than expected, and requires
>>>>> modifying quite a lot of code, so I'm not sure whether it's something
>>>>> to consider for 4.12, I have to think about it.
>>>>
>>>> I understand, especially since PVH dom0 is marked as experimental.
>>>>
>>>>> In the meantime, can you please test the following branch:
>>>>>
>>>>> git://xenbits.xen.org/people/royger/xen.git iommu-fixes-v2
>>>>>
>>>>> I've been able to successfully create a PVH guest from a PVH dom0 on
>>>>> AMD hardware using this branch.
>>>>
>>>> On the other hand, with a quick test I can confirm that booting a PVH guest from a PVH dom0 now works for me as well ! 
>>>> (and booting this build as PV dom0, with my normal PVH/HVM mix of guests still works, no regressions for me so far)
>>
>>
>>  
>>> Sorry for bothering you again, but could you give the following branch
>>> a test:
>>
>> No problem, happy to keep testing until it works and is in good enough shape to get committed.
>>
>> And fortunately you asked, because unfortunately it doesn't boot as pvhdom0, serial log is attached.
> 
> Thanks!
> 
> Can you try with the following debug patch on top? This should print a
> message before hitting the assert, hopefully giving us more
> information.
> 
> Roger.

Sure, I was also missing a sync_console on the Xen cmdline,
serial log attached.

--
Sander

> ---8<---
> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> index 5ad7a36269..bf647e7d26 100644
> --- a/xen/arch/x86/mm/p2m-pt.c
> +++ b/xen/arch/x86/mm/p2m-pt.c
> @@ -648,8 +648,13 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
>                     !rangeset_overlaps_range(mmio_ro_ranges, mfn_x(mfn),
>                                              mfn_x(mfn) + PFN_DOWN(MB(2))));
>          else
> +        {
> +            if ( !mfn_valid(mfn) && (!mfn_eq(mfn, INVALID_MFN) ||
> +                                     !p2m_allows_invalid_mfn(p2mt)) )
> +                printk("mfn: %#lx type: %d\n", mfn_x(mfn), p2mt);
>              ASSERT(mfn_valid(mfn) || (mfn_eq(mfn, INVALID_MFN) &&
>                                        p2m_allows_invalid_mfn(p2mt)));
> +        }
>          l2e_content = mfn_valid(mfn) || p2m_allows_invalid_mfn(p2mt)
>              ? p2m_l2e_from_pfn(mfn_x(mfn),
>                                 p2m_type_to_flags(p2m, p2mt, mfn, 1))
> 


--------------3FA4B773DB3F4A8D40139327
Content-Type: text/x-log;
 name="boot-dom0-pvh.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="boot-dom0-pvh.log"

 __  __            _  _    _ ____    ___              
 \ \/ /___ _ __   | || |  / |___ \  / _ \    _ __ ___ 
  \  // _ \ '_ \  | || |_ | | __) || | | |__| '__/ __|
  /  \  __/ | | | |__   _|| |/ __/ | |_| |__| | | (__ 
 /_/\_\___|_| |_|    |_|(_)_|_____(_)___/   |_|  \___|
                                                      
(XEN) [0000001a849e1840] Xen version 4.12.0-rc (root@dyndns.org) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Fri Feb  8 20:22:06 CET 2019
(XEN) [0000001a8c0e5d75] Latest ChangeSet: Fri Feb 8 15:01:58 2019 +0100 git:ed104d12b9-dirty
(XEN) [0000001a90c468ad] Console output is synchronous.
(XEN) [0000001a939814a3] Bootloader: GRUB 2.02~beta3-5+deb9u1
(XEN) [0000001a96b7e8ad] Command line: dom0_mem=2048M,max:2048M loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64 reboot=k sync_console dom0=pvh
(XEN) [0000001aa5f14b5d] Xen image load base address: 0
(XEN) [0000001aa8c4f086] Video information:
(XEN) [0000001aab00504a]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [0000001aae463298]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [0000001ab2245c92] Disc information:
(XEN) [0000001ab45308a0]  Found 4 MBR signatures
(XEN) [0000001ab6cdba0d]  Found 4 EDD information structures
(XEN) [0000001ab9e0e59b] Xen-e820 RAM map:
(XEN) [0000001abc0f7578]  0000000000000000 - 0000000000096400 (usable)
(XEN) [0000001abfa17a92]  0000000000096400 - 00000000000a0000 (reserved)
(XEN) [0000001ac34cffae]  00000000000e4000 - 0000000000100000 (reserved)
(XEN) [0000001ac6f865be]  0000000000100000 - 00000000c7f90000 (usable)
(XEN) [0000001aca8a6ac8]  00000000c7f90000 - 00000000c7f9e000 (ACPI data)
(XEN) [0000001ace42a21b]  00000000c7f9e000 - 00000000c7fe0000 (ACPI NVS)
(XEN) [0000001ad1ee060e]  00000000c7fe0000 - 00000000c8000000 (reserved)
(XEN) [0000001ad5998ceb]  00000000ffe00000 - 0000000100000000 (reserved)
(XEN) [0000001ad944f79b]  0000000100000000 - 0000000538000000 (usable)
(XEN) [0000001ae24f558b] New Xen image base address: 0xc7800000
(XEN) [0000001ae5887ff6] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [0000001ae8b51352] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001aed77c4d5] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001af23a99a3] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [0000001af6fd4598] ACPI: FACS C7F9E000, 0040
(XEN) [0000001af991828e] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001afe54251e] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000001b0316eb7b] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001b07d9b002] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001b0c9c7332] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [0000001b115f3665] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000001b1621fcee] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [0000001b1ae4c085] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000001b1fa78558] System RAM: 20479MB (20970648kB)
(XEN) [0000001b29dcda3d] SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) [0000001b2cc9c935] SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) [0000001b2fb6d22b] SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) [0000001b32a3db7b] SRAT: PXM 0 -> APIC 03 -> Node 0
(XEN) [0000001b3590e7d8] SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) [0000001b387df36b] SRAT: PXM 0 -> APIC 05 -> Node 0
(XEN) [0000001b3b6aefab] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000001b3e0bb8ed] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000001b4112271d] SRAT: Node 0 PXM 0 100000000-538000000
(XEN) [0000001b444b6ffa] NUMA: Allocated memnodemap from 5334db000 - 5334e1000
(XEN) [0000001b4842fd1e] NUMA: Using 8 for the hash shift.
(XEN) [0000001b8fbeb9f6] Domain heap initialised
(XEN) [0000001b92396eed] Allocated console ring of 128 KiB.
(XEN) [0000001ba85df59d] vesafb: framebuffer at 0xd0000000, mapped to 0xffff82c000201000, using 6144k, total 16384k
(XEN) [0000001bae2b3835] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [0000001bb248f94b] vesafb: Truecolor: size=0:8:8:8, shift=0:16:8:0
(XEN) [0000001bb5f52b25] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [0000001bc0065713] found SMP MP-table at 000ff780
(XEN) [0000001bc2d9d270] DMI present.
(XEN) [0000001bc4c8f173] Using APIC driver default
(XEN) [0000001bc75d276a] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [0000001bcaa30e9e] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [0000001bceda2cc5] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [0000001bd2c500a0] ACPI: Local APIC address 0xfee00000
(XEN) [0000001bd5d8316a] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) [0000001bd9a9bb7d] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) [0000001bdd7b4970] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
(XEN) [0000001be14cc1d0] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) [0000001be51e4485] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
(XEN) [0000001be8efe090] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
(XEN) [0000001becc15c5a] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [0000001bf0d25dc6] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [0000001bf53c5a2b] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [0000001bf95a1415] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000001bfdd09c10] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000001c01ee4d2e] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [0000001c062565a6] ACPI: IRQ0 used by override.
(XEN) [0000001c08dfa706] ACPI: IRQ2 used by override.
(XEN) [0000001c0b99e826] ACPI: IRQ9 used by override.
(XEN) [0000001c0e5431a6] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [0000001c11e639c2] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [0000001c151f5968] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [0000001c19c8cdc6] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000001c1d67810d] ERST table was not found
(XEN) [0000001c1feeeded] Using ACPI (MADT) for SMP configuration information
(XEN) [0000001c23cd2422] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [0000001c26f9bb85] IRQ limits: 56 GSI, 1112 MSI/MSI-X
(XEN) [0000001c2a002efa] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc
(XEN) [0000001c2e50a44a] traps.c:1574: GPF (0000): ffff82d080425cd6 [probe_cpuid_faulting+0xe/0xa2] -> ffff82d0803808b2
(XEN) [0000001c3450c5fe] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [0000001c3808d76a] Speculative mitigation facilities:
(XEN) [0000001c3b0f497e]   Hardware features:
(XEN) [0000001c3d63f9a8]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [0000001c41423a7b]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN) [0000001c45532f72]   Support for HVM VMs: RSB
(XEN) [0000001c47f40786]   Support for PV VMs: RSB
(XEN) [0000001c4a884be8]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [0000001c4f3e40a6]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [0000001c530326f0] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000001c56ee224a] Initializing Credit2 scheduler
(XEN) [0000001c59c1bc20]  load_precision_shift: 18
(XEN) [0000001c5c55d7ba]  load_window_shift: 30
(XEN) [0000001c5ec3fff0]  underload_balance_tolerance: 0
(XEN) [0000001c61a44ffe]  overload_balance_tolerance: -3
(XEN) [0000001c64849d6a]  runqueues arrangement: socket
(XEN) [0000001c67583478]  cap enforcement granularity: 10ms
(XEN) [0000001c6a5e949e] load tracking window length 1073741824 ns
(XEN) [0000001c6dbdfd4e] Adding cpu 0 to runqueue 0
(XEN) [0000001c705eb8cb]  First cpu on runqueue, activating
(XEN) [0000001c7cde01e2] Platform timer is 14.318MHz HPET
(XEN) [    2.997910] Detected 3200.120 MHz processor.
(XEN) [    3.014186] Initing memory sharing.
(XEN) [    3.026145] alt table ffff82d080467c70 -> ffff82d080469a92
(XEN) [    3.044812] AMD-Vi: Found MSI capability block at 0x54
(XEN) [    3.061713] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.083811] AMD-Vi: Using IVHD type 0x10
(XEN) [    3.097070] AMD-Vi: ACPI Table:
(XEN) [    3.107990] AMD-Vi:  Signature IVRS
(XEN) [    3.119950] AMD-Vi:  Length 0x108
(XEN) [    3.131391] AMD-Vi:  Revision 0x1
(XEN) [    3.151551] AMD-Vi:  CheckSum 0x65
(XEN) [    3.171896] AMD-Vi:  OEM_Id AMD  
(XEN) [    3.191966] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.213857] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.236242] AMD-Vi:  Creator_Id AMD 
(XEN) [    3.256977] AMD-Vi:  Creator_Revision 0
(XEN) [    3.278427] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.307468] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.334416] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.356891] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.384580] AMD-Vi: IVHD Device Entry: type 0x3 id 0xe00 flags 0
(XEN) [    3.412516] AMD-Vi:  Dev_Id Range: 0xe00 -> 0xe01
(XEN) [    3.436527] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.464178] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.492073] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.519712] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.547542] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.575077] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.602841] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.630325] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.658091] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.685636] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    3.713482] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    3.737427] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    3.765025] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    3.792832] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    3.820662] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    3.848481] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    3.876301] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    3.904133] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    3.931743] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    3.959576] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    3.983377] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    4.010769] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.038170] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.061439] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.088856] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.112059] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.140256] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.167725] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.195139] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.222531] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.250428] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.277063] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.304506] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.331998] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.359531] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.387363] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.414976] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.438425] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.464751] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.492674] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.521415] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.548663] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.578118] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.605886] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.633834] I/O virtualisation enabled
(XEN) [    4.655089]  - Dom0 mode: Relaxed
(XEN) [    4.674953] Interrupt remapping enabled
(XEN) [    4.696336] nr_sockets: 1
(XEN) [    4.714301] ENABLING IO-APIC IRQs
(XEN) [    4.734114]  -> Using new ACK method
(XEN) [    4.754900] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2019-02-08 19:29:16.261] HVM: ASIDs enabled.
(XEN) [2019-02-08 19:29:16.283] SVM: Supported advanced features:
(XEN) [2019-02-08 19:29:16.309]  - Nested Page Tables (NPT)
(XEN) [2019-02-08 19:29:16.334]  - Last Branch Record (LBR) Virtualisation
(XEN) [2019-02-08 19:29:16.362]  - Next-RIP Saved on #VMEXIT
(XEN) [2019-02-08 19:29:16.387]  - Pause-Intercept Filter
(XEN) [2019-02-08 19:29:16.411] HVM: SVM enabled
(XEN) [2019-02-08 19:29:16.433] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-02-08 19:29:16.461] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2019-02-08 19:29:11.008] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 19:29:16.531] Adding cpu 1 to runqueue 0
(XEN) [2019-02-08 19:29:11.008] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 19:29:16.599] Adding cpu 2 to runqueue 0
(XEN) [2019-02-08 19:29:11.008] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 19:29:16.667] Adding cpu 3 to runqueue 0
(XEN) [2019-02-08 19:29:11.008] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 19:29:16.736] Adding cpu 4 to runqueue 0
(XEN) [2019-02-08 19:29:11.008] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 19:29:16.804] Adding cpu 5 to runqueue 0
(XEN) [2019-02-08 19:29:16.829] Brought up 6 CPUs
(XEN) [2019-02-08 19:29:16.854] build-id: 4210e393246893479fcef6cac95c654dc86abc29
(XEN) [2019-02-08 19:29:16.885] Running stub recovery selftests...
(XEN) [2019-02-08 19:29:16.912] traps.c:1574: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-02-08 19:29:16.951] traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080380412
(XEN) [2019-02-08 19:29:16.989] traps.c:1094: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-02-08 19:29:17.047] ACPI sleep modes: S3
(XEN) [2019-02-08 19:29:17.070] VPMU: disabled
(XEN) [2019-02-08 19:29:17.092] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2019-02-08 19:29:17.124] mcheck_poll: Machine check polling timer started.
(XEN) [2019-02-08 19:29:17.155] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2019-02-08 19:29:17.189] Dom0 has maximum 632 PIRQs
(XEN) [2019-02-08 19:29:17.216] Multiple initrd candidates, picking module #1
(XEN) [2019-02-08 19:29:17.246] NX (Execute Disable) protection active
(XEN) [2019-02-08 19:29:17.274] *** Building a PVH Dom0 ***
(XEN) [2019-02-08 19:29:17.335] AMD-Vi: update_paging_mode Try to access pdev_list without aquiring pcidevs_lock.
(XEN) [2019-02-08 19:29:17.554] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.601] AMD-Vi: Setup I/O page table: device id = 0x2, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.649] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.697] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.745] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.794] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.843] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.892] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.941] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:17.990] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.040] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.089] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.139] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.189] AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.239] AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.290] AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.340] AMD-Vi: Setup I/O page table: device id = 0xa2, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.391] AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.442] AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.493] AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.544] AMD-Vi: Setup I/O page table: device id = 0xa8, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.595] AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.647] AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.699] AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) [2019-02-08 19:29:18.732] AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) [2019-02-08 19:29:18.765] AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) [2019-02-08 19:29:18.799] AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) [2019-02-08 19:29:18.832] AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) [2019-02-08 19:29:18.865] AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.918] AMD-Vi: Setup I/O page table: device id = 0x401, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:18.971] AMD-Vi: Setup I/O page table: device id = 0x402, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.024] AMD-Vi: Setup I/O page table: device id = 0x403, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.077] AMD-Vi: Setup I/O page table: device id = 0x404, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.131] AMD-Vi: Setup I/O page table: device id = 0x405, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.184] AMD-Vi: Setup I/O page table: device id = 0x406, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.238] AMD-Vi: Setup I/O page table: device id = 0x407, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.292] AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.346] AMD-Vi: Setup I/O page table: device id = 0x608, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.401] AMD-Vi: Setup I/O page table: device id = 0x610, type = 0x2, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.455] AMD-Vi: Setup I/O page table: device id = 0x700, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.510] AMD-Vi: Setup I/O page table: device id = 0x800, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.564] AMD-Vi: Setup I/O page table: device id = 0x900, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.619] AMD-Vi: Setup I/O page table: device id = 0x901, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.674] AMD-Vi: Setup I/O page table: device id = 0x902, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.729] AMD-Vi: Setup I/O page table: device id = 0x903, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.785] AMD-Vi: Setup I/O page table: device id = 0x904, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.840] AMD-Vi: Setup I/O page table: device id = 0x905, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.896] AMD-Vi: Setup I/O page table: device id = 0x906, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:19.952] AMD-Vi: Setup I/O page table: device id = 0x907, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.008] AMD-Vi: Setup I/O page table: device id = 0xa00, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.064] AMD-Vi: Setup I/O page table: device id = 0xb00, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.120] AMD-Vi: Setup I/O page table: device id = 0xc00, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.177] AMD-Vi: Setup I/O page table: device id = 0xd00, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.233] AMD-Vi: Setup I/O page table: device id = 0xe00, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.300] AMD-Vi: Setup I/O page table: device id = 0xe01, type = 0x1, root table = 0x523ce5000, domain = 0, paging mode = 3
(XEN) [2019-02-08 19:29:20.843] WARNING: PVH is an experimental mode with limited functionality
(XEN) [2019-02-08 19:29:20.887] Initial low memory virq threshold set at 0x4000 pages.
(XEN) [2019-02-08 19:29:20.928] Scrubbing Free RAM in background
(XEN) [2019-02-08 19:29:20.963] Std. Loglevel: All
(XEN) [2019-02-08 19:29:20.995] Guest Loglevel: All
(XEN) [2019-02-08 19:29:21.027] ***************************************************
(XEN) [2019-02-08 19:29:21.067] WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
(XEN) [2019-02-08 19:29:21.104] This option is intended to aid debugging of Xen by ensuring
(XEN) [2019-02-08 19:29:21.146] that all output is synchronously delivered on the serial line.
(XEN) [2019-02-08 19:29:21.189] However it can introduce SIGNIFICANT latencies and affect
(XEN) [2019-02-08 19:29:21.230] timekeeping. It is NOT recommended for production use!
(XEN) [2019-02-08 19:29:21.271] ***************************************************
(XEN) [2019-02-08 19:29:21.310] 3... 2... 1... 
(XEN) [2019-02-08 19:29:24.340] Xen is relinquishing VGA console.
(XEN) [2019-02-08 19:29:24.458] *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) [2019-02-08 19:29:24.484] Freed 476kB init memory
(XEN) [2019-02-08 19:29:24.759] Dom0 callback via changed to Direct Vector 0xf3
[    0.000000] Linux version 4.20.7-20190207-thp-doflr+ (root@serveerstertje) (gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Thu Feb 7 10:47:45 CET 2019
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
[    0.000005] HVMOP_pagetable_dying not supported
[    0.051678] tsc: Fast TSC calibration failed
[    0.051680] tsc: Detected 3200.120 MHz processor
[    0.059295] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.059296] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.073982] AGP: No AGP bridge found
[    0.074115] last_pfn = 0x80000 max_arch_pfn = 0x400000000
[    0.074172] MTRR default type: uncachable
[    0.074173] MTRR fixed ranges enabled:
[    0.074174]   00000-9FFFF write-back
[    0.074175]   A0000-EFFFF uncachable
[    0.074176]   F0000-FFFFF write-protect
[    0.074177] MTRR variable ranges enabled:
[    0.074179]   0 base 000000000000 mask FFFF80000000 write-back
[    0.074180]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.074181]   2 base 0000C0000000 mask FFFFF8000000 write-back
[    0.074182]   3 disabled
[    0.074183]   4 disabled
[    0.074183]   5 disabled
[    0.074184]   6 disabled
[    0.074185]   7 disabled
[    0.074185] TOM2: 0000000538000000 aka 21376M
[    0.079854] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.081892] e820: update [mem 0xc8000000-0xffffffff] usable ==> reserved
[    0.081920] check: Scanning 1 areas for low memory corruption
[    0.081924] Base memory trampoline at [(____ptrval____)] 90000 size 24576
[    0.081941] Using GB pages for direct mapping
[    0.081944] BRK [0x03401000, 0x03401fff] PGTABLE
[    0.081947] BRK [0x03402000, 0x03402fff] PGTABLE
[    0.081948] BRK [0x03403000, 0x03403fff] PGTABLE
[    0.082134] RAMDISK: [mem 0x03426000-0x04d80fff]
[    0.082147] ACPI: Early table checksum verification disabled
[    0.082152] ACPI: RSDP 0x0000000080069ED8 000024 (v02 ACPIAM)
[    0.082155] ACPI: XSDT 0x0000000080069EFC 00004C (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.082160] ACPI: APIC 0x0000000080069F48 0000B8 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.082165] ACPI: FACP 0x00000000C7F90200 000084 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.082189] ACPI: DSDT 0x00000000C7F905E0 009427 (v01 A7640  A7640100 00000100 INTL 20051117)
[    0.082194] ACPI: FACS 0x00000000C7F9E000 000040
[    0.082197] ACPI: MCFG 0x00000000C7F90420 00003C (v01 7640MS OEMMCFG  20100913 MSFT 00000097)
[    0.082201] ACPI: SLIC 0x00000000C7F90460 000176 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.082205] ACPI: SSDT 0x00000000C7F9A840 000DA4 (v01 A M I  POWERNOW 00000001 AMD  00000001)
[    0.082216] ACPI: Local APIC address 0xfee00000
[    0.082337] Scanning NUMA topology in Northbridge 24
[    0.082359] No NUMA configuration found
[    0.082360] Faking a node at [mem 0x0000000000000000-0x000000007fffffff]
[    0.082364] NODE_DATA(0) allocated [mem 0x7fff6000-0x7fffffff]
[    0.082383] Zone ranges:
[    0.082384]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.082385]   DMA32    [mem 0x0000000001000000-0x000000007fffffff]
[    0.082386]   Normal   empty
[    0.082387] Movable zone start for each node
[    0.082389] Early memory node ranges
[    0.082390]   node   0: [mem 0x0000000000001000-0x0000000000095fff]
[    0.082391]   node   0: [mem 0x0000000000100000-0x000000007fffffff]
[    0.082394] Zeroed struct page in unavailable ranges: 107 pages
[    0.082394] Initmem setup node 0 [mem 0x0000000000001000-0x000000007fffffff]
[    0.082396] On node 0 totalpages: 524181
[    0.082397]   DMA zone: 64 pages used for memmap
[    0.082398]   DMA zone: 21 pages reserved
[    0.082399]   DMA zone: 3989 pages, LIFO batch:0
[    0.082495]   DMA32 zone: 8128 pages used for memmap
[    0.082496]   DMA32 zone: 520192 pages, LIFO batch:63
[    0.095052] ACPI: PM-Timer IO Port: 0x808
[    0.095056] ACPI: Local APIC address 0xfee00000
[    0.095116] IOAPIC[0]: apic_id 6, version 17, address 0xfec00000, GSI 0-23
[    0.095157] IOAPIC[1]: apic_id 7, version 17, address 0xfec20000, GSI 24-55
[    0.095160] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.095161] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.095163] ACPI: IRQ0 used by override.
[    0.095164] ACPI: IRQ9 used by override.
[    0.095166] Using ACPI (MADT) for SMP configuration information
[    0.095173] smpboot: Allowing 6 CPUs, 0 hotplug CPUs
[    0.095186] [mem 0xc8000000-0xffdfffff] available for PCI devices
[    0.095188] Booting paravirtualized kernel on Xen PVH
[    0.095191] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.231123] random: get_random_bytes called from start_kernel+0x91/0x43d with crng_init=0
[    0.231131] setup_percpu: NR_CPUS:6 nr_cpumask_bits:6 nr_cpu_ids:6 nr_node_ids:1
[    0.231816] percpu: Embedded 43 pages/cpu @(____ptrval____) s139032 r8192 d28904 u262144
[    0.231821] pcpu-alloc: s139032 r8192 d28904 u262144 alloc=1*2097152
[    0.231822] pcpu-alloc: [0] 0 1 2 3 4 5 - - 
[    0.231859] xen: PV spinlocks enabled
[    0.231862] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
[    0.231866] Built 1 zonelists, mobility grouping on.  Total pages: 515968
[    0.231867] Policy zone: DMA32
[    0.231870] Kernel command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.232067] You have booted with nomodeset. This means your GPU drivers are DISABLED
[    0.232068] Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly
[    0.232069] Unless you actually understand what nomodeset does, you should reboot without enabling it
[    0.232150] AGP: Checking aperture...
[    0.246852] AGP: No AGP bridge found
[    0.246859] AGP: Node 0: aperture [bus addr 0x66e000000-0x66fffffff] (32MB)
[    0.246860] Aperture beyond 4GB. Ignoring.
[    0.256299] Memory: 1999828K/2096724K available (18436K kernel code, 1356K rwdata, 5152K rodata, 1360K init, 2428K bss, 96896K reserved, 0K cma-reserved)
[    0.256362] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.256428] rcu: Hierarchical RCU implementation.
[    0.256430] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.256445] Using NULL legacy PIC
[    0.256446] NR_IRQS: 4352, nr_irqs: 1016, preallocated irqs: 0
[    0.256554] xen:events: Using FIFO-based ABI
[    0.277151] xen:events: Xen HVM callback vector for event delivery is enabled
[    0.277192] Console: colour dummy device 80x25
[    0.277357] printk: console [tty0] enabled
[    2.733003] printk: console [hvc0] enabled
[    2.745502] ACPI: Core revision 20181003
[    2.760611] Failed to register legacy timer interrupt
[    2.775489] APIC: Switch to symmetric I/O mode setup
[    2.790729] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2e20bb758d5, max_idle_ns: 440795224254 ns
[    2.822287] Calibrating delay loop (skipped), value calculated using timer frequency.. 6402.91 BogoMIPS (lpj=10667066)
[    2.825607] pid_max: default: 32768 minimum: 301
[    2.825607] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    2.825607] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    2.825607] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    2.825607] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    2.825607] mce: CPU supports 2 MCE banks
[    2.825607] process: using AMD E400 aware idle routine
[    2.825607] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
[    2.825607] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
[    2.825607] Spectre V2 : Mitigation: Full AMD retpoline
[    2.825607] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    2.825607] Freeing SMP alternatives memory: 52K
[    2.825607] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    2.825607] Xen: using vcpuop timer interface
[    2.825607] installing Xen timer for CPU 0
[    2.825607] smpboot: CPU0: AMD Phenom(tm) II X6 1090T Processor (family: 0x10, model: 0xa, stepping: 0x0)
[    2.825652] cpu 0 spinlock event irq 29
[    2.829045] Performance Events: PMU not available due to virtualization, using software events only.
[    2.832312] rcu: Hierarchical SRCU implementation.
[    2.835672] NMI watchdog: Perf NMI watchdog permanently disabled
[    2.839030] smp: Bringing up secondary CPUs ...
[    2.842364] installing Xen timer for CPU 1
[    2.845683] x86: Booting SMP configuration:
[    2.848949] .... node  #0, CPUs:      #1
[    2.852343] cpu 1 spinlock event irq 35
[    2.875709] installing Xen timer for CPU 2
[    2.879021]  #2
[    2.882338] cpu 2 spinlock event irq 41
[    2.899080] installing Xen timer for CPU 3
[    2.902357]  #3
[    2.905669] cpu 3 spinlock event irq 47
[    2.922416] installing Xen timer for CPU 4
[    2.925686]  #4
[    3.012338] cpu 4 spinlock event irq 53
[    3.029080] installing Xen timer for CPU 5
[    3.032357]  #5
[    3.037701] cpu 5 spinlock event irq 59
[    3.052296] smp: Brought up 1 node, 6 CPUs
[    3.055617] smpboot: Max logical packages: 2
[    3.058949] smpboot: Total of 6 processors activated (38431.46 BogoMIPS)
[    3.065824] devtmpfs: initialized
[    3.070122] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    3.072289] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    3.075755] xor: measuring software checksum speed
[    3.102286] random: fast init done
[    3.112281]    prefetch64-sse: 17427.600 MB/sec
[    3.148948]    generic_sse: 16400.400 MB/sec
[    3.152282] xor: using function: prefetch64-sse (17427.600 MB/sec)
[    3.155998] NET: Registered protocol family 16
[    3.158959] xen:grant_table: Grant tables using version 1 layout
[    3.162300] Grant table initialized
[    3.165985] cpuidle: using governor ladder
[    3.175670] cpuidle: using governor menu
[    3.178974] node 0 link 0: io port [1000, ffffff]
[    3.182289] TOM: 00000000c8000000 aka 3200M
[    3.185619] Fam 10h mmconf [mem 0xe0000000-0xefffffff]
[    3.188957] node 0 link 0: mmio [e0000000, efffffff] ==> none
[    3.192284] node 0 link 0: mmio [f0000000, ffffffff]
[    3.195618] node 0 link 0: mmio [a0000, bffff]
[    3.198954] node 0 link 0: mmio [c8000000, dfffffff]
[    3.202287] TOM2: 0000000538000000 aka 21376M
[    3.205615] bus: [bus 00-07] on node 0 link 0
[    3.208948] bus: 00 [io  0x0000-0xffff]
[    3.212280] bus: 00 [mem 0xf0000000-0xffffffff]
[    3.215615] bus: 00 [mem 0x000a0000-0x000bffff]
[    3.218946] bus: 00 [mem 0xc8000000-0xdfffffff]
[    3.222282] bus: 00 [mem 0x538000000-0xfcffffffff]
[    3.225803] ACPI: bus type PCI registered
[    3.229182] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    3.232286] PCI: not using MMCONFIG
[    3.235613] PCI: Using configuration type 1 for base access
[    3.238949] PCI: Using configuration type 1 for extended access
[    3.248140] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    3.265620] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    3.285715] cryptd: max_cpu_qlen set to 1000
[    3.354500] raid6: sse2x1   gen()  4388 MB/s
[    3.420445] raid6: sse2x1   xor()  4906 MB/s
[    3.487100] raid6: sse2x2   gen()  7395 MB/s
[    3.553774] raid6: sse2x2   xor()  8396 MB/s
[    3.620449] raid6: sse2x4   gen()  7948 MB/s
[    3.687118] raid6: sse2x4   xor()  3996 MB/s
[    3.698954] raid6: using algorithm sse2x4 gen() 7948 MB/s
[    3.715618] raid6: .... xor() 3996 MB/s, rmw enabled
[    3.732284] raid6: using intx1 recovery algorithm
[    3.745759] ACPI: Added _OSI(Module Device)
[    3.758962] ACPI: Added _OSI(Processor Device)
[    3.772280] ACPI: Added _OSI(3.0 _SCP Extensions)
[    3.785615] ACPI: Added _OSI(Processor Aggregator Device)
[    3.798951] ACPI: Added _OSI(Linux-Dell-Video)
[    3.812284] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    3.832152] ACPI: 2 ACPI AML tables successfully acquired and loaded
(XEN) [2019-02-08 19:29:29.274] d0: bind: m_gsi=9 g_gsi=9
[    3.856467] ACPI: Interpreter enabled
[    3.858969] ACPI: (supports S0 S5)
[    3.862283] ACPI: Using IOAPIC for interrupt routing
[    3.865658] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    3.869845] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
[    3.872306] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    3.875724] ACPI: Enabled 9 GPEs in block 00 to 1F
[    3.885195] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    3.885619] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    3.889156] acpi PNP0A03:00: _OSC: platform does not support [LTR]
[    3.892494] acpi PNP0A03:00: _OSC: OS now controls [PME AER PCIeCapability]
[    3.895747] PCI host bridge to bus 0000:00
[    3.898948] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    3.902282] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    3.905614] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    3.908950] pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000dffff window]
[    3.912282] pci_bus 0000:00: root bus resource [mem 0xc8000000-0xdfffffff window]
[    3.915615] pci_bus 0000:00: root bus resource [mem 0xf0000000-0xfebfffff window]
[    3.918949] pci_bus 0000:00: root bus resource [bus 00-ff]
[    3.922282] pci_bus 0000:00: scanning bus
[    3.925638] pci 0000:00:00.0: [1002:5a11] type 00 class 0x060000
[    3.929169] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    3.932314] pci 0000:00:00.2: [1002:5a23] type 00 class 0x080600
[    3.935787] pci 0000:00:00.2: Failed to add - passthrough or MSI/MSI-X might fail!
[    3.938991] pci 0000:00:02.0: [1002:5a16] type 01 class 0x060400
[    3.942365] pci 0000:00:02.0: enabling Extended Tags
[    3.945678] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
[    3.948955] pci 0000:00:02.0: PME# disabled
[    3.952359] pci 0000:00:02.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    3.955646] pci 0000:00:03.0: [1002:5a17] type 01 class 0x060400
[    3.959028] pci 0000:00:03.0: enabling Extended Tags
[    3.962344] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
[    3.965618] pci 0000:00:03.0: PME# disabled
[    3.969024] pci 0000:00:03.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    3.972342] pci 0000:00:05.0: [1002:5a19] type 01 class 0x060400
[    3.975693] pci 0000:00:05.0: enabling Extended Tags
[    3.979009] pci 0000:00:05.0: PME# supported from D0 D3hot D3cold
[    3.982285] pci 0000:00:05.0: PME# disabled
[    3.985691] pci 0000:00:05.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    3.988981] pci 0000:00:06.0: [1002:5a1a] type 01 class 0x060400
[    3.992356] pci 0000:00:06.0: enabling Extended Tags
[    3.995676] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    3.998951] pci 0000:00:06.0: PME# disabled
[    4.002357] pci 0000:00:06.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.005665] pci 0000:00:09.0: [1002:5a1c] type 01 class 0x060400
[    4.009022] pci 0000:00:09.0: enabling Extended Tags
[    4.012343] pci 0000:00:09.0: PME# supported from D0 D3hot D3cold
[    4.015618] pci 0000:00:09.0: PME# disabled
[    4.019022] pci 0000:00:09.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.022316] pci 0000:00:0a.0: [1002:5a1d] type 01 class 0x060400
[    4.025692] pci 0000:00:0a.0: enabling Extended Tags
[    4.029010] pci 0000:00:0a.0: PME# supported from D0 D3hot D3cold
[    4.032285] pci 0000:00:0a.0: PME# disabled
[    4.035689] pci 0000:00:0a.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.038985] pci 0000:00:0c.0: [1002:5a20] type 01 class 0x060400
[    4.042359] pci 0000:00:0c.0: enabling Extended Tags
[    4.045674] pci 0000:00:0c.0: PME# supported from D0 D3hot D3cold
[    4.048951] pci 0000:00:0c.0: PME# disabled
[    4.052358] pci 0000:00:0c.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.055650] pci 0000:00:0d.0: [1002:5a1e] type 01 class 0x060400
[    4.059034] pci 0000:00:0d.0: enabling Extended Tags
[    4.062342] pci 0000:00:0d.0: PME# supported from D0 D3hot D3cold
[    4.065622] pci 0000:00:0d.0: PME# disabled
[    4.069022] pci 0000:00:0d.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.072320] pci 0000:00:11.0: [1002:4391] type 00 class 0x010601
[    4.075664] pci 0000:00:11.0: reg 0x10: [io  0x7000-0x7007]
[    4.078972] pci 0000:00:11.0: reg 0x14: [io  0x6000-0x6003]
[    4.082303] pci 0000:00:11.0: reg 0x18: [io  0x5000-0x5007]
[    4.085635] pci 0000:00:11.0: reg 0x1c: [io  0x3000-0x3003]
[    4.088969] pci 0000:00:11.0: reg 0x20: [io  0x2000-0x200f]
[    4.092305] pci 0000:00:11.0: reg 0x24: [mem 0xfdeff000-0xfdeff3ff]
[    4.095780] pci 0000:00:11.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.099002] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310
[    4.102383] pci 0000:00:12.0: reg 0x10: [mem 0xfdef7000-0xfdef7fff]
[    4.105931] pci 0000:00:12.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.108984] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320
[    4.112329] pci 0000:00:12.2: reg 0x10: [mem 0xfdeff400-0xfdeff4ff]
[    4.115797] pci 0000:00:12.2: supports D1 D2
[    4.118949] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot
[    4.122286] pci 0000:00:12.2: PME# disabled
[    4.125680] pci 0000:00:12.2: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.129000] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310
[    4.132373] pci 0000:00:13.0: reg 0x10: [mem 0xfdefc000-0xfdefcfff]
[    4.135934] pci 0000:00:13.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.138980] pci 0000:00:13.2: [1002:4396] type 00 class 0x0c0320
[    4.142328] pci 0000:00:13.2: reg 0x10: [mem 0xfdeff800-0xfdeff8ff]
[    4.145789] pci 0000:00:13.2: supports D1 D2
[    4.148948] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot
[    4.152286] pci 0000:00:13.2: PME# disabled
[    4.155681] pci 0000:00:13.2: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.158983] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500
[    4.162494] pci 0000:00:14.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.165649] pci 0000:00:14.2: [1002:4383] type 00 class 0x040300
[    4.169074] pci 0000:00:14.2: reg 0x10: [mem 0xfdef8000-0xfdefbfff 64bit]
[    4.172633] pci 0000:00:14.2: PME# supported from D0 D3hot D3cold
[    4.175622] pci 0000:00:14.2: PME# disabled
[    4.179012] pci 0000:00:14.2: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.182397] pci 0000:00:14.3: [1002:439d] type 00 class 0x060100
[    4.185827] pci 0000:00:14.3: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.188977] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401
[    4.192406] pci 0000:00:14.4: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.195637] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310
[    4.199040] pci 0000:00:14.5: reg 0x10: [mem 0xfdefd000-0xfdefdfff]
[    4.202599] pci 0000:00:14.5: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.205650] pci 0000:00:15.0: [1002:43a0] type 01 class 0x060400
[    4.209013] pci 0000:00:15.0: enabling Extended Tags
[    4.212356] pci 0000:00:15.0: supports D1 D2
[    4.215694] pci 0000:00:15.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.218989] pci 0000:00:16.0: [1002:4397] type 00 class 0x0c0310
[    4.222376] pci 0000:00:16.0: reg 0x10: [mem 0xfdefe000-0xfdefefff]
[    4.225934] pci 0000:00:16.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.228984] pci 0000:00:16.2: [1002:4396] type 00 class 0x0c0320
[    4.232326] pci 0000:00:16.2: reg 0x10: [mem 0xfdeffc00-0xfdeffcff]
[    4.235788] pci 0000:00:16.2: supports D1 D2
[    4.238946] pci 0000:00:16.2: PME# supported from D0 D1 D2 D3hot
[    4.242286] pci 0000:00:16.2: PME# disabled
[    4.245683] pci 0000:00:16.2: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.248989] pci 0000:00:18.0: [1022:1200] type 00 class 0x060000
[    4.252411] pci 0000:00:18.0: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.255641] pci 0000:00:18.1: [1022:1201] type 00 class 0x060000
[    4.259054] pci 0000:00:18.1: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.262307] pci 0000:00:18.2: [1022:1202] type 00 class 0x060000
[    4.265719] pci 0000:00:18.2: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.268973] pci 0000:00:18.3: [1022:1203] type 00 class 0x060000
[    4.272406] pci 0000:00:18.3: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.275640] pci 0000:00:18.4: [1022:1204] type 00 class 0x060000
[    4.279053] pci 0000:00:18.4: Failed to add - passthrough or MSI/MSI-X might fail!
[    4.282316] pci_bus 0000:00: fixups for bus
[    4.285617] pci 0000:00:02.0: scanning [bus 0e-0e] behind bridge, pass 0
[    4.289009] pci_bus 0000:0e: scanning bus
[    4.292300] pci 0000:0e:00.0: [1002:95c5] type 00 class 0x030000
(XEN) [2019-02-08 19:29:31.717] mfn: 0xffffffffffffffff type: 1
(XEN) [2019-02-08 19:29:31.734] Assertion 'mfn_valid(mfn) || (mfn_eq(mfn, INVALID_MFN) && p2m_allows_invalid_mfn(p2mt))' failed at p2m-pt.c:656
(XEN) [2019-02-08 19:29:31.772] ----[ Xen-4.12.0-rc  x86_64  debug=y   Tainted:  C   ]----
(XEN) [2019-02-08 19:29:31.796] CPU:    3
(XEN) [2019-02-08 19:29:31.807] RIP:    e008:[<ffff82d08033d560>] p2m-pt.c#p2m_pt_set_entry+0x915/0x9d1
(XEN) [2019-02-08 19:29:31.834] RFLAGS: 0000000000010246   CONTEXT: hypervisor (d0v0)
(XEN) [2019-02-08 19:29:31.857] rax: 0000000000000e60   rbx: ffff83053345f010   rcx: 0000000000000000
(XEN) [2019-02-08 19:29:31.884] rdx: ffff830525337fff   rsi: 000000000000000a   rdi: ffffffffffffffff
(XEN) [2019-02-08 19:29:31.911] rbp: ffff8305253379f8   rsp: ffff830525337958   r8:  ffff8305334a0000
(XEN) [2019-02-08 19:29:31.937] r9:  0000000000000037   r10: 00000000000002cd   r11: 0000000000000003
(XEN) [2019-02-08 19:29:31.964] r12: 0000000000000001   r13: 00000000000d0000   r14: 0000000000000000
(XEN) [2019-02-08 19:29:31.991] r15: ffff83052530c000   cr0: 000000008005003b   cr4: 00000000000006e0
(XEN) [2019-02-08 19:29:32.018] cr3: 00000005252d5000   cr2: 0000000000000000
(XEN) [2019-02-08 19:29:32.038] fsb: 0000000000000000   gsb: ffff88807da00000   gss: 0000000000000000
(XEN) [2019-02-08 19:29:32.065] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) [2019-02-08 19:29:32.090] Xen code around <ffff82d08033d560> (p2m-pt.c#p2m_pt_set_entry+0x915/0x9d1):
(XEN) [2019-02-08 19:29:32.119]  a3 e0 0f 82 e5 fe ff ff <0f> 0b 48 8b 4d 80 48 39 8d 60 ff ff ff 0f 85 a3
(XEN) [2019-02-08 19:29:32.147] Xen stack trace from rsp=ffff830525337958:
(XEN) [2019-02-08 19:29:32.166]    00000000000d0000 00000000000050f7 0000000300000020 ffff8305252d4400
(XEN) [2019-02-08 19:29:32.194]    ffffffffffffffff 0000000900000000 aaaaaaaaaaaaaaaa ffff82d0803e7c9e
(XEN) [2019-02-08 19:29:32.221]    aaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaa 0000000000000000 ffff82d080276540
(XEN) [2019-02-08 19:29:32.248]    0000000000000000 ffff8305252d4000 ffff8305253379d8 ffffffffffffffff
(XEN) [2019-02-08 19:29:32.275]    0000000000000009 00000000000d0000 ffff83053345f010 0000000000000000
(XEN) [2019-02-08 19:29:32.302]    ffff830525337a68 ffff82d080334318 ffffffffffffffff ffff830525337a80
(XEN) [2019-02-08 19:29:32.329]    0000000000000000 0000000100000007 0000000000000200 ffff83052530c000
(XEN) [2019-02-08 19:29:32.356]    00000000000d0000 ffff83053345f010 00000000000d0000 0000000000000009
(XEN) [2019-02-08 19:29:32.383]    00000000000d0000 ffff83052530c000 ffff830525337ab8 ffff82d080336759
(XEN) [2019-02-08 19:29:32.410]    00000009000fe9e0 0000000700000005 ffff830525337aa8 0000000000000009
(XEN) [2019-02-08 19:29:32.437]    ffff83052530c000 00000000000d0000 00000000000d0000 0000000000000000
(XEN) [2019-02-08 19:29:32.464]    ffff830525337b18 ffff82d080338ef7 0000000000000000 00000000000d0000
(XEN) [2019-02-08 19:29:32.491]    00000000000d0000 0000000000010000 ffff830525337b68 ffff830523b81a60
(XEN) [2019-02-08 19:29:32.518]    00000000000d0000 0000000000010000 ffff830525337be8 ffff830525337fff
(XEN) [2019-02-08 19:29:32.545]    ffff830525337b78 ffff82d08025329f ffff830525337b48 00000000000dffff
(XEN) [2019-02-08 19:29:32.572]    ffff830525337ba0 00000000000e0000 0000000000000104 ffff830523b81a60
(XEN) [2019-02-08 19:29:32.599]    ffff830523b819f0 ffff830523b81a08 ffff83052530c000 ffff82d080253258
(XEN) [2019-02-08 19:29:32.626]    ffff830525337bd8 ffff82d0802293b0 ffff830525337ba0 ffff830525337be8
(XEN) [2019-02-08 19:29:32.653]    ffff83052538acd0 0000000000000000 ffff830525337c38 ffff8305251f1000
(XEN) [2019-02-08 19:29:32.680]    ffff8305251f1000 0000000000000000 ffff83052530c000 000000000070b509
(XEN) [2019-02-08 19:29:32.707] Xen call trace:
(XEN) [2019-02-08 19:29:32.720]    [<ffff82d08033d560>] p2m-pt.c#p2m_pt_set_entry+0x915/0x9d1
(XEN) [2019-02-08 19:29:32.745]    [<ffff82d080334318>] p2m_set_entry+0xaa/0x13c
(XEN) [2019-02-08 19:29:32.766]    [<ffff82d080336759>] clear_mmio_p2m_entry+0x397/0x3c5
(XEN) [2019-02-08 19:29:32.789]    [<ffff82d080338ef7>] unmap_mmio_regions+0x7a/0xdb
(XEN) [2019-02-08 19:29:32.812]    [<ffff82d08025329f>] header.c#map_range+0x47/0x16d
(XEN) [2019-02-08 19:29:32.834]    [<ffff82d0802293b0>] rangeset_consume_ranges+0x89/0xdf
(XEN) [2019-02-08 19:29:32.858]    [<ffff82d0802540eb>] vpci_process_pending+0x4e/0x12c
(XEN) [2019-02-08 19:29:32.881]    [<ffff82d0802ff5e1>] handle_hvm_io_completion+0x4d/0x33f
(XEN) [2019-02-08 19:29:32.905]    [<ffff82d0802f5fcd>] hvm_do_resume+0x21/0xd0
(XEN) [2019-02-08 19:29:32.926]    [<ffff82d080312486>] svm.c#svm_do_resume+0xcc/0x14f
(XEN) [2019-02-08 19:29:32.949]    [<ffff82d080275e87>] continue_running+0x18/0x1a
(XEN) [2019-02-08 19:29:32.971]    [<ffff82d080238bfa>] schedule.c#schedule+0x38a/0x6a2
(XEN) [2019-02-08 19:29:32.994]    [<ffff82d08023c606>] softirq.c#__do_softirq+0x71/0x9a
(XEN) [2019-02-08 19:29:33.018]    [<ffff82d08023c679>] do_softirq+0x13/0x15
(XEN) [2019-02-08 19:29:33.038]    [<ffff82d0803172be>] svm_stgi_label+0x13/0x18
(XEN) [2019-02-08 19:29:33.059] 
(XEN) [2019-02-08 19:29:33.068] 
(XEN) [2019-02-08 19:29:33.077] ****************************************
(XEN) [2019-02-08 19:29:33.096] Panic on CPU 3:
(XEN) [2019-02-08 19:29:33.109] Assertion 'mfn_valid(mfn) || (mfn_eq(mfn, INVALID_MFN) && p2m_allows_invalid_mfn(p2mt))' failed at p2m-pt.c:656
(XEN) [2019-02-08 19:29:33.147] ****************************************
(XEN) [2019-02-08 19:29:33.166] 
(XEN) [2019-02-08 19:29:33.175] Reboot in five seconds...
--------------3FA4B773DB3F4A8D40139327
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------3FA4B773DB3F4A8D40139327--
