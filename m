From: tosher 1 <akm2tosher@yahoo.com>
Subject: Running Driver Domain in different mode and hypervisor
Date: Wed, 27 Feb 2019 00:26:19 +0000 (UTC)
Message-ID: <874019770.5655557.1551227179202@mail.yahoo.com>
References: <874019770.5655557.1551227179202.ref@mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3862588159446878292=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Adka=RC=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1gyn5F-00021r-2i
 for xen-devel@lists.xenproject.org; Wed, 27 Feb 2019 00:28:25 +0000
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

--===============3862588159446878292==
Content-Type: multipart/alternative;
	boundary="----=_Part_5655556_1391314065.1551227179199"
Content-Length: 5405

------=_Part_5655556_1391314065.1551227179199
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Guys,
Lately, I have been trying to play with Xen Driver Domain. I have been able=
 to make it work where both the=C2=A0 Driver Domain OS and the guest OS are=
 run on paravirtualized (PV) machine. However, it doesn't work when any of =
them are hardware virtualized machine (HVM). Therefore, I have the followin=
g questions now.
1. Is it possible to have the Driver Domain and guests, who are using the c=
orresponding drivers, run on virtual machines using=C2=A0other than the PV =
mode, like HVM or PVHVM? If yes, then what are the possible combinations?
2. Is it possible to use virtIO for paravirtualization where the underlying=
 hypervisor is Xen? If yes, then can we run Driver Domain using virtIO?
3. Is it possible to have a Driver Domain where the underlying hypervisor i=
s KVM instead of Xen?

The last question may not be directly related to Xen. However, I am tempted=
 to ask as good things like PV was first introduced in Xen then others hype=
rvisors adapted this design.=C2=A0=20

Please let me know your valuable opinion and feel free to provide any link =
where I can study further regarding these matters.
Thanks,Mehrab
------=_Part_5655556_1391314065.1551227179199
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpe8e3018dyahoo-style-wrap" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
3px;"><span><span><div class=3D"ydp26625be9yiv2948557669ydpfc4e649dyahoo-st=
yle-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif=
;font-size:13px;">Hi Guys,</div><div class=3D"ydp26625be9yiv2948557669ydpfc=
4e649dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Ari=
al, sans-serif;font-size:13px;"><br></div><div class=3D"ydp26625be9yiv29485=
57669ydpfc4e649dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;font-size:13px;">Lately, I have been trying to pla=
y with Xen Driver Domain. I have been able to make it work where both the&n=
bsp; <span><span>Driver Domain</span></span> OS and the guest OS are run on=
 <g class=3D"gr_ gr_26 gr-alert gr_spell gr_inline_cards gr_run_anim Contex=
tualSpelling" id=3D"26" data-gr-id=3D"26">paravirtualized</g> (PV) machine.=
 However, it doesn't work when any of them are hardware virtualized machine=
 (HVM). Therefore, I have the following questions now.</div><div class=3D"y=
dp26625be9yiv2948557669ydpfc4e649dyahoo-style-wrap" style=3D"font-family:He=
lvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><br></div><div =
class=3D"ydp26625be9yiv2948557669ydpfc4e649dyahoo-style-wrap" style=3D"font=
-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;">1. Is=
 it possible to have the Driver Domain and guests, who are using the corres=
ponding drivers, run on virtual machines <span>using&nbsp;</span>other than=
 the PV mode, like HVM or PVHVM? If yes, then what are the possible combina=
tions?</div><div class=3D"ydp26625be9yiv2948557669ydpfc4e649dyahoo-style-wr=
ap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-=
size:13px;"><br></div><div class=3D"ydp26625be9yiv2948557669ydpfc4e649dyaho=
o-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-s=
erif;font-size:13px;">2. Is it possible to use virtIO for paravirtualizatio=
n where the underlying hypervisor is Xen? If yes, then can we run Driver Do=
main using virtIO?</div><div class=3D"ydp26625be9yiv2948557669ydpfc4e649dya=
hoo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, sans=
-serif;font-size:13px;"><br></div><div class=3D"ydp26625be9yiv2948557669ydp=
fc4e649dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, A=
rial, sans-serif;font-size:13px;">3. Is it possible to have a Driver Domain=
 where the underlying hypervisor is KVM instead of Xen?<br></div><div class=
=3D"ydp26625be9yiv2948557669ydpfc4e649dyahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><br></div>=
<div class=3D"ydp26625be9yiv2948557669ydpfc4e649dyahoo-style-wrap" style=3D=
"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;">=
The last question may not be directly related to Xen. However, I am tempted=
 to ask as good things like PV was first introduced in Xen then others hype=
rvisors adapted this design.&nbsp; <br></div><div class=3D"ydp26625be9yiv29=
48557669ydpfc4e649dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, H=
elvetica, Arial, sans-serif;font-size:13px;"><br></div><div class=3D"ydp266=
25be9yiv2948557669ydpfc4e649dyahoo-style-wrap" style=3D"font-family:Helveti=
ca Neue, Helvetica, Arial, sans-serif;font-size:13px;">Please let me know y=
our valuable opinion and feel free to provide any link where I can study fu=
rther regarding these matters.</div><div class=3D"ydp26625be9yiv2948557669y=
dpfc4e649dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica,=
 Arial, sans-serif;font-size:13px;"><br></div><div class=3D"ydp26625be9yiv2=
948557669ydpfc4e649dyahoo-style-wrap" style=3D"font-family:Helvetica Neue, =
Helvetica, Arial, sans-serif;font-size:13px;">Thanks,</div>Mehrab</span></s=
pan></div></body></html>
------=_Part_5655556_1391314065.1551227179199--


--===============3862588159446878292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3862588159446878292==--
