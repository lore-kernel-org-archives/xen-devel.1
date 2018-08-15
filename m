From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Armv8-A: Not able to enable secondary CPUs in
 Hikey960 board
Date: Wed, 15 Aug 2018 14:45:05 +0530
Message-ID: <CAC4nxbvnDGOJotFe0VD6zOjhJcb5TOfLMLtdxPd3Lh8KKPgYLQ@mail.gmail.com>
References: <CAC4nxbsJss__sbvs5fKEW1RZAiyC8KNvV3HMPM88v4HmBwO+ZA@mail.gmail.com>
 <20180811170626.GB20295@char.us.oracle.com>
 <CAC4nxbtEJEnZ9o4hRqSwk_9hzJa1aCvNfGPTccvHRMAp7BvS4g@mail.gmail.com>
 <20180813130114.GA14031@char.us.oracle.com>
 <1d456451-6beb-5a4b-968a-5539f7b8c01b@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2856718557872954721=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1d456451-6beb-5a4b-968a-5539f7b8c01b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xensource.com
List-Id: xen-devel@lists.xenproject.org

--===============2856718557872954721==
Content-Type: multipart/alternative; boundary="0000000000002e5192057375c385"

--0000000000002e5192057375c385
Content-Type: text/plain; charset="UTF-8"

HI Julien,

As you suggested, I enabled early printk for hikey960 in xen-4.8 stable
branch and  xen-4.11 stable branch.



Please find below xen-4.8 log after early printk:
------------------------------------------------------
Using modules provided by bootloader in FDT
Xen 4.8.5-pre (c/s Mon Jul 30 12:10:58 2018 +0200 git:aa45015-dirty) EFI
loader
- UART enabled -
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000000000000 - 000000001abfffff
(XEN) RAM: 000000001ad88000 - 0000000031ffffff
(XEN) RAM: 0000000032101000 - 000000003dffffff
(XEN) RAM: 0000000040000000 - 000000004ae9ffff
(XEN) RAM: 0000000089cc0000 - 00000000b83bdfff
(XEN) RAM: 00000000b9b09000 - 00000000b9bcffff
(XEN) RAM: 00000000b9c70000 - 00000000b9c72fff
(XEN) RAM: 00000000b9c74000 - 00000000b9d5ffff
(XEN) RAM: 00000000ba125000 - 00000000ba12bfff
(XEN) RAM: 00000000ba12c000 - 00000000bdd1bfff
(XEN) RAM: 00000000bdd1c000 - 00000000bddccfff
(XEN) RAM: 00000000bddcd000 - 00000000bde82fff
(XEN) RAM: 00000000bde83000 - 00000000bef5ffff
(XEN) RAM: 00000000bef60000 - 00000000bf0effff
(XEN) RAM: 00000000bf0f0000 - 00000000bf13ffff
(XEN) RAM: 00000000bf190000 - 00000000bf193fff
(XEN) RAM: 00000000bf194000 - 00000000bfffffff
(XEN) RAM: 00000000c0000000 - 00000000dfffffff
(XEN) RAM: 0000000200000000 - 000000021fffffff
(XEN)
(XEN) MODULE[0]: 00000000b83be000 - 00000000b83cf000 Device Tree
(XEN) MODULE[1]: 00000000b84e0000 - 00000000b9996200 Kernel
 console=tty0 console=hvc0 root=/dev/sdd10 rw efi=noruntime
(XEN)
(XEN) Command line: loglvl=all console=dtuart dtuart=/soc/serial@fff32000
efi=no-rs
(XEN) Placing Xen at 0x000000001aa00000-0x000000001ac00000
(XEN) Update BOOTMOD_XEN from 00000000b83cf000-00000000b84cfd81 =>
000000001aa00000-000000001ab00d81
(XEN) Domain heap initialised
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "/soc/serial@fff32000", options ""
 Xen 4.8.5-pre
(XEN) Xen version 4.8.5-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro
GCC 7.1-2017.05) 7.1.1 20170510) debug=n  Wed Aug 15 13:20:23 IST 2018
(XEN) Latest ChangeSet: Mon Jul 30 12:10:58 2018 +0200 git:aa45015-dirty
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using PSCI-1.1 for SMP bringup
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 1920 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000e82b1000
(XEN)         gic_cpu_addr=00000000e82b2000
(XEN)         gic_hyp_addr=00000000e82b4000
(XEN)         gic_vcpu_addr=00000000e82b6000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 64 KiB.
(XEN) Bringing up CPU1
- CPU 00000001 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 1 booted.
(XEN) Bringing up CPU2
- CPU 00000002 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 2 booted.
(XEN) Bringing up CPU3
- CPU 00000003 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 3 booted.
(XEN) Bringing up CPU4
- CPU 00000100 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 4 booted.
(XEN) Bringing up CPU5
- CPU 00000101 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 5 booted.
(XEN) Bringing up CPU6
- CPU 00000102 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 6 booted.
(XEN) Bringing up CPU7
- CPU 00000103 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 7 booted.
(XEN) Brought up 8 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: 293f242dc5faa48be9f27a20ffd457688c3fc38c
(XEN) alternatives: Patching with alt table 00000000400a48c8 ->
00000000400a4c64
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 00000000b84e0000
(XEN) Allocating 1:1 mappings totalling 128MB for dom0:
(XEN) BANK[0] 0x00000010000000-0x00000018000000 (128MB)
(XEN) Grant table range: 0x0000001aa00000-0x0000001aa5f000
(XEN) Loading zImage from 00000000b84e0000 to
0000000010080000-0000000011536200
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading dom0 DTB to 0x0000000017e00000-0x0000000017e0d91c
(XEN) Scrubbing Free RAM on 1 nodes using 8 CPUs
(XEN) .........done.
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)
(XEN) Freed 272kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER32
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER36
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.9.113-07887-geb8dbd1-dirty
(omkar.bolla@OmkarB-LaptopU) (gcc version 7.1.1 20170510 (Linaro GCC
7.1-2017.05) ) #6 SMP PREEMPT Wed A
ug 15 11:55:00 IST 2018
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Xen 4.8 support found
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] Ion: base 0x14e00000, size is 0x1e00000, node name graphic,
heap-name carveout_gralloc namesize 17,[99][97][114][118]
[    0.000000] Ion: insert heap-name carveout_gralloc
[    0.000000] OF: reserved mem: initialized node graphic, compatible id
hisi_ion
[    0.000000] Reserved memory: created CMA memory pool at
0x0000000016c00000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node fastboot-cma-mem,
compatible id shared-dma-pool
[    0.000000] cma: Failed to reserve 64 MiB
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv0.2 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] percpu: Embedded 23 pages/cpu @ffffffc014ce9000 s54936 r8192
d31080 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 32256
[    0.000000] Kernel command line: console=tty0 console=hvc0
root=/dev/sdd10 rw efi=noruntime
[    0.000000] PID hash table entries: 512 (order: 0, 4096 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 5, 131072
bytes)


