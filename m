From: Omkar Bolla <omkar.bolla@pathpartnertech.com>
Subject: Re: Armv8-A: Not able to enable secondary CPUs in
 Hikey960 board
Date: Mon, 20 Aug 2018 15:16:47 +0530
Message-ID: <CAC4nxbu8VBv4zamABUP2Up=0T5FQg_Nv94B1rnCSP+s2Vq_5Og@mail.gmail.com>
References: <CAC4nxbsJss__sbvs5fKEW1RZAiyC8KNvV3HMPM88v4HmBwO+ZA@mail.gmail.com>
 <20180811170626.GB20295@char.us.oracle.com>
 <CAC4nxbtEJEnZ9o4hRqSwk_9hzJa1aCvNfGPTccvHRMAp7BvS4g@mail.gmail.com>
 <20180813130114.GA14031@char.us.oracle.com>
 <1d456451-6beb-5a4b-968a-5539f7b8c01b@arm.com>
 <CAC4nxbvnDGOJotFe0VD6zOjhJcb5TOfLMLtdxPd3Lh8KKPgYLQ@mail.gmail.com>
 <baff58c5-f744-0a23-217b-db64e0716024@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2766219825309528058=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <baff58c5-f744-0a23-217b-db64e0716024@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xensource.com, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

--===============2766219825309528058==
Content-Type: multipart/alternative; boundary="000000000000be0aaf0573dac917"

--000000000000be0aaf0573dac917
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

I tried today with your patch in xen-4.11

Still has secondary cpus problems,

Please find below log after that patch in xen-4.11
--------------------------------------------------------
Loading driver at 0x000B03B5000 EntryPoint=0x000B044907C
Loading driver at 0x000B03B5000 EntryPoint=0x000B044907C
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
(XEN) RAM: 0000000040000000 - 000000004cfa3fff
(XEN) RAM: 0000000089cc0000 - 00000000b03a3fff
(XEN) RAM: 00000000b1af0000 - 00000000b9af0fff
(XEN) RAM: 00000000b9af1000 - 00000000b9af8fff
(XEN) RAM: 00000000b9b09000 - 00000000b9bcffff
(XEN) RAM: 00000000b9c70000 - 00000000b9c71fff
(XEN) RAM: 00000000b9c74000 - 00000000b9d5ffff
(XEN) RAM: 00000000ba125000 - 00000000ba12bfff
(XEN) RAM: 00000000ba12c000 - 00000000bd9b7fff
(XEN) RAM: 00000000bd9b8000 - 00000000bd9b9fff
(XEN) RAM: 00000000bd9ba000 - 00000000bd9c3fff
(XEN) RAM: 00000000bd9c4000 - 00000000bef5ffff
(XEN) RAM: 00000000bef60000 - 00000000bf0effff
(XEN) RAM: 00000000bf0f0000 - 00000000bf13ffff
(XEN) RAM: 00000000bf190000 - 00000000bf193fff
(XEN) RAM: 00000000bf194000 - 00000000bfffffff
(XEN) RAM: 00000000c0000000 - 00000000dfffffff
(XEN) RAM: 0000000200000000 - 000000021fffffff
(XEN)
(XEN) MODULE[0]: 00000000b03a4000 - 00000000b03b5000 Device Tree
(XEN) MODULE[1]: 00000000b04be000 - 00000000b1975a00 Kernel
 console=tty0 console=hvc0 root=/dev/sdd10 rootwait rw rootfstype=ext4
efi=noruntime video=HDMI-A
-1:1280x720@60
(XEN)
(XEN) Command line: loglvl=all console=dtuart dtuart=/soc/serial@fff32000
dom0_mem=2048M efi=no-rs
(XEN) parameter "efi" unknown!
(XEN) Placing Xen at 0x00000000dfe00000-0x00000000e0000000
(XEN) Update BOOTMOD_XEN from 00000000b03b5000-00000000b04bdd81 =>
00000000dfe00000-00000000dff08d81
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Generic System
(XEN) Looking for dtuart at "/soc/serial@fff32000", options ""
 Xen 4.11.1-pre
