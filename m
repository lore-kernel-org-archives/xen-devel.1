From: "Xu, Terrence" <terrence.xu@intel.com>
Subject: [Intel-gfx] [GVT-g] [ANNOUNCE] 2018-Q1 release of XenGT
 (Intel GVT-g for Xen)
Date: Fri, 20 Apr 2018 09:39:50 +0000
Message-ID: <EE92950F97EE42469CA4F508D4691F5E3CAEE905__46566.6670621887$1524217126$gmane$org@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2956056552007244071=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "igvt-g@lists.01.org" <igvt-g@lists.01.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Tian,
 Kevin" <kevin.tian@intel.com>, "Li, Susie" <susie.li@intel.com>, "Wang,
 Zhenyu Z" <zhenyu.z.wang@intel.com>, "Cowperthwaite,
 David J" <david.j.cowperthwaite@intel.com>, "Reddy,
 Raghuveer" <raghuveer.reddy@intel.com>, "Dong,
 Eddie" <eddie.dong@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>, "Jin,
 Gordon" <gordon.jin@intel.com>, "Downs,
 Mike" <mike.downs@intel.com>, "Wang, Hongbo" <hongbo.wang@intel.com>
List-Id: xen-devel@lists.xenproject.org

--===============2956056552007244071==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_EE92950F97EE42469CA4F508D4691F5E3CAEE905SHSMSX104ccrcor_"

--_000_EE92950F97EE42469CA4F508D4691F5E3CAEE905SHSMSX104ccrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,



We are pleased to announce an update of Intel GVT-g for Xen.



Intel GVT-g is a full GPU virtualization solution with mediated pass-throug=
h, starting from 4th generation Intel Core(TM) processors with Intel proces=
sor graphics. A virtual GPU instance is maintained for each VM, with part o=
f performance critical resources directly assigned. The capability of runni=
ng native graphics driver inside a VM, without hypervisor intervention in p=
erformance critical paths, achieves a good balance among performance, featu=
re, and sharing capability. GVT-g for Xen hypervisor is XenGT.





Repositories

-    Xen :  https://github.com/01org/igvtg-xen (tag: 2018-q1-xengt-stable-4=
.10)

-    Kernel: https://github.com/01org/gvt-linux (tag: 2018-q1-gvt-stable-4.=
14)

-    Qemu: https://github.com/01org/igvtg-qemu (tag: 2018-q1-stable-2.10.0)





Platform Support

-    Server platforms: Intel(r) Xeon(r) E3_v4, E3_v5 and E3_v6 with Intel G=
raphics processor

-    Client platforms: Intel(r) Core(tm) 5th generation (code name: Broadwe=
ll), 6th generation (code name: Skylake) and 7th generation (code name: Kab=
ylake)



Guest Operation System Validated

-    Windows7 32-bit, Window7 64-bit, Windows8.1 64-bit, Windows10 64-bit

-    Ubuntu 16.04 64-bit



Major Changes from Q3'2017 Release

-    This update is based on kernel version 4.14 and Qemu version 2.10 and =
Xen 4.10.

-    Improve stability of Live Migration feature with internal stress test =
passed.

-    More bug fixing, code refinement and debugging interface enhancement, =
please refer to git log.



Limitation or known issues:

-    Due to graphics hardware resource limitation, the maximum number of Wi=
ndows VM is 7.

-    The pre-defined type vgt_low_gm_sz=3D128/256/512 of option into HVM fi=
le must be created for VM to install Windows 7 32-bit. vGPU type 8 is not a=
llocated to have enough graphics resource to support Windows 7 32-bit.

-    If the default 1024x768 vm screen resolution couldn't satisfy your nee=
d, please add vgt_log_gm_sz=3D128/256/512 option into HVM file.

-    Due to one known regression issue in latest Intel Windows Graphics dri=
ver, Intel Windows Graphics driver version 15.45 is preferred to install in=
 Windows VM and please don't enable Windows auto-update mechanism to update=
 the driver to later version. Some 3rd party applications like 3DMark rely =
on DirectX12 features. DirectX12 is not supported in Intel Windows Graphics=
 driver 15.45 or earlier versions. So the applications will not run well in=
 Windows VM with these drivers.

-    There's corner case that Guest Windows 7 32bit VM may be killed automa=
tically by Xen when Guest VM runs into TDR. This issues happens only on Bro=
adwell platform. The workaround is to disable part of viridian feature in G=
uest VM hvm file by adding viridian=3D["all", "!apic_assist"].







