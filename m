From: "Wang, Baoqian" <bwang1@islander.tamucc.edu>
Subject: Fw:  Boot Xen on Jetson TX2
Date: Fri, 22 Dec 2017 16:54:41 +0000
Message-ID: <BLUPR0601MB1604E5A3A199D671AF52473AC5020@BLUPR0601MB1604.namprd06.prod.outlook.com>
References: <BLUPR0601MB1604582245D8B0216ED9EFE7C50C0@BLUPR0601MB1604.namprd06.prod.outlook.com>,
 <816de85a-ae38-6a8d-f0d0-11b7ef042025@epam.com>,
 <BLUPR0601MB16044C498E0DC89334F19283C50D0@BLUPR0601MB1604.namprd06.prod.outlook.com>,
 <SN1PR0601MB161539E5C0AE0B8DAA585FD7C5020@SN1PR0601MB1615.namprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4007706569132676952=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mhd2=ds=islander.tamucc.edu=bwang1@srs-us1.protection.inumbo.net>)
 id 1eSQat-0000QW-2h
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2017 16:54:47 +0000
In-Reply-To: <SN1PR0601MB161539E5C0AE0B8DAA585FD7C5020@SN1PR0601MB1615.namprd06.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============4007706569132676952==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BLUPR0601MB1604E5A3A199D671AF52473AC5020BLUPR0601MB1604_"

--_000_BLUPR0601MB1604E5A3A199D671AF52473AC5020BLUPR0601MB1604_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Wang, Baoqian
Sent: Thursday, December 21, 2017 7:53 PM
To: Andrii Anisov
Subject: Re: [Xen-devel] Boot Xen on Jetson TX2


I also dumped domain0 info, it shows :


VCPU information and callbacks for domain 0:
(XEN)     VCPU0: CPU0 [has=3DF] poll=3D0 upcall_pend=3D00 upcall_mask=3D01 =
dirty_cpus=3D{}
(XEN)     cpu_hard_affinity=3D{0} cpu_soft_affinity=3D{0}
(XEN)     pause_count=3D0 pause_flags=3D0
(XEN) GICH_LRs (vcpu 0) mask=3D0
(XEN)    VCPU_LR[0]=3D0
(XEN)    VCPU_LR[1]=3D0
(XEN)    VCPU_LR[2]=3D0
(XEN)    VCPU_LR[3]=3D0
(XEN)     No periodic timer


There is not periodic timer and the CPU0[has=3DF], is this the problem?


________________________________
From: Wang, Baoqian
Sent: Thursday, December 21, 2017 7:24:02 PM
To: Andrii Anisov
Subject: Re: [Xen-devel] Boot Xen on Jetson TX2


Hi Andrii,


Thanks for your reply. I tried your suggestions and got the following messa=
ges.  The PC is a0080000 where the kernel image is loaded.  The X0 is a8000=
000 where dtb is loaded. It seems that vcpu did not even execute the zImage=
.  Other things looks normal. is it possible something wrong  with the doma=
in0 kernel or the memory address where it is loaded.  Any other suggestions=
? Thank you!

Baoqian Wang


