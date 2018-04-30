From: Ajay Garg <ajaygargnsit@gmail.com>
Subject: Re: [cubieboard2] Bringing up dom0
Date: Mon, 30 Apr 2018 11:11:48 +0530
Message-ID: <CAHP4M8XdrzZceZB2EPJgUY1pn7XwWGyiEEeHt2Y_F2OS7LyziQ@mail.gmail.com>
References: <CAHP4M8XeGY0S-HyLprND0R26hQsNd9k4-upM7MFDrodx0vomqA@mail.gmail.com>
 <7c64b5a9-d11e-414b-52df-4db92d992526@citrix.com>
 <CAHP4M8WzCwcmr8rL459B0LjkdC0Eb2C+hQM8nzKF=A7PEpx=ZQ@mail.gmail.com>
 <23a0e88b-95c6-9d55-32e1-0c7834999f98@citrix.com>
 <CAHP4M8UUEwyG9NgmAiT6WXBbD_gmbJXQP03n3pH58eoGrwPAuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6892920335055954393=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9iis=ht=gmail.com=ajaygargnsit@srs-us1.protection.inumbo.net>)
 id 1fD1ZT-0000Os-Lu
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 05:41:55 +0000
In-Reply-To: <CAHP4M8UUEwyG9NgmAiT6WXBbD_gmbJXQP03n3pH58eoGrwPAuQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============6892920335055954393==
Content-Type: multipart/alternative; boundary="0000000000005aaa40056b0a4fac"

--0000000000005aaa40056b0a4fac
Content-Type: text/plain; charset="UTF-8"

Hi All.

I made some changes :

a)
Removed the changed from the dts file.
Instead changed boot.cmd to

#############################################################################
# SUNXI Xen Boot Script
# Arch Linux ARM adaption of the cmd file which can be found at
http://openmirage.org/wiki/xen-on-cubieboard2

# Addresses suitable for 1GB system, adjust as appropriate for a 2GB system.
# Top of RAM:         0x80000000
# Xen relocate addr   0x7fe00000
setenv kernel_addr_r  0x7f600000 # 8M
setenv ramdisk_addr_r 0x7ee00000 # 8M
setenv fdt_addr       0x7ec00000 # 2M
setenv xen_addr_r     0x7ea00000 # 2M

setenv fdt_high      0xffffffff # Load fdt in place instead of relocating

# Load xen/xen to ${xen_addr_r}.
fatload mmc 0 ${xen_addr_r} /xen
setenv bootargs "console=dtuart dtuart=/soc@01c00000/serial@01c28000
dom0_mem=256M"

# Load appropriate .dtb file to ${fdt_addr}
fatload mmc 0 ${fdt_addr} /sun7i-a20-cubieboard2.dtb
fdt addr ${fdt_addr} 0x40000
fdt resize
fdt chosen
fdt set /chosen \#address-cells <1>
fdt set /chosen \#size-cells <1>

# Load Linux arch/arm/boot/zImage to ${kernel_addr_r}
fatload mmc 0 ${kernel_addr_r} /vmlinuz

fdt mknod /chosen module@0
fdt set /chosen/module@0 compatible "xen,linux-zimage"
"xen,multiboot-module"
fdt set /chosen/module@0 reg <${kernel_addr_r} 0x${filesize} >
fdt set /chosen/module@0 bootargs "console=hvc0 rw root=/dev/mmcblk0p2
rootwait  clk_ignore_unused"

bootz ${xen_addr_r} - ${fdt_addr}
#############################################################################


b)
Now, when I boot, I get the following bootup-logs :

#############################################################################
U-Boot SPL 2018.05-rc2-00118-gec5c4a8 (Apr 28 2018 - 08:40:48 +0530)
DRAM: 1024 MiB
CPU: 912000000Hz, AXI/AHB/APB: 3/2/2
Trying to boot from MMC1


U-Boot 2018.05-rc2-00118-gec5c4a8 (Apr 28 2018 - 08:40:48 +0530) Allwinner
Technology

CPU:   Allwinner A20 (SUN7I)
Model: Cubietech Cubieboard2
I2C:   ready
DRAM:  1 GiB
MMC:   SUNXI SD/MMC: 0
Loading Environment from FAT... *** Warning - bad CRC, using default
environment

Failed (-5)
In:    serial
Out:   serial
Err:   serial
SCSI:  SATA link 0 timeout.
AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl SATA mode
flags: ncq stag pm led clo only pmp pio slum part ccc apst
Net:   eth0: ethernet@01c50000
starting USB...
USB0:   USB EHCI 1.00
USB1:   USB OHCI 1.0
USB2:   USB EHCI 1.00
USB3:   USB OHCI 1.0
scanning bus 0 for devices... 1 USB Device(s) found
scanning bus 2 for devices... 1 USB Device(s) found
       scanning usb for storage devices... 0 Storage Device(s) found
Hit any key to stop autoboot:  0
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found U-Boot script /boot.scr
1344 bytes read in 17 ms (77.1 KiB/s)
## Executing script at 43100000
819208 bytes read in 66 ms (11.8 MiB/s)
26147 bytes read in 23 ms (1.1 MiB/s)
4076736 bytes read in 247 ms (15.7 MiB/s)
## Flattened Device Tree blob at 7ec00000
   Booting using the fdt blob at 0x7ec00000
   reserving fdt memory region: addr=7ec00000 size=7000
   Using Device Tree in place at 7ec00000, end 7ec09fff

Starting kernel ...

- UART enabled -
- CPU 00000000 booting -
- Xen starting in Hyp mode -
- Zero BSS -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) Checking for initrd in /chosen
(XEN) RAM: 0000000040000000 - 000000007fffffff
(XEN)
(XEN) MODULE[0]: 000000007ec00000 - 000000007ec07000 Device Tree
(XEN) MODULE[1]: 000000007f600000 - 000000007f9e34c0 Kernel
console=hvc0 rw root=/dev/mmcblk0p2 rootwait clk_ignore_unused
(XEN)  RESVD[0]: 000000007ec00000 - 000000007ec07000
(XEN)
(XEN) Command line: console=dtuart dtuart=/soc@01c00000/serial@01c28000
dom0_mem=256M
(XEN) Placing Xen at 0x000000007fe00000-0x0000000080000000
(XEN) Update BOOTMOD_XEN from 000000007ea00000-000000007eb0d781 =>
000000007fe00000-000000007ff0d781
(XEN) Xen heap: 000000007c000000-000000007e000000 (8192 pages)
(XEN) Dom heap: 253952 pages
(XEN) Domain heap initialised
(XEN) Booting using Device Tree
(XEN) Platform: Allwinner ARMv7
(XEN) Looking for dtuart at "/soc@01c00000/serial@01c28000", options ""
(XEN) Unable to find device "/soc@01c00000/serial@01c28000"
(XEN) Bad console= option 'dtuart'
 Xen 4.11-unstable