(XEN) Xen version 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro
GCC 7.1-2017.05) 7.1.1 20170510) debug=n  Mon Aug 20 15:11:16 IST 2018
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
(XEN) build-id: 361a7d1197ce6c845658fa3210780d1751b7103a
(XEN) alternatives: Patching with alt table 00000000400acff8 ->
00000000400ad568
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 00000000b04be000
(XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
(XEN) BANK[0] 0x00000010000000-0x00000018000000 (128MB)
(XEN) BANK[1] 0x00000020000000-0x00000030000000 (256MB)
(XEN) BANK[2] 0x00000038000000-0x0000003c000000 (64MB)
(XEN) BANK[3] 0x00000040000000-0x0000004c000000 (192MB)
(XEN) BANK[4] 0x0000008c000000-0x000000b0000000 (576MB)
(XEN) BANK[5] 0x000000b4000000-0x000000b8000000 (64MB)
(XEN) BANK[6] 0x000000c0000000-0x000000dc000000 (448MB)
(XEN) BANK[7] 0x00000200000000-0x00000214000000 (320MB)
(XEN) Grant table range: 0x000000dfe00000-0x000000dfe40000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 00000000b04be000 to
0000000010080000-0000000011537a00
(XEN) Loading dom0 DTB to 0x0000000017e00000-0x0000000017e0d73b
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 1 CPUs
(XEN)
....................................................................done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
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
7.1-2017.05) ) #32 SMP PREEMPT Sun
Aug 19 17:07:02 IST 2018
[    0.000000] Boot CPU: AArch64 Processor [410fd034]
[    0.000000] Xen 4.11 support found
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] Ion: base 0xda200000, size is 0x1e00000, node name graphic,
heap-name carveout_gralloc namesize 17,[99][97][114][118]
[    0.000000] Ion: insert heap-name carveout_gralloc
[    0.000000] OF: reserved mem: initialized node graphic, compatible id
hisi_ion
[    0.000000] cma: Reserved 64 MiB at 0x00000000d6000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] percpu: Embedded 23 pages/cpu @ffffffc213f88000 s54936 r8192
d31080 u94208
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 845719
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 515592
[    0.000000] Kernel command line: console=tty0 console=hvc0
root=/dev/sdd10 rootwait rw rootfstype=ext4 efi=noruntime
video=HDMI-A-1:1280x720@60
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
bytes)
[    0.000000] software IO TLB [mem 0xd2000000-0xd6000000] (64MB) mapped at
[ffffffc0d2000000-ffffffc0d5ffffff]
[    0.000000] Memory: 1824004K/2095104K available (13756K kernel code,
1374K rwdata, 4884K rodata, 1152K init, 1067K bss, 205564K reserved, 65536K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (
 128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (
 250 GB)
[    0.000000]       .text : 0xffffff8008080000 - 0xffffff8008df0000   (
13760 KB)
[    0.000000]     .rodata : 0xffffff8008df0000 - 0xffffff80092c0000   (
4928 KB)
[    0.000000]       .init : 0xffffff80092c0000 - 0xffffff80093e0000   (
1152 KB)
[    0.000000]       .data : 0xffffff80093e0000 - 0xffffff8009537a00   (
1375 KB)
[    0.000000]        .bss : 0xffffff8009537a00 - 0xffffff8009642754   (
1068 KB)
[    0.000000]     fixed   : 0xffffffbefe7fb000 - 0xffffffbefec00000   (
4116 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (
16 MB)
[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (
 4 GB maximum)
[    0.000000]               0xffffffbf00400000 - 0xffffffbf08500000   (
 129 MB actual)
[    0.000000]     memory  : 0xffffffc010000000 - 0xffffffc214000000   (
8256 MB)
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=1.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=1
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] arm_arch_timer: Architected cp15 timer(s) running at 1.92MHz
(virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1c570327e, max_idle_ns: 1763180809505 ns
[    0.000005] sched_clock: 56 bits at 1920kHz, resolution 520ns, wraps
every 4398046510977ns
[    0.000105] clocksource: arm,sp804: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58334160866034 ns
[    0.000699] Console: colour dummy device 80x25
[    0.001190] console [tty0] enabled
[    0.341427] console [hvc0] enabled
[    0.344935] Calibrating delay loop (skipped), value calculated using
timer frequency.. 3.84 BogoMIPS (lpj=7680)
[    0.355049] pid_max: default: 32768 minimum: 301
[    0.359845] Security Framework initialized
[    0.363910] SELinux:  Initializing.
[    0.367538] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.374225] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
bytes)
[    0.382219] ftrace: allocating 44464 entries in 174 pages
[    0.479344] sched-energy: CPU device node has no sched-energy-costs
[    0.485645] Invalid sched_group_energy for CPU0
[    0.490181] CPU0: update cpu_capacity 1024
[    0.494355] ASID allocator initialised with 32768 entries
[    0.500803] xen:grant_table: Grant tables using version 1 layout
[    0.506746] Grant table initialized
[    0.510310] xen:events: Using FIFO-based ABI
[    0.514720] Xen: initializing cpu0
[    0.547593] EFI services will not be available.
[    0.560149] Brought up 1 CPUs
[    0.563030] SMP: Total of 1 processors activated.
[    0.567826] CPU features: detected feature: 32-bit EL0 Support
[    0.573708] CPU features: detected feature: Kernel page table isolation
(KPTI)
[    0.586209] CPU: All CPU(s) started at EL1
[    0.590234] alternatives: patching kernel code
[    0.594924] Invalid sched_group_energy for CPU0
[    0.599376] CPU0: update max cpu_capacity 1024
[    0.603878] Invalid sched_group_energy for Cluster0
[    0.610428] devtmpfs: initialized

--------------------------------------------------------

Thanks,
Omkar B

On Wed, Aug 15, 2018 at 11:52 PM, Julien Grall <julien.grall@arm.com> wrote:

> On 08/15/2018 10:15 AM, Omkar Bolla wrote:
>
>> HI Julien,
>>
>
> Hello,
>
> As you suggested, I enabled early printk for hikey960 in xen-4.8 stable
>> branch and xen-4.11 stable branch.
>>
>
> Looking at the logs, Xen is placed differently in the memory:
>         - Xen 4.8:  0x000000001aa00000
>         - Xen 4.11: 0x000000021fe00000
>
> With Xen 4.11, the binary will be placed above 4GB. There was some change
> in the way to place Xen in the memory in 2016 allowing to place Xen at the
> end of the usable RAM.
>
> I suspect the firmware does not support 64-bit address entry point for
> secondary CPU. This would explain the ADDRESS_INVALID from PSCI CPU UP
> call. Can you give a try to this patch:
>
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7d40a8466b..13318da6b1 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -408,13 +408,11 @@ static paddr_t __init get_xen_paddr(void)
>              if ( !e )
>                  continue;
>
> -#ifdef CONFIG_ARM_32
>              /* Xen must be under 4GB */
>              if ( e > 0x100000000ULL )
>                  e = 0x100000000ULL;
>              if ( e < bank->start )
>                  continue;
> -#endif
>
>              s = e - min_size;
>
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

--000000000000be0aaf0573dac917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)=
">Hi Julien,</div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148=
)"><br></div><div class=3D"gmail_default" style=3D"color:rgb(11,83,148)">I =
tried today with your patch in xen-4.11</div><div class=3D"gmail_default" s=
tyle=3D"color:rgb(11,83,148)"><br></div><div class=3D"gmail_default" style=
=3D"color:rgb(11,83,148)">Still has secondary cpus problems,</div><div clas=
s=3D"gmail_default" style=3D"color:rgb(11,83,148)"><br></div><div class=3D"=
gmail_default" style=3D"color:rgb(11,83,148)">Please find below log after t=
hat patch in xen-4.11</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">--------------------------------------------------------</div><=
div class=3D"gmail_default"><div class=3D"gmail_default"><font color=3D"#0b=
5394">Loading driver at 0x000B03B5000 EntryPoint=3D0x000B044907C</font></di=
v><div class=3D"gmail_default"><font color=3D"#0b5394">Loading driver at 0x=
000B03B5000 EntryPoint=3D0x000B044907C=C2=A0</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">Using modules provided by bootloader in =
FDT</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">Xen 4.=
11.1-pre (c/s Mon Jul 30 11:30:09 2018 +0200 git:33ced72-dirty) EFI loader<=
/font></div><div class=3D"gmail_default"><font color=3D"#0b5394"><br></font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394">- UART enabled =
-</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">- CPU 00=
000000 booting -</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">- Current EL 00000008 -</font></div><div class=3D"gmail_default"><fo=
nt color=3D"#0b5394">- Xen starting at EL2 -</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">- Setting up control registers -</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">- Turning on pagi=
ng -</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">- Rea=
dy -</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=
 Checking for initrd in /chosen</font></div><div class=3D"gmail_default"><f=