(XEN) *** Dumping Dom0 vcpu#0 state: ***
(XEN) ----[ Xen-4.9.0  arm64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00000000a0080000
(XEN) LR:     0000000000000000
(XEN) SP_EL0: 0000000000000000
(XEN) SP_EL1: 0000000000000000
(XEN) CPSR:   000001c5 MODE:64-bit EL1h (Guest Kernel, handler)
(XEN)      X0: 00000000a8000000  X1: 0000000000000000  X2: 0000000000000000
(XEN)      X3: 0000000000000000  X4: 0000000000000000  X5: 0000000000000000
(XEN)      X6: 0000000000000000  X7: 0000000000000000  X8: 0000000000000000
(XEN)      X9: 0000000000000000 X10: 0000000000000000 X11: 0000000000000000
(XEN)     X12: 0000000000000000 X13: 0000000000000000 X14: 0000000000000000
(XEN)     X15: 0000000000000000 X16: 0000000000000000 X17: 0000000000000000
(XEN)     X18: 0000000000000000 X19: 0000000000000000 X20: 0000000000000000
(XEN)     X21: 0000000000000000 X22: 0000000000000000 X23: 0000000000000000
(XEN)     X24: 0000000000000000 X25: 0000000000000000 X26: 0000000000000000
(XEN)     X27: 0000000000000000 X28: 0000000000000000  FP: 0000000000000000
(XEN)
(XEN)    ELR_EL1: 0000000000000000
(XEN)    ESR_EL1: 00000000
(XEN)    FAR_EL1: 0000000000000000
(XEN)
(XEN)  SCTLR_EL1: 00c50838
(XEN)    TCR_EL1: 00000000
(XEN)  TTBR0_EL1: 0000000000000000
(XEN)  TTBR1_EL1: 0000000000000000
(XEN)
(XEN)   VTCR_EL2: 80043594
(XEN)  VTTBR_EL2: 0001000275d33000
(XEN)
(XEN)  SCTLR_EL2: 30cd183d
(XEN)    HCR_EL2: 000000008038663f
(XEN)  TTBR0_EL2: 0000000275cfe000

(XEN)    ESR_EL2: 8200000d
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 00000000a0080000
(XEN)
(XEN) Guest stack trace from sp=3D0:
(XEN)   Failed to convert stack to physical address
(XEN) '0' pressed -> dumping Dom0's registers




________________________________
From: Andrii Anisov <andrii_anisov@epam.com>
Sent: Thursday, December 21, 2017 3:16:01 AM
To: Wang, Baoqian; xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] Boot Xen on Jetson TX2

Hello Wang,


On 20.12.17 23:29, Wang, Baoqian wrote:
> (XEN) 3... 2... 1...
> (XEN) *** Serial input -> DOM0 (type 'CTRL-a' three times to switch
> input to Xen)
> (XEN) Freed 288kB init memory.
Try switching to XEN console now. Hit Ctrl-a three (six with minicom)
times, then '0'.

--

*Andrii Anisov*

*
*


--_000_BLUPR0601MB1604E5A3A199D671AF52473AC5020BLUPR0601MB1604_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Wang, Baoqian<br>
<b>Sent:</b> Thursday, December 21, 2017 7:53 PM<br>
<b>To:</b> Andrii Anisov<br>
<b>Subject:</b> Re: [Xen-devel] Boot Xen on Jetson TX2</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0">I also dumped domain0 info, it s=
hows :</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<div>VCPU information and callbacks for domain 0:&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; VCPU0: CPU0 [has=3DF] poll=3D0 upcall_pend=3D=
00 upcall_mask=3D01 dirty_cpus=3D{}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; cpu_hard_affinity=3D{0} cpu_soft_affinity=3D{=
0}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; pause_count=3D0 pause_flags=3D0&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN) GICH_LRs (vcpu 0) mask=3D0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp; VCPU_LR[0]=3D0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp; VCPU_LR[1]=3D0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp; VCPU_LR[2]=3D0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp; VCPU_LR[3]=3D0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; No periodic timer&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
<br>
There is not periodic timer and the CPU0[has=3DF], is this the problem? &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
</div>
<p></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Wang, Baoqian<br>
<b>Sent:</b> Thursday, December 21, 2017 7:24:02 PM<br>
<b>To:</b> Andrii Anisov<br>
<b>Subject:</b> Re: [Xen-devel] Boot Xen on Jetson TX2</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">=0A=
<!--=0A=
p=0A=
	{margin-top:0;=0A=
	margin-bottom:0}=0A=
-->=0A=
</style>
<div dir=3D"ltr">
<div id=3D"x_x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; c=
olor:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0">Hi Andrii,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Thanks for your reply. I tried y=
our suggestions and got the following messages.&nbsp; The PC is a0080000 wh=
ere the kernel image is loaded.&nbsp; The X0 is a8000000 where dtb is loade=
d. It seems that vcpu did not even execute the
 zImage.&nbsp; Other things looks normal. is it possible something wrong&nb=
sp; with the domain0 kernel or the memory address where it is loaded.&nbsp;=
 Any other suggestions? Thank you!</p>