(XEN) Xen version 4.11-unstable (debian@) (gcc (Debian 4.6.3-14) 4.6.3)
debug=y  Mon Apr 30 04:52:58 UTC 2018
(XEN) Latest ChangeSet: Mon Apr 16 10:56:00 2018 +0000 git:a6aa678
(XEN) Processor: 410fc074: "ARM Limited", variant: 0x0, part 0xc07, rev 0x4
(XEN) 32-bit Execution:
(XEN)   Processor Features: 00001131:00011011
(XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle
(XEN)     Extensions: GenericTimer Security
(XEN)   Debug Features: 02010555
(XEN)   Auxiliary Features: 00000000
(XEN)   Memory Model Features: 10101105 40000000 01240000 02102211
(XEN)  ISA Features: 02101110 13112111 21232041 11112131 10011142 00000000
(XEN) Using SMC Calling Convention v1.0
(XEN) Using PSCI v0.1
(XEN) SMP: Allowing 2 CPUs
(XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 24000 KHz
(XEN) GICv2 initialization:
(XEN)         gic_dist_addr=0000000001c81000
(XEN)         gic_cpu_addr=0000000001c82000
(XEN)         gic_hyp_addr=0000000001c84000
(XEN)         gic_vcpu_addr=0000000001c86000
(XEN)         gic_maintenance_irq=25
(XEN) GICv2: 160 lines, 2 cpus, secure (IID 0100143b).
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Allocated console ring of 16 KiB.
(XEN) VFP implementer 0x41 architecture 2 part 0x30 variant 0x7 rev 0x4
(XEN) Bringing up CPU1
- CPU 00000001 booting -
- Xen starting in Hyp mode -
- Setting up control registers -
- Turning on paging -
- Ready -
(XEN) CPU 1 booted.
(XEN) Brought up 2 CPUs
(XEN) P2M: 40-bit IPA
(XEN) P2M: 3 levels with order-1 root, VTCR 0x80003558
(XEN) I/O virtualisation disabled
(XEN) build-id: 5b458a2ea80127f76c657ac2621bcd437261f509
(XEN) alternatives: Patching with alt table 100af574 -> 100af5a4
(XEN) grant_table.c:1769:IDLEv0 Expanding d0 grant table from 0 to 1 frames
(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading kernel from boot module @ 000000007f600000
(XEN) Allocating 1:1 mappings totalling 256MB for dom0:
(XEN) BANK[0] 0x00000060000000-0x00000070000000 (256MB)
(XEN) Grant table range: 0x0000007fe00000-0x0000007fe40000
(XEN) Allocating PPI 16 for event channel interrupt
(XEN) Loading zImage from 000000007f600000 to
0000000067c00000-0000000067fe34c0
(XEN) Loading dom0 DTB to 0x0000000068000000-0x00000000680060d5
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM on 1 nodes using 2 CPUs
(XEN) ....done.
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)
(XEN) Freed 288kB init memory.
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER4
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER8
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER12
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER16
(XEN) d0v0: vGICD: unhandled word write 0xffffffff to ICACTIVER0
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.17.0-rc2-dirty (ajay@latitude-3480) (gcc
version 6.2.1 20161016 (Linaro GCC 6.2-2016.11)) #9 SMP Sun Apr 29 11:8
[    0.000000] CPU: ARMv7 Processor [410fc074] revision 4 (ARMv7),
cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Cubietech Cubieboard2
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] Xen 4.11 support found
[    0.000000] cma: Reserved 16 MiB at 0x6f000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.1
[    0.000000] random: get_random_bytes called from start_kernel+0xa0/0x3fc
with crng_init=0
[    0.000000] percpu: Embedded 16 pages/cpu @(ptrval) s34764 r8192 d22580
u65536
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 65024
[    0.000000] Kernel command line: console=hvc0 rw root=/dev/mmcblk0p2
rootwait clk_ignore_unused
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072
bytes)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Memory: 233356K/262144K available (6144K kernel code, 427K
rwdata, 1528K rodata, 1024K init, 249K bss, 12404K reserved, 16384K )
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xd0800000 - 0xff800000   ( 752 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xd0000000   ( 256 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0x(ptrval) - 0x(ptrval)   (7136 kB)
[    0.000000]       .init : 0x(ptrval) - 0x(ptrval)   (1024 kB)
[    0.000000]       .data : 0x(ptrval) - 0x(ptrval)   ( 428 kB)
[    0.000000]        .bss : 0x(ptrval) - 0x(ptrval)   ( 250 kB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000007] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every
4398046511097ns
[    0.000021] Switching to timer-based delay loop, resolution 41ns
[    0.000363] clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 79635851949 ns
[    0.000587] clocksource: hstimer: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 6370868154 ns
[    0.000919] Console: colour dummy device 80x30
[    0.288101] console [hvc0] enabled
[    0.291596] Calibrating delay loop (skipped), value calculated using
timer frequency.. 48.00 BogoMIPS (lpj=240000)
[    0.301983] pid_max: default: 32768 minimum: 301
[    0.306807] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.313450] Mountpoint-cache hash table entries: 1024 (order: 0, 4096
bytes)
[    0.321155] CPU: Testing write buffer coherency: ok
[    0.326523] /cpus/cpu@0 missing clock-frequency property
[    0.331929] /cpus/cpu@1 missing clock-frequency property
[    0.337304] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.344422] xen:grant_table: Grant tables using version 1 layout
[    0.350544] Grant table initialized
[    0.354158] xen:events: Using FIFO-based ABI
[    0.358487] Xen: initializing cpu0
[    0.362075] Setting up static identity map for 0x60100000 - 0x60100060
[    0.368858] Hierarchical SRCU implementation.
[    0.374021] smp: Bringing up secondary CPUs ...
(XEN) d0v1: vGICD: unhandled word write 0xffffffff to ICACTIVER0
[    0.385338] Xen: initializing cpu1
[    0.385427] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.385704] smp: Brought up 1 node, 2 CPUs
[    0.399002] SMP: Total of 2 processors activated (96.00 BogoMIPS).
[    0.405260] CPU: All CPU(s) started in SVC mode.
[    0.410729] devtmpfs: initialized
[    0.420269] Built 1 zonelists, mobility grouping on.  Total pages: 62371
[    0.427816] VFP support v0.3: implementor 41 architecture 2 part 30
variant 7 rev 4
[    0.435774] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.445681] futex hash table entries: 512 (order: 3, 32768 bytes)
[    0.452035] pinctrl core: initialized pinctrl subsystem
[    0.458206] NET: Registered protocol family 16
[    0.463723] DMA: preallocated 256 KiB pool for atomic coherent
allocations
[    0.472429] xen:swiotlb_xen: Warning: only able to allocate 4 MB for
software IO TLB
[    0.482360] software IO TLB [mem 0x6e000000-0x6e400000] (4MB) mapped at
[(ptrval)-(ptrval)]
[    0.490848] hw-breakpoint: Failed to enable monitor mode on CPU 0.
[    0.511454] xen:balloon: Initialising balloon driver
[    0.518136] SCSI subsystem initialized
[    0.522612] usbcore: registered new interface driver usbfs
[    0.528158] usbcore: registered new interface driver hub
[    0.533651] usbcore: registered new device driver usb
[    0.538971] pps_core: LinuxPPS API ver. 1 registered
[    0.544017] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.553197] PTP clock support registered
[    0.557413] Advanced Linux Sound Architecture Driver Initialized.
[    0.564659] clocksource: Switched to clocksource arch_sys_counter
[    0.579029] OF: /thermal-zones/cpu_thermal/cooling-maps/map0: could not
find phandle
[    0.586908] missing cooling_device property
[    0.591101] failed to build thermal zone cpu_thermal: -22
[    0.596769] NET: Registered protocol family 2
[    0.601698] tcp_listen_portaddr_hash hash table entries: 512 (order: 0,
6144 bytes)
[    0.609472] TCP established hash table entries: 2048 (order: 1, 8192
bytes)
[    0.616536] TCP bind hash table entries: 2048 (order: 2, 16384 bytes)
[    0.623017] TCP: Hash tables configured (established 2048 bind 2048)
[    0.629574] UDP hash table entries: 256 (order: 1, 8192 bytes)
[    0.635496] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
[    0.641976] NET: Registered protocol family 1
[    0.647420] RPC: Registered named UNIX socket transport module.
[    0.653356] RPC: Registered udp transport module.
[    0.658210] RPC: Registered tcp transport module.
[    0.662918] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.671474] workingset: timestamp_bits=30 max_order=16 bucket_order=0
[    0.685118] NFS: Registering the id_resolver key type
[    0.690225] Key type id_resolver registered
[    0.694440] Key type id_legacy registered
[    0.701273] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 248)
[    0.708770] io scheduler noop registered
[    0.712700] io scheduler deadline registered
[    0.717334] io scheduler cfq registered (default)
[    0.722077] io scheduler mq-deadline registered
[    0.726696] io scheduler kyber registered
[    0.731450] sun4i-usb-phy 1c13400.phy: could not find pctldev for node
/soc@1c00000/pinctrl@1c20800/usb0_id_detect_pin@0, deferring probe
[    0.747298] sun4i-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver
[    0.763143] xen:xen_evtchn: Event-channel device installed
[    0.818679] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.830086] sun4i-backend 1e60000.display-backend: Couldn't find
matching frontend, frontend features disabled
[    0.840566] sun4i-drm display-engine: bound 1e60000.display-backend (ops
0xc0748f94)
[    0.848402] sun4i-backend 1e40000.display-backend: Couldn't find
matching frontend, frontend features disabled
[    0.858694] sun4i-drm display-engine: bound 1e40000.display-backend (ops
0xc0748f94)
[    0.866884] sun4i-drm display-engine: No panel or bridge found... RGB
output disabled
[    0.874814] sun4i-drm display-engine: bound 1c0c000.lcd-controller (ops
0xc0747f24)
[    0.882853] sun4i-drm display-engine: No panel or bridge found... RGB
output disabled
[    0.890743] sun4i-drm display-engine: bound 1c0d000.lcd-controller (ops
0xc0747f24)
[    0.898849] sun4i-drm display-engine: bound 1c16000.hdmi (ops 0xc0749998)
[    0.905747] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    0.912374] [drm] No driver support for vblank timestamp query.
[    1.418423] [drm] Cannot find any crtc or sizes
[    1.423838] [drm] Initialized sun4i-drm 1.0.0 20150629 for
display-engine on minor 0
[    1.432355] Invalid max_queues (4), will use default max: 2.
[    1.439357] libphy: Fixed MDIO Bus: probed
[    1.443479] CAN device driver interface
[    1.448069] sun7i-dwmac 1c50000.ethernet: PTP uses main clock
[    1.453837] sun7i-dwmac 1c50000.ethernet: no reset control found
[    1.459957] sun7i-dwmac 1c50000.ethernet: no regulator found
[    1.466042] sun7i-dwmac 1c50000.ethernet: Ring mode enabled
[    1.471652] sun7i-dwmac 1c50000.ethernet: DMA HW capability register
supported
[    1.478929] sun7i-dwmac 1c50000.ethernet: Normal descriptors
[    1.494720] libphy: stmmac: probed
[    1.498149] mdio_bus stmmac-0:01: attached PHY driver [unbound]
(mii_bus:phy_addr=stmmac-0:01, irq=POLL)
[    1.508780] xen_netfront: Initialising Xen virtual ethernet driver
[    1.515120] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.521652] ehci-platform: EHCI generic platform driver
[    1.527443] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.533705] ohci-platform: OHCI generic platform driver
[    1.541166] sunxi-rtc 1c20d00.rtc: rtc core: registered rtc-sunxi as rtc0
[    1.548026] sunxi-rtc 1c20d00.rtc: RTC enabled
[    1.552620] i2c /dev entries driver
[    1.557597] axp20x-i2c 1-0034: AXP20x variant AXP209 found
[    1.582423] input: axp20x-pek as /devices/platform/soc@1c00000
/1c2ac00.i2c/i2c-1/1-0034/axp20x-pek/input/input0
[    1.593816] ldo1: supplied by regulator-dummy
[    1.598547] ldo2: supplied by regulator-dummy
[    1.604304] ldo3: supplied by regulator-dummy
[    1.609551] ldo4: supplied by regulator-dummy
[    1.614120] ldo5: supplied by regulator-dummy
[    1.619921] dcdc2: supplied by regulator-dummy
[    1.625276] dcdc3: supplied by regulator-dummy
[    1.631568] axp20x-i2c 1-0034: AXP20X driver loaded
[    1.638062] Registered IR keymap rc-empty
[    1.642244] rc rc0: sunxi-ir as /devices/platform/soc@1c00000/
1c21800.ir/rc/rc0
[    1.649831] input: sunxi-ir as /devices/platform/soc@1c00000/
1c21800.ir/rc/rc0/input1
[    1.658402] sunxi-ir 1c21800.ir: initialized sunXi IR driver
[    1.665721] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16
sec, nowayout=0)
[    1.674051] cpu cpu0: failed to get clock: -2
[    1.678510] cpufreq-dt: probe of cpufreq-dt failed with error -2
[    1.686126] sunxi-mmc 1c0f000.mmc: Got CD GPIO
[    1.714999] sunxi-mmc 1c0f000.mmc: base:0x(ptrval) irq:27
[    1.721679] sun4i-ss 1c15000.crypto-engine: Die ID 0
[    1.728729] usbcore: registered new interface driver usbhid
[    1.734324] usbhid: USB HID core driver
[    1.743178] sun4i-codec 1c22c00.codec: ASoC: Failed to create component
debugfs directory
[    1.753930] sun4i-codec 1c22c00.codec: Codec <-> 1c22c00.codec mapping ok
[    1.762798] NET: Registered protocol family 17
[    1.767356] can: controller area network core (rev 20170425 abi 9)
[    1.773642] NET: Registered protocol family 29
[    1.778191] can: raw protocol (rev 20170425)
[    1.782466] can: broadcast manager protocol (rev 20170425 t)
[    1.788241] can: netlink gateway (rev 20170425) max_hops=1
[    1.793991] Key type dns_resolver registered
[    1.798438] Registering SWP/SWPB emulation handler
[    1.804279] random: fast init done
[    1.859746] mmc0: host does not support reading read-only switch,
assuming write-enable
[    1.874042] mmc0: new high speed SDHC card at address aaaa
[    1.880897] mmcblk0: mmc0:aaaa SS16G 14.8 GiB
[    1.891605]  mmcblk0: p1 p2
[    1.924710] ahci-sunxi 1c18000.sata: controller can't do PMP, turning
off CAP_PMP
[    1.932248] ahci-sunxi 1c18000.sata: SSS flag set, parallel bus scan
disabled
[    1.939478] ahci-sunxi 1c18000.sata: AHCI 0001.0100 32 slots 1 ports 3
Gbps 0x1 impl platform mode
[    1.948464] ahci-sunxi 1c18000.sata: flags: ncq sntf stag pm led clo
only pio slum part ccc
[    1.958331] scsi host0: ahci-sunxi
[    1.962147] ata1: SATA max UDMA/133 mmio [mem 0x01c18000-0x01c18fff]
port 0x100 irq 33
[    1.970760] ehci-platform 1c14000.usb: EHCI Host Controller
[    1.976458] ehci-platform 1c14000.usb: new USB bus registered, assigned
bus number 1
[    1.984532] ehci-platform 1c14000.usb: irq 29, io mem 0x01c14000
[    2.014698] ehci-platform 1c14000.usb: USB 2.0 started, EHCI 1.00
[    2.021857] hub 1-0:1.0: USB hub found
[    2.025702] hub 1-0:1.0: 1 port detected
[    2.030547] ehci-platform 1c1c000.usb: EHCI Host Controller
[    2.036234] ehci-platform 1c1c000.usb: new USB bus registered, assigned
bus number 2
[    2.044307] ehci-platform 1c1c000.usb: irq 34, io mem 0x01c1c000
[    2.074667] ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00
[    2.081787] hub 2-0:1.0: USB hub found
[    2.085639] hub 2-0:1.0: 1 port detected
[    2.090439] ohci-platform 1c14400.usb: Generic Platform OHCI controller
[    2.097158] ohci-platform 1c14400.usb: new USB bus registered, assigned
bus number 3
[    2.105231] ohci-platform 1c14400.usb: irq 30, io mem 0x01c14400
[    2.179624] hub 3-0:1.0: USB hub found
[    2.183442] hub 3-0:1.0: 1 port detected
[    2.188291] ohci-platform 1c1c400.usb: Generic Platform OHCI controller
[    2.195033] ohci-platform 1c1c400.usb: new USB bus registered, assigned
bus number 4
[    2.203132] ohci-platform 1c1c400.usb: irq 35, io mem 0x01c1c400
[    2.279656] hub 4-0:1.0: USB hub found
[    2.283474] hub 4-0:1.0: 1 port detected
[    2.288374] usb_phy_generic usb_phy_generic.0.auto:
usb_phy_generic.0.auto supply vcc not found, using dummy regulator
[    2.297035] ata1: SATA link down (SStatus 0 SControl 300)
[    2.299725] musb-hdrc musb-hdrc.1.auto: MUSB HDRC host driver
[    2.310399] musb-hdrc musb-hdrc.1.auto: new USB bus registered, assigned
bus number 5
[    2.319258] hub 5-0:1.0: USB hub found
[    2.323068] hub 5-0:1.0: 1 port detected
[    2.339055] sunxi-rtc 1c20d00.rtc: setting system clock to 2018-04-30
05:37:21 UTC (1525066641)
[    2.347999] clk: Not disabling unused clocks
[    2.352298] vcc3v0: disabling
[    2.355339] vcc5v0: disabling
[    2.358364] ALSA device list:
[    2.361380]   #0: sun4i-codec
[    2.444375] EXT4-fs (mmcblk0p2): recovery complete
[    2.450240] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data
mode. Opts: (null)
[    2.458430] VFS: Mounted root (ext4 filesystem) on device 179:2.
[    2.475217] devtmpfs: mounted
[    2.480063] Freeing unused kernel memory: 1024K
[    3.494805] [drm] Cannot find any crtc or sizes
INIT: version 2.88 booting
[info] Using makefile-style concurrent boot in runlevel S.
[....] Starting the hotplug events dispatcher: udevd[    4.321664]
udevd[184]: starting version 175
. ok
[....] Synthesizing the initial hotplug events...done.
[....] Waiting for /dev to be fully populated...done.
[....] Setting preliminary keymap...done.
[....] Activating swap...done.
[    7.118505] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
[....] Cleaning up temporary files... /tmp. ok
[....] Activating lvm and md swap...done.
[....] Checking file systems...fsck from util-linux 2.20.1
done.
[....] Mounting local filesystems...done.
[....] Activating swapfile swap...done.
[....] Cleaning up temporary files.... ok
[....] Setting kernel variables ...done.
[....] Setting up resolvconf.../etc/resolvconf/update.d/libc: Warning:
/etc/resolv.conf is not a symbolic link to /etc/resolvconf/run/resolv.cf
done.
[   10.616291] random: dd: uninitialized urandom read (512 bytes read)
[....] Configuring network interfaces...Internet Systems Consortium DHCP
Client 4.2.2
Copyright 2004-2011 Internet Systems Consortium.
All rights reserved.
For info, please visit https://www.isc.org/software/dhcp/