------------------------------------------------------
Please find below xen-4.8 log after early printk:
------------------------------------------------------
Using modules provided by bootloader in FDT
Xen 4.11.1-pre (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72-dirty) EFI
loader

- UART enabled -
- CPU 00000000 booting -
- Current EL 00000008 -
- Xen starting at EL2 -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000000000000 - 000000001abfffff
(XEN) RAM: 000000001ad88000 - 0000000031ffffff
(XEN) RAM: 0000000032101000 - 000000003dffffff
(XEN) RAM: 0000000040000000 - 000000004ae9ffff
(XEN) RAM: 0000000089cc0000 - 00000000b83adfff
(XEN) RAM: 00000000b9b09000 - 00000000b9bcffff
(XEN) RAM: 00000000b9c70000 - 00000000b9c72fff
(XEN) RAM: 00000000b9c74000 - 00000000b9d5ffff
(XEN) RAM: 00000000ba125000 - 00000000ba12bfff
(XEN) RAM: 00000000ba12c000 - 00000000bdd1bfff
(XEN) RAM: 00000000bdd1c000 - 00000000bddccfff
(XEN) RAM: 00000000bddcd000 - 00000000bde82fff
(XEN) RAM: 00000000bde83000 - 00000000bef5ffff
(XEN) RAM: 00000000bef60000 - 00000000bf0effff
(XEN) RAM: 00000000bf0f0000 - 00000000bf13ffff
(XEN) RAM: 00000000bf190000 - 00000000bf193fff
(XEN) RAM: 00000000bf194000 - 00000000bfffffff
(XEN) RAM: 00000000c0000000 - 00000000dfffffff
(XEN) RAM: 0000000200000000 - 000000021fffffff
(XEN)
(XEN) MODULE[0]: 00000000b83ae000 - 00000000b83bf000 Device Tree
(XEN) MODULE[1]: 00000000b84d8000 - 00000000b998e200 Kernel
 console=tty0 console=hvc0 root=/dev/sdd10 rw efi=noruntime
(XEN)
(XEN) Command line: loglvl=all console=dtuart dtuart=/soc/serial@fff32000
efi=no-rs
(XEN) parameter "efi" unknown!
(XEN) Placing Xen at 0x000000021fe00000-0x0000000220000000
(XEN) Update BOOTMOD_XEN from 00000000b83bf000-00000000b84c7d81 =>
000000021fe00000-000000021ff08d81
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "/soc/serial@fff32000", options ""
 Xen 4.11.1-pre