ont color=3D"#0b5394">(XEN) RAM: 0000000000000000 - 000000001abfffff</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000=
0001ad88000 - 0000000031ffffff</font></div><div class=3D"gmail_default"><fo=
nt color=3D"#0b5394">(XEN) RAM: 0000000032101000 - 000000003dffffff</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 000000=
0040000000 - 000000004cfa3fff</font></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">(XEN) RAM: 0000000089cc0000 - 00000000b03a3fff</font></=
div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 0000000=
0b1af0000 - 00000000b9af0fff</font></div><div class=3D"gmail_default"><font=
 color=3D"#0b5394">(XEN) RAM: 00000000b9af1000 - 00000000b9af8fff</font></d=
iv><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000=
b9b09000 - 00000000b9bcffff</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394">(XEN) RAM: 00000000b9c70000 - 00000000b9c71fff</font></di=
v><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000b=
9c74000 - 00000000b9d5ffff</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">(XEN) RAM: 00000000ba125000 - 00000000ba12bfff</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000ba=
12c000 - 00000000bd9b7fff</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394">(XEN) RAM: 00000000bd9b8000 - 00000000bd9b9fff</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000bd9=
ba000 - 00000000bd9c3fff</font></div><div class=3D"gmail_default"><font col=
or=3D"#0b5394">(XEN) RAM: 00000000bd9c4000 - 00000000bef5ffff</font></div><=
div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000bef6=
0000 - 00000000bf0effff</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">(XEN) RAM: 00000000bf0f0000 - 00000000bf13ffff</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000bf190=
000 - 00000000bf193fff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 00000000bf194000 - 00000000bfffffff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) RAM: 00000000c00000=
00 - 00000000dfffffff</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) RAM: 0000000200000000 - 000000021fffffff</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0</font></div><=
div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) MODULE[0]: 000000=
00b03a4000 - 00000000b03b5000 Device Tree=C2=A0=C2=A0</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">(XEN) MODULE[1]: 00000000b04be0=
00 - 00000000b1975a00 Kernel=C2=A0 =C2=A0 =C2=A0 =C2=A0console=3Dtty0 conso=
le=3Dhvc0 root=3D/dev/sdd10 rootwait rw rootfstype=3Dext4 efi=3Dnoruntime v=
ideo=3DHDMI-A</font></div><div class=3D"gmail_default"><font color=3D"#0b53=
94">-1:1280x720@60</font></div><div class=3D"gmail_default"><font color=3D"=
#0b5394">(XEN)=C2=A0</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) Command line: loglvl=3Dall console=3Ddtuart dtuart=3D/so=
c/serial@fff32000 dom0_mem=3D2048M efi=3Dno-rs</font></div><div class=3D"gm=
ail_default"><font color=3D"#0b5394">(XEN) parameter &quot;efi&quot; unknow=
n!</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) P=
lacing Xen at 0x00000000dfe00000-0x00000000e0000000</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) Update BOOTMOD_XEN from 00=
000000b03b5000-00000000b04bdd81 =3D&gt; 00000000dfe00000-00000000dff08d81</=
font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Domai=
n heap initialised</font></div><div class=3D"gmail_default"><font color=3D"=
#0b5394">(XEN) Booting using Device Tree</font></div><div class=3D"gmail_de=
fault"><font color=3D"#0b5394">(XEN) Platform: Generic System</font></div><=
div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Looking for dtuar=
t at &quot;/soc/serial@fff32000&quot;, options &quot;&quot;</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">=C2=A0Xen 4.11.1-pre</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Xen vers=
ion 4.11.1-pre (omkar.bolla@) (aarch64-linux-gnu-gcc (Linaro GCC 7.1-2017.0=
5) 7.1.1 20170510) debug=3Dn=C2=A0 Mon Aug 20 15:11:16 IST 2018</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Latest ChangeSe=
t: Mon Jul 30 11:30:09 2018 +0200 git:33ced72-dirty</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) Processor: 410fd034: &quot=
;ARM Limited&quot;, variant: 0x0, part 0xd03, rev 0x4</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">(XEN) 64-bit Execution:</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=
=A0Processor Features: 0000000000002222 0000000000000000</font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0Exc=
eption Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32</font></div><div cla=
ss=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0Exten=
sions: FloatingPoint AdvancedSIMD</font></div><div class=3D"gmail_default">=
<font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0Debug Features: 0000000010305106 =
0000000000000000</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">(XEN)=C2=A0 =C2=A0Auxiliary Features: 0000000000000000 0000000000000=
000</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=
=C2=A0 =C2=A0Memory Model Features: 0000000000001122 0000000000000000</font=
></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=
=A0ISA Features:=C2=A0 0000000000011120 0000000000000000</font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394">(XEN) 32-bit Execution:</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =
=C2=A0Processor Features: 00000131:00011011</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0Instruction Sets=
: AArch32 A32 Thumb Thumb-2 Jazelle</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0Extensions: GenericTimer=
 Security</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">=
