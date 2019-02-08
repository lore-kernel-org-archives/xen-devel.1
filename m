From: Sander Eikelenboom <linux@eikelenboom.it>
Subject: Re: Xen-unstable PVHdom0: Assertion
 'IS_ALIGNED(dfn_x(dfn), (1ul << page_order))' failed at iommu.c:324
Date: Fri, 8 Feb 2019 17:15:22 +0100
Message-ID: <0c10c9b7-5705-eb98-4ff7-eb1200aba86b@eikelenboom.it>
References: <5ae1965e-9e31-b796-5a37-dfd211b3bd98@eikelenboom.it>
 <20190123182500.fc3nsnjisnbr6qbb@mac>
 <d9272bac-54d6-f4b3-7573-412ac0f048b3@eikelenboom.it>
 <20190124075021.pqwgywacacsun7zd@mac>
 <4da92f88-34ea-30fb-9ff2-5ef72455dab7@eikelenboom.it>
 <20190124101100.iuflmkbbuol3eluz@mac>
 <823f206d-1838-1ed9-0c9f-aaea5afaff3e@eikelenboom.it>
 <20190124120431.hdiojrypvost77pm@mac> <20190125143853.3lx7owqixflnygwj@mac>
 <d1414107-2fc8-f686-79ab-77bb38a60b89@eikelenboom.it>
 <20190208151053.573gy7jnr7jymu4e@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1542FA11E72618B5A38A279C"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aZLP=QP=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1gs8ml-0004Kw-EO
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 16:13:52 +0000
In-Reply-To: <20190208151053.573gy7jnr7jymu4e@mac>
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
--------------1542FA11E72618B5A38A279C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 08/02/2019 16:10, Roger Pau Monné wrote:
> On Fri, Jan 25, 2019 at 07:44:40PM +0100, Sander Eikelenboom wrote:
>> On 25/01/2019 15:38, Roger Pau Monné wrote:
>>> On Thu, Jan 24, 2019 at 01:04:31PM +0100, Roger Pau Monné wrote:
>>> Sorry, fixing that error took longer than expected, and requires
>>> modifying quite a lot of code, so I'm not sure whether it's something
>>> to consider for 4.12, I have to think about it.
>>
>> I understand, especially since PVH dom0 is marked as experimental.
>>
>>> In the meantime, can you please test the following branch:
>>>
>>> git://xenbits.xen.org/people/royger/xen.git iommu-fixes-v2
>>>
>>> I've been able to successfully create a PVH guest from a PVH dom0 on
>>> AMD hardware using this branch.
>>
>> On the other hand, with a quick test I can confirm that booting a PVH guest from a PVH dom0 now works for me as well ! 
>> (and booting this build as PV dom0, with my normal PVH/HVM mix of guests still works, no regressions for me so far)


 
> Sorry for bothering you again, but could you give the following branch
> a test:

No problem, happy to keep testing until it works and is in good enough shape to get committed.

And fortunately you asked, because unfortunately it doesn't boot as pvhdom0, serial log is attached.

--
Sander

> 
> git://xenbits.xen.org/people/royger/xen.git fixes-4.12-v2
> 
> You should hopefully be able to boot a pvh dom0 and create guests from
> it on your AMD hardware.
> 
> Thanks, Roger.
> 


--------------1542FA11E72618B5A38A279C
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
                                                      
