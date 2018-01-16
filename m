From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: Unexpected behavior: Xen creating domains on startup
Date: Mon, 15 Jan 2018 21:01:35 -0800
Message-ID: <CADNMjEB=GiiaZqqd8KYCofrPag-oAxk0Td5HbGWXa7a+DjHUug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0791998991113820049=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rmxq=el=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1ebJNS-0007ED-OM
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 05:01:38 +0000
Received: by mail-yb0-x233.google.com with SMTP id i13so2028525ybl.9
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2018 21:01:36 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============0791998991113820049==
Content-Type: multipart/alternative; boundary="089e0828f134074ea20562dda0b2"

--089e0828f134074ea20562dda0b2
Content-Type: text/plain; charset="UTF-8"

Hello all,

I am doing some testing with Xen. After some of the guest domains I am
testing crashed, I decided to add some logging to Xen and the tools. After
rebuilding, reinstalling and rebooting the system, Xen seems to create
guest domains (the ones created before reboot) on startup (with no 'xl
create' command issued by me). The domains are deleted a few seconds after
startup and when I create the first domain, the domain number is not 1 but
3 or 4. Below is an example of dmesg logs right after startup: (int this
case a domain 2 was launched, xl list shows no domain few seconds later):

(XEN) Dom0 has maximum 8 VCPUs

(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff81aca000

(XEN) ELF: phdr 1 at 0xffffffff81c00000 -> 0xffffffff81d1e000

(XEN) ELF: phdr 2 at 0xffffffff81d1e000 -> 0xffffffff81d37418

(XEN) ELF: phdr 3 at 0xffffffff81d38000 -> 0xffffffff81e82000

(XEN) Initial low memory virq threshold set at 0x4000 pages.

(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs

(XEN) ..................................done.

(XEN) Std. Loglevel: All

(XEN) Guest Loglevel: All

(XEN) Xen is relinquishing VGA console.

(XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch input
to Xen)

(XEN) Freed 456kB init memory

(XEN) PCI add device 0000:00:00.0

(XEN) PCI add device 0000:00:01.0

(XEN) PCI add device 0000:00:16.0

(XEN) PCI add device 0000:00:16.1

(XEN) PCI add device 0000:00:1a.0

(XEN) PCI add device 0000:00:1d.0

(XEN) PCI add device 0000:00:1e.0

(XEN) PCI add device 0000:00:1f.0

(XEN) PCI add device 0000:00:1f.2

(XEN) PCI add device 0000:00:1f.3

(XEN) PCI add device 0000:01:00.0

(XEN) PCI add device 0000:01:00.1

(XEN) PCI add device 0000:02:03.0

(XEN) PCI: Using MCFG for segment 0000 bus 00-ff

(XEN) d0: Forcing read-only access to MFN fed00

(XEN) traps.c:1540: GPF (0000): ffff82d080363383
[emul-priv-op.c#read_msr+0x370/0x45c] -> ffff82d08036d9b2

(XEN) traps.c:1540: GPF (0000): ffff82d080363383
[emul-priv-op.c#read_msr+0x370/0x45c] -> ffff82d08036d9b2

(XEN) traps.c:1540: GPF (0000): ffff82d080363383
[emul-priv-op.c#read_msr+0x370/0x45c] -> ffff82d08036d9b2

(XEN) grant_table.c:1688:d0v1 Expanding d1 grant table from 0 to 1 frames

(XEN) HVM1 restore: CPU 0

(XEN) HVM1 restore: CPU 1

(XEN) HVM1 restore: PIC 0

(XEN) HVM1 restore: PIC 1

(XEN) HVM1 restore: IOAPIC 0

(XEN) HVM1 restore: LAPIC 0

(XEN) HVM1 restore: LAPIC 1

(XEN) HVM1 restore: LAPIC_REGS 0

(XEN) HVM1 restore: LAPIC_REGS 1

(XEN) HVM1 restore: PCI_IRQ 0

(XEN) HVM1 restore: ISA_IRQ 0

(XEN) HVM1 restore: PCI_LINK 0

(XEN) HVM1 restore: PIT 0

(XEN) HVM1 restore: RTC 0

(XEN) HVM1 restore: HPET 0

(XEN) HVM1 restore: PMTIMER 0

(XEN) HVM1 restore: MTRR 0

(XEN) HVM1 restore: MTRR 1

(XEN) HVM1 restore: CPU_XSAVE 0

(XEN) HVM1 restore: CPU_XSAVE 1

(XEN) HVM1 restore: VMCE_VCPU 0

(XEN) HVM1 restore: VMCE_VCPU 1

(XEN) HVM1 restore: TSC_ADJUST 0

(XEN) HVM1 restore: TSC_ADJUST 1

(XEN) grant_table.c:1688:d0v6 Expanding d2 grant table from 0 to 1 frames

(d2) Bootstrapping...

(d2) Xen Minimal OS (pv)!

(d2)   start_info: 0x574000(VA)

(d2)     nr_pages: 0x2000
(d2)   shared_inf: 0x06182000(MA)


Any explanation/idea on what could be occurring would be appreciated.

Cheers,

Bruno

--089e0828f134074ea20562dda0b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I am doing some testing with=
 Xen. After some of the guest domains I am testing crashed, I decided to ad=
d some logging to Xen and the tools. After rebuilding, reinstalling and reb=
ooting the system, Xen seems to create guest domains (the ones created befo=
re reboot) on startup (with no &#39;xl create&#39; command issued by me). T=
he domains are deleted a few seconds after startup and when I create the fi=
rst domain, the domain number is not 1 but 3 or 4. Below is an example of d=
mesg logs right after startup: (int this case a domain 2 was launched, xl l=
ist shows no domain few seconds later):</div><div><font size=3D"1" style=3D=
"background-color:rgb(255,255,255)" color=3D"#000000"><br></font></div>







<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Dom0 has maximum 8 VCPUs</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) ELF: phdr 0 at 0xffffffff81000000 -&gt; 0xffffffff81aca000</font>=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) ELF: phdr 1 at 0xffffffff81c00000 -&gt; 0xffffffff81d1e000</font>=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) ELF: phdr 2 at 0xffffffff81d1e000 -&gt; 0xffffffff81d37418</font>=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) ELF: phdr 3 at 0xffffffff81d38000 -&gt; 0xffffffff81e82000</font>=
</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Initial low memory virq threshold set at 0x4000 pages.</font></sp=
an></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Scrubbing Free RAM on 1 nodes using 4 CPUs</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) ..................................done.</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Std. Loglevel: All</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Guest Loglevel: All</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Xen is relinquishing VGA console.</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) *** Serial input -&gt; DOM0 (type &#39;CTRL-a&#39; three times to=
 switch input to Xen)</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) Freed 456kB init memory</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:00.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:01.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:16.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:16.1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:1a.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:1d.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:1e.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:1f.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:1f.2</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:00:1f.3</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:01:00.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:01:00.1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI add device 0000:02:03.0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) PCI: Using MCFG for segment 0000 bus 00-ff</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) d0: Forcing read-only access to MFN fed00</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) traps.c:1540: GPF (0000): ffff82d080363383 [emul-priv-op.c#read_m=
sr+0x370/0x45c] -&gt; ffff82d08036d9b2</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) traps.c:1540: GPF (0000): ffff82d080363383 [emul-priv-op.c#read_m=
sr+0x370/0x45c] -&gt; ffff82d08036d9b2</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) traps.c:1540: GPF (0000): ffff82d080363383 [emul-priv-op.c#read_m=
sr+0x370/0x45c] -&gt; ffff82d08036d9b2</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) grant_table.c:1688:d0v1 Expanding d1 grant table from 0 to 1 fram=
es</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: CPU 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: CPU 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: PIC 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: PIC 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: IOAPIC 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: LAPIC 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: LAPIC 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: LAPIC_REGS 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: LAPIC_REGS 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: PCI_IRQ 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: ISA_IRQ 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: PCI_LINK 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: PIT 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: RTC 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: HPET 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: PMTIMER 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: MTRR 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: MTRR 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: CPU_XSAVE 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: CPU_XSAVE 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: VMCE_VCPU 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: VMCE_VCPU 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: TSC_ADJUST 0</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) HVM1 restore: TSC_ADJUST 1</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(XEN) grant_table.c:1688:d0v6 Expanding d2 grant table from 0 to 1 fram=
es</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(d2) Bootstrapping...</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(d2) Xen Minimal OS (pv)!</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(d2) <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>start_in=
fo: 0x574000(VA)</font></span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;line-height:normal;font-family:=
Menlo"><span class=3D"gmail-s1" style=3D"font-variant-ligatures:no-common-l=
igatures;background-color:rgb(255,255,255)"><font size=3D"1" color=3D"#0000=
00">(d2) <span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>n=
r_pages: 0x2000</font></span></p>
<div><font size=3D"1" style=3D"background-color:rgb(255,255,255)" color=3D"=
#000000"><span style=3D"font-variant-ligatures:no-common-ligatures;font-fam=
ily:Menlo">(d2) </span><span class=3D"gmail-Apple-converted-space" style=3D=
"font-variant-ligatures:no-common-ligatures;font-family:Menlo">=C2=A0 </spa=
n><span style=3D"font-variant-ligatures:no-common-ligatures;font-family:Men=
lo">shared_inf: 0x06182000(MA)</span>=C2=A0</font></div><div><font size=3D"=
1" style=3D"background-color:rgb(255,255,255)" color=3D"#000000"><br></font=
></div><div><br></div><div>Any explanation/idea on what could be occurring =
would be appreciated.</div><div><br></div><div>Cheers,</div><div><br></div>=
<div>Bruno</div></div>

--089e0828f134074ea20562dda0b2--


--===============0791998991113820049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0791998991113820049==--