[   11.077914] Generic PHY stmmac-0:01: attached PHY driver [Generic PHY]
(mii_bus:phy_addr=stmmac-0:01, irq=POLL)
[   11.091988] sun7i-dwmac 1c50000.ethernet eth0: RX IPC Checksum Offload
disabled
[   11.099411] sun7i-dwmac 1c50000.ethernet eth0: No MAC Management
Counters available
[   11.107103] sun7i-dwmac 1c50000.ethernet eth0: PTP not supported by HW
Listening on LPF/eth0/02:0f:06:c3:45:7c
Sending on   LPF/eth0/02:0f:06:c3:45:7c
Sending on   Socket/fallback
DHCPREQUEST on eth0 to 255.255.255.255 port 67
[   12.175471] sun7i-dwmac 1c50000.ethernet eth0: Link is Up - 100Mbps/Full
- flow control rx/tx
DHCPREQUEST on eth0 to 255.255.255.255 port 67
DHCPACK from 10.20.50.50
/etc/resolvconf/update.d/libc: Warning: /etc/resolv.conf is not a symbolic
link to /etc/resolvconf/run/resolv.conf
bound to 10.20.55.141 -- renewal in 248256 seconds.
done.
[....] Cleaning up temporary files.... ok
[info] Setting console screen modes.
setterm: cannot (un)set powersave mode: Inappropriate ioctl for device
[info] Skipping font and keymap setup (handled by console-setup).
[....] Setting up console font and keymap...done.
[....] Setting up X socket directories... /tmp/.X11-unix /tmp/.ICE-unix. ok
INIT: Entering runlevel: 2
[info] Using makefile-style concurrent boot in runlevel 2.
[....] Starting enhanced syslogd: rsyslogd. ok
[   21.960384] random: dbus-daemon: uninitialized urandom read (12 bytes
read)
[   21.996335] random: dbus-daemon: uninitialized urandom read (12 bytes
read)
[   22.038283] random: sshd: uninitialized urandom read (32 bytes read)
[....] Starting periodic command scheduler: cron. ok
[....] Starting system message bus: dbus. ok
[....] Starting OpenBSD Secure Shell server: sshd. ok
#############################################################################


c)
After I ssh into the machine, following just hangs (without returning to
prompt) :

debian@debian-armhf:~$ sudo xl list
Name                                        ID   Mem VCPUs    State
Time(s)


Now what am I missing?

On Sun, Apr 29, 2018 at 11:30 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote:

> I changed the /chosen node in the dts file to
>
> #######################################
>     chosen {
>         stdout-path = "serial0:115200n8";
>         xen,xen-bootargs = "dom0_mem=752M console=dtuart dtuart=serial0
> dom0_max_vcpus=4";
>         xen,dom0-bootargs = "console=ttyS0,115200 rw root=/dev/mmcblk0p2
> ignore_loglevel cma=128M";
>         modules {
>             #address-cells = <2>;
>             #size-cells = <2>;
>             module@1 {
>                 compatible = "xen,linux-zimage", "xen,multiboot-module";
>                 reg = <0x0 0x7a000000 0x0 0x02000000>;
>             };
>         };
>     };
> #######################################
>
>
>
> Also, the xen-related features in the kernel are as follows (created by
> default after selecting "Kernel features => Xen guest support on ARM" in
> menuconfig) :
>
> #######################################
>   CONFIG_XEN_DOM0=y
>   CONFIG_XEN=y
>   CONFIG_XEN_BLKDEV_FRONTEND=y
>   CONFIG_XEN_NETDEV_FRONTEND=y
>   CONFIG_INPUT_XEN_KBDDEV_FRONTEND=y
>   CONFIG_HVC_XEN=y
>   CONFIG_HVC_XEN_FRONTEND=y
>   CONFIG_XEN_FBDEV_FRONTEND=y
>   CONFIG_XEN_BALLOON=y
>   CONFIG_XEN_SCRUB_PAGES=y
>   CONFIG_XEN_DEV_EVTCHN=y
>   CONFIG_XEN_BACKEND=y
>   CONFIG_XENFS=y
>   CONFIG_XEN_COMPAT_XENFS=y
>   CONFIG_XEN_SYS_HYPERVISOR=y
>   CONFIG_XEN_XENBUS_FRONTEND=y
>   CONFIG_XEN_GNTDEV=m
>   CONFIG_XEN_GRANT_DEV_ALLOC=m
>   CONFIG_SWIOTLB_XEN=y
>   CONFIG_XEN_PRIVCMD=y
>   CONFIG_XEN_AUTO_XLATE=y
>
>
>   # CONFIG_XEN_BLKDEV_BACKEND is not set
>   # CONFIG_XEN_SCSI_FRONTEND is not set
>   # CONFIG_XEN_NETDEV_BACKEND is not set
>   # CONFIG_XEN_WDT is not set
>   # CONFIG_XEN_PVCALLS_FRONTEND is not set
>   # CONFIG_XEN_PVCALLS_BACKEND is not set
> #######################################
>
> However, I see absolutely no change in the observations; no xen-related
> log on the serial-console, and "sudo xl list" gives the same error messages.
>
> What am I lacking?
>
>
> On Sat, Apr 28, 2018 at 11:06 PM, Andrew Cooper <andrew.cooper3@citrix.com
> > wrote:
>
>> On 28/04/18 18:34, Ajay Garg wrote:
>>
>> Hi Andrew.
>>
>> Thanks for the reply.
>>
>> On Sat, Apr 28, 2018 at 10:57 PM, Andrew Cooper <
>> andrew.cooper3@citrix.com> wrote:
>>
>>> On 28/04/18 18:12, Ajay Garg wrote:
>>>
>>> Hi All.
>>>
>>> We have brought up the cubieboard2 from almost scratch, following are
>>> the steps done :
>>>
>>> <snip>
>>>
>>> == getting xen ready ==
>>>
>>> i)
>>> Compiled xen on cubieboard itself, via :
>>>
>>>    * git clone git://xenbits.xen.org/xen.git
>>>    * cd xen
>>> .  * ./configure --libdir=/usr/lib
>>>    * make debball CONFIG_EARLY_PRINTK=sun7i -j4
>>>    * sudo dpkg -i dist/xen-upstream-4.11-unstable.deb
>>>    * sudo reboot
>>>
>>> ii)
>>> Upon reboot, "sudo xl list" gives following :
>>>
>>> ##################################################################
>>> debian@debian-armhf:~$ sudo  xl list
>>> [sudo] password for debian:
>>> xencall: error: Could not obtain handle on privileged command interface:
>>> No such file or directory
>>> libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
>>> such file or directory
>>> cannot init xl context
>>> ##################################################################
>>>
>>>
>>> This means that /dev/xen/privcmd (or the legacy /proc/xen/privcmd)
>>> device isn't available.
>>>
>>> First check that you have actually booted Xen with Linux as dom0.  You
>>> don't show any logs in this final section, and simply installing the
>>> debball and rebooting won't typically cause Xen to be the head of the boot
>>> list.
>>>
>>
>> Yes, I haven't been able to setup xen bootup.
>>
>> That's why, requested help regarding the changes that are required in
>> https://github.com/torvalds/linux/blob/master/arch/arm/boot/
>> dts/sun7i-a20-cubieboard2.dts, that would cause dom0 to boot up.
>>
>>
>> Sorry for the confusion.
>>
>>
>> Ah - sorry.  I misunderstood.  I'm afraid you're going to have to wait
>> for some people more knowledge about ARM to answer.
>>
>> ~Andrew
>>
>
>
>
> --
> Regards,
> Ajay
>



-- 
Regards,
Ajay