(XEN)=C2=A0 =C2=A0Debug Features: 03010066</font></div><div class=3D"gmail_=
default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0Auxiliary Features: 0000=
0000</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=
=C2=A0 =C2=A0Memory Model Features: 10201105 40000000 01260000 02102211</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 I=
SA Features: 02101110 13112111 21232042 01112131 00011142 00011121</font></=
div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Using SMC Ca=
lling Convention v1.1</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) Using PSCI v1.1</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">(XEN) SMP: Allowing 8 CPUs</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) Generic Timer IRQ: phys=3D=
30 hyp=3D26 virt=3D27 Freq: 1920 KHz</font></div><div class=3D"gmail_defaul=
t"><font color=3D"#0b5394">(XEN) GICv2 initialization:</font></div><div cla=
ss=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gic_dist_addr=3D00000000e82b1000</font></div><div class=3D"gmail_=
default"><font color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic=
_cpu_addr=3D00000000e82b2000</font></div><div class=3D"gmail_default"><font=
 color=3D"#0b5394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_hyp_addr=3D00=
000000e82b4000</font></div><div class=3D"gmail_default"><font color=3D"#0b5=
394">(XEN)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_vcpu_addr=3D00000000e82b600=
0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic_maintenance_irq=3D25</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">(XEN) GICv2: 384 lines, 8 cpu=
s, secure (IID 0200143b).</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394">(XEN) Using scheduler: SMP Credit Scheduler (credit)</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Allocated =
console ring of 64 KiB.</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">(XEN) Bringing up CPU1</font></div><div class=3D"gmail_defaul=
t"><font color=3D"#0b5394">(XEN) Failed to bring up CPU1</font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed to bring up CPU=
 1 (error -9)</font></div><div class=3D"gmail_default"><font color=3D"#0b53=