(XEN) Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro
GCC 7.1-2017.05) 7.1.1 20170510) debug=n  Wed Aug 15 14:18:23 IST 2018
(XEN) Latest ChangeSet: Mon Jul 30 11:30:09 2018 +0200 git:33ced72-dirty
(XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
(XEN) 64-bit Execution:
(XEN)   Processor Features: 0000000000002222 0000000000000000
(XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
(XEN)     Extensions: FloatingPoint AdvancedSIMD
(XEN)   Debug Features: 0000000010305106 0000000000000000
(XEN)   Auxiliary Features: 0000000000000000 0000000000000000
(XEN)   Memory Model Features: 0000000000001122 0000000000000000
(XEN)   ISA Features:  0000000000011120 0000000000000000
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00000131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 03010066
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
(XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
(XEN) Using SMC Calling Convention v1.1
(XEN) Using PSCI v1.1
(XEN) SMP: Allowing 8 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 1920 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=00000000e82b1000
(XEN)         gic_cpu_addr=00000000e82b2000
(XEN)         gic_hyp_addr=00000000e82b4000
(XEN)         gic_vcpu_addr=00000000e82b6000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 64 KiB.
(XEN) Bringing up CPU1
(XEN) Failed to bring up CPU1
(XEN) Failed to bring up CPU 1 (error -9)
(XEN) Bringing up CPU2
(XEN) Failed to bring up CPU2
(XEN) Failed to bring up CPU 2 (error -9)
(XEN) Bringing up CPU3
(XEN) Failed to bring up CPU3
(XEN) Failed to bring up CPU 3 (error -9)
(XEN) Bringing up CPU4
(XEN) Failed to bring up CPU4
(XEN) Failed to bring up CPU 4 (error -9)
(XEN) Bringing up CPU5
(XEN) Failed to bring up CPU5
(XEN) Failed to bring up CPU 5 (error -9)
(XEN) Bringing up CPU6
(XEN) Failed to bring up CPU6
(XEN) Failed to bring up CPU 6 (error -9)
(XEN) Bringing up CPU7
(XEN) Failed to bring up CPU7
(XEN) Failed to bring up CPU 7 (error -9)
(XEN) Brought up 1 CPUs
(XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
(XEN) I/O virtualisation disabled
(XEN) build-id: 52630f42d6da8e35f5a018454a0f57bdfdba3f8f
(XEN) alternatives: Patching with alt table 00000000400acff8 ->
00000000400ad568
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 00000000b84d8000
(XEN) Allocating 1:1 mappings totalling 512MB for dom0:
(XEN) BANK[0] 0x000000c0000000-0x000000e0000000 (512MB)
(XEN) Grant table range: 0x0000021fe00000-0x0000021fe40000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 00000000b84d8000 to
00000000c0080000-00000000c1536200
(XEN) Loading dom0 DTB to 0x00000000c8000000-0x00000000c800d638
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 1 CPUs
(XEN)
....................................................................done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
(XEN) ***************************************************
(XEN) PLEASE SPECIFY dom0_mem PARAMETER - USING 512M FOR NOW
(XEN) ***************************************************
(XEN) 3... 2... 1...
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)
(XEN) Freed 280kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER20
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER24
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER28
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER32
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER36
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.9.113-07887-geb8dbd1-dirty
(omkar.bolla@OmkarB-LaptopU) (gcc version 7.1.1 20170510 (Linaro GCC
7.1-2017.05) ) #6 SMP PREEMPT Wed A
ug 15 11:55:00 IST 2018
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Xen 4.11 support found
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] Ion: base 0xde200000, size is 0x1e00000, node name graphic,
heap-name carveout_gralloc namesize 17,[99][97][114][118]
[    0.000000] Ion: insert heap-name carveout_gralloc
[    0.000000] OF: reserved mem: initialized node graphic, compatible id
hisi_ion
[    0.000000] Reserved memory: created CMA memory pool at
0x0000000016c00000, size 64 MiB
[    0.000000] OF: reserved mem: initialized node fastboot-cma-mem,
compatible id shared-dma-pool
[    0.000000] cma: Reserved 64 MiB at 0x00000000da000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 23 pages/cpu @ffffffc01e18b000 s54936 r8192
d31080 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 129024
[    0.000000] Kernel command line: console=tty0 console=hvc0
root=/dev/sdd10 rw efi=noruntime
[    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288
bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144
bytes)
------------------------------------------------------

In above logs, I marked CMA memory area reserving, which is giving errors
while initialising cma pools in linux when i am using xen-4.8
Could you please tell me, what could be the problem?
I hope it belongs to CMA memory address part in DTS, please correct me if i
were wrong.


Thank you,
Omkar B

On Mon, Aug 13, 2018 at 8:40 PM, Julien Grall <julien.grall@arm.com> wrote:

> Hello,
>
> On 13/08/18 14:01, Konrad Rzeszutek Wilk wrote:
>
>> On Mon, Aug 13, 2018 at 11:16:14AM +0530, Omkar Bolla wrote:
>>
>>> Please check below log:
>>>>> --------------------------------
>>>>>   Using modules provided by bootloader in FDT
>>>>> Xen 4.11.1-pre (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72) EFI
>>>>>
>>>> loader
>>>>
>>>>>   Xen 4.11.1-pre
>>>>> (XEN) Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc
>>>>>
>>>> (Linaro
>>>>
>>>>> GCC 7.1-2017.05) 7.1.1 20170510) debug=n  Sat Aug 11 20:35:10 IST 201
>>>>> 8
>>>>> (XEN) Latest ChangeSet: Mon Jul 30 11:30:09 2018 +0200 git:33ced72
>>>>> (XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev
>>>>>
>>>> 0x4
>>>>
>>>>> (XEN) 64-bit Execution:
>>>>> (XEN)   Processor Features: 0000000000002222 0000000000000000
>>>>> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
>>>>> (XEN)     Extensions: FloatingPoint AdvancedSIMD
>>>>> (XEN)   Debug Features: 0000000010305106 0000000000000000
>>>>> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
>>>>> (XEN)   Memory Model Features: 0000000000001122 0000000000000000
>>>>> (XEN)   ISA Features:  0000000000011120 0000000000000000
>>>>> (XEN) 32-bit Execution:
>>>>> (XEN)   Processor Features: 00000131:00011011
>>>>> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
>>>>> (XEN)     Extensions: GenericTimer Security
>>>>> (XEN)   Debug Features: 03010066
>>>>> (XEN)   Auxiliary Features: 00000000
>>>>> (XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
>>>>> (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142
>>>>>
>>>> 00011121
>>>>
>>>>> (XEN) Using SMC Calling Convention v1.1
>>>>> (XEN) Using PSCI v1.1
>>>>> (XEN) SMP: Allowing 8 CPUs
>>>>> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 1920 KHz
>>>>> (XEN) GICv2 initialization:
>>>>> (XEN)         gic_dist_addr=00000000e82b1000
>>>>> (XEN)         gic_cpu_addr=00000000e82b2000
>>>>> (XEN)         gic_hyp_addr=00000000e82b4000
>>>>> (XEN)         gic_vcpu_addr=00000000e82b6000
>>>>> (XEN)         gic_maintenance_irq=25
>>>>> (XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).
>>>>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
>>>>> (XEN) Allocated console ring of 64 KiB.
>>>>> (XEN) Bringing up CPU1
>>>>> (XEN) Failed to bring up CPU1
>>>>> (XEN) Failed to bring up CPU 1 (error -9)
>>>>>
>>>>
> I think the -9 is coming from PSCI which means INVALID_ADDRESS. This means
> Xen gave an invalid entry point to PSCI CPU_UP.
>
> It would be interesting to know where Xen is loaded in memory with Xen 4.8
> and Xen 4.11. This will be printed when early printk is enabled as the
> console is not yet setup.
>
> To get early printk, you could use CONFIG_EARLY_PRINTK=hikey960 on the
> make command line. Note this requires to have debug enabled.
>
> Once you have early printk setup you should have a message similar to
> "Update BOOTMOD_XEN from ... to ...".
>
> Also, as Konrad suggested it, I would recommend to bisect Xen and see if
> you can pin point a commit.
>
> Cheers,
>
> --
> Julien Grall
>

-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.

--0000000000002e5192057375c385
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">HI Julien,</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)"><br></div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">As=
 you suggested, I enabled early printk for hikey960 in xen-4.8 stable branc=
h and <span style=3D"font-size:small;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline"><span>=C2=A0</span>xen-4.11 stable branch</span>.</div><div class=
=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_=
default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_defau=
lt" style=3D"color:rgb(11,83,148)">Please find below xen-4.8 log after earl=
y printk:</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">=
------------------------------------------------------</div><div class=3D"g=
mail_default" style=3D"color:rgb(11,83,148)"><div class=3D"gmail_default">U=
sing modules provided by bootloader in FDT</div><div class=3D"gmail_default=
">Xen 4.8.5-pre (c/s Mon Jul 30 12:10:58 2018 +0200 git:aa45015-dirty) EFI =
loader</div><div class=3D"gmail_default">- UART enabled -</div><div class=
=3D"gmail_default">- CPU 00000000 booting -</div><div class=3D"gmail_defaul=
t">- Current EL 00000008 -</div><div class=3D"gmail_default">- Xen starting=
 at EL2 -</div><div class=3D"gmail_default">- Zero BSS -</div><div class=3D=
"gmail_default">- Setting up control registers -</div><div class=3D"gmail_d=
efault">- Turning on paging -</div><div class=3D"gmail_default">- Ready -</=
div><div class=3D"gmail_default">(XEN) Checking for initrd in /chosen</div>=
<div class=3D"gmail_default">(XEN) RAM: 0000000000000000 - 000000001abfffff=
</div><div class=3D"gmail_default">(XEN) RAM: 000000001ad88000 - 0000000031=
ffffff</div><div class=3D"gmail_default">(XEN) RAM: 0000000032101000 - 0000=
00003dffffff</div><div class=3D"gmail_default">(XEN) RAM: 0000000040000000 =
- 000000004ae9ffff</div><div class=3D"gmail_default">(XEN) RAM: 0000000089c=
c0000 - 00000000b83bdfff</div><div class=3D"gmail_default">(XEN) RAM: 00000=
000b9b09000 - 00000000b9bcffff</div><div class=3D"gmail_default">(XEN) RAM:=
 00000000b9c70000 - 00000000b9c72fff</div><div class=3D"gmail_default">(XEN=
) RAM: 00000000b9c74000 - 00000000b9d5ffff</div><div class=3D"gmail_default=
">(XEN) RAM: 00000000ba125000 - 00000000ba12bfff</div><div class=3D"gmail_d=
efault">(XEN) RAM: 00000000ba12c000 - 00000000bdd1bfff</div><div class=3D"g=
mail_default">(XEN) RAM: 00000000bdd1c000 - 00000000bddccfff</div><div clas=
s=3D"gmail_default">(XEN) RAM: 00000000bddcd000 - 00000000bde82fff</div><di=
v class=3D"gmail_default">(XEN) RAM: 00000000bde83000 - 00000000bef5ffff</d=
iv><div class=3D"gmail_default">(XEN) RAM: 00000000bef60000 - 00000000bf0ef=
fff</div><div class=3D"gmail_default">(XEN) RAM: 00000000bf0f0000 - 0000000=
0bf13ffff</div><div class=3D"gmail_default">(XEN) RAM: 00000000bf190000 - 0=
0000000bf193fff</div><div class=3D"gmail_default">(XEN) RAM: 00000000bf1940=
00 - 00000000bfffffff</div><div class=3D"gmail_default">(XEN) RAM: 00000000=
c0000000 - 00000000dfffffff</div><div class=3D"gmail_default">(XEN) RAM: 00=
00000200000000 - 000000021fffffff</div><div class=3D"gmail_default">(XEN)=
=C2=A0</div><div class=3D"gmail_default">(XEN) MODULE[0]: 00000000b83be000 =
- 00000000b83cf000 Device Tree=C2=A0=C2=A0</div><div class=3D"gmail_default=
">(XEN) MODULE[1]: 00000000b84e0000 - 00000000b9996200 Kernel=C2=A0 =C2=A0 =
=C2=A0 =C2=A0console=3Dtty0 console=3Dhvc0 root=3D/dev/sdd10 rw efi=3Dnorun=
time</div><div class=3D"gmail_default">(XEN)=C2=A0</div><div class=3D"gmail=
_default">(XEN) Command line: loglvl=3Dall console=3Ddtuart dtuart=3D/soc/s=
erial@fff32000 efi=3Dno-rs</div><div class=3D"gmail_default">(XEN) Placing =
Xen at 0x000000001aa00000-0x000000001ac00000</div><div class=3D"gmail_defau=
lt">(XEN) Update BOOTMOD_XEN from 00000000b83cf000-00000000b84cfd81 =3D&gt;=
 000000001aa00000-000000001ab00d81</div><div class=3D"gmail_default">(XEN) =
Domain heap initialised</div><div class=3D"gmail_default">(XEN) Platform: G=
eneric System</div><div class=3D"gmail_default">(XEN) Looking for dtuart at=
 &quot;/soc/serial@fff32000&quot;, options &quot;&quot;</div><div class=3D"=
gmail_default">=C2=A0Xen 4.8.5-pre</div><div class=3D"gmail_default">(XEN) =
Xen version 4.8.5-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro GCC 7.1=
-2017.05) 7.1.1 20170510) debug=3Dn=C2=A0 Wed Aug 15 13:20:23 IST 2018</div=
><div class=3D"gmail_default">(XEN) Latest ChangeSet: Mon Jul 30 12:10:58 2=
018 +0200 git:aa45015-dirty</div><div class=3D"gmail_default">(XEN) Process=
or: 410fd034: &quot;ARM Limited&quot;, variant: 0x0, part 0xd03, rev 0x4</d=
iv><div class=3D"gmail_default">(XEN) 64-bit Execution:</div><div class=3D"=
gmail_default">(XEN)=C2=A0 =C2=A0Processor Features: 0000000000002222 00000=
00000000000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0Exce=
ption Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32</div><div class=3D"gm=
ail_default">(XEN)=C2=A0 =C2=A0 =C2=A0Extensions: FloatingPoint AdvancedSIM=
D</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0Debug Features: 00000=
00010305106 0000000000000000</div><div class=3D"gmail_default">(XEN)=C2=A0 =
=C2=A0Auxiliary Features: 0000000000000000 0000000000000000</div><div class=
=3D"gmail_default">(XEN)=C2=A0 =C2=A0Memory Model Features: 000000000000112=
2 0000000000000000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0ISA =
Features:=C2=A0 0000000000011120 0000000000000000</div><div class=3D"gmail_=
default">(XEN) 32-bit Execution:</div><div class=3D"gmail_default">(XEN)=C2=
=A0 =C2=A0Processor Features: 00000131:00011011</div><div class=3D"gmail_de=
fault">(XEN)=C2=A0 =C2=A0 =C2=A0Instruction Sets: AArch32 A32 Thumb Thumb-2=
 Jazelle</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0Extensi=
ons: GenericTimer Security</div><div class=3D"gmail_default">(XEN)=C2=A0 =
=C2=A0Debug Features: 03010066</div><div class=3D"gmail_default">(XEN)=C2=
=A0 =C2=A0Auxiliary Features: 00000000</div><div class=3D"gmail_default">(X=
EN)=C2=A0 =C2=A0Memory Model Features: 10201105 40000000 01260000 02102211<=
/div><div class=3D"gmail_default">(XEN)=C2=A0 ISA Features: 02101110 131121=
11 21232042 01112131 00011142 00011121</div><div class=3D"gmail_default">(X=
EN) Using PSCI-1.1 for SMP bringup</div><div class=3D"gmail_default">(XEN) =
SMP: Allowing 8 CPUs</div><div class=3D"gmail_default">(XEN) Generic Timer =
IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 1920 KHz</div><div class=3D"gmail_d=
efault">(XEN) GICv2 initialization:</div><div class=3D"gmail_default">(XEN)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_dist_addr=3D00000000e82b1000</div><di=
v class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_cpu_ad=
dr=3D00000000e82b2000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0gic_hyp_addr=3D00000000e82b4000</div><div class=3D"gmai=
l_default">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_vcpu_addr=3D00000000e=
82b6000</div><div class=3D"gmail_default">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0gic_maintenance_irq=3D25</div><div class=3D"gmail_default">(XEN) GICv=
2: 384 lines, 8 cpus, secure (IID 0200143b).</div><div class=3D"gmail_defau=
lt">(XEN) Using scheduler: SMP Credit Scheduler (credit)</div><div class=3D=
"gmail_default">(XEN) Allocated console ring of 64 KiB.</div><div class=3D"=
gmail_default">(XEN) Bringing up CPU1</div><div class=3D"gmail_default">- C=
PU 00000001 booting -</div><div class=3D"gmail_default">- Current EL 000000=
08 -</div><div class=3D"gmail_default">- Xen starting at EL2 -</div><div cl=
ass=3D"gmail_default">- Setting up control registers -</div><div class=3D"g=
mail_default">- Turning on paging -</div><div class=3D"gmail_default">- Rea=
dy -</div><div class=3D"gmail_default">(XEN) CPU 1 booted.</div><div class=
=3D"gmail_default">(XEN) Bringing up CPU2</div><div class=3D"gmail_default"=
>- CPU 00000002 booting -</div><div class=3D"gmail_default">- Current EL 00=
000008 -</div><div class=3D"gmail_default">- Xen starting at EL2 -</div><di=
v class=3D"gmail_default">- Setting up control registers -</div><div class=
=3D"gmail_default">- Turning on paging -</div><div class=3D"gmail_default">=
- Ready -</div><div class=3D"gmail_default">(XEN) CPU 2 booted.</div><div c=
lass=3D"gmail_default">(XEN) Bringing up CPU3</div><div class=3D"gmail_defa=
ult">- CPU 00000003 booting -</div><div class=3D"gmail_default">- Current E=
L 00000008 -</div><div class=3D"gmail_default">- Xen starting at EL2 -</div=
><div class=3D"gmail_default">- Setting up control registers -</div><div cl=
ass=3D"gmail_default">- Turning on paging -</div><div class=3D"gmail_defaul=
t">- Ready -</div><div class=3D"gmail_default">(XEN) CPU 3 booted.</div><di=
v class=3D"gmail_default">(XEN) Bringing up CPU4</div><div class=3D"gmail_d=
efault">- CPU 00000100 booting -</div><div class=3D"gmail_default">- Curren=
t EL 00000008 -</div><div class=3D"gmail_default">- Xen starting at EL2 -</=
div><div class=3D"gmail_default">- Setting up control registers -</div><div=
 class=3D"gmail_default">- Turning on paging -</div><div class=3D"gmail_def=
ault">- Ready -</div><div class=3D"gmail_default">(XEN) CPU 4 booted.</div>=
<div class=3D"gmail_default">(XEN) Bringing up CPU5</div><div class=3D"gmai=
l_default">- CPU 00000101 booting -</div><div class=3D"gmail_default">- Cur=
rent EL 00000008 -</div><div class=3D"gmail_default">- Xen starting at EL2 =
-</div><div class=3D"gmail_default">- Setting up control registers -</div><=
div class=3D"gmail_default">- Turning on paging -</div><div class=3D"gmail_=
default">- Ready -</div><div class=3D"gmail_default">(XEN) CPU 5 booted.</d=
iv><div class=3D"gmail_default">(XEN) Bringing up CPU6</div><div class=3D"g=
mail_default">- CPU 00000102 booting -</div><div class=3D"gmail_default">- =
Current EL 00000008 -</div><div class=3D"gmail_default">- Xen starting at E=
L2 -</div><div class=3D"gmail_default">- Setting up control registers -</di=
v><div class=3D"gmail_default">- Turning on paging -</div><div class=3D"gma=
il_default">- Ready -</div><div class=3D"gmail_default">(XEN) CPU 6 booted.=
</div><div class=3D"gmail_default">(XEN) Bringing up CPU7</div><div class=
=3D"gmail_default">- CPU 00000103 booting -</div><div class=3D"gmail_defaul=
t">- Current EL 00000008 -</div><div class=3D"gmail_default">- Xen starting=
 at EL2 -</div><div class=3D"gmail_default">- Setting up control registers =
-</div><div class=3D"gmail_default">- Turning on paging -</div><div class=
=3D"gmail_default">- Ready -</div><div class=3D"gmail_default">(XEN) CPU 7 =
booted.</div><div class=3D"gmail_default">(XEN) Brought up 8 CPUs</div><div=
 class=3D"gmail_default">(XEN) P2M: 40-bit IPA with 40-bit PA</div><div cla=
ss=3D"gmail_default">(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558=
</div><div class=3D"gmail_default">(XEN) I/O virtualisation disabled</div><=
div class=3D"gmail_default">(XEN) build-id: 293f242dc5faa48be9f27a20ffd4576=
88c3fc38c</div><div class=3D"gmail_default">(XEN) alternatives: Patching wi=
th alt table 00000000400a48c8 -&gt; 00000000400a4c64</div><div class=3D"gma=
il_default">(XEN) *** LOADING DOMAIN 0 ***</div><div class=3D"gmail_default=
">(XEN) Loading kernel from boot module @ 00000000b84e0000</div><div class=
=3D"gmail_default">(XEN) Allocating 1:1 mappings totalling 128MB for dom0:<=
/div><div class=3D"gmail_default">(XEN) BANK[0] 0x00000010000000-0x00000018=
000000 (128MB)</div><div class=3D"gmail_default">(XEN) Grant table range: 0=
x0000001aa00000-0x0000001aa5f000</div><div class=3D"gmail_default">(XEN) Lo=
ading zImage from 00000000b84e0000 to 0000000010080000-0000000011536200</di=
v><div class=3D"gmail_default">(XEN) Allocating PPI 16 for event channel in=
terrupt</div><div class=3D"gmail_default">(XEN) Loading dom0 DTB to 0x00000=
00017e00000-0x0000000017e0d91c</div><div class=3D"gmail_default">(XEN) Scru=
bbing Free RAM on 1 nodes using 8 CPUs</div><div class=3D"gmail_default">(X=
EN) .........done.</div><div class=3D"gmail_default">(XEN) Initial low memo=
ry virq threshold set at 0x4000 pages.</div><div class=3D"gmail_default">(X=
EN) Std. Loglevel: All</div><div class=3D"gmail_default">(XEN) Guest Loglev=
el: Nothing (Rate-limited: Errors and warnings)</div><div class=3D"gmail_de=
fault">(XEN) *** Serial input -&gt; DOM0 (type &#39;CTRL-a&#39; three times=
 to switch input to Xen)</div><div class=3D"gmail_default">(XEN) Freed 272k=
B init memory.</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandl=
ed word write 0xffffffff to ICACTIVER4</div><div class=3D"gmail_default">(X=
EN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8</div><div cl=
ass=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to=
 ICACTIVER12</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled=
 word write 0xffffffff to ICACTIVER16</div><div class=3D"gmail_default">(XE=
N) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER20</div><div cl=
ass=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to=
 ICACTIVER24</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled=
 word write 0xffffffff to ICACTIVER28</div><div class=3D"gmail_default">(XE=
N) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER32</div><div cl=
ass=3D"gmail_default">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to=
 ICACTIVER36</div><div class=3D"gmail_default">(XEN) d0v0: vGICD: unhandled=
 word write 0xffffffff to ICACTIVER40</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 0.000000] Booting Linux on physical CPU 0x0</div><div class=
=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] Linux version 4.9.113-07887-geb=
8dbd1-dirty (omkar.bolla@OmkarB-LaptopU) (gcc version 7.1.1 20170510 (Linar=
o GCC 7.1-2017.05) ) #6 SMP PREEMPT Wed A</div><div class=3D"gmail_default"=
>ug 15 11:55:00 IST 2018</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0=
.000000] Boot CPU: AArch64 Processor [410fd034]</div><div class=3D"gmail_de=
fault">[=C2=A0 =C2=A0 0.000000] Xen 4.8 support found</div><div class=3D"gm=
ail_default">[=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:=
</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] efi: UEFI not f=
ound.</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] Ion: base =
0x14e00000, size is 0x1e00000, node name graphic, heap-name carveout_grallo=
c namesize 17,[99][97][114][118]</div><div class=3D"gmail_default">[=C2=A0 =
=C2=A0 0.000000] Ion: insert heap-name carveout_gralloc=C2=A0</div><div cla=
ss=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] OF: reserved mem: initialized=
 node graphic, compatible id hisi_ion</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 0.000000] Reserved memory: created CMA memory pool at 0x00000=
