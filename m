From: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
Subject: Re: Fwd: Error while booting android kernel 4.4 on
 jacinto j6 evm as DOM0
Date: Tue, 27 Feb 2018 12:27:25 +0200
Message-ID: <CAC+yBMuqfJqVVvDXGnfgTAp4iK0YddVsK=rOUf6BEOQ--GTw_g@mail.gmail.com>
References: <CAN_ATrdLzYQBs=KGffiPOcpBPjjj+h1KNxniNBcmWUF5Q2L0Mw@mail.gmail.com>
 <CAN_ATrdzZv2Qv7g+3CDPVR_DgsiPiGsOuS0E+f3yFZ55hCHbgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399459428282972495=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gks3=fv=globallogic.com=iurii.mykhalskyi@srs-us1.protection.inumbo.net>)
 id 1eqcUJ-0004DO-9w
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 10:27:59 +0000
Received: by mail-qk0-x235.google.com with SMTP id v124so22806866qkh.11
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2018 02:27:56 -0800 (PST)
In-Reply-To: <CAN_ATrdzZv2Qv7g+3CDPVR_DgsiPiGsOuS0E+f3yFZ55hCHbgQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: moin anjnawala <moinanjnawala@gmail.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============0399459428282972495==
Content-Type: multipart/alternative; boundary="001a114c5c466f832f05662f148f"

--001a114c5c466f832f05662f148f
Content-Type: text/plain; charset="UTF-8"

Dear Moinuddin,

What changes have to you done in device tree for Dom0?

I'm curious with few moments:
1. (XEN) omap-uart: Unable to retrieve the IRQ
(XEN) Unable to initialize dtuart: -22
(XEN) Bad console= option 'dtuart'

Looks there is some problems with uart node.

2. Strange kernel command line:
Kernel command line: console=ttyS0,115200 earlyprintk omapdrm.num_crtc=2
root=/dev/mmcblk0p2 rw rootwait rootfstype=ext4 init=/init drm.
rnodes=1 androidboot.selinux=permissive snd.slots_reserved=1,1
snd-soc-core.pmdown_time=-1 uio_pdrv_genirq.of_id=generic-uio
androidboot.console=ttyS0
androidboot.hardware=jacinto6evmboard

Looks like it mixed: android & linux at some time.
Are you trying to run Android as dom0?

And if you are using xen, you don't have to specify console for dom0.

3. [    0.831911] palmas 0-0058: IRQ missing: skipping irq request
[    5.048233] omap_i2c 4807a000.i2c: failure requesting irq 328

Looks like there is some problems with interrupt mapping. Xen doesn't
forward interrupts with number bigger than 192.
If you need to forward such IRQ, you have to use crossbar - it can be
statically configured during u-boot stage.
But at the same time - you have to update Dom0 device tree - to use gic as
main interrupt controller, not crossbar.

4.  [    5.436504] omapdss_dss 58000000.dss: master bind failed: -517 -
looks like same problem, please look through the log & fix in the same way
as 4th.
5. [    6.881378] Waiting for root device /dev/mmcblk0p2...
Boot log shows, that your partition list are not enumerated - this might be
the same problem - some problems for emmc/sd card IRQ.

In general it looks like you use wrong device tree.

Please, look into [1] as reference to update your device tree.

[1]
https://wiki.xenproject.org/wiki/User:Xen_intruction_setup_for_dra7xx-evm_board


With the best regards,
Iurii Mykhalskyi






On Tue, Feb 27, 2018 at 11:09 AM, moin anjnawala <moinanjnawala@gmail.com>
wrote:

> Hi,
>
> I am trying to boot kernel 4.4 on Jacinto-6 EVM board, I am facing error
> from xen. Please find attached log to find errors.
>
> The kernel is stuck at
> [    6.881378] Waiting for root device /dev/mmcblk0p2...
>
> Is it due to i2c related errors in boot log as mentioned below?
> [    0.831911] palmas 0-0058: IRQ missing: skipping irq request
> [    1.860292] omap_i2c 48070000.i2c: controller timed out
> [    1.880663] palmas: probe of 0-0058 failed with error -110
> [    2.902874] omap_i2c 48070000.i2c: controller timed out
> [    2.922933] pcf857x: probe of 0-0020 failed with error -110
> [    3.945557] omap_i2c 48070000.i2c: controller timed out
> [    3.965619] pcf857x: probe of 0-0021 failed with error -110
> [    3.971774] omap_i2c 48070000.i2c: bus 0 rev0.12 at 400 kHz
> [    5.000328] omap_i2c 48072000.i2c: controller timed out
> [    5.020390] pcf857x: probe of 1-0026 failed with error -110
> [    5.026750] omap_i2c 48072000.i2c: bus 1 rev0.12 at 400 kHz
> [    5.033041] omap_i2c 48060000.i2c: bus 2 rev0.12 at 400 kHz
> [    5.039104] genirq: Flags mismatch irq 328. 00006000 (4807a000.i2c) vs.
> 00006000 (48072000.i2c)
> [    5.048233] omap_i2c 4807a000.i2c: failure requesting irq 328
> [    5.054274] omap_i2c: probe of 4807a000.i2c failed with error -16
>
> Can anyone provide the solution to these problems?
>
> Thanks,
> Moinuddin
>
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel
>