94">(XEN) Bringing up CPU2</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">(XEN) Failed to bring up CPU2</font></div><div class=3D"gm=
ail_default"><font color=3D"#0b5394">(XEN) Failed to bring up CPU 2 (error =
-9)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) =
Bringing up CPU3</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">(XEN) Failed to bring up CPU3</font></div><div class=3D"gmail_defaul=
t"><font color=3D"#0b5394">(XEN) Failed to bring up CPU 3 (error -9)</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Bringing u=
p CPU4</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XE=
N) Failed to bring up CPU4</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">(XEN) Failed to bring up CPU 4 (error -9)</font></div><div=
 class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Bringing up CPU5</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed =
to bring up CPU5</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">(XEN) Failed to bring up CPU 5 (error -9)</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">(XEN) Bringing up CPU6</font></div><=
div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed to bring u=
p CPU6</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XE=
N) Failed to bring up CPU 6 (error -9)</font></div><div class=3D"gmail_defa=
ult"><font color=3D"#0b5394">(XEN) Bringing up CPU7</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed to bring up CPU7</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Failed=
 to bring up CPU 7 (error -9)</font></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">(XEN) Brought up 1 CPUs</font></div><div class=3D"gmail=
_default"><font color=3D"#0b5394">(XEN) P2M: 40-bit IPA with 40-bit PA and =
8-bit VMID</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"=
>(XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">(XEN) I/O virtualisation disa=
bled</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=
 build-id: 361a7d1197ce6c845658fa3210780d1751b7103a</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) alternatives: Patching wit=
h alt table 00000000400acff8 -&gt; 00000000400ad568</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) *** LOADING DOMAIN 0 ***</=
font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Loadi=
ng kernel from boot module @ 00000000b04be000</font></div><div class=3D"gma=
il_default"><font color=3D"#0b5394">(XEN) Allocating 1:1 mappings totalling=
 2048MB for dom0:</font></div><div class=3D"gmail_default"><font color=3D"#=
0b5394">(XEN) BANK[0] 0x00000010000000-0x00000018000000 (128MB)</font></div=
><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) BANK[1] 0x00000=
020000000-0x00000030000000 (256MB)</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">(XEN) BANK[2] 0x00000038000000-0x0000003c000000 (6=
4MB)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN)=
 BANK[3] 0x00000040000000-0x0000004c000000 (192MB)</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) BANK[4] 0x0000008c000000-0=