00016c00000, size 64 MiB</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0=
.000000] OF: reserved mem: initialized node fastboot-cma-mem, compatible id=
 shared-dma-pool</div><div class=3D"gmail_default"><span style=3D"backgroun=
d-color:rgb(234,153,153)">[=C2=A0 =C2=A0 0.000000] cma: Failed to reserve 6=
4 MiB</span></div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] psc=
i: probing for conduit method from DT.</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 0.000000] psci: PSCIv0.2 detected in firmware.</div><div clas=
s=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] psci: Using standard PSCI v0.2=
 function IDs</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] ps=
ci: Trusted OS migration not required</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 0.000000] percpu: Embedded 23 pages/cpu @ffffffc014ce9000 s54=
936 r8192 d31080 u94208</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0.=
000000] Detected VIPT I-cache on CPU0</div><div class=3D"gmail_default">[=
=C2=A0 =C2=A0 0.000000] CPU features: enabling workaround for ARM erratum 8=
45719</div><div class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] Built 1 zo=
nelists in Zone order, mobility grouping on.=C2=A0 Total pages: 32256</div>=
<div class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] Kernel command line: =
console=3Dtty0 console=3Dhvc0 root=3D/dev/sdd10 rw efi=3Dnoruntime</div><di=
v class=3D"gmail_default">[=C2=A0 =C2=A0 0.000000] PID hash table entries: =
512 (order: 0, 4096 bytes)</div><div class=3D"gmail_default">[=C2=A0 =C2=A0=
 0.000000] Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)<=