-- 

Iurii Mykhalskyi | Lead Software Engineer
GlobalLogic
P +38.044.492.9695x3664  M +38.096.311.5467  S mad-nemoi
www.globallogic.com
<http://www.globallogic.com/>
http://www.globallogic.com/email_disclaimer.txt

--001a114c5c466f832f05662f148f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear=C2=A0<span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline">Moinuddin,</span><div=
><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font=
-size:12.8px">What changes have to you done in device tree for Dom0?</span>=
</div><div><span style=3D"font-size:12.8px"><br></span></div><div><span sty=
le=3D"font-size:12.8px">I&#39;m curious with few moments:</span></div><div>=
<span style=3D"font-size:12.8px">1.=C2=A0(XEN) omap-uart: Unable to retriev=
e the IRQ</span><div><span style=3D"font-size:12.8px">(XEN) Unable to initi=
alize dtuart: -22</span></div><div><span style=3D"font-size:12.8px">(XEN) B=
ad console=3D option &#39;dtuart&#39;</span></div><div><br></div><div>Looks=
 there is some problems with uart node.</div><div><br></div><div>2. Strange=
 kernel command line:</div><div><div>Kernel command line: console=3DttyS0,1=
15200 earlyprintk omapdrm.num_crtc=3D2 root=3D/dev/mmcblk0p2 rw rootwait ro=
otfstype=3Dext4 init=3D/init drm.</div><div>rnodes=3D1 androidboot.selinux=
=3Dpermissive snd.slots_reserved=3D1,1 snd-soc-core.pmdown_time=3D-1 uio_pd=
rv_genirq.of_id=3Dgeneric-uio androidboot.console=3DttyS0=C2=A0</div><div>a=
ndroidboot.hardware=3Djacinto6evmboard</div></div><div><br></div><div>Looks=
 like it mixed: android &amp; linux at some time.</div><div><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">Are you trying to run Android as dom0?</span><br></div><div><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline"><br></span></div><div>And if you are using xen, you d=
on&#39;t have to specify console for dom0.</div><div><br></div><div>3.=C2=
=A0[=C2=A0 =C2=A0 0.831911] palmas 0-0058: IRQ missing: skipping irq reques=
t</div><div>[=C2=A0 =C2=A0 5.048233] omap_i2c 4807a000.i2c: failure request=
ing irq 328<br></div><div><br></div><div>Looks like there is some problems =
with interrupt mapping. Xen doesn&#39;t forward interrupts with number bigg=
er than 192.</div><div>If you need to forward such IRQ, you have to use cro=
ssbar - it can be statically configured during u-boot stage.</div><div>But =
at the same time - you have to update Dom0 device tree - to use gic as main=
 interrupt controller, not crossbar.</div><div><br></div><div>4.=C2=A0=C2=
=A0[=C2=A0 =C2=A0 5.436504] omapdss_dss 58000000.dss: master bind failed: -=
517 - looks like same problem, please look through the log &amp; fix in the=
 same way as 4th.</div><div>5.=C2=A0[=C2=A0 =C2=A0 6.881378] Waiting for ro=
ot device /dev/mmcblk0p2...</div><div>Boot log shows, that your partition l=
ist are not enumerated - this might be the same problem - some problems for=
 emmc/sd card IRQ.</div><div><br></div><div>In general it looks like you us=