--0000000000005aaa40056b0a4fac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div>Hi All.<=
br><br></div>I made some changes :<br><br></div>a)<br></div>Removed the cha=
nged from the dts file.<br></div>Instead changed boot.cmd to <br><br>######=
#######################################################################<br>=
# SUNXI Xen Boot Script<br># Arch Linux ARM adaption of the cmd file which =
can be found at <a href=3D"http://openmirage.org/wiki/xen-on-cubieboard2">h=
ttp://openmirage.org/wiki/xen-on-cubieboard2</a><br><br># Addresses suitabl=
e for 1GB system, adjust as appropriate for a 2GB system.<br># Top of RAM:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x80000000<br># Xen reloca=
te addr=C2=A0=C2=A0 0x7fe00000<br>setenv kernel_addr_r=C2=A0 0x7f600000 # 8=
M<br>setenv ramdisk_addr_r 0x7ee00000 # 8M<br>setenv fdt_addr=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x7ec00000 # 2M<br>setenv xen_addr_r=C2=A0=C2=A0=
=C2=A0=C2=A0 0x7ea00000 # 2M<br><br>setenv fdt_high=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xffffffff # Load fdt in place instead of relocating<br><br># Load x=
en/xen to ${xen_addr_r}.<br>fatload mmc 0 ${xen_addr_r} /xen<br>setenv boot=
args &quot;console=3Ddtuart dtuart=3D/soc@01c00000/serial@01c28000 dom0_mem=
=3D256M&quot;<br><br># Load appropriate .dtb file to ${fdt_addr}<br>fatload=
 mmc 0 ${fdt_addr} /sun7i-a20-cubieboard2.dtb<br>fdt addr ${fdt_addr} 0x400=
00<br>fdt resize<br>fdt chosen<br>fdt set /chosen \#address-cells &lt;1&gt;=
<br>fdt set /chosen \#size-cells &lt;1&gt;<br><br># Load Linux arch/arm/boo=
t/zImage to ${kernel_addr_r}<br>fatload mmc 0 ${kernel_addr_r} /vmlinuz<br>=
<br>fdt mknod /chosen module@0<br>fdt set /chosen/module@0 compatible &quot=
;xen,linux-zimage&quot; &quot;xen,multiboot-module&quot;<br>fdt set /chosen=
/module@0 reg &lt;${kernel_addr_r} 0x${filesize} &gt;<br>fdt set /chosen/mo=
dule@0 bootargs &quot;console=3Dhvc0 rw root=3D/dev/mmcblk0p2 rootwait=C2=
=A0 clk_ignore_unused&quot;<br><br>bootz ${xen_addr_r} - ${fdt_addr}<br>###=
##########################################################################<=
br><br><br></div>b)<br></div>Now, when I boot, I get the following bootup-l=
ogs :<br><br>##############################################################=
###############<br>U-Boot SPL 2018.05-rc2-00118-gec5c4a8 (Apr 28 2018 - 08:=
40:48 +0530)<br>DRAM: 1024 MiB<br>CPU: 912000000Hz, AXI/AHB/APB: 3/2/2<br>T=
rying to boot from MMC1<br><br><br>U-Boot 2018.05-rc2-00118-gec5c4a8 (Apr 2=
8 2018 - 08:40:48 +0530) Allwinner Technology<br><br>CPU:=C2=A0=C2=A0 Allwi=
nner A20 (SUN7I)<br>Model: Cubietech Cubieboard2<br>I2C:=C2=A0=C2=A0 ready<=
br>DRAM:=C2=A0 1 GiB<br>MMC:=C2=A0=C2=A0 SUNXI SD/MMC: 0<br>Loading Environ=
ment from FAT... *** Warning - bad CRC, using default environment<br><br>Fa=
iled (-5)<br>In:=C2=A0=C2=A0=C2=A0 serial<br>Out:=C2=A0=C2=A0 serial<br>Err=
:=C2=A0=C2=A0 serial<br>SCSI:=C2=A0 SATA link 0 timeout.<br>AHCI 0001.0100 =
32 slots 1 ports 3 Gbps 0x1 impl SATA mode<br>flags: ncq stag pm led clo on=
ly pmp pio slum part ccc apst <br>Net:=C2=A0=C2=A0 eth0: ethernet@01c50000<=
br>starting USB...<br>USB0:=C2=A0=C2=A0 USB EHCI 1.00<br>USB1:=C2=A0=C2=A0 =
USB OHCI 1.0<br>USB2:=C2=A0=C2=A0 USB EHCI 1.00<br>USB3:=C2=A0=C2=A0 USB OH=
CI 1.0<br>scanning bus 0 for devices... 1 USB Device(s) found<br>scanning b=
us 2 for devices... 1 USB Device(s) found<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 scanning usb for storage devices... 0 Storage Device(s) found<br>Hit=
 any key to stop autoboot:=C2=A0 0 <br>switch to partitions #0, OK<br>mmc0 =
is current device<br>Scanning mmc 0:1...<br>Found U-Boot script /boot.scr<b=
r>1344 bytes read in 17 ms (77.1 KiB/s)<br>## Executing script at 43100000<=
br>819208 bytes read in 66 ms (11.8 MiB/s)<br>26147 bytes read in 23 ms (1.=
1 MiB/s)<br>4076736 bytes read in 247 ms (15.7 MiB/s)<br>## Flattened Devic=
e Tree blob at 7ec00000<br>=C2=A0=C2=A0 Booting using the fdt blob at 0x7ec=
00000<br>=C2=A0=C2=A0 reserving fdt memory region: addr=3D7ec00000 size=3D7=
000<br>=C2=A0=C2=A0 Using Device Tree in place at 7ec00000, end 7ec09fff<br=
><br>Starting kernel ...<br><br>- UART enabled -<br>- CPU 00000000 booting =
-<br>- Xen starting in Hyp mode -<br>- Zero BSS -<br>- Setting up control r=
egisters -<br>- Turning on paging -<br>- Ready -<br>(XEN) Checking for init=
rd in /chosen<br>(XEN) RAM: 0000000040000000 - 000000007fffffff<br>(XEN) <b=
r>(XEN) MODULE[0]: 000000007ec00000 - 000000007ec07000 Device Tree=C2=A0 <b=
r>(XEN) MODULE[1]: 000000007f600000 - 000000007f9e34c0 Kernel=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 console=3Dhvc0 rw root=3D/dev/mmcblk0p2 rootwait c=
lk_ignore_unused<br>(XEN)=C2=A0 RESVD[0]: 000000007ec00000 - 000000007ec070=
00<br>(XEN) <br>(XEN) Command line: console=3Ddtuart dtuart=3D/soc@01c00000=
/serial@01c28000 dom0_mem=3D256M<br>(XEN) Placing Xen at 0x000000007fe00000=
-0x0000000080000000<br>(XEN) Update BOOTMOD_XEN from 000000007ea00000-00000=
0007eb0d781 =3D&gt; 000000007fe00000-000000007ff0d781<br>(XEN) Xen heap: 00=
0000007c000000-000000007e000000 (8192 pages)<br>(XEN) Dom heap: 253952 page=
s<br>(XEN) Domain heap initialised<br>(XEN) Booting using Device Tree<br>(X=
EN) Platform: Allwinner ARMv7<br>(XEN) Looking for dtuart at &quot;/soc@01c=
00000/serial@01c28000&quot;, options &quot;&quot;<br>(XEN) Unable to find d=
evice &quot;/soc@01c00000/serial@01c28000&quot;<br>(XEN) Bad console=3D opt=
ion &#39;dtuart&#39;<br>=C2=A0Xen 4.11-unstable<br>(XEN) Xen version 4.11-u=
nstable (debian@) (gcc (Debian 4.6.3-14) 4.6.3) debug=3Dy=C2=A0 Mon Apr 30 =
04:52:58 UTC 2018<br>(XEN) Latest ChangeSet: Mon Apr 16 10:56:00 2018 +0000=
 git:a6aa678<br>(XEN) Processor: 410fc074: &quot;ARM Limited&quot;, variant=
: 0x0, part 0xc07, rev 0x4<br>(XEN) 32-bit Execution:<br>(XEN)=C2=A0=C2=A0 =
Processor Features: 00001131:00011011<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0 Inst=
ruction Sets: AArch32 A32 Thumb Thumb-2 ThumbEE Jazelle<br>(XEN)=C2=A0=C2=
=A0=C2=A0=C2=A0 Extensions: GenericTimer Security<br>(XEN)=C2=A0=C2=A0 Debu=
g Features: 02010555<br>(XEN)=C2=A0=C2=A0 Auxiliary Features: 00000000<br>(=
XEN)=C2=A0=C2=A0 Memory Model Features: 10101105 40000000 01240000 02102211=
<br>(XEN)=C2=A0 ISA Features: 02101110 13112111 21232041 11112131 10011142 =
00000000<br>(XEN) Using SMC Calling Convention v1.0<br>(XEN) Using PSCI v0.=
1<br>(XEN) SMP: Allowing 2 CPUs<br>(XEN) Generic Timer IRQ: phys=3D30 hyp=
=3D26 virt=3D27 Freq: 24000 KHz<br>(XEN) GICv2 initialization:<br>(XEN)=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_dist_addr=3D0000000001c81=
000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_cpu_addr=
=3D0000000001c82000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gic_hyp_addr=3D0000000001c84000<br>(XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 gic_vcpu_addr=3D0000000001c86000<br>(XEN)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_maintenance_irq=3D25<br>(XEN) GICv2: =
160 lines, 2 cpus, secure (IID 0100143b).<br>(XEN) Using scheduler: SMP Cre=
dit Scheduler (credit)<br>(XEN) Allocated console ring of 16 KiB.<br>(XEN) =
VFP implementer 0x41 architecture 2 part 0x30 variant 0x7 rev 0x4<br>(XEN) =
Bringing up CPU1<br>- CPU 00000001 booting -<br>- Xen starting in Hyp mode =
-<br>- Setting up control registers -<br>- Turning on paging -<br>- Ready -=
<br>(XEN) CPU 1 booted.<br>(XEN) Brought up 2 CPUs<br>(XEN) P2M: 40-bit IPA=
<br>(XEN) P2M: 3 levels with order-1 root, VTCR 0x80003558<br>(XEN) I/O vir=
tualisation disabled<br>(XEN) build-id: 5b458a2ea80127f76c657ac2621bcd43726=
1f509<br>(XEN) alternatives: Patching with alt table 100af574 -&gt; 100af5a=
4<br>(XEN) grant_table.c:1769:IDLEv0 Expanding d0 grant table from 0 to 1 f=
rames<br>(XEN) *** LOADING DOMAIN 0 ***<br>(XEN) Loading kernel from boot m=
odule @ 000000007f600000<br>(XEN) Allocating 1:1 mappings totalling 256MB f=
or dom0:<br>(XEN) BANK[0] 0x00000060000000-0x00000070000000 (256MB)<br>(XEN=
) Grant table range: 0x0000007fe00000-0x0000007fe40000<br>(XEN) Allocating =
PPI 16 for event channel interrupt<br>(XEN) Loading zImage from 000000007f6=
00000 to 0000000067c00000-0000000067fe34c0<br>(XEN) Loading dom0 DTB to 0x0=
000000068000000-0x00000000680060d5<br>(XEN) Initial low memory virq thresho=
ld set at 0x4000 pages.<br>(XEN) Scrubbing Free RAM on 1 nodes using 2 CPUs=
<br>(XEN) ....done.<br>(XEN) Std. Loglevel: All<br>(XEN) Guest Loglevel: Al=
l<br>(XEN) *** Serial input -&gt; DOM0 (type &#39;CTRL-a&#39; three times t=
o switch input to Xen)<br>(XEN) Freed 288kB init memory.<br>(XEN) d0v0: vGI=
CD: unhandled word write 0xffffffff to ICACTIVER4<br>(XEN) d0v0: vGICD: unh=
andled word write 0xffffffff to ICACTIVER8<br>(XEN) d0v0: vGICD: unhandled =
word write 0xffffffff to ICACTIVER12<br>(XEN) d0v0: vGICD: unhandled word w=
rite 0xffffffff to ICACTIVER16<br>(XEN) d0v0: vGICD: unhandled word write 0=
xffffffff to ICACTIVER0<br>[=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on p=
hysical CPU 0x0<br>[=C2=A0=C2=A0=C2=A0 0.000000] Linux version 4.17.0-rc2-d=
irty (ajay@latitude-3480) (gcc version 6.2.1 20161016 (Linaro GCC 6.2-2016.=
11)) #9 SMP Sun Apr 29 11:8<br>[=C2=A0=C2=A0=C2=A0 0.000000] CPU: ARMv7 Pro=
cessor [410fc074] revision 4 (ARMv7), cr=3D10c5387d<br>[=C2=A0=C2=A0=C2=A0 =
0.000000] CPU: div instructions available: patching division code<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT ali=
asing instruction cache<br>[=C2=A0=C2=A0=C2=A0 0.000000] OF: fdt: Machine m=
odel: Cubietech Cubieboard2<br>[=C2=A0=C2=A0=C2=A0 0.000000] Memory policy:=
 Data cache writealloc<br>[=C2=A0=C2=A0=C2=A0 0.000000] Xen 4.11 support fo=
und<br>[=C2=A0=C2=A0=C2=A0 0.000000] cma: Reserved 16 MiB at 0x6f000000<br>=
[=C2=A0=C2=A0=C2=A0 0.000000] psci: probing for conduit method from DT.<br>=
[=C2=A0=C2=A0=C2=A0 0.000000] psci: PSCIv1.1 detected in firmware.<br>[=C2=
=A0=C2=A0=C2=A0 0.000000] psci: Using standard PSCI v0.2 function IDs<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] psci: Trusted OS migration not required<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] psci: SMC Calling Convention v1.1<br>[=C2=A0=
=C2=A0=C2=A0 0.000000] random: get_random_bytes called from start_kernel+0x=
a0/0x3fc with crng_init=3D0<br>[=C2=A0=C2=A0=C2=A0 0.000000] percpu: Embedd=
ed 16 pages/cpu @(ptrval) s34764 r8192 d22580 u65536<br>[=C2=A0=C2=A0=C2=A0=
 0.000000] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 6502=