Useful links:

-    Setup guide:

https://github.com/01org/gvt-linux/wiki/GVTg_Setup_Guide



-    New upstream architecture design introduction:

https://01.org/igvt-g/documentation/intel-gvt-g-new-architecture-introducti=
on



-    Please subscribe to join the mailing list if you want to learn more ab=
out GVT-g project:

https://lists.01.org/mailman/listinfo/igvt-g



-    Please subscribe to join the mailing list if you want to contribute/re=
view latest GVT-g upstream patches:

https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev



-    Official GVT-g portal:

https://01.org/igvt-g



-    More information about background, architecture and others about Intel=
 GVT-g, can be found at:

https://01.org/igvt-g

https://www.usenix.org/conference/atc14/technical-sessions/presentation/tia=
n

http://events.linuxfoundation.org/sites/events/files/slides/XenGT-Xen%20Sum=
mit-v7_0.pdf

http://events.linuxfoundation.org/sites/events/files/slides/XenGT-Xen%20Sum=
mit-REWRITE%203RD%20v4.pdf

https://01.org/xen/blogs/srclarkx/2013/graphics-virtualization-xengt





Important Note:

The XenGT project should be considered a work in progress. As such it is no=
t a complete product nor should it be considered one. Extra care should be =
taken when testing and configuring a system to use the XenGT project.







Thanks

Terrence

Tel: +86-21-6116 5390

MP: +86-1356 4367 024

Mail: terrence.xu@intel.com<mailto:terrence.xu@intel.com>



_______________________________________________

GVT-g mailing list

iGVT-g@lists.01.org<mailto:iGVT-g@lists.01.org>

https://lists.01.org/mailman/listinfo/igvt-g


--_000_EE92950F97EE42469CA4F508D4691F5E3CAEE905SHSMSX104ccrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi all,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">We are pleased to announce an update of Intel GVT=
-g for Xen.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Intel GVT-g is a full GPU virtualization solution=
 with mediated pass-through, starting from 4th generation Intel Core(TM) pr=
ocessors with Intel processor graphics. A virtual GPU instance is maintaine=
d for each VM, with part of performance
 critical resources directly assigned. The capability of running native gra=
phics driver inside a VM, without hypervisor intervention in performance cr=
itical paths, achieves a good balance among performance, feature, and shari=
ng capability. GVT-g for Xen hypervisor
 is XenGT.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Repositories<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Xen :&nbsp; <a href=3D"https:=
//github.com/01org/igvtg-xen">
https://github.com/01org/igvtg-xen</a> (tag: 2018-q1-xengt-stable-4.10)<o:p=
></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Kernel: <a href=3D"https://gi=
thub.com/01org/gvt-linux">
https://github.com/01org/gvt-linux</a> (tag: 2018-q1-gvt-stable-4.14)<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Qemu: <a href=3D"https://gith=
ub.com/01org/igvtg-qemu">
https://github.com/01org/igvtg-qemu</a> (tag: 2018-q1-stable-2.10.0)<o:p></=
o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Platform Support<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Server platforms: Intel(r) Xe=
on(r) E3_v4, E3_v5 and E3_v6 with Intel Graphics processor<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Client platforms: Intel(r) Co=
re(tm) 5th generation (code name: Broadwell), 6th generation (code name: Sk=
ylake) and 7th generation (code name: Kabylake)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Guest Operation System Validated<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Windows7 32-bit, Window7 64-b=
it, Windows8.1 64-bit, Windows10 64-bit<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Ubuntu 16.04 64-bit<o:p></o:p=
></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Major Changes from Q3&#8217;2017 Release<o:p></o:=
p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; This update is based on kerne=
l version 4.14 and Qemu version 2.10 and Xen 4.10.<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Improve stability of Live Mig=
ration feature with internal stress test passed.<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; More bug fixing, code refinem=
ent and debugging interface enhancement, please refer to git log.<o:p></o:p=
></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Limitation or known issues:<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Due to graphics hardware reso=
urce limitation, the maximum number of Windows VM is 7.<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; The pre-defined type vgt_low_=
gm_sz=3D128/256/512 of option into HVM file must be created for VM to insta=
ll Windows 7 32-bit. vGPU type 8 is not allocated to have enough graphics r=
esource to support Windows 7 32-bit.<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; If the default 1024x768 vm sc=
reen resolution couldn&#8217;t satisfy your need, please add&nbsp;vgt_log_g=
m_sz=3D128/256/512 option into HVM file.<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Due to one known regression i=
ssue in latest Intel Windows Graphics driver, Intel Windows Graphics driver=
 version 15.45 is preferred to install in Windows VM and please don&#8217;t=
 enable Windows auto-update mechanism to update the driver
 to later version. Some 3rd party applications like 3DMark rely on DirectX1=