x000000b0000000 (576MB)</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">(XEN) BANK[5] 0x000000b4000000-0x000000b8000000 (64MB)</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) BANK[6] 0x=
000000c0000000-0x000000dc000000 (448MB)</font></div><div class=3D"gmail_def=
ault"><font color=3D"#0b5394">(XEN) BANK[7] 0x00000200000000-0x000002140000=
00 (320MB)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394"=
>(XEN) Grant table range: 0x000000dfe00000-0x000000dfe40000</font></div><di=
v class=3D"gmail_default"><font color=3D"#0b5394">(XEN) Allocating PPI 16 f=
or event channel interrupt</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">(XEN) Loading zImage from 00000000b04be000 to 000000001008=
0000-0000000011537a00</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">(XEN) Loading dom0 DTB to 0x0000000017e00000-0x0000000017e0d73=
b</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) In=
itial low memory virq threshold set at 0x4000 pages.</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">(XEN) Scrubbing Free RAM on 1 no=
des using 1 CPUs</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">(XEN) ..............................................................=
......done.</font></div><div class=3D"gmail_default"><font color=3D"#0b5394=
">(XEN) Std. Loglevel: All</font></div><div class=3D"gmail_default"><font c=
olor=3D"#0b5394">(XEN) Guest Loglevel: Nothing (Rate-limited: Errors and wa=
rnings)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">(X=
EN) *** Serial input -&gt; DOM0 (type &#39;CTRL-a&#39; three times to switc=
h input to Xen)</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394">(XEN) Freed 280kB init memory.</font></div><div class=3D"gmail_defaul=
t"><font color=3D"#0b5394">(XEN) d0v0: vGICD: unhandled word write 0xffffff=
ff to ICACTIVER4</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">(XEN) d0v0: v=
GICD: unhandled word write 0xffffffff to ICACTIVER12</font></div><div class=
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
 20170510 (Linaro GCC 7.1-2017.05) ) #32 SMP PREEMPT Sun=C2=A0</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">Aug 19 17:07:02 IST 20=
18</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0=
 =C2=A0 0.000000] Boot CPU: AArch64 Processor [410fd034]</font></div><div c=
lass=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Xen=
 4.11 support found</font></div><div class=3D"gmail_default"><font color=3D=
"#0b5394">[=C2=A0 =C2=A0 0.000000] efi: Getting EFI parameters from FDT:</f=
ont></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] efi: UEFI not found.</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Ion: base 0xda200000, siz=
e is 0x1e00000, node name graphic, heap-name carveout_gralloc namesize 17,[=
99][97][114][118]</font></div><div class=3D"gmail_default"><font color=3D"#=
0b5394">[=C2=A0 =C2=A0 0.000000] Ion: insert heap-name carveout_gralloc=C2=
=A0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000] OF: reserved mem: initialized node graphic, compatible=
 id hisi_ion</font></div><div class=3D"gmail_default"><font color=3D"#0b539=
4">[=C2=A0 =C2=A0 0.000000] cma: Reserved 64 MiB at 0x00000000d6000000</fon=
t></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0=
 0.000000] psci: probing for conduit method from DT.</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] psci: P=
SCIv1.1 detected in firmware.</font></div><div class=3D"gmail_default"><fon=
t color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] psci: Using standard PSCI v0.2=
 function IDs</font></div><div class=3D"gmail_default"><font color=3D"#0b53=
94">[=C2=A0 =C2=A0 0.000000] psci: Trusted OS migration not required</font>=
</div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0=
.000000] psci: SMC Calling Convention v1.1</font></div><div class=3D"gmail_=
default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] percpu: Embedded =
23 pages/cpu @ffffffc213f88000 s54936 r8192 d31080 u94208</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] De=
tected VIPT I-cache on CPU0</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] CPU features: enabling workaroun=
d for ARM erratum 845719</font></div><div class=3D"gmail_default"><font col=
or=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Built 1 zonelists in Zone order, mo=
bility grouping on.=C2=A0 Total pages: 515592</font></div><div class=3D"gma=
il_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Kernel command=
 line: console=3Dtty0 console=3Dhvc0 root=3D/dev/sdd10 rootwait rw rootfsty=
pe=3Dext4 efi=3Dnoruntime video=3DHDMI-A-1:1280x720@60</font></div><div cla=
ss=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] PID h=
ash table entries: 4096 (order: 3, 32768 bytes)</font></div><div class=3D"g=
mail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Dentry cache=
 hash table entries: 262144 (order: 9, 2097152 bytes)</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Inode-=
cache hash table entries: 131072 (order: 8, 1048576 bytes)</font></div><div=
 class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] s=