(XEN) [0000001a2b740615] Xen version 4.12.0-rc (root@dyndns.org) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516) debug=y  Fri Feb  8 16:55:33 CET 2019
(XEN) [0000001a32e440c5] Latest ChangeSet: Fri Feb 8 15:01:58 2019 +0100 git:ed104d12b9-dirty
(XEN) [0000001a379a4482] Bootloader: GRUB 2.02~beta3-5+deb9u1
(XEN) [0000001a3aba1018] Command line: dom0_mem=2048M,max:2048M loglvl=all console_timestamps=datems vga=gfx-1280x1024x32 no-cpuidle com1=38400,8n1 console=vga,com1 ivrs_ioapic[6]=00:14.0 iommu=on,verbose,debug conring_size=128k ucode=scan sched=credit2 gnttab_max_frames=64 reboot=k dom0=pvh
(XEN) [0000001a494e9056] Xen image load base address: 0
(XEN) [0000001a4c222d7d] Video information:
(XEN) [0000001a4e5d7cea]  VGA is graphics mode 1280x1024, 32 bpp
(XEN) [0000001a51a358a5]  VBE/DDC methods: V2; EDID transfer time: 1 seconds
(XEN) [0000001a55818d76] Disc information:
(XEN) [0000001a57b02a5e]  Found 4 MBR signatures
(XEN) [0000001a5a2aeb63]  Found 4 EDD information structures
(XEN) [0000001a5d3dfc7d] Xen-e820 RAM map:
(XEN) [0000001a5f6ca21e]  0000000000000000 - 0000000000096400 (usable)
(XEN) [0000001a62feb77e]  0000000000096400 - 00000000000a0000 (reserved)
(XEN) [0000001a66aa3075]  00000000000e4000 - 0000000000100000 (reserved)
(XEN) [0000001a6a55a48b]  0000000000100000 - 00000000c7f90000 (usable)
(XEN) [0000001a6de7b95b]  00000000c7f90000 - 00000000c7f9e000 (ACPI data)
(XEN) [0000001a719fd3fb]  00000000c7f9e000 - 00000000c7fe0000 (ACPI NVS)
(XEN) [0000001a754b3972]  00000000c7fe0000 - 00000000c8000000 (reserved)
(XEN) [0000001a78f6c798]  00000000ffe00000 - 0000000100000000 (reserved)
(XEN) [0000001a7ca22738]  0000000100000000 - 0000000538000000 (usable)
(XEN) [0000001a85ab560d] New Xen image base address: 0xc7800000
(XEN) [0000001a88e47dba] ACPI: RSDP 000FB100, 0014 (r0 ACPIAM)
(XEN) [0000001a8c11072b] ACPI: RSDT C7F90000, 0048 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001a90d3ab62] ACPI: FACP C7F90200, 0084 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001a95967bdd] ACPI: DSDT C7F905E0, 9427 (r1  A7640 A7640100      100 INTL 20051117)
(XEN) [0000001a9a592c9b] ACPI: FACS C7F9E000, 0040
(XEN) [0000001a9ced544b] ACPI: APIC C7F90390, 0088 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001aa1b01572] ACPI: MCFG C7F90420, 003C (r1 7640MS OEMMCFG  20100913 MSFT       97)
(XEN) [0000001aa672eafb] ACPI: SLIC C7F90460, 0176 (r1 MSI    OEMSLIC  20100913 MSFT       97)
(XEN) [0000001aab3591de] ACPI: OEMB C7F9E040, 0072 (r1 7640MS A7640100 20100913 MSFT       97)
(XEN) [0000001aaff86acb] ACPI: SRAT C7F9A5E0, 0108 (r3 AMD    FAM_F_10        2 AMD         1)
(XEN) [0000001ab4bb246e] ACPI: HPET C7F9A6F0, 0038 (r1 7640MS OEMHPET  20100913 MSFT       97)
(XEN) [0000001ab97dea6e] ACPI: IVRS C7F9A730, 0108 (r1  AMD     RD890S   202031 AMD         0)
(XEN) [0000001abe40938e] ACPI: SSDT C7F9A840, 0DA4 (r1 A M I  POWERNOW        1 AMD         1)
(XEN) [0000001ac303719a] System RAM: 20479MB (20970648kB)
(XEN) [0000001acd3aa1dd] SRAT: PXM 0 -> APIC 00 -> Node 0
(XEN) [0000001ad027a2b2] SRAT: PXM 0 -> APIC 01 -> Node 0
(XEN) [0000001ad314a125] SRAT: PXM 0 -> APIC 02 -> Node 0
(XEN) [0000001ad601a71b] SRAT: PXM 0 -> APIC 03 -> Node 0
(XEN) [0000001ad8eea5c2] SRAT: PXM 0 -> APIC 04 -> Node 0
(XEN) [0000001adbdbc3bb] SRAT: PXM 0 -> APIC 05 -> Node 0
(XEN) [0000001adec8d046] SRAT: Node 0 PXM 0 0-a0000
(XEN) [0000001ae1699bfa] SRAT: Node 0 PXM 0 100000-c8000000
(XEN) [0000001ae4701336] SRAT: Node 0 PXM 0 100000000-538000000
(XEN) [0000001ae7a92a5a] NUMA: Allocated memnodemap from 5334d6000 - 5334dc000
(XEN) [0000001aeba0d5da] NUMA: Using 8 for the hash shift.
(XEN) [0000001b32a7cd78] Domain heap initialised
(XEN) [0000001b3522847a] Allocated console ring of 128 KiB.
(XEN) [0000001b4b46ec0e] vesafb: framebuffer at 0xd0000000, mapped to 0xffff82c000201000, using 6144k, total 16384k
(XEN) [0000001b51145a8a] vesafb: mode is 1280x1024x32, linelength=5120, font 8x16
(XEN) [0000001b55320935] vesafb: Truecolor: size=0:8:8:8, shift=0:16:8:0
(XEN) [0000001b58de3d25] CPU Vendor: AMD, Family 16 (0x10), Model 10 (0xa), Stepping 0 (raw 00100fa0)
(XEN) [0000001b62f27de5] found SMP MP-table at 000ff780
(XEN) [0000001b65c61bca] DMI present.
(XEN) [0000001b67b535da] Using APIC driver default
(XEN) [0000001b6a49605e] ACPI: PM-Timer IO Port: 0x808 (24 bits)
(XEN) [0000001b6d8f3510] ACPI: SLEEP INFO: pm1x_cnt[1:804,1:0], pm1x_evt[1:800,1:0]
(XEN) [0000001b71c656ae] ACPI:             wakeup_vec[c7f9e00c], vec_size[20]
(XEN) [0000001b75b137fd] ACPI: Local APIC address 0xfee00000
(XEN) [0000001b78c46f53] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) [0000001b7c95e3ba] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
(XEN) [0000001b80677b28] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
(XEN) [0000001b84390ac6] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
(XEN) [0000001b880a7e5e] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] enabled)
(XEN) [0000001b8bdc19bd] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] enabled)
(XEN) [0000001b8fada9ed] ACPI: IOAPIC (id[0x06] address[0xfec00000] gsi_base[0])
(XEN) [0000001b93be929b] IOAPIC[0]: apic_id 6, version 33, address 0xfec00000, GSI 0-23
(XEN) [0000001b9828881e] ACPI: IOAPIC (id[0x07] address[0xfec20000] gsi_base[24])
(XEN) [0000001b9c4630eb] IOAPIC[1]: apic_id 7, version 33, address 0xfec20000, GSI 24-55
(XEN) [0000001ba0bcd53e] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) [0000001ba4da743b] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
(XEN) [0000001ba911a5d8] ACPI: IRQ0 used by override.
(XEN) [0000001babcbd73a] ACPI: IRQ2 used by override.
(XEN) [0000001bae861d1a] ACPI: IRQ9 used by override.
(XEN) [0000001bb1404cc6] Enabling APIC mode:  Flat.  Using 2 I/O APICs
(XEN) [0000001bb4d273ab] ACPI: HPET id: 0x8300 base: 0xfed00000
(XEN) [0000001bb80b9f75] PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) [0000001bbcb4f5a3] PCI: Not using MCFG for segment 0000 bus 00-ff
(XEN) [0000001bc053b085] ERST table was not found
(XEN) [0000001bc2db327e] Using ACPI (MADT) for SMP configuration information
(XEN) [0000001bc6b974ab] SMP: Allowing 6 CPUs (0 hotplug CPUs)
(XEN) [0000001bc9e5f72a] IRQ limits: 56 GSI, 1112 MSI/MSI-X
(XEN) [0000001bccec55f3] microcode: CPU0 updated from revision 0x10000bf to 0x10000dc
(XEN) [0000001bd13ce4c0] traps.c:1574: GPF (0000): ffff82d080425cd6 [probe_cpuid_faulting+0xe/0xa2] -> ffff82d0803808b2
(XEN) [0000001bd73cf763] CPU0: AMD Fam10h machine check reporting enabled
(XEN) [0000001bdaf51a4e] Speculative mitigation facilities:
(XEN) [0000001bddfb7538]   Hardware features:
(XEN) [0000001be0503a70]   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN) [0000001be42e656b]   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other:
(XEN) [0000001be83f7246]   Support for HVM VMs: RSB
(XEN) [0000001beae052b6]   Support for PV VMs: RSB
(XEN) [0000001bed7478a8]   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN) [0000001bf22a90a8]   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) [0000001bf5ef5112] Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) [0000001bf9da4ebb] Initializing Credit2 scheduler
(XEN) [0000001bfcaddfe0]  load_precision_shift: 18
(XEN) [0000001bff420320]  load_window_shift: 30
(XEN) [0000001c01b02178]  underload_balance_tolerance: 0
(XEN) [0000001c049088ca]  overload_balance_tolerance: -3
(XEN) [0000001c0770d190]  runqueues arrangement: socket
(XEN) [0000001c0a447e08]  cap enforcement granularity: 10ms
(XEN) [0000001c0d4ad2a0] load tracking window length 1073741824 ns
(XEN) [0000001c10aa3126] Adding cpu 0 to runqueue 0
(XEN) [0000001c134af256]  First cpu on runqueue, activating
(XEN) [0000001c1fca3f73] Platform timer is 14.318MHz HPET
(XEN) [    2.969665] Detected 3200.142 MHz processor.
(XEN) [    2.985952] Initing memory sharing.
(XEN) [    2.997910] alt table ffff82d080467c70 -> ffff82d080469a92
(XEN) [    3.016592] AMD-Vi: Found MSI capability block at 0x54
(XEN) [    3.033492] AMD-Vi: IVRS Block: Found type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.055591] AMD-Vi: Using IVHD type 0x10
(XEN) [    3.068850] AMD-Vi: ACPI Table:
(XEN) [    3.079769] AMD-Vi:  Signature IVRS
(XEN) [    3.091728] AMD-Vi:  Length 0x108
(XEN) [    3.103167] AMD-Vi:  Revision 0x1
(XEN) [    3.123328] AMD-Vi:  CheckSum 0x65
(XEN) [    3.143673] AMD-Vi:  OEM_Id AMD  
(XEN) [    3.163744] AMD-Vi:  OEM_Table_Id RD890S
(XEN) [    3.185660] AMD-Vi:  OEM_Revision 0x202031
(XEN) [    3.208047] AMD-Vi:  Creator_Id AMD 
(XEN) [    3.228781] AMD-Vi:  Creator_Revision 0
(XEN) [    3.250229] AMD-Vi: IVRS Block: type 0x10 flags 0x3e len 0xd8 id 0x2
(XEN) [    3.279270] AMD-Vi: IVHD Device Entry: type 0x3 id 0 flags 0
(XEN) [    3.306218] AMD-Vi:  Dev_Id Range: 0 -> 0x2
(XEN) [    3.328696] AMD-Vi: IVHD Device Entry: type 0x2 id 0x10 flags 0
(XEN) [    3.356383] AMD-Vi: IVHD Device Entry: type 0x3 id 0xe00 flags 0
(XEN) [    3.384319] AMD-Vi:  Dev_Id Range: 0xe00 -> 0xe01
(XEN) [    3.408328] AMD-Vi: IVHD Device Entry: type 0x2 id 0x18 flags 0
(XEN) [    3.435978] AMD-Vi: IVHD Device Entry: type 0x2 id 0xd00 flags 0
(XEN) [    3.463875] AMD-Vi: IVHD Device Entry: type 0x2 id 0x28 flags 0
(XEN) [    3.491473] AMD-Vi: IVHD Device Entry: type 0x2 id 0xc00 flags 0
(XEN) [    3.519306] AMD-Vi: IVHD Device Entry: type 0x2 id 0x30 flags 0
(XEN) [    3.546838] AMD-Vi: IVHD Device Entry: type 0x2 id 0xb00 flags 0
(XEN) [    3.574644] AMD-Vi: IVHD Device Entry: type 0x2 id 0x48 flags 0
(XEN) [    3.602125] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa00 flags 0
(XEN) [    3.629891] AMD-Vi: IVHD Device Entry: type 0x2 id 0x50 flags 0
(XEN) [    3.657436] AMD-Vi: IVHD Device Entry: type 0x3 id 0x900 flags 0
(XEN) [    3.685295] AMD-Vi:  Dev_Id Range: 0x900 -> 0x907
(XEN) [    3.709240] AMD-Vi: IVHD Device Entry: type 0x2 id 0x60 flags 0
(XEN) [    3.736836] AMD-Vi: IVHD Device Entry: type 0x2 id 0x500 flags 0
(XEN) [    3.764644] AMD-Vi: IVHD Device Entry: type 0x2 id 0x608 flags 0
(XEN) [    3.792437] AMD-Vi: IVHD Device Entry: type 0x2 id 0x800 flags 0
(XEN) [    3.820255] AMD-Vi: IVHD Device Entry: type 0x2 id 0x610 flags 0
(XEN) [    3.848074] AMD-Vi: IVHD Device Entry: type 0x2 id 0x700 flags 0
(XEN) [    3.875905] AMD-Vi: IVHD Device Entry: type 0x2 id 0x68 flags 0
(XEN) [    3.903529] AMD-Vi: IVHD Device Entry: type 0x3 id 0x400 flags 0
(XEN) [    3.931361] AMD-Vi:  Dev_Id Range: 0x400 -> 0x407
(XEN) [    3.955164] AMD-Vi: IVHD Device Entry: type 0x2 id 0x88 flags 0
(XEN) [    3.982593] AMD-Vi: IVHD Device Entry: type 0x3 id 0x90 flags 0
(XEN) [    4.009994] AMD-Vi:  Dev_Id Range: 0x90 -> 0x92
(XEN) [    4.033250] AMD-Vi: IVHD Device Entry: type 0x3 id 0x98 flags 0
(XEN) [    4.060680] AMD-Vi:  Dev_Id Range: 0x98 -> 0x9a
(XEN) [    4.083897] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa0 flags 0xd7
(XEN) [    4.112093] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa2 flags 0
(XEN) [    4.139586] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa3 flags 0
(XEN) [    4.167002] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa4 flags 0
(XEN) [    4.194390] AMD-Vi: IVHD Device Entry: type 0x43 id 0x300 flags 0
(XEN) [    4.222289] AMD-Vi:  Dev_Id Range: 0x300 -> 0x3ff alias 0xa4
(XEN) [    4.248925] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa5 flags 0
(XEN) [    4.276367] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa8 flags 0
(XEN) [    4.303859] AMD-Vi: IVHD Device Entry: type 0x2 id 0xa9 flags 0
(XEN) [    4.331392] AMD-Vi: IVHD Device Entry: type 0x2 id 0x100 flags 0
(XEN) [    4.359224] AMD-Vi: IVHD Device Entry: type 0x3 id 0xb0 flags 0
(XEN) [    4.386835] AMD-Vi:  Dev_Id Range: 0xb0 -> 0xb2
(XEN) [    4.410286] AMD-Vi: IVHD Device Entry: type 0 id 0 flags 0
(XEN) [    4.436609] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0xd7
(XEN) [    4.464559] AMD-Vi: IVHD Special: 0000:00:14.0 variety 0x2 handle 0
(XEN) [    4.493300] AMD-Vi: IVHD Device Entry: type 0x48 id 0 flags 0
(XEN) [    4.520546] AMD-Vi: IVHD Special: 0000:00:00.1 variety 0x1 handle 0x7
(XEN) [    4.550004] AMD-Vi: Disabled HAP memory map sharing with IOMMU
(XEN) [    4.577783] AMD-Vi: IOMMU 0 Enabled.
(XEN) [    4.605746] I/O virtualisation enabled
(XEN) [    4.626998]  - Dom0 mode: Relaxed
(XEN) [    4.646863] Interrupt remapping enabled
(XEN) [    4.668260] nr_sockets: 1
(XEN) [    4.686225] ENABLING IO-APIC IRQs
(XEN) [    4.706036]  -> Using new ACK method
(XEN) [    4.726822] ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) [2019-02-08 16:06:10.079] HVM: ASIDs enabled.
(XEN) [2019-02-08 16:06:10.089] SVM: Supported advanced features:
(XEN) [2019-02-08 16:06:10.098]  - Nested Page Tables (NPT)
(XEN) [2019-02-08 16:06:10.107]  - Last Branch Record (LBR) Virtualisation
(XEN) [2019-02-08 16:06:10.117]  - Next-RIP Saved on #VMEXIT
(XEN) [2019-02-08 16:06:10.126]  - Pause-Intercept Filter
(XEN) [2019-02-08 16:06:10.135] HVM: SVM enabled
(XEN) [2019-02-08 16:06:10.145] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-02-08 16:06:10.154] HVM: HAP page sizes: 4kB, 2MB, 1GB
(XEN) [2019-02-08 16:06:05.036] microcode: CPU1 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 16:06:10.184] Adding cpu 1 to runqueue 0
(XEN) [2019-02-08 16:06:05.036] microcode: CPU2 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 16:06:10.213] Adding cpu 2 to runqueue 0
(XEN) [2019-02-08 16:06:05.036] microcode: CPU3 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 16:06:10.243] Adding cpu 3 to runqueue 0
(XEN) [2019-02-08 16:06:05.036] microcode: CPU4 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 16:06:10.272] Adding cpu 4 to runqueue 0
(XEN) [2019-02-08 16:06:05.036] microcode: CPU5 updated from revision 0x10000bf to 0x10000dc
(XEN) [2019-02-08 16:06:10.302] Adding cpu 5 to runqueue 0
(XEN) [2019-02-08 16:06:10.312] Brought up 6 CPUs
(XEN) [2019-02-08 16:06:10.325] build-id: f0ca5daf958714c52378f75421d0b5afeeefa83c
(XEN) [2019-02-08 16:06:10.335] Running stub recovery selftests...
(XEN) [2019-02-08 16:06:10.345] traps.c:1574: GPF (0000): ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-02-08 16:06:10.354] traps.c:755: Trap 12: ffff82d0bffff040 [ffff82d0bffff040] -> ffff82d080380412
(XEN) [2019-02-08 16:06:10.364] traps.c:1094: Trap 3: ffff82d0bffff041 [ffff82d0bffff041] -> ffff82d080380412
(XEN) [2019-02-08 16:06:10.395] ACPI sleep modes: S3
(XEN) [2019-02-08 16:06:10.405] VPMU: disabled
(XEN) [2019-02-08 16:06:10.415] MCA: Use hw thresholding to adjust polling frequency
(XEN) [2019-02-08 16:06:10.424] mcheck_poll: Machine check polling timer started.
(XEN) [2019-02-08 16:06:10.435] Xenoprofile: Failed to setup IBS LVT offset, IBSCTL = 0xffffffff
(XEN) [2019-02-08 16:06:10.445] Dom0 has maximum 632 PIRQs
(XEN) [2019-02-08 16:06:10.456] Multiple initrd candidates, picking module #1
(XEN) [2019-02-08 16:06:10.466] NX (Execute Disable) protection active
(XEN) [2019-02-08 16:06:10.477] *** Building a PVH Dom0 ***
(XEN) [2019-02-08 16:06:10.523] AMD-Vi: update_paging_mode Try to access pdev_list without aquiring pcidevs_lock.
(XEN) [2019-02-08 16:06:10.712] AMD-Vi: Setup I/O page table: device id = 0, type = 0x6, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.722] AMD-Vi: Setup I/O page table: device id = 0x2, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.733] AMD-Vi: Setup I/O page table: device id = 0x10, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.744] AMD-Vi: Setup I/O page table: device id = 0x18, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.755] AMD-Vi: Setup I/O page table: device id = 0x28, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.767] AMD-Vi: Setup I/O page table: device id = 0x30, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.778] AMD-Vi: Setup I/O page table: device id = 0x48, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.790] AMD-Vi: Setup I/O page table: device id = 0x50, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.802] AMD-Vi: Setup I/O page table: device id = 0x60, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.813] AMD-Vi: Setup I/O page table: device id = 0x68, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.826] AMD-Vi: Setup I/O page table: device id = 0x88, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.838] AMD-Vi: Setup I/O page table: device id = 0x90, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.850] AMD-Vi: Setup I/O page table: device id = 0x92, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.863] AMD-Vi: Setup I/O page table: device id = 0x98, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.876] AMD-Vi: Setup I/O page table: device id = 0x9a, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.889] AMD-Vi: Setup I/O page table: device id = 0xa0, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.902] AMD-Vi: Setup I/O page table: device id = 0xa2, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.916] AMD-Vi: Setup I/O page table: device id = 0xa3, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.929] AMD-Vi: Setup I/O page table: device id = 0xa4, type = 0x5, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.943] AMD-Vi: Setup I/O page table: device id = 0xa5, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.957] AMD-Vi: Setup I/O page table: device id = 0xa8, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.971] AMD-Vi: Setup I/O page table: device id = 0xb0, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:10.985] AMD-Vi: Setup I/O page table: device id = 0xb2, type = 0x7, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.000] AMD-Vi: Skipping host bridge 0000:00:18.0
(XEN) [2019-02-08 16:06:11.014] AMD-Vi: Skipping host bridge 0000:00:18.1
(XEN) [2019-02-08 16:06:11.028] AMD-Vi: Skipping host bridge 0000:00:18.2
(XEN) [2019-02-08 16:06:11.043] AMD-Vi: Skipping host bridge 0000:00:18.3
(XEN) [2019-02-08 16:06:11.058] AMD-Vi: Skipping host bridge 0000:00:18.4
(XEN) [2019-02-08 16:06:11.072] AMD-Vi: Setup I/O page table: device id = 0x400, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.087] AMD-Vi: Setup I/O page table: device id = 0x401, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.103] AMD-Vi: Setup I/O page table: device id = 0x402, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.118] AMD-Vi: Setup I/O page table: device id = 0x403, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.134] AMD-Vi: Setup I/O page table: device id = 0x404, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.150] AMD-Vi: Setup I/O page table: device id = 0x405, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.166] AMD-Vi: Setup I/O page table: device id = 0x406, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.182] AMD-Vi: Setup I/O page table: device id = 0x407, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.198] AMD-Vi: Setup I/O page table: device id = 0x500, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.215] AMD-Vi: Setup I/O page table: device id = 0x608, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.232] AMD-Vi: Setup I/O page table: device id = 0x610, type = 0x2, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.249] AMD-Vi: Setup I/O page table: device id = 0x700, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.266] AMD-Vi: Setup I/O page table: device id = 0x800, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.283] AMD-Vi: Setup I/O page table: device id = 0x900, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.300] AMD-Vi: Setup I/O page table: device id = 0x901, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.318] AMD-Vi: Setup I/O page table: device id = 0x902, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.335] AMD-Vi: Setup I/O page table: device id = 0x903, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.353] AMD-Vi: Setup I/O page table: device id = 0x904, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.371] AMD-Vi: Setup I/O page table: device id = 0x905, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.389] AMD-Vi: Setup I/O page table: device id = 0x906, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.407] AMD-Vi: Setup I/O page table: device id = 0x907, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.426] AMD-Vi: Setup I/O page table: device id = 0xa00, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.444] AMD-Vi: Setup I/O page table: device id = 0xb00, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.463] AMD-Vi: Setup I/O page table: device id = 0xc00, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.482] AMD-Vi: Setup I/O page table: device id = 0xd00, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.501] AMD-Vi: Setup I/O page table: device id = 0xe00, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:11.530] AMD-Vi: Setup I/O page table: device id = 0xe01, type = 0x1, root table = 0x523ce0000, domain = 0, paging mode = 3
(XEN) [2019-02-08 16:06:12.032] WARNING: PVH is an experimental mode with limited functionality
(XEN) [2019-02-08 16:06:12.051] Initial low memory virq threshold set at 0x4000 pages.
(XEN) [2019-02-08 16:06:12.070] Scrubbing Free RAM in background
(XEN) [2019-02-08 16:06:12.089] Std. Loglevel: All
(XEN) [2019-02-08 16:06:12.108] Guest Loglevel: All
(XEN) [2019-02-08 16:06:12.126] Xen is relinquishing VGA console.
(XEN) [2019-02-08 16:06:12.229] *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) [2019-02-08 16:06:12.229] Freed 476kB init memory
(XEN) [2019-02-08 16:06:12.517] Dom0 callback via changed to Direct Vector 0xf3
[    0.000000] Linux version 5.0.0-rc5-20190208-thp-net-florian-doflr+ (root@serveerstertje) (gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Fri Feb 8 13:36:52 CET 2019
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
[    0.052338] tsc: Fast TSC calibration failed
[    0.052339] tsc: Detected 3200.142 MHz processor
[    0.062192] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.062194] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.077021] AGP: No AGP bridge found
[    0.077156] last_pfn = 0x80000 max_arch_pfn = 0x400000000
[    0.077215] MTRR default type: uncachable
[    0.077216] MTRR fixed ranges enabled:
[    0.077218]   00000-9FFFF write-back
[    0.077219]   A0000-EFFFF uncachable
[    0.077220]   F0000-FFFFF write-protect
[    0.077221] MTRR variable ranges enabled:
[    0.077223]   0 base 000000000000 mask FFFF80000000 write-back
[    0.077224]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.077225]   2 base 0000C0000000 mask FFFFF8000000 write-back
[    0.077226]   3 disabled
[    0.077226]   4 disabled
[    0.077227]   5 disabled
[    0.077227]   6 disabled
[    0.077228]   7 disabled
[    0.077229] TOM2: 0000000538000000 aka 21376M
[    0.083275] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.085428] e820: update [mem 0xc8000000-0xffffffff] usable ==> reserved
[    0.085459] check: Scanning 1 areas for low memory corruption
[    0.085462] Base memory trampoline at [(____ptrval____)] 90000 size 24576
[    0.085481] Using GB pages for direct mapping
[    0.085484] BRK [0x03401000, 0x03401fff] PGTABLE
[    0.085487] BRK [0x03402000, 0x03402fff] PGTABLE
[    0.085489] BRK [0x03403000, 0x03403fff] PGTABLE
[    0.085678] RAMDISK: [mem 0x03426000-0x04d80fff]
[    0.085691] ACPI: Early table checksum verification disabled
[    0.085695] ACPI: RSDP 0x0000000080069ED8 000024 (v02 ACPIAM)
[    0.085699] ACPI: XSDT 0x0000000080069EFC 00004C (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.085704] ACPI: APIC 0x0000000080069F48 0000B8 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.085709] ACPI: FACP 0x00000000C7F90200 000084 (v01 7640MS A7640100 20100913 MSFT 00000097)
[    0.085736] ACPI: DSDT 0x00000000C7F905E0 009427 (v01 A7640  A7640100 00000100 INTL 20051117)
[    0.085739] ACPI: FACS 0x00000000C7F9E000 000040
[    0.085743] ACPI: MCFG 0x00000000C7F90420 00003C (v01 7640MS OEMMCFG  20100913 MSFT 00000097)
[    0.085747] ACPI: SLIC 0x00000000C7F90460 000176 (v01 MSI    OEMSLIC  20100913 MSFT 00000097)
[    0.085751] ACPI: SSDT 0x00000000C7F9A840 000DA4 (v01 A M I  POWERNOW 00000001 AMD  00000001)
[    0.085763] ACPI: Local APIC address 0xfee00000
[    0.085886] Scanning NUMA topology in Northbridge 24
[    0.085908] No NUMA configuration found
[    0.085909] Faking a node at [mem 0x0000000000000000-0x000000007fffffff]
[    0.085913] NODE_DATA(0) allocated [mem 0x7fff6000-0x7fffffff]
[    0.085935] Zone ranges:
[    0.085936]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.085938]   DMA32    [mem 0x0000000001000000-0x000000007fffffff]
[    0.085939]   Normal   empty
[    0.085940] Movable zone start for each node
[    0.085941] Early memory node ranges
[    0.085942]   node   0: [mem 0x0000000000001000-0x0000000000095fff]
[    0.085943]   node   0: [mem 0x0000000000100000-0x000000007fffffff]
[    0.085946] Zeroed struct page in unavailable ranges: 107 pages
[    0.085947] Initmem setup node 0 [mem 0x0000000000001000-0x000000007fffffff]
[    0.085948] On node 0 totalpages: 524181
[    0.085949]   DMA zone: 64 pages used for memmap
[    0.085950]   DMA zone: 21 pages reserved
[    0.085951]   DMA zone: 3989 pages, LIFO batch:0
[    0.086046]   DMA32 zone: 8128 pages used for memmap
[    0.086046]   DMA32 zone: 520192 pages, LIFO batch:63
[    0.104302] ACPI: PM-Timer IO Port: 0x808
[    0.104307] ACPI: Local APIC address 0xfee00000
[    0.104376] IOAPIC[0]: apic_id 6, version 17, address 0xfec00000, GSI 0-23
[    0.104416] IOAPIC[1]: apic_id 7, version 17, address 0xfec20000, GSI 24-55
[    0.104420] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.104422] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.104423] ACPI: IRQ0 used by override.
[    0.104425] ACPI: IRQ9 used by override.
[    0.104427] Using ACPI (MADT) for SMP configuration information
[    0.104436] smpboot: Allowing 6 CPUs, 0 hotplug CPUs
[    0.104453] [mem 0xc8000000-0xffdfffff] available for PCI devices
[    0.104454] Booting paravirtualized kernel on Xen PVH
[    0.104458] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
[    0.253246] random: get_random_bytes called from start_kernel+0x91/0x43d with crng_init=0
[    0.253256] setup_percpu: NR_CPUS:6 nr_cpumask_bits:6 nr_cpu_ids:6 nr_node_ids:1
[    0.254042] percpu: Embedded 43 pages/cpu @(____ptrval____) s139224 r8192 d28712 u262144
[    0.254048] pcpu-alloc: s139224 r8192 d28712 u262144 alloc=1*2097152
[    0.254049] pcpu-alloc: [0] 0 1 2 3 4 5 - - 
[    0.254100] xen: PV spinlocks enabled
[    0.254104] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes)
[    0.254109] Built 1 zonelists, mobility grouping on.  Total pages: 515968
[    0.254110] Policy zone: DMA32
[    0.254112] Kernel command line: root=/dev/mapper/serveerstertje_ssd-root ro verbose earlyprintk=xen mem=2048M console=hvc0 scsi_mod.use_blk_mq=1 console=tty0 acpi_enforce_resources=lax max_loop=30 loop_max_part=10 r8169.use_dac=1 loglevel=10 nomodeset net.ifnames=0 biosdevname=0 xen-pciback.hide=(00:14.2)(04:00.*)(08:00.0)(09:00.*)(0a:00.0)(0d:00.0)
[    0.254333] You have booted with nomodeset. This means your GPU drivers are DISABLED
[    0.254334] Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly
[    0.254335] Unless you actually understand what nomodeset does, you should reboot without enabling it
[    0.254423] AGP: Checking aperture...
[    0.269289] AGP: No AGP bridge found
[    0.269297] AGP: Node 0: aperture [bus addr 0x64e000000-0x64fffffff] (32MB)
[    0.269298] Aperture beyond 4GB. Ignoring.
[    0.281805] Memory: 1999828K/2096724K available (18435K kernel code, 1360K rwdata, 5156K rodata, 1360K init, 2428K bss, 96896K reserved, 0K cma-reserved)
[    0.281887] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.281974] rcu: Hierarchical RCU implementation.
[    0.281977] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.281998] Using NULL legacy PIC
[    0.281999] NR_IRQS: 4352, nr_irqs: 1016, preallocated irqs: 0
[    0.282117] xen:events: Using FIFO-based ABI
[    0.282143] xen:events: Xen HVM callback vector for event delivery is enabled
[    0.282204] Console: colour dummy device 80x25
[    0.282379] printk: console [tty0] enabled
[    0.284335] printk: console [hvc0] enabled
[    0.284362] ACPI: Core revision 20181213
[    0.288616] Failed to register legacy timer interrupt
[    0.288644] APIC: Switch to symmetric I/O mode setup
[    0.288838] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2e20d03d098, max_idle_ns: 440795231063 ns
[    0.288879] Calibrating delay loop (skipped), value calculated using timer frequency.. 6402.96 BogoMIPS (lpj=10667140)
[    0.288906] pid_max: default: 32768 minimum: 301
[    0.289645] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.290027] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.290076] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.290107] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.290448] mce: CPU supports 2 MCE banks
[    0.290496] process: using AMD E400 aware idle routine
[    0.290514] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
[    0.290527] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
[    0.290545] Spectre V2 : Mitigation: Full AMD retpoline
[    0.290558] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.290773] Freeing SMP alternatives memory: 52K
[    0.292201] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.292201] Xen: using vcpuop timer interface
[    0.292201] installing Xen timer for CPU 0
[    0.292201] smpboot: CPU0: AMD Phenom(tm) II X6 1090T Processor (family: 0x10, model: 0xa, stepping: 0x0)
[    0.292201] cpu 0 spinlock event irq 29
[    0.292201] Performance Events: PMU not available due to virtualization, using software events only.
[    0.292201] rcu: Hierarchical SRCU implementation.
[    0.292201] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.292201] smp: Bringing up secondary CPUs ...
[    0.292201] installing Xen timer for CPU 1
[    0.292201] x86: Booting SMP configuration:
[    0.292201] .... node  #0, CPUs:      #1
[    0.294607] cpu 1 spinlock event irq 35
[    0.294607] installing Xen timer for CPU 2
[    0.294607]  #2
[    0.298978] cpu 2 spinlock event irq 41
[    0.299046] installing Xen timer for CPU 3
[    0.299155]  #3
[    0.304561] cpu 3 spinlock event irq 47
[    0.304561] installing Xen timer for CPU 4
[    0.304561]  #4
[    0.392297] cpu 4 spinlock event irq 53
[    0.392365] installing Xen timer for CPU 5
[    0.392467]  #5
[    0.397684] cpu 5 spinlock event irq 59
[    0.397684] smp: Brought up 1 node, 6 CPUs
[    0.397684] smpboot: Max logical packages: 2
[    0.397684] smpboot: Total of 6 processors activated (38432.02 BogoMIPS)
[    0.399107] devtmpfs: initialized
[    0.400040] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.400085] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.400243] xor: measuring software checksum speed
[    0.432207]    prefetch64-sse: 17210.400 MB/sec
[    0.465541]    generic_sse: 16437.600 MB/sec
[    0.465555] xor: using function: prefetch64-sse (17210.400 MB/sec)
[    0.466019] NET: Registered protocol family 16
[    0.466055] xen:grant_table: Grant tables using version 1 layout
[    0.466100] Grant table initialized
[    0.466623] cpuidle: using governor ladder
[    0.466623] cpuidle: using governor menu
[    0.466623] node 0 link 0: io port [1000, ffffff]
[    0.466623] TOM: 00000000c8000000 aka 3200M
[    0.466623] Fam 10h mmconf [mem 0xe0000000-0xefffffff]
[    0.466623] node 0 link 0: mmio [e0000000, efffffff] ==> none
[    0.466623] node 0 link 0: mmio [f0000000, ffffffff]
[    0.466623] node 0 link 0: mmio [a0000, bffff]
[    0.466623] node 0 link 0: mmio [c8000000, dfffffff]
[    0.466623] TOM2: 0000000538000000 aka 21376M
[    0.466623] bus: [bus 00-07] on node 0 link 0
[    0.466623] bus: 00 [io  0x0000-0xffff]
[    0.466623] bus: 00 [mem 0xf0000000-0xffffffff]
[    0.466623] bus: 00 [mem 0x000a0000-0x000bffff]
[    0.466623] bus: 00 [mem 0xc8000000-0xdfffffff]
[    0.466623] bus: 00 [mem 0x538000000-0xfcffffffff]
[    0.466623] ACPI: bus type PCI registered
[    0.466623] random: fast init done
[    0.466623] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.466623] PCI: not using MMCONFIG
[    0.466623] PCI: Using configuration type 1 for base access
[    0.466623] PCI: Using configuration type 1 for extended access
[    0.474896] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.474896] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.475571] cryptd: max_cpu_qlen set to 1000
[    0.475676] raid6: using algorithm sse2x4 gen() 0 MB/s
[    0.475676] raid6: .... xor() 0 MB/s, rmw enabled
[    0.475676] raid6: using intx1 recovery algorithm
[    0.475753] ACPI: Added _OSI(Module Device)
[    0.475767] ACPI: Added _OSI(Processor Device)
[    0.475784] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.475801] ACPI: Added _OSI(Processor Aggregator Device)
[    0.475817] ACPI: Added _OSI(Linux-Dell-Video)
[    0.475832] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.475848] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.482864] ACPI: 2 ACPI AML tables successfully acquired and loaded
(XEN) [2019-02-08 16:06:12.787] d0: bind: m_gsi=9 g_gsi=9
[    0.483944] ACPI: Interpreter enabled
[    0.483944] ACPI: (supports S0 S5)
[    0.483944] ACPI: Using IOAPIC for interrupt routing
[    0.483944] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.486329] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
[    0.486389] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.486535] ACPI: Enabled(XEN) [2019-02-08 16:06:17.053] 
(XEN) [2019-02-08 16:06:17.062] ****************************************
(XEN) [2019-02-08 16:06:17.081] Panic on CPU 3:
(XEN) [2019-02-08 16:06:17.094] Assertion 'mfn_valid(mfn) || (mfn_eq(mfn, INVALID_MFN) && p2m_allows_invalid_mfn(p2mt))' failed at p2m-pt.c:652
(XEN) [2019-02-08 16:06:17.132] ****************************************
(XEN) [2019-02-08 16:06:17.151] 
(XEN) [2019-02-08 16:06:17.160] Reboot in five seconds...
--------------1542FA11E72618B5A38A279C
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------1542FA11E72618B5A38A279C--
