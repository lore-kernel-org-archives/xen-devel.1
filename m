From: "Security Developer" <security.developer@emailn.de>
Subject: GFX passthrough of primary graphics card
Date: Tue, 22 Jan 2019 13:41:12 +0100
Message-ID: <ecc2f811264194dc2c54f30adad9fbfb@mail.emailn.de>
Reply-To: Security Developer <security.developer@emailn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2218221585183000816=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9PSJ=P6=emailn.de=security.developer@srs-us1.protection.inumbo.net>)
 id 1glvMi-0004ZA-0R
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 12:41:16 +0000
Received: from mail.emailn.de (46.182.20.122 [46.182.20.122])
 by mail.emailn.de (b1gMailServer) with ESMTP id 2AB9ED16
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jan 2019 13:41:12 +0100 (CET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2218221585183000816==
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

<html><font face="Arial" size="2">Hi there, I'm trying to pass through my primary graphics card, but I have trouble getting it to work. I posted already on xen-users, but no one replied. So I try again on the developers list.</font><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2">I have the latest xen-unstable, and as Dom0 kernel I run 4.20 (also latest from upstream).</font></div><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2">I have the following scenario:</font></div><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2">I want to set up my laptop in "kiosk mode" where there is absolutely no graphics in Dom0 and all hardware sits directly in my VM. This VM is Windows at the moment.</font></d
 iv><div><font face="Arial" size="2">I have a laptop with an Intel HD graphics card (so just a single
one for the whole platform). I want to hand over this graphics card to the VM as its primary graphics card (no emulation of hardware).</font></div><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2">I have configured to hide the card from Dom0 and switch off the use of graphics in Dom0 (kernel command line):</font></div><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2">xen_pciback.hide=(00:02.0) quiet video=vesafb:off,efifb:off</font></div><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2">My configuration file has the following parameters set:</font></div><div><font face="Arial" size="2"><br></font></div><div><font face="Arial" size="2"><div>vga = "none"</div><div>nographic = 1</div><div>builde
 r = "hvm"</div><div>gfx_passthru=1</div><div>pci=['00:02.0']</div><div><br></div><div>When I boot the
VM, I see the following errors in dmesg:</div><div><br></div></font></div><div><font face="Arial" size="2"><div>[&nbsp; 291.884273] resource sanity check: requesting [mem 0x000c0000-0x000dffff], which spans more than PCI Bus 0000:00 [mem 0x000c0000-0x000c3fff window]</div><div>[&nbsp; 291.884278] caller pci_map_rom+0x6a/0x1b0 mapping multiple BARs</div><div>[&nbsp; 291.884290] pciback 0000:00:02.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0xffff</div><div>[&nbsp; 291.934147] xen_pciback: vpci: 0000:00:02.0: assign to virtual slot 0</div><div>[&nbsp; 291.934275] pciback 0000:00:02.0: registering for 2</div><div><br></div><div>In xl dmesg I see the following:</div><div><br></div><div><div>(XEN) d11: bind: m_gsi=16 g_gsi=28 dev=00.00.3 intx=0</div><div>(d11) HVM Loader</div><di
 v>(d11) Detected Xen v4.12.0-rc</div><div>(d11) Xenbus rings @0xfeffc000, event channel 1</div><div>(d11)
System requested SeaBIOS</div><div>(d11) CPU speed is 2712 MHz</div><div>(d11) Relocating guest memory for lowmem MMIO space disabled</div><div>(XEN) irq.c:374: Dom11 PCI link 0 changed 0 -&gt; 5</div><div>(d11) PCI-ISA link 0 routed to IRQ5</div><div>(XEN) irq.c:374: Dom11 PCI link 1 changed 0 -&gt; 10</div><div>(d11) PCI-ISA link 1 routed to IRQ10</div><div>(XEN) irq.c:374: Dom11 PCI link 2 changed 0 -&gt; 11</div><div>(d11) PCI-ISA link 2 routed to IRQ11</div><div>(XEN) irq.c:374: Dom11 PCI link 3 changed 0 -&gt; 5</div><div>(d11) PCI-ISA link 3 routed to IRQ5</div><div>(d11) pci dev 01:3 INTA-&gt;IRQ10</div><div>(d11) pci dev 02:0 INTA-&gt;IRQ11</div><div>(XEN) memory_map:add: dom11 gfn=fdffc mfn=8ff4f nr=3</div><div>(d11) pci dev 03:0 INTA-&gt;IRQ5</div><div>(d11) RAM in high memory; 
 setting high_mem resource base to 166000000</div><div>(d11) pci dev 03:0 bar 18 size 010000000: 0e000000c</div><div>(d11)
pci dev 02:0 bar 14 size 001000000: 0f0000008</div><div>(XEN) memory_map:add: dom11 gfn=f1000 mfn=eb000 nr=1000</div><div>(d11) pci dev 03:0 bar 10 size 001000000: 0f1000004</div><div>(d11) pci dev 03:0 bar 30 size 000020000: 0f2000000</div><div>(d11) pci dev 02:0 bar 10 size 000000100: 00000c001</div><div>(d11) pci dev 03:0 bar 20 size 000000040: 00000c101</div><div>(XEN) ioport_map:add: dom11 gport=c100 mport=e000 nr=40</div><div>(d11) pci dev 01:1 bar 20 size 000000010: 00000c141</div><div>(d11) Multiprocessor initialisation:</div><div>(d11)&nbsp; - CPU0 ... 39-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.</div><div>(d11)&nbsp; - CPU1 ... 39-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.</div><div>(d11) Testing HVM environment:</div><div>(d11) Using scratch memory at 40
 0000</div><div>(d11)&nbsp; - REP INSB across page boundaries ... passed</div><div>(d11)&nbsp; - REP INSW
across page boundaries ... passed</div><div>(d11)&nbsp; - GS base MSRs and SWAPGS ... passed</div><div>(d11) Passed 3 of 3 tests</div><div>(d11) Writing SMBIOS tables ...</div><div>(d11) Loading SeaBIOS ...</div><div>(d11) Creating MP tables ...</div><div>(d11) Loading ACPI ...</div><div>(d11) vm86 TSS at fc00a680</div><div>(d11) BIOS map:</div><div>(d11)&nbsp; 10000-100e3: Scratch space</div><div>(d11)&nbsp; c0000-fffff: Main BIOS</div><div>(d11) E820 table:</div><div>(d11)&nbsp; [00]: 00000000:00000000 - 00000000:000a0000: RAM</div><div>(d11)&nbsp; HOLE: 00000000:000a0000 - 00000000:000c0000</div><div>(d11)&nbsp; [01]: 00000000:000c0000 - 00000000:00100000: RESERVED</div><div>(d11)&nbsp; [02]: 00000000:00100000 - 00000000:9a000000: RAM</div><div>(d11)&nbsp; [03]: 00000000:9a000000 - 0000
 0000:9c800000: RESERVED</div><div>(d11)&nbsp; HOLE: 00000000:9c800000 - 00000000:fc000000</div><div>(d11)&nbsp;
[04]: 00000000:fc000000 - 00000000:fdffc000: RESERVED</div><div>(d11)&nbsp; [05]: 00000000:fdffc000 - 00000000:fdfff000: NVS</div><div>(d11)&nbsp; [06]: 00000000:fdfff000 - 00000001:00000000: RESERVED</div><div>(d11)&nbsp; [07]: 00000001:00000000 - 00000001:66000000: RAM</div><div>(d11) Invoking SeaBIOS ...</div><div>(d11) SeaBIOS (version rel-1.12.0-0-ga698c89-Xen)</div><div>(d11) BUILD: gcc: (GCC) 8.2.1 20181215 (Red Hat 8.2.1-6) binutils: version 2.31.1-15.fc29</div><div>(d11)&nbsp;</div><div>(d11) Found Xen hypervisor signature at 40000000</div><div>(d11) Running on QEMU (i440fx)</div><div>(d11) xen: copy e820...</div><div>(d11) Relocating init from 0x000d87c0 to 0x99fac360 (size 80896)</div><div>(d11) Found 6 PCI devices (max PCI bus is 00)</div><div>(d11) Allocated Xen hypercall page
  at 99fff000</div><div>(d11) Detected Xen v4.12.0-rc</div><div>(d11) xen: copy BIOS tables...</div><div>(d11)
Copying SMBIOS entry point from 0x00010020 to 0x000f5be0</div><div>(d11) Copying MPTABLE from 0xfc001180/fc001190 to 0x000f5ae0</div><div>(d11) Copying PIR from 0x00010040 to 0x000f5a60</div><div>(d11) Copying ACPI RSDP from 0x000100c0 to 0x000f5a30</div><div>(d11) Using pmtimer, ioport 0xb008</div><div>(d11) WARNING - Timeout at wait_reg8:81!</div><div>(d11) Scan for VGA option rom</div><div>(XEN) memory_map:add: dom11 gfn=f2000 mfn=c0 nr=20</div><div>(XEN) memory_map:remove: dom11 gfn=f2000 mfn=c0 nr=20</div><div>(d11) Turning on vga text mode console</div><div>(d11) SeaBIOS (version rel-1.12.0-0-ga698c89-Xen)</div><div>(d11) Machine UUID 894a9246-73b7-4496-9b1b-e43839ec2621</div><div>(d11) ATA controller 1 at 1f0/3f4/c140 (irq 14 dev 9)</div><div>(d11) ATA controller 2 at 170/374/c148 (
 irq 15 dev 9)</div><div>(d11) Found 0 lpt ports</div><div>(d11) Found 1 serial ports</div><div>(d11)
PS2 keyboard initialized</div><div>(d11) ata0-0: QEMU HARDDISK ATA-7 Hard-Disk (20480 MiBytes)</div><div>(d11) Searching bootorder for: /pci@i0cf8/*@1,1/drive@0/disk@0</div><div>(d11) DVD/CD [ata1-0: QEMU DVD-ROM ATAPI-4 DVD/CD]</div><div>(d11) Searching bootorder for: /pci@i0cf8/*@1,1/drive@1/disk@0</div><div>(d11) All threads complete.</div><div>(d11) Scan for option roms</div><div>(d11)&nbsp;</div><div>(d11) Press ESC for boot menu.</div><div>(d11)&nbsp;</div><div>(d11) Searching bootorder for: HALT</div><div>(d11) drive 0x000f59c0: PCHS=16383/16/63 translation=lba LCHS=1024/255/63 s=41943040</div><div>(d11) Space available for UMB: c0000-eb000, f5400-f5960</div><div>(d11) Returned 258048 bytes of ZoneHigh</div><div>(d11) e820 map has 9 items:</div><div>(d11)&nbsp; &nbsp;0: 000000000000
 0000 - 000000000009fc00 = 1 RAM</div><div>(d11)&nbsp; &nbsp;1: 000000000009fc00 - 00000000000a0000 =
2 RESERVED</div><div>(d11)&nbsp; &nbsp;2: 00000000000f0000 - 0000000000100000 = 2 RESERVED</div><div>(d11)&nbsp; &nbsp;3: 0000000000100000 - 0000000099fff000 = 1 RAM</div><div>(d11)&nbsp; &nbsp;4: 0000000099fff000 - 000000009c800000 = 2 RESERVED</div><div>(d11)&nbsp; &nbsp;5: 00000000fc000000 - 00000000fdffc000 = 2 RESERVED</div><div>(d11)&nbsp; &nbsp;6: 00000000fdffc000 - 00000000fdfff000 = 4 NVS</div><div>(d11)&nbsp; &nbsp;7: 00000000fdfff000 - 0000000100000000 = 2 RESERVED</div><div>(d11)&nbsp; &nbsp;8: 0000000100000000 - 0000000166000000 = 1 RAM</div><div>(d11) enter handle_19:</div><div>(d11)&nbsp; &nbsp;NULL</div><div>(d11) Booting from DVD/CD...</div><div>(d11) Booting from 0000:7c00</div><div>(XEN) irq.c:374: Dom11 PCI link 0 changed 5 -&gt; 0</div><div>(XEN) irq.c:374: Dom11 PCI l
 ink 1 changed 10 -&gt; 0</div><div>(XEN) irq.c:374: Dom11 PCI link 2 changed 11 -&gt; 0</div><div>(XEN)
irq.c:374: Dom11 PCI link 3 changed 5 -&gt; 0</div><div>(XEN) memory_map:remove: dom11 gfn=f1000 mfn=eb000 nr=1000</div><div>(XEN) ioport_map:remove: dom11 gport=c100 mport=e000 nr=40</div><div>(XEN) memory_map:add: dom11 gfn=f1000 mfn=eb000 nr=1000</div><div>(XEN) ioport_map:add: dom11 gport=c100 mport=e000 nr=40</div><div>(XEN) memory_map:remove: dom11 gfn=f1000 mfn=eb000 nr=1000</div><div>(XEN) ioport_map:remove: dom11 gport=c100 mport=e000 nr=40</div><div>(XEN) memory_map:add: dom11 gfn=f1000 mfn=eb000 nr=1000</div><div>(XEN) ioport_map:add: dom11 gport=c100 mport=e000 nr=40</div></div><div><br></div><div>The screen remains black.&nbsp;</div><div><br></div><div>Can anyone help with this scenario? Is it not supported to pass through the primary graphics card? Is the problem maybe that t
 he card is still used by Dom0 somehow?</div><div>What do these "Invalid PCI ROM header signature" errors
mean?</div></font></div><br /><br />
<hr /><br />
Versendet mit <a href="https://www.emailn.de/">Emailn.de</a> - Freemail
<br /><br />
* Unbegrenzt Speicherplatz<br />
* Eigenes Online-Büro<br />
* 24h besten Mailempfang<br />
* Spamschutz, Adressbuch <br /><br /></html>




--===============2218221585183000816==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2218221585183000816==--