oftware IO TLB [mem 0xd2000000-0xd6000000] (64MB) mapped at [ffffffc0d20000=
00-ffffffc0d5ffffff]</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Memory: 1824004K/2095104K available (=
13756K kernel code, 1374K rwdata, 4884K rodata, 1152K init, 1067K bss, 2055=
64K reserved, 65536K cma-reserved)</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Virtual kernel memory lay=
out:</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0modules : 0xffffff8000000000 - 0xff=
ffff8008000000=C2=A0 =C2=A0(=C2=A0 =C2=A0128 MB)</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=
=A0 =C2=A0vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000=C2=A0 =C2=A0(=
=C2=A0 =C2=A0250 GB)</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.text : 0xf=
fffff8008080000 - 0xffffff8008df0000=C2=A0 =C2=A0( 13760 KB)</font></div><d=
iv class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=
=C2=A0 =C2=A0 =C2=A0.rodata : 0xffffff8008df0000 - 0xffffff80092c0000=C2=A0=
 =C2=A0(=C2=A0 4928 KB)</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.init : 0x=
ffffff80092c0000 - 0xffffff80093e0000=C2=A0 =C2=A0(=C2=A0 1152 KB)</font></=
div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.0=
00000]=C2=A0 =C2=A0 =C2=A0 =C2=A0.data : 0xffffff80093e0000 - 0xffffff80095=
37a00=C2=A0 =C2=A0(=C2=A0 1375 KB)</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 .bss : 0xffffff8009537a00 - 0xffffff8009642754=C2=A0 =C2=A0(=C2=A0 1068=
 KB)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0fixed=C2=A0 =C2=A0: 0xffffffbefe7fb=
000 - 0xffffffbefec00000=C2=A0 =C2=A0(=C2=A0 4116 KB)</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 =
=C2=A0 =C2=A0PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000=C2=A0 =C2=A0=
(=C2=A0 =C2=A0 16 MB)</font></div><div class=3D"gmail_default"><font color=
=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0vmemmap : 0xffffff=
bf00000000 - 0xffffffc000000000=C2=A0 =C2=A0(=C2=A0 =C2=A0 =C2=A04 GB maxim=
um)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0xffffffbf00400000 - 0xffffffbf08500000=C2=A0 =C2=A0(=C2=A0 =C2=A0129 MB ac=
tual)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.000000]=C2=A0 =C2=A0 =C2=A0memory=C2=A0 : 0xffffffc010000000 -=
 0xffffffc214000000=C2=A0 =C2=A0(=C2=A0 8256 MB)</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] Preemptible=
 hierarchical RCU implementation.</font></div><div class=3D"gmail_default">=
<font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 Build-time adjustmen=
t of leaf fanout to 64.</font></div><div class=3D"gmail_default"><font colo=
r=3D"#0b5394">[=C2=A0 =C2=A0 0.000000]=C2=A0 RCU restricting CPUs from NR_C=
PUS=3D64 to nr_cpu_ids=3D1.</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] RCU: Adjusting geometry for rcu_=
fanout_leaf=3D64, nr_cpu_ids=3D1</font></div><div class=3D"gmail_default"><=
font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000000] NR_IRQS:64 nr_irqs:64 0</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.000000] arm_arch_timer: Architected cp15 timer(s) running at 1.92MHz =
(virt).</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=
=C2=A0 =C2=A0 0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffff=
ff max_cycles: 0x1c570327e, max_idle_ns: 1763180809505 ns</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000005] sc=
hed_clock: 56 bits at 1920kHz, resolution 520ns, wraps every 4398046510977n=
s</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =
=C2=A0 0.000105] clocksource: arm,sp804: mask: 0xffffffff max_cycles: 0xfff=
fffff, max_idle_ns: 58334160866034 ns</font></div><div class=3D"gmail_defau=
lt"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.000699] Console: colour dummy =
device 80x25</font></div><div class=3D"gmail_default"><font color=3D"#0b539=
4">[=C2=A0 =C2=A0 0.001190] console [tty0] enabled</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.341427] console=
 [hvc0] enabled</font></div><div class=3D"gmail_default"><font color=3D"#0b=
5394">[=C2=A0 =C2=A0 0.344935] Calibrating delay loop (skipped), value calc=
ulated using timer frequency.. 3.84 BogoMIPS (lpj=3D7680)</font></div><div =
class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.355049] pi=
d_max: default: 32768 minimum: 301</font></div><div class=3D"gmail_default"=
><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.359845] Security Framework initia=
lized</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.363910] SELinux:=C2=A0 Initializing.</font></div><div class=3D=
"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.367538] Mount-cach=
e hash table entries: 4096 (order: 3, 32768 bytes)</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.374225] Mountpo=
int-cache hash table entries: 4096 (order: 3, 32768 bytes)</font></div><div=
 class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.382219] f=