/div><div><div class=3D"gmail_default" style=3D"font-size:small;text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline"><br></span></div><div class=3D"gmail_de=
fault" style=3D"font-size:small;text-decoration-style:initial;text-decorati=
on-color:initial"><span style=3D"background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne"><br></span></div><div class=3D"gmail_default" style=3D"font-size:small;=
text-decoration-style:initial;text-decoration-color:initial"><span style=3D=
"background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">----------------------------=
--------------------------</span><br class=3D"gmail-Apple-interchange-newli=
ne">Please find below xen-4.8 log after early printk:</div><div class=3D"gm=
ail_default" style=3D"font-size:small;text-decoration-style:initial;text-de=
coration-color:initial">---------------------------------------------------=
---</div></div></div><div class=3D"gmail_default"><div class=3D"gmail_defau=
lt"><font color=3D"#0b5394">Using modules provided by bootloader in FDT</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">Xen 4.11.1-pr=
e (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72-dirty) EFI loader</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394"><br></font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">- UART enabled -</font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394">- CPU 00000000 =
booting -</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">=
- Current EL 00000008 -</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">- Xen starting at EL2 -</font></div><div class=3D"gmail_defau=
lt"><font color=3D"#0b5394">- Setting up control registers -</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">- Turning on paging -</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">- Ready -</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Checki=
ng for initrd in /chosen</font></div><div class=3D"gmail_default"><font col=
or=3D"#0b5394">(XEN) RAM: 0000000000000000 - 000000001abfffff</font></div><=
div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 000000001ad8=
8000 - 0000000031ffffff</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">(XEN) RAM: 0000000032101000 - 000000003dffffff</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 0000000040000=
000 - 000000004ae9ffff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 0000000089cc0000 - 00000000b83adfff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000b9b090=
00 - 00000000b9bcffff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000b9c70000 - 00000000b9c72fff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000b9c740=
00 - 00000000b9d5ffff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000ba125000 - 00000000ba12bfff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000ba12c0=
00 - 00000000bdd1bfff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000bdd1c000 - 00000000bddccfff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000bddcd0=
00 - 00000000bde82fff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000bde83000 - 00000000bef5ffff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000bef600=
00 - 00000000bf0effff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000bf0f0000 - 00000000bf13ffff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000bf1900=
00 - 00000000bf193fff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000bf194000 - 00000000bfffffff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000c00000=
00 - 00000000dfffffff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 0000000200000000 - 000000021fffffff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0</font></div><=
div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) MODULE[0]: 000000=
00b83ae000 - 00000000b83bf000 Device Tree=C2=A0=C2=A0</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">(XEN) MODULE[1]: 00000000b84d80=
00 - 00000000b998e200 Kernel=C2=A0 =C2=A0 =C2=A0 =C2=A0console=3Dtty0 conso=
le=3Dhvc0 root=3D/dev/sdd10 rw efi=3Dnoruntime</font></div><div class=3D"gm=
ail_default"><font color=3D"#0b5394">(XEN)=C2=A0</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">(XEN) Command line: loglvl=3Dall con=
sole=3Ddtuart dtuart=3D/soc/serial@fff32000 efi=3Dno-rs</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">(XEN) parameter &quot;efi&quo=
t; unknown!</font></div><div class=3D"gmail_default"><font color=3D"#0b5394=
">(XEN) Placing Xen at 0x000000021fe00000-0x0000000220000000</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Update BOOTMOD_XEN=
 from 00000000b83bf000-00000000b84c7d81 =3D&gt; 000000021fe00000-000000021f=