<p style=3D"margin-top:0; margin-bottom:0">Baoqian Wang</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<div>(XEN) *** Dumping Dom0 vcpu#0 state: ***<br>
(XEN) ----[ Xen-4.9.0&nbsp; arm64&nbsp; debug=3Dy&nbsp;&nbsp; Not tainted ]=
----<br>
(XEN) CPU:&nbsp;&nbsp;&nbsp; 0<br>
(XEN) PC:&nbsp;&nbsp;&nbsp;&nbsp; 00000000a0080000<br>
(XEN) LR:&nbsp;&nbsp;&nbsp;&nbsp; 0000000000000000<br>
(XEN) SP_EL0: 0000000000000000<br>
(XEN) SP_EL1: 0000000000000000<br>
(XEN) CPSR:&nbsp;&nbsp; 000001c5 MODE:64-bit EL1h (Guest Kernel, handler)<b=
r>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X0: 00000000a8000000&nbsp; X1: 00000000=
00000000&nbsp; X2: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X3: 0000000000000000&nbsp; X4: 00000000=
00000000&nbsp; X5: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X6: 0000000000000000&nbsp; X7: 00000000=
00000000&nbsp; X8: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X9: 0000000000000000 X10: 0000000000000=
000 X11: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X12: 0000000000000000 X13: 0000000000000000 X=
14: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X15: 0000000000000000 X16: 0000000000000000 X=
17: 0000000000000000<br>
<div>(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X18: 0000000000000000 X19: 0000000000000=
000 X20: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X21: 0000000000000000 X22: 0000000000000000 X=
23: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X24: 0000000000000000 X25: 0000000000000000 X=
26: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp;&nbsp; X27: 0000000000000000 X28: 0000000000000000&n=
bsp; FP: 0000000000000000<br>
(XEN)<br>
(XEN)&nbsp;&nbsp;&nbsp; ELR_EL1: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp; ESR_EL1: 00000000<br>
(XEN)&nbsp;&nbsp;&nbsp; FAR_EL1: 0000000000000000<br>
(XEN)<br>
(XEN)&nbsp; SCTLR_EL1: 00c50838<br>
</div>
<div>(XEN)&nbsp;&nbsp;&nbsp; TCR_EL1: 00000000<br>
(XEN)&nbsp; TTBR0_EL1: 0000000000000000<br>
(XEN)&nbsp; TTBR1_EL1: 0000000000000000<br>
(XEN)<br>
(XEN)&nbsp;&nbsp; VTCR_EL2: 80043594<br>
(XEN)&nbsp; VTTBR_EL2: 0001000275d33000<br>
(XEN)<br>
(XEN)&nbsp; SCTLR_EL2: 30cd183d<br>
(XEN)&nbsp;&nbsp;&nbsp; HCR_EL2: 000000008038663f<br>
(XEN)&nbsp; TTBR0_EL2: 0000000275cfe000<br>
</div>
<br>
</div>
<div>(XEN)&nbsp;&nbsp;&nbsp; ESR_EL2: 8200000d<br>
(XEN)&nbsp; HPFAR_EL2: 0000000000000000<br>
(XEN)&nbsp;&nbsp;&nbsp; FAR_EL2: 00000000a0080000<br>
(XEN)<br>
(XEN) Guest stack trace from sp=3D0:<br>
(XEN)&nbsp;&nbsp; Failed to convert stack to physical address<br>
</div>
<div>(XEN) '0' pressed -&gt; dumping Dom0's registers<br>
</div>
<br>
<p></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" fa=
ce=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Andrii Anisov &lt=
;andrii_anisov@epam.com&gt;<br>
<b>Sent:</b> Thursday, December 21, 2017 3:16:01 AM<br>
<b>To:</b> Wang, Baoqian; xen-devel@lists.xenproject.org<br>
<b>Subject:</b> Re: [Xen-devel] Boot Xen on Jetson TX2</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText">Hello Wang,<br>
<br>
<br>
On 20.12.17 23:29, Wang, Baoqian wrote:<br>
&gt; (XEN) 3... 2... 1...<br>
&gt; (XEN) *** Serial input -&gt; DOM0 (type 'CTRL-a' three times to switch=
 <br>
&gt; input to Xen)<br>
&gt; (XEN) Freed 288kB init memory.<br>
Try switching to XEN console now. Hit Ctrl-a three (six with minicom) <br>
times, then '0'.<br>
<br>
-- <br>
<br>
*Andrii Anisov*<br>
<br>
*<br>
*<br>
<br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BLUPR0601MB1604E5A3A199D671AF52473AC5020BLUPR0601MB1604_--


--===============4007706569132676952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4007706569132676952==--
