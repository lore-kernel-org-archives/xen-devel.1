From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: sidecar (hvm shim) creation script
Date: Wed, 10 Jan 2018 18:07:34 +0100
Message-ID: <1515604054.13211.13.camel@suse.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
 <23126.13380.315656.733601@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7039822355073477609=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q/bw=ef=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eZMIz-0000wv-Sl
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 19:44:57 +0000
In-Reply-To: <23126.13380.315656.733601@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============7039822355073477609==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-F19nmnwvyUDMHPNx6ebS"


--=-F19nmnwvyUDMHPNx6ebS
Content-Type: multipart/mixed; boundary="=-ZgeIEQN3MFiQk8qeJ5wT"


--=-ZgeIEQN3MFiQk8qeJ5wT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-01-10 at 15:41 +0000, Ian Jackson wrote:
> Ian Jackson writes ("Re: sidecar (hvm shim) creation script"):
> > And here is one which handles the guest console correctly.  Vixen
> > sends the L2 guest console to the emulated serial, along with the
> > shim's own output.
>=20
So, I've got a PV guest that works.

Now I shut it down, run this script, and do `xl create -c' on the
resulting config file, but it dies. :-(

I'm using what's in this branch https://github.com/aliguori/xen/tree/vi
xen-upstream-v2 both as the host hypervisor and as the shim.

So, here's what I see on what I think is vixen's console:

error: Can't get controller info..
 __  __            _  _    _ _                    _        _     _     =20
 \ \/ /___ _ __   | || |  / / |   _   _ _ __  ___| |_ __ _| |__ | | ___=20
  \  // _ \ '_ \  | || |_ | | |__| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
  /  \  __/ | | | |__   _|| | |__| |_| | | | \__ \ || (_| | |_) | |  __/
 /_/\_\___|_| |_|    |_|(_)_|_|   \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
                                                                       =20
(XEN) Xen version 4.11-unstable (dario@fritz.box) (gcc (Debian 7.2.0-19) 7.=
2.0) debug=3Dy  Wed Jan 10 13:28:20 UTC 2018
(XEN) Latest ChangeSet: Wed Dec 20 11:09:09 2017 +0000 git:d80556acd4
(XEN) Bootloader: GRUB 2.02-2
(XEN) Command line: placeholder console=3Dcom1 com1=3D115200n1
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  No VGA detected
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 0 EDD information structures
(XEN) Vixen running under Xen 4.11
(XEN) Xen-e820 RAM map:
(XEN)  0000000000000000 - 000000000009fc00 (usable)
(XEN)  000000000009fc00 - 00000000000a0000 (reserved)
(XEN)  00000000000f0000 - 0000000000100000 (reserved)
(XEN)  0000000000100000 - 000000007f7ff000 (usable)
(XEN)  000000007f7ff000 - 000000007f800000 (reserved)
(XEN)  00000000fc000000 - 00000000feff0000 (reserved)
(XEN)  00000000feff0000 - 0000000100000000 (usable)



While this is L0's console:

(XEN) [  298.886732] grant_table.c:1681:d0v2 Expanding d2 grant table from =
0 to 1 frames
(XEN) [  299.087102] HVM2 save: CPU
(XEN) [  299.087105] HVM2 save: PIC
(XEN) [  299.087108] HVM2 save: IOAPIC
(XEN) [  299.087111] HVM2 save: LAPIC
(XEN) [  299.087113] HVM2 save: LAPIC_REGS
(XEN) [  299.087117] HVM2 save: PCI_IRQ
(XEN) [  299.087119] HVM2 save: ISA_IRQ
(XEN) [  299.087121] HVM2 save: PCI_LINK
(XEN) [  299.087123] HVM2 save: PIT
(XEN) [  299.087125] HVM2 save: RTC
(XEN) [  299.087128] HVM2 save: HPET
(XEN) [  299.087131] HVM2 save: PMTIMER
(XEN) [  299.087133] HVM2 save: MTRR
(XEN) [  299.087141] HVM2 save: VIRIDIAN_DOMAIN
(XEN) [  299.087143] HVM2 save: CPU_XSAVE
(XEN) [  299.087149] HVM2 save: VIRIDIAN_VCPU
(XEN) [  299.087151] HVM2 save: VMCE_VCPU
(XEN) [  299.087153] HVM2 save: TSC_ADJUST
(XEN) [  299.087155] HVM2 save: CPU_MSR
(XEN) [  299.087195] HVM2 restore: CPU 0
[  293.712868] tun: Universal TUN/TAP device driver, 1.6^M
[  293.940987] xenbr0: port 2(vif2.0) entered blocking state^M
[  293.941014] xenbr0: port 2(vif2.0) entered disabled state^M
[  293.941111] device vif2.0 entered promiscuous mode^M
[  293.946041] IPv6: ADDRCONF(NETDEV_UP): vif2.0: link is not ready^M
[  294.139158] xenbr0: port 3(vif2.0-emu) entered blocking state^M
[  294.139202] xenbr0: port 3(vif2.0-emu) entered disabled state^M
[  294.139261] device vif2.0-emu entered promiscuous mode^M
[  294.144532] xenbr0: port 3(vif2.0-emu) entered blocking state^M
[  294.144544] xenbr0: port 3(vif2.0-emu) entered listening state^M
(d2) [  300.952702] HVM Loader
(d2) [  300.952773] Detected Xen v4.11-unstable
(d2) [  300.952850] Xenbus rings @0xfeffc000, event channel 1
(d2) [  300.953103] System requested SeaBIOS
(d2) [  300.953139] CPU speed is 2394 MHz
(d2) [  300.953491] Relocating guest memory for lowmem MMIO space disabled
(XEN) [  300.954017] irq.c:334: Dom2 PCI link 0 changed 0 -> 5
(d2) [  300.954246] PCI-ISA link 0 routed to IRQ5
(XEN) [  300.954423] irq.c:334: Dom2 PCI link 1 changed 0 -> 10
(d2) [  300.954633] PCI-ISA link 1 routed to IRQ10
(XEN) [  300.954794] irq.c:334: Dom2 PCI link 2 changed 0 -> 11
(d2) [  300.954999] PCI-ISA link 2 routed to IRQ11
(XEN) [  300.955233] irq.c:334: Dom2 PCI link 3 changed 0 -> 5
(d2) [  300.955415] PCI-ISA link 3 routed to IRQ5
(d2) [  300.971627] pci dev 01:3 INTA->IRQ10
(d2) [  300.975567] pci dev 02:0 INTA->IRQ11
(d2) [  300.997380] No RAM in high memory; setting high_mem resource base t=
o 100000000
(d2) [  300.997576] pci dev 02:0 bar 14 size 001000000: 0f0000008
(d2) [  300.998673] pci dev 02:0 bar 10 size 000000100: 00000c001
(d2) [  300.999767] pci dev 01:1 bar 20 size 000000010: 00000c101
(d2) [  301.000817] Multiprocessor initialisation:
(d2) [  301.000951]  - CPU0 ... 40-bit phys ... fixed MTRRs ... var MTRRs [=
1/8] ... done.
(d2) [  301.001249]  - CPU1 ... 40-bit phys ... fixed MTRRs ... var MTRRs [=
1/8] ... done.
(d2) [  301.001562]  - CPU2 ... 40-bit phys ... fixed MTRRs ... var MTRRs [=
1/8] ... done.
(d2) [  301.001870]  - CPU3 ... 40-bit phys ... fixed MTRRs ... var MTRRs [=
1/8] ... done.
(d2) [  301.001953] Testing HVM environment:
(d2) [  301.002002] Using scratch memory at 400000
(d2) [  301.019991]  - REP INSB across page boundaries ... passed
(d2) [  301.031612]  - REP INSW across page boundaries ... passed
(d2) [  301.041228]  - GS base MSRs and SWAPGS ... passed
(d2) [  301.041249] Passed 3 of 3 tests
(d2) [  301.041275] Writing SMBIOS tables ...
(d2) [  301.042145] Loading SeaBIOS ...
(d2) [  301.042231] Creating MP tables ...
(d2) [  301.042387] Loading ACPI ...
(d2) [  301.043421] CONV disabled
(d2) [  301.043630] vm86 TSS at fc00a780
(d2) [  301.044162] BIOS map:
(d2) [  301.044196]  10000-100e3: Scratch space
(d2) [  301.044219]  c0000-fffff: Main BIOS
(d2) [  301.044259] E820 table:
(d2) [  301.044308]  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d2) [  301.044353]  HOLE: 00000000:000a0000 - 00000000:000c0000
(d2) [  301.044403]  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d2) [  301.044449]  [02]: 00000000:00100000 - 00000000:7f800000: RAM
(d2) [  301.044491]  HOLE: 00000000:7f800000 - 00000000:fc000000
(d2) [  301.044545]  [03]: 00000000:fc000000 - 00000001:00000000: RESERVED
(d2) [  301.044642] Invoking SeaBIOS ...
(d2) [  301.045027] SeaBIOS (version rel-1.10.2-0-g5f4c7b1)
(d2) [  301.045096] BUILD: gcc: (Debian 7.2.0-19) 7.2.0 binutils: (GNU Binu=
tils for Debian) 2.29.1
(d2) [  301.045099]=20
(d2) [  301.045138] Found Xen hypervisor signature at 40000000
(d2) [  301.045442] Running on QEMU (i440fx)
(d2) [  301.045465] xen: copy e820...
(d2) [  301.045524] Relocating init from 0x000daf80 to 0x7f7ad360 (size 768=
00)
(d2) [  301.048415] Found 5 PCI devices (max PCI bus is 00)
(d2) [  301.048456] Allocated Xen hypercall page at 7f7ff000
(d2) [  301.048492] Detected Xen v4.11-unstable
(d2) [  301.048518] xen: copy BIOS tables...
(d2) [  301.048576] Copying SMBIOS entry point from 0x00010020 to 0x000f6b2=
0
(d2) [  301.048631] Copying MPTABLE from 0xfc0011f0/fc001200 to 0x000f6a00
(d2) [  301.048674] Copying PIR from 0x00010040 to 0x000f6980
(d2) [  301.048718] Copying ACPI RSDP from 0x000100c0 to 0x000f6950
(d2) [  301.048747] Using pmtimer, ioport 0xb008
(d2) [  301.048893] Scan for VGA option rom
(d2) [  301.050267] ATA controller 1 at 1f0/3f4/c100 (irq 14 dev 9)
(d2) [  301.051553] ATA controller 2 at 170/374/c108 (irq 15 dev 9)
(d2) [  301.052569] Found 0 lpt ports
(d2) [  301.052762] Found 1 serial ports
(d2) [  301.055677] DVD/CD [ata1-0: QEMU DVD-ROM ATAPI-4 DVD/CD]
(d2) [  301.055731] Searching bootorder for: /pci@i0cf8/*@1,1/drive@1/disk@=
0
(d2) [  301.056943] PS2 keyboard initialized
(d2) [  301.056965] All threads complete.
(d2) [  301.056986] Scan for option roms
(d2) [  301.058379]=20
(d2) [  301.065610] Press ESC for boot menu.
(d2) [  301.066100]=20
[  296.154652] xenbr0: port 3(vif2.0-emu) entered learning state^M
(d2) [  303.684355] Searching bootorder for: HALT
(d2) [  303.684666] Space available for UMB: c0000-ec800, f6340-f68b0
(d2) [  303.684720] Returned 258048 bytes of ZoneHigh
(d2) [  303.684755] e820 map has 6 items:
(d2) [  303.684828]   0: 0000000000000000 - 000000000009fc00 =3D 1 RAM
(d2) [  303.684909]   1: 000000000009fc00 - 00000000000a0000 =3D 2 RESERVED
(d2) [  303.684990]   2: 00000000000f0000 - 0000000000100000 =3D 2 RESERVED
(d2) [  303.685064]   3: 0000000000100000 - 000000007f7ff000 =3D 1 RAM
(d2) [  303.685144]   4: 000000007f7ff000 - 000000007f800000 =3D 2 RESERVED
(d2) [  303.685225]   5: 00000000fc000000 - 0000000100000000 =3D 2 RESERVED
(d2) [  303.686459] enter handle_19:
(d2) [  303.686473]   NULL
(d2) [  303.694760] Booting from DVD/CD...
(d2) [  303.701138] Booting from 0000:7c00
[  298.170547] xenbr0: port 3(vif2.0-emu) entered forwarding state^M
[  298.170616] xenbr0: topology change detected, propagating^M
(XEN) [  314.149788] d2v0 Triple fault - invoking HVM shutdown action 1
(XEN) [  314.149791] *** Dumping Dom2 vcpu#0 state: ***
(XEN) [  314.149796] ----[ Xen-4.11-unstable  x86_64  debug=3Dy   Not taint=
ed ]----
(XEN) [  314.149798] CPU:    15
(XEN) [  314.149801] RIP:    e008:[<ffff82d080417368>]
(XEN) [  314.149803] RFLAGS: 0000000000010002   CONTEXT: hvm guest (d2v0)
(XEN) [  314.149807] rax: ffff8300ffe80000   rbx: 00000000ffe73000   rcx: 0=
000000000000000
(XEN) [  314.149810] rdx: ffff82d080480000   rsi: 0000000000000020   rdi: f=
fff8300ffe88000
(XEN) [  314.149814] rbp: ffff82d080487f08   rsp: ffff82d080487dd8   r8:  f=
ff0000000000fff
(XEN) [  314.149817] r9:  000ffffffffff000   r10: 000000ffffffffff   r11: 0=
000000000001000
(XEN) [  314.149820] r12: ffff830000000000   r13: 00000000ffa00000   r14: 0=
0000000ff000000
(XEN) [  314.149823] r15: ffff82d0804552bc   cr0: 0000000080050033   cr4: 0=
000000000000020
(XEN) [  314.149825] cr3: 00000000ffe73000   cr2: ffff82d080417368
(XEN) [  314.149827] fsb: 0000000000000000   gsb: 0000000000000000   gss: 0=
000000000000002
(XEN) [  314.149830] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000  =
 cs: e008



Also, find attached the various log files.

So... what am I doing wrong? :-)

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, Software Engineer @ SUSE
http://about.me/dario.faggioli
--=-ZgeIEQN3MFiQk8qeJ5wT
Content-Disposition: attachment; filename="xl-vm10.log"
Content-Type: text/x-log; name="xl-vm10.log"; charset="UTF-8"
Content-Transfer-Encoding: base64

V2FpdGluZyBmb3IgZG9tYWluIHZtMTAgKGRvbWlkIDIpIHRvIGRpZSBbcGlkIDIwNDFdCkRvbWFp
biAyIGhhcyBzaHV0IGRvd24sIHJlYXNvbiBjb2RlIDEgMHgxCkFjdGlvbiBmb3Igc2h1dGRvd24g
cmVhc29uIGNvZGUgMSBpcyBkZXN0cm95CkRvbWFpbiAyIG5lZWRzIHRvIGJlIGNsZWFuZWQgdXA6
IGRlc3Ryb3lpbmcgdGhlIGRvbWFpbgpEb25lLiBFeGl0aW5nIG5vdwo=


--=-ZgeIEQN3MFiQk8qeJ5wT
Content-Disposition: attachment; filename="qemu-dm-vm10.log"
Content-Type: text/x-log; name="qemu-dm-vm10.log"; charset="UTF-8"
Content-Transfer-Encoding: base64

KyA6IC14ZW4tZG9taWQgMiAtY2hhcmRldiBzb2NrZXQsaWQ9bGlieGwtY21kLHBhdGg9L3Zhci9y
dW4veGVuL3FtcC1saWJ4bC0yLHNlcnZlcixub3dhaXQgLW5vLXNodXRkb3duIC1tb24gY2hhcmRl
dj1saWJ4bC1jbWQsbW9kZT1jb250cm9sIC1jaGFyZGV2IHNvY2tldCxpZD1saWJ4ZW5zdGF0LWNt
ZCxwYXRoPS92YXIvcnVuL3hlbi9xbXAtbGlieGVuc3RhdC0yLHNlcnZlcixub3dhaXQgLW1vbiBj
aGFyZGV2PWxpYnhlbnN0YXQtY21kLG1vZGU9Y29udHJvbCAtbm9kZWZhdWx0cyAtbm8tdXNlci1j
b25maWcgLW5hbWUgdm0xMCAtdm5jIDEyNy4wLjAuMTowLHRvPTk5IC1kaXNwbGF5IG5vbmUgLWtl
cm5lbCAvcm9vdC92bTEwL3ZtbGludXotNC4xNC4wLTMtYW1kNjQgLWluaXRyZCAvcm9vdC92bTEw
L2luaXRyZC5pbWctNC4xNC4wLTMtYW1kNjQgLWFwcGVuZCAncm9vdD0vZGV2L3h2ZGExIHJvJyAt
c2VyaWFsIHB0eSAtZGV2aWNlIGNpcnJ1cy12Z2EsdmdhbWVtX21iPTggLWJvb3Qgb3JkZXI9YyAt
c21wIDQsbWF4Y3B1cz00IC1kZXZpY2UgcnRsODEzOSxpZD1uaWMwLG5ldGRldj1uZXQwLG1hYz0w
MDoxNjozZTo2Yzo1YTpkNCAtbmV0ZGV2IHR5cGU9dGFwLGlkPW5ldDAsaWZuYW1lPXZpZjIuMC1l
bXUsc2NyaXB0PW5vLGRvd25zY3JpcHQ9bm8gLW1hY2hpbmUgeGVuZnYgLWNkcm9tIC92YXIvbGli
L3hlbi9wdnNoaW0tc2lkZWNhcnMvdm0xMC5pc28gLW0gMjA0MCAtZHJpdmUgZmlsZT0vZGV2L3Zt
cy92bTEwLWRpc2ssaWY9aWRlLGluZGV4PTAsbWVkaWE9ZGlzayxmb3JtYXQ9cmF3LGNhY2hlPXdy
aXRlYmFjaworIHNldCAreAp3YXJuaW5nOiB1bmV4cGVjdGVkIGFyZ3VtZW50IC1zZXJpYWwgYmVp
bmcgcGFzc2VkIHRocm91Z2gKd2FybmluZzogdW5leHBlY3RlZCBhcmd1bWVudCBwdHkgYmVpbmcg
cGFzc2VkIHRocm91Z2gKd2FybmluZzogdW5leHBlY3RlZCBhcmd1bWVudCAtc21wIGJlaW5nIHBh
c3NlZCB0aHJvdWdoCndhcm5pbmc6IHVuZXhwZWN0ZWQgYXJndW1lbnQgNCxtYXhjcHVzPTQgYmVp
bmcgcGFzc2VkIHRocm91Z2gKKyBleGVjIC91c3IvbG9jYWwvbGliL3hlbi9iaW4vcWVtdS1zeXN0
ZW0taTM4NiAteGVuLWRvbWlkIDIgLWNoYXJkZXYgc29ja2V0LGlkPWxpYnhsLWNtZCxwYXRoPS92
YXIvcnVuL3hlbi9xbXAtbGlieGwtMixzZXJ2ZXIsbm93YWl0IC1uby1zaHV0ZG93biAtbW9uIGNo
YXJkZXY9bGlieGwtY21kLG1vZGU9Y29udHJvbCAtY2hhcmRldiBzb2NrZXQsaWQ9bGlieGVuc3Rh
dC1jbWQscGF0aD0vdmFyL3J1bi94ZW4vcW1wLWxpYnhlbnN0YXQtMixzZXJ2ZXIsbm93YWl0IC1t
b24gY2hhcmRldj1saWJ4ZW5zdGF0LWNtZCxtb2RlPWNvbnRyb2wgLW5vZGVmYXVsdHMgLW5vLXVz
ZXItY29uZmlnIC1uYW1lIHZtMTAgLWRpc3BsYXkgbm9uZSAtc2VyaWFsIHB0eSAtYm9vdCBvcmRl
cj1jIC1zbXAgNCxtYXhjcHVzPTQgLW5ldGRldiB0eXBlPXRhcCxpZD1uZXQwLGlmbmFtZT12aWYy
LjAtZW11LHNjcmlwdD1ubyxkb3duc2NyaXB0PW5vIC1tYWNoaW5lIHhlbmZ2IC1jZHJvbSAvdmFy
L2xpYi94ZW4vcHZzaGltLXNpZGVjYXJzL3ZtMTAuaXNvIC1tIDIwNDAKcWVtdS1zeXN0ZW0taTM4
NjogLXNlcmlhbCBwdHk6IGNoYXIgZGV2aWNlIHJlZGlyZWN0ZWQgdG8gL2Rldi9wdHMvMiAobGFi
ZWwgc2VyaWFsMCkKV2FybmluZzogbmV0ZGV2IG5ldDAgaGFzIG5vIHBlZXIKcWVtdS1zeXN0ZW0t
aTM4NjogdGVybWluYXRpbmcgb24gc2lnbmFsIDEgZnJvbSBwaWQgMjA0MSAoeGwpCg==


--=-ZgeIEQN3MFiQk8qeJ5wT--

--=-F19nmnwvyUDMHPNx6ebS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpWSFYACgkQFkJ4iaW4
c+5LjxAAuN73NOb3eA1wxxCzCMI6TyAbe34vbCqE8AB7fK0fS2wJhzhgqSXFOZ1D
755jQksNYNnTNUNPWXfJfBbgc6I9X1oAzi1D/etxMO3tsBk1KpcMegmx8VfJS5sQ
H63US4wL6PQSRebikXvR5+XDwM4yf0VW92wwkaaw+wgfGID6daaLPKQoCeuEkVbp
MOCMFhWMSM66t2SNlJEA1RwVD5euNPRoUYKkswytQ5qDvV/KQUGxGUu97+wq9JZD
E6+PDlFV22cKM3ZHSJxtY6AD64bYMfX2e6UZVJELzl1YOG3QyEbbSenlcqC2XkUd
mwnCmMtQ7vNhVgrCp/w1yFKuLgzJsQn8BASkWgEjGaKij6CVaCN++QxuypqyH/MW
6j0ylPMEGVWCnGAixfLjb3w1Xr76KgKNO01uCXZSeP7JToOEr6xyJEJzXL8xIXqB
rs/xP2Aegry3++6/du8J87wRBLKY3qlEWVlj7O7e8QaKsX9T1ppYKwiJFGlsW7pR
5mgr05WnpRqwtKDyXm/SDNYcIkS5lKJ1BwE++aueDrtfWodw3iFVHVYScsp2r2yN
+i5co/jefpqVCmkzSuRqr8P4DdBHOdH48Zx2oUsa1ZNRuY54KGiuZ9hf9C496PH8
5J6q7PxYOWzPT7BNxBPnb9OSK6HdYAy3p1vtPWnAdW1kaga0zg8=
=OqqC
-----END PGP SIGNATURE-----

--=-F19nmnwvyUDMHPNx6ebS--



--===============7039822355073477609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7039822355073477609==--