4<br>[=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: console=3Dhvc0 rw r=
oot=3D/dev/mmcblk0p2 rootwait clk_ignore_unused<br>[=C2=A0=C2=A0=C2=A0 0.00=
0000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)<br>[=
=C2=A0=C2=A0=C2=A0 0.000000] Inode-cache hash table entries: 16384 (order: =
4, 65536 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.000000] Memory: 233356K/262144K av=
ailable (6144K kernel code, 427K rwdata, 1528K rodata, 1024K init, 249K bss=
, 12404K reserved, 16384K )<br>[=C2=A0=C2=A0=C2=A0 0.000000] Virtual kernel=
 memory layout:<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0 ve=
ctor=C2=A0 : 0xffff0000 - 0xffff1000=C2=A0=C2=A0 (=C2=A0=C2=A0 4 kB)<br>[=
=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0 fixmap=C2=A0 : 0xffc00=
000 - 0xfff00000=C2=A0=C2=A0 (3072 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=
=A0=C2=A0=C2=A0=C2=A0 vmalloc : 0xd0800000 - 0xff800000=C2=A0=C2=A0 ( 752 M=
B)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0 lowmem=C2=A0 : =
0xc0000000 - 0xd0000000=C2=A0=C2=A0 ( 256 MB)<br>[=C2=A0=C2=A0=C2=A0 0.0000=
00]=C2=A0=C2=A0=C2=A0=C2=A0 pkmap=C2=A0=C2=A0 : 0xbfe00000 - 0xc0000000=C2=
=A0=C2=A0 (=C2=A0=C2=A0 2 MB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=
=C2=A0=C2=A0 modules : 0xbf000000 - 0xbfe00000=C2=A0=C2=A0 (=C2=A0 14 MB)<b=
r>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text :=
 0x(ptrval) - 0x(ptrval)=C2=A0=C2=A0 (7136 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000=
000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .init : 0x(ptrval) - 0x(ptrval)=C2=
=A0=C2=A0 (1024 kB)<br>[=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .data : 0x(ptrval) - 0x(ptrval)=C2=A0=C2=A0 ( 428 kB)<br>[=
=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bss=
 : 0x(ptrval) - 0x(ptrval)=C2=A0=C2=A0 ( 250 kB)<br>[=C2=A0=C2=A0=C2=A0 0.0=
00000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1=
<br>[=C2=A0=C2=A0=C2=A0 0.000000] Hierarchical RCU implementation.<br>[=C2=
=A0=C2=A0=C2=A0 0.000000]=C2=A0 RCU restricting CPUs from NR_CPUS=3D8 to nr=
_cpu_ids=3D2.<br>[=C2=A0=C2=A0=C2=A0 0.000000] RCU: Adjusting geometry for =
rcu_fanout_leaf=3D16, nr_cpu_ids=3D2<br>[=C2=A0=C2=A0=C2=A0 0.000000] NR_IR=
QS: 16, nr_irqs: 16, preallocated irqs: 16<br>[=C2=A0=C2=A0=C2=A0 0.000000]=
 arch_timer: cp15 timer(s) running at 24.00MHz (virt).<br>[=C2=A0=C2=A0=C2=
=A0 0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cyc=
les: 0x588fe9dc0, max_idle_ns: 440795202592 ns<br>[=C2=A0=C2=A0=C2=A0 0.000=
007] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511=
097ns<br>[=C2=A0=C2=A0=C2=A0 0.000021] Switching to timer-based delay loop,=
 resolution 41ns<br>[=C2=A0=C2=A0=C2=A0 0.000363] clocksource: timer: mask:=
 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 79635851949 ns<br>[=C2=A0=
=C2=A0=C2=A0 0.000587] clocksource: hstimer: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370868154 ns<br>[=C2=A0=C2=A0=C2=A0 0.000919] Cons=
ole: colour dummy device 80x30<br>[=C2=A0=C2=A0=C2=A0 0.288101] console [hv=
c0] enabled<br>[=C2=A0=C2=A0=C2=A0 0.291596] Calibrating delay loop (skippe=
d), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=3D240000)<=
br>[=C2=A0=C2=A0=C2=A0 0.301983] pid_max: default: 32768 minimum: 301<br>[=
=C2=A0=C2=A0=C2=A0 0.306807] Mount-cache hash table entries: 1024 (order: 0=
, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.313450] Mountpoint-cache hash table =
entries: 1024 (order: 0, 4096 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.321155] CPU: =
Testing write buffer coherency: ok<br>[=C2=A0=C2=A0=C2=A0 0.326523] /cpus/c=
pu@0 missing clock-frequency property<br>[=C2=A0=C2=A0=C2=A0 0.331929] /cpu=
s/cpu@1 missing clock-frequency property<br>[=C2=A0=C2=A0=C2=A0 0.337304] C=
PU0: thread -1, cpu 0, socket 0, mpidr 80000000<br>[=C2=A0=C2=A0=C2=A0 0.34=
4422] xen:grant_table: Grant tables using version 1 layout<br>[=C2=A0=C2=A0=
=C2=A0 0.350544] Grant table initialized<br>[=C2=A0=C2=A0=C2=A0 0.354158] x=
en:events: Using FIFO-based ABI<br>[=C2=A0=C2=A0=C2=A0 0.358487] Xen: initi=
alizing cpu0<br>[=C2=A0=C2=A0=C2=A0 0.362075] Setting up static identity ma=
p for 0x60100000 - 0x60100060<br>[=C2=A0=C2=A0=C2=A0 0.368858] Hierarchical=
 SRCU implementation.<br>[=C2=A0=C2=A0=C2=A0 0.374021] smp: Bringing up sec=
ondary CPUs ...<br>(XEN) d0v1: vGICD: unhandled word write 0xffffffff to IC=
ACTIVER0<br>[=C2=A0=C2=A0=C2=A0 0.385338] Xen: initializing cpu1<br>[=C2=A0=
=C2=A0=C2=A0 0.385427] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001<br>=
[=C2=A0=C2=A0=C2=A0 0.385704] smp: Brought up 1 node, 2 CPUs<br>[=C2=A0=C2=
=A0=C2=A0 0.399002] SMP: Total of 2 processors activated (96.00 BogoMIPS).<=
br>[=C2=A0=C2=A0=C2=A0 0.405260] CPU: All CPU(s) started in SVC mode.<br>[=
=C2=A0=C2=A0=C2=A0 0.410729] devtmpfs: initialized<br>[=C2=A0=C2=A0=C2=A0 0=
.420269] Built 1 zonelists, mobility grouping on.=C2=A0 Total pages: 62371<=
br>[=C2=A0=C2=A0=C2=A0 0.427816] VFP support v0.3: implementor 41 architect=
ure 2 part 30 variant 7 rev 4<br>[=C2=A0=C2=A0=C2=A0 0.435774] clocksource:=
 jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462=
750000 ns<br>[=C2=A0=C2=A0=C2=A0 0.445681] futex hash table entries: 512 (o=
rder: 3, 32768 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.452035] pinctrl core: initia=
lized pinctrl subsystem<br>[=C2=A0=C2=A0=C2=A0 0.458206] NET: Registered pr=
otocol family 16<br>[=C2=A0=C2=A0=C2=A0 0.463723] DMA: preallocated 256 KiB=
 pool for atomic coherent allocations<br>[=C2=A0=C2=A0=C2=A0 0.472429] xen:=
swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB<br>[=
=C2=A0=C2=A0=C2=A0 0.482360] software IO TLB [mem 0x6e000000-0x6e400000] (4=
MB) mapped at [(ptrval)-(ptrval)]<br>[=C2=A0=C2=A0=C2=A0 0.490848] hw-break=
point: Failed to enable monitor mode on CPU 0.<br>[=C2=A0=C2=A0=C2=A0 0.511=
454] xen:balloon: Initialising balloon driver<br>[=C2=A0=C2=A0=C2=A0 0.5181=
36] SCSI subsystem initialized<br>[=C2=A0=C2=A0=C2=A0 0.522612] usbcore: re=
gistered new interface driver usbfs<br>[=C2=A0=C2=A0=C2=A0 0.528158] usbcor=
e: registered new interface driver hub<br>[=C2=A0=C2=A0=C2=A0 0.533651] usb=
core: registered new device driver usb<br>[=C2=A0=C2=A0=C2=A0 0.538971] pps=
_core: LinuxPPS API ver. 1 registered<br>[=C2=A0=C2=A0=C2=A0 0.544017] pps_=
core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti &lt;<a hre=
f=3D"mailto:giometti@linux.it">giometti@linux.it</a>&gt;<br>[=C2=A0=C2=A0=
=C2=A0 0.553197] PTP clock support registered<br>[=C2=A0=C2=A0=C2=A0 0.5574=
13] Advanced Linux Sound Architecture Driver Initialized.<br>[=C2=A0=C2=A0=
=C2=A0 0.564659] clocksource: Switched to clocksource arch_sys_counter<br>[=
=C2=A0=C2=A0=C2=A0 0.579029] OF: /thermal-zones/cpu_thermal/cooling-maps/ma=
p0: could not find phandle<br>[=C2=A0=C2=A0=C2=A0 0.586908] missing cooling=
_device property<br>[=C2=A0=C2=A0=C2=A0 0.591101] failed to build thermal z=
one cpu_thermal: -22<br>[=C2=A0=C2=A0=C2=A0 0.596769] NET: Registered proto=
col family 2<br>[=C2=A0=C2=A0=C2=A0 0.601698] tcp_listen_portaddr_hash hash=
 table entries: 512 (order: 0, 6144 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.609472]=
 TCP established hash table entries: 2048 (order: 1, 8192 bytes)<br>[=C2=A0=
=C2=A0=C2=A0 0.616536] TCP bind hash table entries: 2048 (order: 2, 16384 b=
ytes)<br>[=C2=A0=C2=A0=C2=A0 0.623017] TCP: Hash tables configured (establi=
shed 2048 bind 2048)<br>[=C2=A0=C2=A0=C2=A0 0.629574] UDP hash table entrie=
s: 256 (order: 1, 8192 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.635496] UDP-Lite has=
h table entries: 256 (order: 1, 8192 bytes)<br>[=C2=A0=C2=A0=C2=A0 0.641976=
] NET: Registered protocol family 1<br>[=C2=A0=C2=A0=C2=A0 0.647420] RPC: R=
egistered named UNIX socket transport module.<br>[=C2=A0=C2=A0=C2=A0 0.6533=
56] RPC: Registered udp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.658210] =
RPC: Registered tcp transport module.<br>[=C2=A0=C2=A0=C2=A0 0.662918] RPC:=
 Registered tcp NFSv4.1 backchannel transport module.<br>[=C2=A0=C2=A0=C2=
=A0 0.671474] workingset: timestamp_bits=3D30 max_order=3D16 bucket_order=
=3D0<br>[=C2=A0=C2=A0=C2=A0 0.685118] NFS: Registering the id_resolver key =
type<br>[=C2=A0=C2=A0=C2=A0 0.690225] Key type id_resolver registered<br>[=
=C2=A0=C2=A0=C2=A0 0.694440] Key type id_legacy registered<br>[=C2=A0=C2=A0=
=C2=A0 0.701273] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 248)<br>[=C2=A0=C2=A0=C2=A0 0.708770] io scheduler noop registered<br=
>[=C2=A0=C2=A0=C2=A0 0.712700] io scheduler deadline registered<br>[=C2=A0=
=C2=A0=C2=A0 0.717334] io scheduler cfq registered (default)<br>[=C2=A0=C2=
=A0=C2=A0 0.722077] io scheduler mq-deadline registered<br>[=C2=A0=C2=A0=C2=
=A0 0.726696] io scheduler kyber registered<br>[=C2=A0=C2=A0=C2=A0 0.731450=
] sun4i-usb-phy 1c13400.phy: could not find pctldev for node /soc@1c00000/p=
inctrl@1c20800/usb0_id_detect_pin@0, deferring probe<br>[=C2=A0=C2=A0=C2=A0=
 0.747298] sun4i-pinctrl 1c20800.pinctrl: initialized sunXi PIO driver<br>[=
=C2=A0=C2=A0=C2=A0 0.763143] xen:xen_evtchn: Event-channel device installed=
<br>[=C2=A0=C2=A0=C2=A0 0.818679] Serial: 8250/16550 driver, 8 ports, IRQ s=
haring disabled<br>[=C2=A0=C2=A0=C2=A0 0.830086] sun4i-backend 1e60000.disp=
lay-backend: Couldn&#39;t find matching frontend, frontend features disable=
d<br>[=C2=A0=C2=A0=C2=A0 0.840566] sun4i-drm display-engine: bound 1e60000.=
display-backend (ops 0xc0748f94)<br>[=C2=A0=C2=A0=C2=A0 0.848402] sun4i-bac=
kend 1e40000.display-backend: Couldn&#39;t find matching frontend, frontend=
 features disabled<br>[=C2=A0=C2=A0=C2=A0 0.858694] sun4i-drm display-engin=
e: bound 1e40000.display-backend (ops 0xc0748f94)<br>[=C2=A0=C2=A0=C2=A0 0.=
866884] sun4i-drm display-engine: No panel or bridge found... RGB output di=
sabled<br>[=C2=A0=C2=A0=C2=A0 0.874814] sun4i-drm display-engine: bound 1c0=
c000.lcd-controller (ops 0xc0747f24)<br>[=C2=A0=C2=A0=C2=A0 0.882853] sun4i=
-drm display-engine: No panel or bridge found... RGB output disabled<br>[=
=C2=A0=C2=A0=C2=A0 0.890743] sun4i-drm display-engine: bound 1c0d000.lcd-co=
ntroller (ops 0xc0747f24)<br>[=C2=A0=C2=A0=C2=A0 0.898849] sun4i-drm displa=
y-engine: bound 1c16000.hdmi (ops 0xc0749998)<br>[=C2=A0=C2=A0=C2=A0 0.9057=
47] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).<br>[=C2=A0=
=C2=A0=C2=A0 0.912374] [drm] No driver support for vblank timestamp query.<=
br>[=C2=A0=C2=A0=C2=A0 1.418423] [drm] Cannot find any crtc or sizes<br>[=
=C2=A0=C2=A0=C2=A0 1.423838] [drm] Initialized sun4i-drm 1.0.0 20150629 for=
 display-engine on minor 0<br>[=C2=A0=C2=A0=C2=A0 1.432355] Invalid max_que=
ues (4), will use default max: 2.<br>[=C2=A0=C2=A0=C2=A0 1.439357] libphy: =
Fixed MDIO Bus: probed<br>[=C2=A0=C2=A0=C2=A0 1.443479] CAN device driver i=
nterface<br>[=C2=A0=C2=A0=C2=A0 1.448069] sun7i-dwmac 1c50000.ethernet: PTP=
 uses main clock<br>[=C2=A0=C2=A0=C2=A0 1.453837] sun7i-dwmac 1c50000.ether=
net: no reset control found<br>[=C2=A0=C2=A0=C2=A0 1.459957] sun7i-dwmac 1c=
50000.ethernet: no regulator found<br>[=C2=A0=C2=A0=C2=A0 1.466042] sun7i-d=
wmac 1c50000.ethernet: Ring mode enabled<br>[=C2=A0=C2=A0=C2=A0 1.471652] s=
un7i-dwmac 1c50000.ethernet: DMA HW capability register supported<br>[=C2=
=A0=C2=A0=C2=A0 1.478929] sun7i-dwmac 1c50000.ethernet: Normal descriptors<=
br>[=C2=A0=C2=A0=C2=A0 1.494720] libphy: stmmac: probed<br>[=C2=A0=C2=A0=C2=
=A0 1.498149] mdio_bus stmmac-0:01: attached PHY driver [unbound] (mii_bus:=
phy_addr=3Dstmmac-0:01, irq=3DPOLL)<br>[=C2=A0=C2=A0=C2=A0 1.508780] xen_ne=
tfront: Initialising Xen virtual ethernet driver<br>[=C2=A0=C2=A0=C2=A0 1.5=
15120] ehci_hcd: USB 2.0 &#39;Enhanced&#39; Host Controller (EHCI) Driver<b=
r>[=C2=A0=C2=A0=C2=A0 1.521652] ehci-platform: EHCI generic platform driver=
<br>[=C2=A0=C2=A0=C2=A0 1.527443] ohci_hcd: USB 1.1 &#39;Open&#39; Host Con=
troller (OHCI) Driver<br>[=C2=A0=C2=A0=C2=A0 1.533705] ohci-platform: OHCI =
generic platform driver<br>[=C2=A0=C2=A0=C2=A0 1.541166] sunxi-rtc 1c20d00.=
rtc: rtc core: registered rtc-sunxi as rtc0<br>[=C2=A0=C2=A0=C2=A0 1.548026=
] sunxi-rtc 1c20d00.rtc: RTC enabled<br>[=C2=A0=C2=A0=C2=A0 1.552620] i2c /=
dev entries driver<br>[=C2=A0=C2=A0=C2=A0 1.557597] axp20x-i2c 1-0034: AXP2=
0x variant AXP209 found<br>[=C2=A0=C2=A0=C2=A0 1.582423] input: axp20x-pek =
as /devices/platform/soc@1c00000/1c2ac00.i2c/i2c-1/1-0034/axp20x-pek/input/=
input0<br>[=C2=A0=C2=A0=C2=A0 1.593816] ldo1: supplied by regulator-dummy<b=
r>[=C2=A0=C2=A0=C2=A0 1.598547] ldo2: supplied by regulator-dummy<br>[=C2=
=A0=C2=A0=C2=A0 1.604304] ldo3: supplied by regulator-dummy<br>[=C2=A0=C2=
=A0=C2=A0 1.609551] ldo4: supplied by regulator-dummy<br>[=C2=A0=C2=A0=C2=
=A0 1.614120] ldo5: supplied by regulator-dummy<br>[=C2=A0=C2=A0=C2=A0 1.61=
9921] dcdc2: supplied by regulator-dummy<br>[=C2=A0=C2=A0=C2=A0 1.625276] d=
cdc3: supplied by regulator-dummy<br>[=C2=A0=C2=A0=C2=A0 1.631568] axp20x-i=
2c 1-0034: AXP20X driver loaded<br>[=C2=A0=C2=A0=C2=A0 1.638062] Registered=
 IR keymap rc-empty<br>[=C2=A0=C2=A0=C2=A0 1.642244] rc rc0: sunxi-ir as /d=
evices/platform/soc@1c00000/<a href=3D"http://1c21800.ir/rc/rc0">1c21800.ir=
/rc/rc0</a><br>[=C2=A0=C2=A0=C2=A0 1.649831] input: sunxi-ir as /devices/pl=
atform/soc@1c00000/<a href=3D"http://1c21800.ir/rc/rc0/input1">1c21800.ir/r=
c/rc0/input1</a><br>[=C2=A0=C2=A0=C2=A0 1.658402] sunxi-ir <a href=3D"http:=
//1c21800.ir">1c21800.ir</a>: initialized sunXi IR driver<br>[=C2=A0=C2=A0=
=C2=A0 1.665721] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=3D16=
 sec, nowayout=3D0)<br>[=C2=A0=C2=A0=C2=A0 1.674051] cpu cpu0: failed to ge=
t clock: -2<br>[=C2=A0=C2=A0=C2=A0 1.678510] cpufreq-dt: probe of cpufreq-d=
t failed with error -2<br>[=C2=A0=C2=A0=C2=A0 1.686126] sunxi-mmc 1c0f000.m=
mc: Got CD GPIO<br>[=C2=A0=C2=A0=C2=A0 1.714999] sunxi-mmc 1c0f000.mmc: bas=
e:0x(ptrval) irq:27<br>[=C2=A0=C2=A0=C2=A0 1.721679] sun4i-ss 1c15000.crypt=
o-engine: Die ID 0<br>[=C2=A0=C2=A0=C2=A0 1.728729] usbcore: registered new=
 interface driver usbhid<br>[=C2=A0=C2=A0=C2=A0 1.734324] usbhid: USB HID c=
ore driver<br>[=C2=A0=C2=A0=C2=A0 1.743178] sun4i-codec 1c22c00.codec: ASoC=
: Failed to create component debugfs directory<br>[=C2=A0=C2=A0=C2=A0 1.753=
930] sun4i-codec 1c22c00.codec: Codec &lt;-&gt; 1c22c00.codec mapping ok<br=
>[=C2=A0=C2=A0=C2=A0 1.762798] NET: Registered protocol family 17<br>[=C2=
=A0=C2=A0=C2=A0 1.767356] can: controller area network core (rev 20170425 a=
bi 9)<br>[=C2=A0=C2=A0=C2=A0 1.773642] NET: Registered protocol family 29<b=
r>[=C2=A0=C2=A0=C2=A0 1.778191] can: raw protocol (rev 20170425)<br>[=C2=A0=
=C2=A0=C2=A0 1.782466] can: broadcast manager protocol (rev 20170425 t)<br>=
[=C2=A0=C2=A0=C2=A0 1.788241] can: netlink gateway (rev 20170425) max_hops=
=3D1<br>[=C2=A0=C2=A0=C2=A0 1.793991] Key type dns_resolver registered<br>[=
=C2=A0=C2=A0=C2=A0 1.798438] Registering SWP/SWPB emulation handler<br>[=C2=
=A0=C2=A0=C2=A0 1.804279] random: fast init done<br>[=C2=A0=C2=A0=C2=A0 1.8=
59746] mmc0: host does not support reading read-only switch, assuming write=
-enable<br>[=C2=A0=C2=A0=C2=A0 1.874042] mmc0: new high speed SDHC card at =
address aaaa<br>[=C2=A0=C2=A0=C2=A0 1.880897] mmcblk0: mmc0:aaaa SS16G 14.8=
 GiB <br>[=C2=A0=C2=A0=C2=A0 1.891605]=C2=A0 mmcblk0: p1 p2<br>[=C2=A0=C2=
=A0=C2=A0 1.924710] ahci-sunxi 1c18000.sata: controller can&#39;t do PMP, t=
urning off CAP_PMP<br>[=C2=A0=C2=A0=C2=A0 1.932248] ahci-sunxi 1c18000.sata=
: SSS flag set, parallel bus scan disabled<br>[=C2=A0=C2=A0=C2=A0 1.939478]=
 ahci-sunxi 1c18000.sata: AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl p=
latform mode<br>[=C2=A0=C2=A0=C2=A0 1.948464] ahci-sunxi 1c18000.sata: flag=
s: ncq sntf stag pm led clo only pio slum part ccc <br>[=C2=A0=C2=A0=C2=A0 =
1.958331] scsi host0: ahci-sunxi<br>[=C2=A0=C2=A0=C2=A0 1.962147] ata1: SAT=
A max UDMA/133 mmio [mem 0x01c18000-0x01c18fff] port 0x100 irq 33<br>[=C2=
=A0=C2=A0=C2=A0 1.970760] ehci-platform 1c14000.usb: EHCI Host Controller<b=
r>[=C2=A0=C2=A0=C2=A0 1.976458] ehci-platform 1c14000.usb: new USB bus regi=
stered, assigned bus number 1<br>[=C2=A0=C2=A0=C2=A0 1.984532] ehci-platfor=
m 1c14000.usb: irq 29, io mem 0x01c14000<br>[=C2=A0=C2=A0=C2=A0 2.014698] e=
hci-platform 1c14000.usb: USB 2.0 started, EHCI 1.00<br>[=C2=A0=C2=A0=C2=A0=
 2.021857] hub 1-0:1.0: USB hub found<br>[=C2=A0=C2=A0=C2=A0 2.025702] hub =
1-0:1.0: 1 port detected<br>[=C2=A0=C2=A0=C2=A0 2.030547] ehci-platform 1c1=
c000.usb: EHCI Host Controller<br>[=C2=A0=C2=A0=C2=A0 2.036234] ehci-platfo=
rm 1c1c000.usb: new USB bus registered, assigned bus number 2<br>[=C2=A0=C2=
=A0=C2=A0 2.044307] ehci-platform 1c1c000.usb: irq 34, io mem 0x01c1c000<br=
>[=C2=A0=C2=A0=C2=A0 2.074667] ehci-platform 1c1c000.usb: USB 2.0 started, =
EHCI 1.00<br>[=C2=A0=C2=A0=C2=A0 2.081787] hub 2-0:1.0: USB hub found<br>[=
=C2=A0=C2=A0=C2=A0 2.085639] hub 2-0:1.0: 1 port detected<br>[=C2=A0=C2=A0=
=C2=A0 2.090439] ohci-platform 1c14400.usb: Generic Platform OHCI controlle=
r<br>[=C2=A0=C2=A0=C2=A0 2.097158] ohci-platform 1c14400.usb: new USB bus r=
egistered, assigned bus number 3<br>[=C2=A0=C2=A0=C2=A0 2.105231] ohci-plat=
form 1c14400.usb: irq 30, io mem 0x01c14400<br>[=C2=A0=C2=A0=C2=A0 2.179624=
] hub 3-0:1.0: USB hub found<br>[=C2=A0=C2=A0=C2=A0 2.183442] hub 3-0:1.0: =
1 port detected<br>[=C2=A0=C2=A0=C2=A0 2.188291] ohci-platform 1c1c400.usb:=
 Generic Platform OHCI controller<br>[=C2=A0=C2=A0=C2=A0 2.195033] ohci-pla=
tform 1c1c400.usb: new USB bus registered, assigned bus number 4<br>[=C2=A0=
=C2=A0=C2=A0 2.203132] ohci-platform 1c1c400.usb: irq 35, io mem 0x01c1c400=
<br>[=C2=A0=C2=A0=C2=A0 2.279656] hub 4-0:1.0: USB hub found<br>[=C2=A0=C2=
=A0=C2=A0 2.283474] hub 4-0:1.0: 1 port detected<br>[=C2=A0=C2=A0=C2=A0 2.2=
88374] usb_phy_generic usb_phy_generic.0.auto: usb_phy_generic.0.auto suppl=
y vcc not found, using dummy regulator<br>[=C2=A0=C2=A0=C2=A0 2.297035] ata=
1: SATA link down (SStatus 0 SControl 300)<br>[=C2=A0=C2=A0=C2=A0 2.299725]=
 musb-hdrc musb-hdrc.1.auto: MUSB HDRC host driver<br>[=C2=A0=C2=A0=C2=A0 2=
.310399] musb-hdrc musb-hdrc.1.auto: new USB bus registered, assigned bus n=
umber 5<br>[=C2=A0=C2=A0=C2=A0 2.319258] hub 5-0:1.0: USB hub found<br>[=C2=
=A0=C2=A0=C2=A0 2.323068] hub 5-0:1.0: 1 port detected<br>[=C2=A0=C2=A0=C2=
=A0 2.339055] sunxi-rtc 1c20d00.rtc: setting system clock to 2018-04-30 05:=
37:21 UTC (1525066641)<br>[=C2=A0=C2=A0=C2=A0 2.347999] clk: Not disabling =
unused clocks<br>[=C2=A0=C2=A0=C2=A0 2.352298] vcc3v0: disabling<br>[=C2=A0=
=C2=A0=C2=A0 2.355339] vcc5v0: disabling<br>[=C2=A0=C2=A0=C2=A0 2.358364] A=
LSA device list:<br>[=C2=A0=C2=A0=C2=A0 2.361380]=C2=A0=C2=A0 #0: sun4i-cod=
ec<br>[=C2=A0=C2=A0=C2=A0 2.444375] EXT4-fs (mmcblk0p2): recovery complete<=
br>[=C2=A0=C2=A0=C2=A0 2.450240] EXT4-fs (mmcblk0p2): mounted filesystem wi=
th ordered data mode. Opts: (null)<br>[=C2=A0=C2=A0=C2=A0 2.458430] VFS: Mo=
unted root (ext4 filesystem) on device 179:2.<br>[=C2=A0=C2=A0=C2=A0 2.4752=
17] devtmpfs: mounted<br>[=C2=A0=C2=A0=C2=A0 2.480063] Freeing unused kerne=
l memory: 1024K<br>[=C2=A0=C2=A0=C2=A0 3.494805] [drm] Cannot find any crtc=
 or sizes<br>INIT: version 2.88 booting<br>[info] Using makefile-style conc=
urrent boot in runlevel S.<br>[....] Starting the hotplug events dispatcher=
: udevd[=C2=A0=C2=A0=C2=A0 4.321664] udevd[184]: starting version 175<br>. =
ok <br>[....] Synthesizing the initial hotplug events...done.<br>[....] Wai=
ting for /dev to be fully populated...done.<br>[....] Setting preliminary k=
eymap...done.<br>[....] Activating swap...done.<br>[=C2=A0=C2=A0=C2=A0 7.11=
8505] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)<br>[....] Cleaning up t=
emporary files... /tmp. ok <br>[....] Activating lvm and md swap...done.<br=
>[....] Checking file systems...fsck from util-linux 2.20.1<br>done.<br>[..=
..] Mounting local filesystems...done.<br>[....] Activating swapfile swap..=
.done.<br>[....] Cleaning up temporary files.... ok <br>[....] Setting kern=
el variables ...done.<br>[....] Setting up resolvconf.../etc/resolvconf/upd=
ate.d/libc: Warning: /etc/resolv.conf is not a symbolic link to /etc/resolv=
conf/run/<a href=3D"http://resolv.cf">resolv.cf</a><br>done.<br>[=C2=A0=C2=
=A0 10.616291] random: dd: uninitialized urandom read (512 bytes read)<br>[=
....] Configuring network interfaces...Internet Systems Consortium DHCP Cli=
ent 4.2.2<br>Copyright 2004-2011 Internet Systems Consortium.<br>All rights=
 reserved.<br>For info, please visit <a href=3D"https://www.isc.org/softwar=
e/dhcp/">https://www.isc.org/software/dhcp/</a><br><br>[=C2=A0=C2=A0 11.077=
914] Generic PHY stmmac-0:01: attached PHY driver [Generic PHY] (mii_bus:ph=
y_addr=3Dstmmac-0:01, irq=3DPOLL)<br>[=C2=A0=C2=A0 11.091988] sun7i-dwmac 1=
c50000.ethernet eth0: RX IPC Checksum Offload disabled<br>[=C2=A0=C2=A0 11.=
099411] sun7i-dwmac 1c50000.ethernet eth0: No MAC Management Counters avail=
able<br>[=C2=A0=C2=A0 11.107103] sun7i-dwmac 1c50000.ethernet eth0: PTP not=
 supported by HW<br>Listening on LPF/eth0/02:0f:06:c3:45:7c<br>Sending on=
=C2=A0=C2=A0 LPF/eth0/02:0f:06:c3:45:7c<br>Sending on=C2=A0=C2=A0 Socket/fa=
llback<br>DHCPREQUEST on eth0 to 255.255.255.255 port 67<br>[=C2=A0=C2=A0 1=
2.175471] sun7i-dwmac 1c50000.ethernet eth0: Link is Up - 100Mbps/Full - fl=
ow control rx/tx<br>DHCPREQUEST on eth0 to 255.255.255.255 port 67<br>DHCPA=
CK from 10.20.50.50<br>/etc/resolvconf/update.d/libc: Warning: /etc/resolv.=
conf is not a symbolic link to /etc/resolvconf/run/resolv.conf<br>bound to =
10.20.55.141 -- renewal in 248256 seconds.<br>done.<br>[....] Cleaning up t=
emporary files.... ok <br>[info] Setting console screen modes.<br>setterm: =
cannot (un)set powersave mode: Inappropriate ioctl for device<br>[info] Ski=
pping font and keymap setup (handled by console-setup).<br>[....] Setting u=
p console font and keymap...done.<br>[....] Setting up X socket directories=
... /tmp/.X11-unix /tmp/.ICE-unix. ok <br>INIT: Entering runlevel: 2<br>[in=
fo] Using makefile-style concurrent boot in runlevel 2.<br>[....] Starting =
enhanced syslogd: rsyslogd. ok <br>[=C2=A0=C2=A0 21.960384] random: dbus-da=
emon: uninitialized urandom read (12 bytes read)<br>[=C2=A0=C2=A0 21.996335=
] random: dbus-daemon: uninitialized urandom read (12 bytes read)<br>[=C2=
=A0=C2=A0 22.038283] random: sshd: uninitialized urandom read (32 bytes rea=
d)<br>[....] Starting periodic command scheduler: cron. ok <br>[....] Start=
ing system message bus: dbus. ok <br>[....] Starting OpenBSD Secure Shell s=
erver: sshd. ok <br>#######################################################=
######################<br><br><br></div>c)<br></div>After I ssh into the ma=
chine, following just hangs (without returning to prompt) :<br><br>debian@d=
ebian-armhf:~$ sudo xl list<br>Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs=C2=
=A0=C2=A0=C2=A0 State=C2=A0=C2=A0=C2=A0 Time(s)<br><br></div><br></div>Now =
what am I missing?<br></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On Sun, Apr 29, 2018 at 11:30 AM, Ajay Garg <span dir=3D"ltr">&l=
t;<a href=3D"mailto:ajaygargnsit@gmail.com" target=3D"_blank">ajaygargnsit@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div><div><div><div>I changed the /chosen node in the dts file to =
<br><br>##############################<wbr>#########<br>=C2=A0=C2=A0=C2=A0 =
chosen {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stdout-path =3D &quo=
t;serial0:115200n8&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen=
,xen-bootargs =3D &quot;dom0_mem=3D752M console=3Ddtuart dtuart=3Dserial0 d=
om0_max_vcpus=3D4&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen,=
dom0-bootargs =3D &quot;console=3DttyS0,115200 rw root=3D/dev/mmcblk0p2 ign=
ore_loglevel cma=3D128M&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 modules {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 #address-cells =3D &lt;2&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D &lt;2&gt;;<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module@1 {<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 compatible =3D &quot;xen,linux-zimage&quot;, &quot;xen,mult=
iboot-module&quot;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x0 0x7a000000 0x0 0x02=
000000&gt;;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 };<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>=C2=A0=C2=A0=
=C2=A0 };<br>##############################<wbr>#########<br><br></div><br>=
<br></div>Also, the xen-related features in the kernel are as follows (crea=
ted by default after selecting &quot;Kernel features =3D&gt; Xen guest supp=
ort on ARM&quot; in menuconfig) :<br><br>##############################<wbr=
>#########<br>=C2=A0 CONFIG_XEN_DOM0=3Dy<br>=C2=A0 CONFIG_XEN=3Dy<br>=C2=A0=
 CONFIG_XEN_BLKDEV_FRONTEND=3Dy<br>=C2=A0 CONFIG_XEN_NETDEV_FRONTEND=3Dy<br=
>=C2=A0 CONFIG_INPUT_XEN_KBDDEV_<wbr>FRONTEND=3Dy<br>=C2=A0 CONFIG_HVC_XEN=
=3Dy<br>=C2=A0 CONFIG_HVC_XEN_FRONTEND=3Dy<br>=C2=A0 CONFIG_XEN_FBDEV_FRONT=
END=3Dy<br>=C2=A0 CONFIG_XEN_BALLOON=3Dy<br>=C2=A0 CONFIG_XEN_SCRUB_PAGES=
=3Dy<br>=C2=A0 CONFIG_XEN_DEV_EVTCHN=3Dy<br>=C2=A0 CONFIG_XEN_BACKEND=3Dy<b=
r>=C2=A0 CONFIG_XENFS=3Dy<br>=C2=A0 CONFIG_XEN_COMPAT_XENFS=3Dy<br>=C2=A0 C=
ONFIG_XEN_SYS_HYPERVISOR=3Dy<br>=C2=A0 CONFIG_XEN_XENBUS_FRONTEND=3Dy<br>=
=C2=A0 CONFIG_XEN_GNTDEV=3Dm<br>=C2=A0 CONFIG_XEN_GRANT_DEV_ALLOC=3Dm<br>=
=C2=A0 CONFIG_SWIOTLB_XEN=3Dy<br>=C2=A0 CONFIG_XEN_PRIVCMD=3Dy<br>=C2=A0 CO=
NFIG_XEN_AUTO_XLATE=3Dy<br><br><br>=C2=A0 # CONFIG_XEN_BLKDEV_BACKEND is no=
t set<br>=C2=A0 # CONFIG_XEN_SCSI_FRONTEND is not set<br>=C2=A0 # CONFIG_XE=
N_NETDEV_BACKEND is not set<br>=C2=A0 # CONFIG_XEN_WDT is not set<br>=C2=A0=
 # CONFIG_XEN_PVCALLS_FRONTEND is not set<br>=C2=A0 # CONFIG_XEN_PVCALLS_BA=
CKEND is not set<br>##############################<wbr>#########<br><br></d=
iv>However, I see absolutely no change in the observations; no xen-related =
log on the serial-console, and &quot;sudo xl list&quot; gives the same erro=
r messages.<br><br></div>What am I lacking?<br><div><div><br></div></div></=
div><div class=3D"gmail_extra"><div><div class=3D"h5"><br><div class=3D"gma=
il_quote">On Sat, Apr 28, 2018 at 11:06 PM, Andrew Cooper <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.=
cooper3@citrix.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"m_1443443550=
76638951h5">
    <div class=3D"m_144344355076638951m_-8566150150470179879moz-cite-prefix=
">On 28/04/18 18:34, Ajay Garg wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Hi Andrew.<br>
          <br>
        </div>
        Thanks for the reply.<br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Sat, Apr 28, 2018 at 10:57 PM,
            Andrew Cooper <span dir=3D"ltr">&lt;<a href=3D"mailto:andrew.co=
oper3@citrix.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;</span=
>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              <div bgcolor=3D"#FFFFFF"><span class=3D"m_144344355076638951m=
_-8566150150470179879gmail-">
                  <div class=3D"m_144344355076638951m_-8566150150470179879g=
mail-m_-4521707927368275737moz-cite-prefix">On
                    28/04/18 18:12, Ajay Garg wrote:<br>
                  </div>
                </span>
                <blockquote type=3D"cite">
                  <div dir=3D"ltr">
                    <div><span class=3D"m_144344355076638951m_-856615015047=
0179879gmail-">Hi All.<br>
                        <br>
                        We have brought up the cubieboard2 from almost
                        scratch, following are the steps done :<br>
                        <br>
                      </span> &lt;snip&gt;</div>
                    <span class=3D"m_144344355076638951m_-85661501504701798=
79gmail-">
                      <div><br>
                        =3D=3D getting xen ready =3D=3D<br>
                        <br>
                      </div>
                      <div>i)<br>
                      </div>
                      <div>Compiled xen on cubieboard itself, via :<br>
                        <br>
                        =C2=A0=C2=A0 * git clone git://<a href=3D"http://xe=