e wrong device tree.</div><div><br></div><div>Please, look into [1] as refe=
rence to update your device tree.</div><div><br></div><div>[1]=C2=A0<a href=
=3D"https://wiki.xenproject.org/wiki/User:Xen_intruction_setup_for_dra7xx-e=
vm_board">https://wiki.xenproject.org/wiki/User:Xen_intruction_setup_for_dr=
a7xx-evm_board</a></div><div><br></div><div><br></div><div>With the best re=
gards,</div><div>Iurii Mykhalskyi</div><div><br></div><div><br></div><div><=
br></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline"><br></span></div><div><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline"><br></span></div></div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Tue, Feb 27, 2018 at 11:09 AM, moin anjnawal=
a <span dir=3D"ltr">&lt;<a href=3D"mailto:moinanjnawala@gmail.com" target=
=3D"_blank">moinanjnawala@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><div dir=3D"ltr">H=
i,<br><div class=3D"gmail_quote"><div dir=3D"ltr"><div><div><div><br></div>=
I am trying to boot kernel 4.4 on Jacinto-6 EVM board, I am facing error fr=
om xen. Please find attached log to find errors.<br><br></div><div>The kern=
el is stuck at <br>[=C2=A0=C2=A0=C2=A0 6.881378] Waiting for root device /d=
ev/mmcblk0p2...<br></div><div><br></div><div>Is it due to i2c related error=
s in boot log as mentioned below?<br>[=C2=A0=C2=A0=C2=A0 0.831911] palmas 0=
-0058: IRQ missing: skipping irq request<br>[=C2=A0=C2=A0=C2=A0 1.860292] o=
map_i2c 48070000.i2c: controller timed out<br>[=C2=A0=C2=A0=C2=A0 1.880663]=
 palmas: probe of 0-0058 failed with error -110<br>[=C2=A0=C2=A0=C2=A0 2.90=
2874] omap_i2c 48070000.i2c: controller timed out<br>[=C2=A0=C2=A0=C2=A0 2.=
922933] pcf857x: probe of 0-0020 failed with error -110<br>[=C2=A0=C2=A0=C2=
=A0 3.945557] omap_i2c 48070000.i2c: controller timed out<br>[=C2=A0=C2=A0=
=C2=A0 3.965619] pcf857x: probe of 0-0021 failed with error -110<br>[=C2=A0=
=C2=A0=C2=A0 3.971774] omap_i2c 48070000.i2c: bus 0 rev0.12 at 400 kHz<br>[=
=C2=A0=C2=A0=C2=A0 5.000328] omap_i2c 48072000.i2c: controller timed out<br=
>[=C2=A0=C2=A0=C2=A0 5.020390] pcf857x: probe of 1-0026 failed with error -=
110<br>[=C2=A0=C2=A0=C2=A0 5.026750] omap_i2c 48072000.i2c: bus 1 rev0.12 a=
t 400 kHz<br>[=C2=A0=C2=A0=C2=A0 5.033041] omap_i2c 48060000.i2c: bus 2 rev=
0.12 at 400 kHz<br>[=C2=A0=C2=A0=C2=A0 5.039104] genirq: Flags mismatch irq=
 328. 00006000 (4807a000.i2c) vs. 00006000 (48072000.i2c)<br>[=C2=A0=C2=A0=
=C2=A0 5.048233] omap_i2c 4807a000.i2c: failure requesting irq 328<br>[=C2=
=A0=C2=A0=C2=A0 5.054274] omap_i2c: probe of 4807a000.i2c failed with error=
 -16<br><br></div><div>Can anyone provide the solution to these problems?<b=
r><br></div>Thanks,<br></div>Moinuddin<br><div><div><br></div></div></div>
</div><br></div>
</div></div><br>______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a><br></blockquote></div><br><br clear=3D"all"><div><br></=
div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div><font size=3D"-1"><br><span style=3D"vertical-align:baseline=
;font-variant:normal;font-style:normal;font-size:12px;background-color:tran=
sparent;text-decoration:none;font-family:Arial;font-weight:bold">Iurii Mykh=
alskyi | Lead Software Engineer </span><br><span style=3D"vertical-align:ba=
seline;font-variant:normal;font-style:normal;font-size:12px;background-colo=
r:transparent;text-decoration:none;font-family:Arial;font-weight:normal">Gl=
obalLogic</span><br><span style=3D"vertical-align:baseline;font-variant:nor=
mal;font-style:normal;font-size:12px;background-color:transparent;text-deco=
ration:none;font-family:Arial;font-weight:normal">P=C2=A0</span></font><a h=
ref=3D"tel:%2B38.044.492.9695x3664" value=3D"+380444929695" style=3D"color:=
rgb(17,85,204);font-family:Arial;font-size:12px" target=3D"_blank">+38.044.=
492.9695x3664</a><font size=3D"-1"><span style=3D"vertical-align:baseline;f=
ont-variant:normal;font-style:normal;font-size:12px;background-color:transp=
arent;text-decoration:none;font-family:Arial;font-weight:normal">=C2=A0 M +=
38.096.311.5467=C2=A0 S mad-nemoi</span><br><a href=3D"http://www.globallog=
ic.com/" target=3D"_blank"><span style=3D"font-size:12px;font-family:Arial;=
color:#1155cc;background-color:transparent;font-weight:normal;font-style:no=
rmal;font-variant:normal;text-decoration:underline;vertical-align:baseline"=
>www.globallogic.com</span></a><span style=3D"vertical-align:baseline;font-=
variant:normal;font-style:normal;font-size:12px;background-color:transparen=
t;text-decoration:none;font-family:Arial;font-weight:normal"></span><br><a =
href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"font-=
size:12px;font-family:Arial;color:#1155cc;background-color:transparent;font=
-weight:normal;font-style:normal;font-variant:normal;text-decoration:underl=
ine;vertical-align:baseline"></span></a><br><a href=3D"http://www.globallog=
ic.com/email_disclaimer.txt" target=3D"_blank"><span style=3D"font-size:11p=
x;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:=
normal;font-style:normal;font-variant:normal;text-decoration:underline;vert=
ical-align:baseline">http://www.globallogic.com/email_disclaimer.txt</span>=
</a><span style=3D"vertical-align:baseline;font-variant:normal;font-style:n=
ormal;font-size:11px;background-color:transparent;text-decoration:none;font=
-family:Arial;font-weight:normal"></span></font></div></div></div></div></d=
iv></div></div></div></div>
</div>

--001a114c5c466f832f05662f148f--


--===============0399459428282972495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0399459428282972495==--