f08d81</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XE=
N) Domain heap initialised</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">(XEN) Booting using Device Tree</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">(XEN) Platform: Generic System</font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Looking f=
or dtuart at &quot;/soc/serial@fff32000&quot;, options &quot;&quot;</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">=C2=A0Xen 4.11.1-=
pre</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) =
Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro GCC 7.=
1-2017.05) 7.1.1 20170510) debug=3Dn=C2=A0 Wed Aug 15 14:18:23 IST 2018</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Latest =
ChangeSet: Mon Jul 30 11:30:09 2018 +0200 git:33ced72-dirty</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Processor: 410fd034=
: &quot;ARM Limited&quot;, variant: 0x0, part 0xd03, rev 0x4</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) 64-bit Execution:<=
/font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=
=A0 =C2=A0Processor Features: 0000000000002222 0000000000000000</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =
=C2=A0Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =
=C2=A0Extensions: FloatingPoint AdvancedSIMD</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0Debug Features: 000000=
0010305106 0000000000000000</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394">(XEN)=C2=A0 =C2=A0Auxiliary Features: 0000000000000000 00=
00000000000000</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN)=C2=A0 =C2=A0Memory Model Features: 0000000000001122 000000000000=
0000</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=
=C2=A0 =C2=A0ISA Features:=C2=A0 0000000000011120 0000000000000000</font></=
div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) 32-bit Execu=
tion:</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN=
)=C2=A0 =C2=A0Processor Features: 00000131:00011011</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0Instruc=
tion Sets: AArch32 A32 Thumb Thumb-2 Jazelle</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0Extensions: Gen=
ericTimer Security</font></div><div class=3D"gmail_default"><font color=3D"=
#0b5394">(XEN)=C2=A0 =C2=A0Debug Features: 03010066</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0Auxiliary Feat=
ures: 00000000</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN)=C2=A0 =C2=A0Memory Model Features: 10201105 40000000 01260000 02=
102211</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XE=
N)=C2=A0 ISA Features: 02101110 13112111 21232042 01112131 00011142 0001112=
1</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Us=
ing SMC Calling Convention v1.1</font></div><div class=3D"gmail_default"><f=
ont color=3D"#0b5394">(XEN) Using PSCI v1.1</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394">(XEN) SMP: Allowing 8 CPUs</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Generic Timer IRQ:=
 phys=3D30 hyp=3D26 virt=3D27 Freq: 1920 KHz</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">(XEN) GICv2 initialization:</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0gic_dist_addr=3D00000000e82b1000</font></div><div class=3D=