2 features. DirectX12 is not supported in Intel Windows Graphics driver 15.=
45 or earlier versions. So the applications will not run well in Windows VM=
 with these drivers.<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; There&#8217;s corner case tha=
t Guest Windows 7 32bit VM may be killed automatically by Xen when Guest VM=
 runs into TDR. This issues happens only on Broadwell platform. The workaro=
und is to disable part of viridian feature in Guest VM
 hvm file by adding viridian=3D[&quot;all&quot;, &quot;!apic_assist&quot;].=
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Useful links:<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Setup guide:<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://github.com/01org/gvt-linux/wik=
i/GVTg_Setup_Guide">https://github.com/01org/gvt-linux/wiki/GVTg_Setup_Guid=
e</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; New upstream architecture des=
ign introduction:<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://01.org/igvt-g/documentation/in=
tel-gvt-g-new-architecture-introduction">https://01.org/igvt-g/documentatio=
n/intel-gvt-g-new-architecture-introduction</a>
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Please subscribe to join the =
mailing list if you want to learn more about GVT-g project:
<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://lists.01.org/mailman/listinfo/=
igvt-g">https://lists.01.org/mailman/listinfo/igvt-g</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Please subscribe to join the =
mailing list if you want to contribute/review latest GVT-g upstream patches=
:<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://lists.freedesktop.org/mailman/=
listinfo/intel-gvt-dev">https://lists.freedesktop.org/mailman/listinfo/inte=
l-gvt-dev</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; Official GVT-g portal:<o:p></=
o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://01.org/igvt-g">https://01.org/=
igvt-g</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp; More information about backgr=
ound, architecture and others about Intel GVT-g, can be found at:<o:p></o:p=
></p>
<p class=3D"MsoPlainText"><a href=3D"https://01.org/igvt-g">https://01.org/=
igvt-g</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://www.usenix.org/conference/atc1=
4/technical-sessions/presentation/tian">https://www.usenix.org/conference/a=
tc14/technical-sessions/presentation/tian</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"http://events.linuxfoundation.org/site=
s/events/files/slides/XenGT-Xen%20Summit-v7_0.pdf">http://events.linuxfound=
ation.org/sites/events/files/slides/XenGT-Xen%20Summit-v7_0.pdf</a><o:p></o=
:p></p>
<p class=3D"MsoPlainText"><a href=3D"http://events.linuxfoundation.org/site=
s/events/files/slides/XenGT-Xen%20Summit-REWRITE%203RD%20v4.pdf">http://eve=
nts.linuxfoundation.org/sites/events/files/slides/XenGT-Xen%20Summit-REWRIT=
E%203RD%20v4.pdf</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://01.org/xen/blogs/srclarkx/2013=
/graphics-virtualization-xengt">https://01.org/xen/blogs/srclarkx/2013/grap=
hics-virtualization-xengt</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Important Note:<o:p></o:p></p>
<p class=3D"MsoPlainText">The XenGT project should be considered a work in =
progress. As such it is not a complete product nor should it be considered =
one. Extra care should be taken when testing and configuring a system to us=
e the XenGT project.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks<o:p></o:p></p>
<p class=3D"MsoPlainText">Terrence<o:p></o:p></p>
<p class=3D"MsoPlainText">Tel: &#43;86-21-6116 5390<o:p></o:p></p>
<p class=3D"MsoPlainText">MP: &#43;86-1356 4367 024<o:p></o:p></p>
<p class=3D"MsoPlainText">Mail: <a href=3D"mailto:terrence.xu@intel.com">te=
rrence.xu@intel.com</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">_______________________________________________<o=
:p></o:p></p>
<p class=3D"MsoPlainText">GVT-g mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"mailto:iGVT-g@lists.01.org">iGVT-g@lis=
ts.01.org</a><o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://lists.01.org/mailman/listinfo/=
igvt-g">https://lists.01.org/mailman/listinfo/igvt-g</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_EE92950F97EE42469CA4F508D4691F5E3CAEE905SHSMSX104ccrcor_--


--===============2956056552007244071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2956056552007244071==--