nbits.xen.org/xen.git" target=3D"_blank">xenbits.xen.org/xen.git</a><br>
                        =C2=A0=C2=A0 * cd xen<br>
                        .=C2=A0 * ./configure --libdir=3D/usr/lib<br>
                        =C2=A0=C2=A0 * make debball CONFIG_EARLY_PRINTK=3Ds=
un7i -j4<br>
                      </div>
                      <div>=C2=A0=C2=A0 * sudo dpkg -i dist/xen-upstream-4.=
11-unstabl<wbr>e.deb<br>
                      </div>
                      <div>=C2=A0=C2=A0 * sudo reboot<br>
                        <br>
                      </div>
                      <div>ii)<br>
                      </div>
                      <div>Upon reboot, &quot;sudo xl list&quot; gives foll=
owing :<br>
                        <br>
                        ##############################<wbr>################=
##############<wbr>######<br>
                        debian@debian-armhf:~$ sudo=C2=A0 xl list<br>
                        [sudo] password for debian:<br>
                        xencall: error: Could not obtain handle on
                        privileged command interface: No such file or
                        directory<br>
                        libxl: error: libxl.c:102:libxl_ctx_alloc:
                        cannot open libxc handle: No such file or
                        directory<br>
                        cannot init xl context<br>
                        ##############################<wbr>################=