"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0gic_cpu_addr=3D00000000e82b2000</font></div><div class=3D"gmail_defau=
lt"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_hyp_=
addr=3D00000000e82b4000</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_vcpu_addr=3D000000=
00e82b6000</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"=
>(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_maintenance_irq=3D25</font></di=
v><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) GICv2: 384 lin=
es, 8 cpus, secure (IID 0200143b).</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">(XEN) Using scheduler: SMP Credit Scheduler (credi=
t)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) A=
llocated console ring of 64 KiB.</font></div><div class=3D"gmail_default"><=
font color=3D"#0b5394">(XEN) Bringing up CPU1</font></div><div class=3D"gma=
il_default"><font color=3D"#0b5394">(XEN) Failed to bring up CPU1</font></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed to bri=
ng up CPU 1 (error -9)</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) Bringing up CPU2</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394">(XEN) Failed to bring up CPU2</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed to bring up CPU =
2 (error -9)</font></div><div class=3D"gmail_default"><font color=3D"#0b539=
4">(XEN) Bringing up CPU3</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394">(XEN) Failed to bring up CPU3</font></div><div class=3D"gma=
il_default"><font color=3D"#0b5394">(XEN) Failed to bring up CPU 3 (error -=
9)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) B=
ringing up CPU4</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394">(XEN) Failed to bring up CPU4</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394">(XEN) Failed to bring up CPU 4 (error -9)</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Bringing up=
 CPU5</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN=
) Failed to bring up CPU5</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394">(XEN) Failed to bring up CPU 5 (error -9)</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Bringing up CPU6</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed t=
o bring up CPU6</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394">(XEN) Failed to bring up CPU 6 (error -9)</font></div><div class=3D"g=
mail_default"><font color=3D"#0b5394">(XEN) Bringing up CPU7</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed to bring up=
 CPU7</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN=
) Failed to bring up CPU 7 (error -9)</font></div><div class=3D"gmail_defau=
lt"><font color=3D"#0b5394">(XEN) Brought up 1 CPUs</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) P2M: 40-bit IPA with 40-bi=
t PA and 8-bit VMID</font></div><div class=3D"gmail_default"><font color=3D=
"#0b5394">(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558</font></di=
v><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) I/O virtualisa=
tion disabled</font></div><div class=3D"gmail_default"><font color=3D"#0b53=
94">(XEN) build-id: 52630f42d6da8e35f5a018454a0f57bdfdba3f8f</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) alternatives: Patc=
hing with alt table 00000000400acff8 -&gt; 00000000400ad568</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) *** LOADING DOMAIN =
0 ***</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN=
) Loading kernel from boot module @ 00000000b84d8000</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) Allocating 1:1 mappings to=
talling 512MB for dom0:</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">(XEN) BANK[0] 0x000000c0000000-0x000000e0000000 (512MB)</font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Grant tab=
le range: 0x0000021fe00000-0x0000021fe40000</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394">(XEN) Allocating PPI 16 for event channel=
 interrupt</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"=
>(XEN) Loading zImage from 00000000b84d8000 to 00000000c0080000-00000000c15=
36200</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN=
) Loading dom0 DTB to 0x00000000c8000000-0x00000000c800d638</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Initial low memory =
virq threshold set at 0x4000 pages.</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394">(XEN) Scrubbing Free RAM on 1 nodes using 1 CPUs<=
/font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) ....=
................................................................done.</font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Std. Logl=
evel: All</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">=
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)</font></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) *************=
**************************************</font></div><div class=3D"gmail_defa=
ult"><font color=3D"#0b5394">(XEN) PLEASE SPECIFY dom0_mem PARAMETER - USIN=
G 512M FOR NOW</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN) ***************************************************</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) 3... 2... 1...=
=C2=A0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XE=
N) *** Serial input -&gt; DOM0 (type &#39;CTRL-a&#39; three times to switch=
 input to Xen)</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN) Freed 280kB init memory.</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394">(XEN) d0v0: vGICD: unhandled word write 0xfffffff=
f to ICACTIVER4</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) d0v0: vG=
ICD: unhandled word write 0xffffffff to ICACTIVER12</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) d0v0: vGICD: unhandled wor=
d write 0xffffffff to ICACTIVER16</font></div><div class=3D"gmail_default">=
<font color=3D"#0b5394">(XEN) d0v0: vGICD: unhandled word write 0xffffffff =
to ICACTIVER20</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER24</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) d0v0: vG=
ICD: unhandled word write 0xffffffff to ICACTIVER28</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) d0v0: vGICD: unhandled wor=
d write 0xffffffff to ICACTIVER32</font></div><div class=3D"gmail_default">=
<font color=3D"#0b5394">(XEN) d0v0: vGICD: unhandled word write 0xffffffff =
to ICACTIVER36</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER40</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0=
 0.000000] Booting Linux on physical CPU 0x0</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Linux version 4=
.9.113-07887-geb8dbd1-dirty (omkar.bolla@OmkarB-LaptopU) (gcc version 7.1.1=
 20170510 (Linaro GCC 7.1-2017.05) ) #6 SMP PREEMPT Wed A</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394">ug 15 11:55:00 IST 2018</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Xen 4.1=