trace: allocating 44464 entries in 174 pages</font></div><div class=3D"gmai=
l_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.479344] sched-energy: C=
PU device node has no sched-energy-costs</font></div><div class=3D"gmail_de=
fault"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.485645] Invalid sched_group=
_energy for CPU0</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">[=C2=A0 =C2=A0 0.490181] CPU0: update cpu_capacity 1024</font></div>=
<div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.49435=
5] ASID allocator initialised with 32768 entries</font></div><div class=3D"=
gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.500803] xen:grant_t=
able: Grant tables using version 1 layout</font></div><div class=3D"gmail_d=
efault"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.506746] Grant table initia=
lized</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.510310] xen:events: Using FIFO-based ABI</font></div><div clas=
s=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.514720] Xen: i=
nitializing cpu0</font></div><div class=3D"gmail_default"><font color=3D"#0=
b5394">[=C2=A0 =C2=A0 0.547593] EFI services will not be available.</font><=
/div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.=
560149] Brought up 1 CPUs</font></div><div class=3D"gmail_default"><font co=
lor=3D"#0b5394">[=C2=A0 =C2=A0 0.563030] SMP: Total of 1 processors activat=
ed.</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.567826] CPU features: detected feature: 32-bit EL0 Support</fo=
nt></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=
=A0 0.573708] CPU features: detected feature: Kernel page table isolation (=
KPTI)</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.586209] CPU: All CPU(s) started at EL1</font></div><div class=
=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.590234] alterna=
tives: patching kernel code</font></div><div class=3D"gmail_default"><font =
color=3D"#0b5394">[=C2=A0 =C2=A0 0.594924] Invalid sched_group_energy for C=
PU0</font></div><div class=3D"gmail_default"><font color=3D"#0b5394">[=C2=
=A0 =C2=A0 0.599376] CPU0: update max cpu_capacity 1024</font></div><div cl=
ass=3D"gmail_default"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.603878] Inva=
lid sched_group_energy for Cluster0</font></div><div class=3D"gmail_default=
"><font color=3D"#0b5394">[=C2=A0 =C2=A0 0.610428] devtmpfs: initialized</f=
ont></div><div style=3D"color:rgb(11,83,148)"><br></div></div><div class=3D=
"gmail_default" style=3D"color:rgb(11,83,148)">----------------------------=
----------------------------</div><div class=3D"gmail_default" style=3D"col=
or:rgb(11,83,148)"><br></div><div class=3D"gmail_default" style=3D"color:rg=
b(11,83,148)">Thanks,</div><div class=3D"gmail_default" style=3D"color:rgb(=
11,83,148)">Omkar B</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Wed, Aug 15, 2018 at 11:52 PM, Julien Grall <span dir=3D"l=
tr">&lt;<a href=3D"mailto:julien.grall@arm.com" target=3D"_blank">julien.gr=
all@arm.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 08/1=
5/2018 10:15 AM, Omkar Bolla wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
HI Julien,<br>
</blockquote>
<br>
Hello,<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
As you suggested, I enabled early printk for hikey960 in xen-4.8 stable bra=
nch and xen-4.11 stable branch.<br>
</blockquote>
<br></span>
Looking at the logs, Xen is placed differently in the memory:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Xen 4.8:=C2=A0 0x000000001aa00000<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Xen 4.11: 0x000000021fe00000<br>
<br>
With Xen 4.11, the binary will be placed above 4GB. There was some change i=
n the way to place Xen in the memory in 2016 allowing to place Xen at the e=
nd of the usable RAM.<br>
<br>
I suspect the firmware does not support 64-bit address entry point for seco=
ndary CPU. This would explain the ADDRESS_INVALID from PSCI CPU UP call. Ca=
n you give a try to this patch:<br>
<br>
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c<br>
index 7d40a8466b..13318da6b1 100644<br>
--- a/xen/arch/arm/setup.c<br>
+++ b/xen/arch/arm/setup.c<br>
@@ -408,13 +408,11 @@ static paddr_t __init get_xen_paddr(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( !e )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
<br>
-#ifdef CONFIG_ARM_32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Xen must be under 4GB */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( e &gt; 0x100000000ULL =
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D 0x10000=
0000ULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( e &lt; bank-&gt;start =
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D e - min_size;<br>
<br>
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
--000000000000be0aaf0573dac917--


--===============2766219825309528058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2766219825309528058==--