##############<wbr>######<br>
                      </div>
                    </span></div>
                </blockquote>
                <br>
                This means that /dev/xen/privcmd (or the legacy
                /proc/xen/privcmd) device isn&#39;t available.<br>
                <br>
                First check that you have actually booted Xen with Linux
                as dom0.=C2=A0 You don&#39;t show any logs in this final se=
ction,
                and simply installing the debball and rebooting won&#39;t
                typically cause Xen to be the head of the boot list.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>Yes, I haven&#39;t been able to setup xen bootup.<br>
              <br>
            </div>
            <div>That&#39;s why, requested help regarding the changes that
              are required in <a href=3D"https://github.com/torvalds/linux/=
blob/master/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts" target=3D"_blank">=
https://github.com/torvalds/li<wbr>nux/blob/master/arch/arm/boot/<wbr>dts/s=
un7i-a20-cubieboard2.dts</a>,
              that would cause dom0 to boot up.<br>
              <br>
              <br>
            </div>
            <div>Sorry for the confusion.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div></div>
    Ah - sorry.=C2=A0 I misunderstood.=C2=A0 I&#39;m afraid you&#39;re goin=
g to have to
    wait for some people more knowledge about ARM to answer.<span class=3D"=
m_144344355076638951HOEnZb"><font color=3D"#888888"><br>
    <br>
    ~Andrew
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><br></div></div><span class=3D"HOE=
nZb"><font color=3D"#888888">-- <br><div class=3D"m_144344355076638951gmail=
_signature" data-smartmail=3D"gmail_signature">Regards,<br>Ajay<br></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Regards,<br>Ajay<br></div>
</div>

--0000000000005aaa40056b0a4fac--


--===============6892920335055954393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6892920335055954393==--