1 support found</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394">[=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0=
.000000] efi: UEFI not found.</font></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Ion: base 0xde200000, size is =
0x1e00000, node name graphic, heap-name carveout_gralloc namesize 17,[99][9=
7][114][118]</font></div><div class=3D"gmail_default"><font color=3D"#0b539=
4">[=C2=A0 =C2=A0 0.000000] Ion: insert heap-name carveout_gralloc=C2=A0</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] OF: reserved mem: initialized node graphic, compatible id his=
i_ion</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000] Reserved memory: created CMA memory pool at 0x00000000=
16c00000, size 64 MiB</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] OF: reserved mem: initialized node fa=
stboot-cma-mem, compatible id shared-dma-pool</font></div><div class=3D"gma=
il_default"><font color=3D"#0b5394" style=3D"background-color:rgb(147,196,1=
25)">[=C2=A0 =C2=A0 0.000000] cma: Reserved 64 MiB at 0x00000000da000000</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] psci: probing for conduit method from DT.</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] psci=
: PSCIv1.1 detected in firmware.</font></div><div class=3D"gmail_default"><=
font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] psci: Using standard PSCI v=
0.2 function IDs</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">[=C2=A0 =C2=A0 0.000000] psci: Trusted OS migration not required</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] psci: SMC Calling Convention v1.1</font></div><div class=3D"g=
mail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] percpu: Embe=
dded 23 pages/cpu @ffffffc01e18b000 s54936 r8192 d31080 u94208</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.00000=
0] Detected VIPT I-cache on CPU0</font></div><div class=3D"gmail_default"><=
font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] CPU features: enabling work=
around for ARM erratum 845719</font></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Built 1 zonelists in Zone orde=
r, mobility grouping on.=C2=A0 Total pages: 129024</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Kernel =
command line: console=3Dtty0 console=3Dhvc0 root=3D/dev/sdd10 rw efi=3Dnoru=
ntime</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)</=
font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 byte=
s)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0=
 =C2=A0 0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 b=
ytes)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><spa=
n style=3D"font-size:small;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">--=
----------------------------------------------------</span><br></font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394"><span style=3D"font-s=
ize:small;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline"><br></span></font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">In above logs, I =
marked CMA memory area reserving, which is giving errors while initialising=
=C2=A0cma pools in linux when i am using xen-4.8</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">Could you please tell me, what could=
 be the problem?</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">I hope it belongs to CMA memory address part in DTS, please correct =
me if i were wrong.</font></div><div class=3D"gmail_default"><font color=3D=
"#0b5394"><span style=3D"font-size:small;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline"><br></span></font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394"><span style=3D"font-size:small;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><br></span></font></div></div><div class=3D"gmail_default" =
style=3D"color:rgb(11,83,148)">Thank you,</div><div class=3D"gmail_default"=
 style=3D"color:rgb(11,83,148)">Omkar B</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Mon, Aug 13, 2018 at 8:40 PM, Julien G=
rall <span dir=3D"ltr">&lt;<a href=3D"mailto:julien.grall@arm.com" target=
=3D"_blank">julien.grall@arm.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello,<span class=3D""><br>
<br>
On 13/08/18 14:01, Konrad Rzeszutek Wilk wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
On Mon, Aug 13, 2018 at 11:16:14AM +0530, Omkar Bolla wrote:<br>
</span><div><div class=3D"h5"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
Please check below log:<br>
------------------------------<wbr>--<br>
=C2=A0 Using modules provided by bootloader in FDT<br>
Xen 4.11.1-pre (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72) EFI<br>
</blockquote>
loader<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 Xen 4.11.1-pre<br>
(XEN) Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc<br>
</blockquote>
(Linaro<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
GCC 7.1-2017.05) 7.1.1 20170510) debug=3Dn=C2=A0 Sat Aug 11 20:35:10 IST 20=
1<br>
8<br>
(XEN) Latest ChangeSet: Mon Jul 30 11:30:09 2018 +0200 git:33ced72<br>
(XEN) Processor: 410fd034: &quot;ARM Limited&quot;, variant: 0x0, part 0xd0=
3, rev<br>
</blockquote>
0x4<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
(XEN) 64-bit Execution:<br>
(XEN)=C2=A0 =C2=A0Processor Features: 0000000000002222 0000000000000000<br>
(XEN)=C2=A0 =C2=A0 =C2=A0Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL=
0:64+32<br>
(XEN)=C2=A0 =C2=A0 =C2=A0Extensions: FloatingPoint AdvancedSIMD<br>
(XEN)=C2=A0 =C2=A0Debug Features: 0000000010305106 0000000000000000<br>
(XEN)=C2=A0 =C2=A0Auxiliary Features: 0000000000000000 0000000000000000<br>
(XEN)=C2=A0 =C2=A0Memory Model Features: 0000000000001122 0000000000000000<=
br>
(XEN)=C2=A0 =C2=A0ISA Features:=C2=A0 0000000000011120 0000000000000000<br>
(XEN) 32-bit Execution:<br>
(XEN)=C2=A0 =C2=A0Processor Features: 00000131:00011011<br>
(XEN)=C2=A0 =C2=A0 =C2=A0Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazell=
e<br>
(XEN)=C2=A0 =C2=A0 =C2=A0Extensions: GenericTimer Security<br>
(XEN)=C2=A0 =C2=A0Debug Features: 03010066<br>
(XEN)=C2=A0 =C2=A0Auxiliary Features: 00000000<br>
(XEN)=C2=A0 =C2=A0Memory Model Features: 10201105 40000000 01260000 0210221=
1<br>
(XEN)=C2=A0 ISA Features: 02101110 13112111 21232042 01112131 00011142<br>
</blockquote>
00011121<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
(XEN) Using SMC Calling Convention v1.1<br>
(XEN) Using PSCI v1.1<br>
(XEN) SMP: Allowing 8 CPUs<br>
(XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 1920 KHz<br>
(XEN) GICv2 initialization:<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_dist_addr=3D<wbr>00000000e82b100=
0<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_cpu_addr=3D00000000e82b2000<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_hyp_addr=3D00000000e82b4000<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_vcpu_addr=3D<wbr>00000000e82b600=
0<br>
(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_maintenance_irq=3D25<br>
(XEN) GICv2: 384 lines, 8 cpus, secure (IID 0200143b).<br>
(XEN) Using scheduler: SMP Credit Scheduler (credit)<br>
(XEN) Allocated console ring of 64 KiB.<br>
(XEN) Bringing up CPU1<br>
(XEN) Failed to bring up CPU1<br>
(XEN) Failed to bring up CPU 1 (error -9)<br>
</blockquote></blockquote></blockquote></div></div></blockquote>
<br>
I think the -9 is coming from PSCI which means INVALID_ADDRESS. This means =
Xen gave an invalid entry point to PSCI CPU_UP.<br>
<br>
It would be interesting to know where Xen is loaded in memory with Xen 4.8 =
and Xen 4.11. This will be printed when early printk is enabled as the cons=
ole is not yet setup.<br>
<br>
To get early printk, you could use CONFIG_EARLY_PRINTK=3Dhikey960 on the ma=
ke command line. Note this requires to have debug enabled.<br>
<br>
Once you have early printk setup you should have a message similar to &quot=
;Update BOOTMOD_XEN from ... to ...&quot;.<br>
<br>
Also, as Konrad suggested it, I would recommend to bisect Xen and see if yo=
u can pin point a commit.<br>
<br>
Cheers,<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
-- <br>
Julien Grall<br>
</font></span></blockquote></div><br></div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--0000000000002e5192057375c385--


--===============2856718557872954721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2856718557872954721==--
