From: Rich Persaud <persaur@gmail.com>
Subject: Re: Community call: PCI Emulation - Future Direction
 (Wed, May 2nd, UTC 16:00-17:00 / BST 17:00-18:00)
Date: Wed, 2 May 2018 12:06:22 -0400
Message-ID: <B775F5DF-82E7-44EA-B57F-2E674C4522CC@gmail.com>
References: <C0735441-A835-4558-B69D-83EEE17F21E7@citrix.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0241977543943897326=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=w/j7=hv=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1fDuGw-0005Bz-QE
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 16:06:26 +0000
Received: by mail-qk0-x235.google.com with SMTP id x22so11608216qkb.12
 for <xen-devel@lists.xenproject.org>; Wed, 02 May 2018 09:06:24 -0700 (PDT)
In-Reply-To: <C0735441-A835-4558-B69D-83EEE17F21E7@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, marmarek@invisiblethingslab.com, Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>, Alexey G <x1917x@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, George.Dunlap@citrix.com, Chao Gao <chao.gao@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0241977543943897326==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-D9592BEA-4955-4DC0-8121-42303959B0FA
Content-Transfer-Encoding: 7bit


--Apple-Mail-D9592BEA-4955-4DC0-8121-42303959B0FA
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Apr 24, 2018, at 05:19, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> Hi all,
> as agreed please find attached the meeting invite
> Regards
> Lars
>=20
> ## Agenda (provisional)
> I copied what was discussed on this thread so far https://docs.google.com/=
document/d/1RWylmNmBXOrgGLARj6_ynK50P7SZPl4LpnmhGaPglJw/edit?usp=3Dsharing, w=
hich I will use as pad to write down minutes. Feel free to make agenda sugge=
stions and copy relevant information into the doc, prior to the meeting.

I would like to add an agenda item to discuss the level of security support t=
hat will be asserted in SUPPORT.md for driver domains which contain untruste=
d PCI devices.  Will Xen security support be different for SR-IOV devices?  G=
PUs vs. NICs?

There have been past discussions on this topic and a proposed PCI-iommu-bugs=
.txt file to help Xen users and developers understand the risks [2][3][4] th=
at may arise from a hostile device and potentially buggy firmware.  If we ca=
n document specific risks, we can ask firmware developers to make specific i=
mprovements to improve the security of PCI emulation.

There is an active effort [4] underway to improve firmware security in serve=
rs (and eventually desktops), including a reduction of attack surface due to=
 SMM.  There is also work underway [5][6] to perform secure boot between ind=
ividual PCI devices and server motherboards.  Some of these concepts may alr=
eady be deployed in Azure.

Several stakeholders will be attending or presenting at the PSEC [6] confere=
nce.

Rich

[1] Performance Isolation Exposure in Virtualized Platforms with PCI Passthr=
ough I/O Sharing, https://mediatum.ub.tum.de/doc/1187609/972322.pdf

[2]  Securing Self-Virtualizing Ethernet Devices, https://www.usenix.org/sys=
tem/files/conference/usenixsecurity15/sec15-paper-smolyar.pdf

[3]  Denial-of-Service Attacks on PCI Passthrough Devices, http://publicatio=
ns.andre-richter.com/richter2015denial.pdf

[4] Open Compute Open System Firmware, http://www.opencompute.org/wiki/Open_=
System_Firmware

[5] Open Compute Security, http://www.opencompute.org/wiki/Security

[6] Firmware attestation: https://www.platformsecuritysummit.com/prepare/#at=
testation


--Apple-Mail-D9592BEA-4955-4DC0-8121-42303959B0FA
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div></div><div>O=
n Apr 24, 2018, at 05:19, Lars Kurth &lt;<a href=3D"mailto:lars.kurth@citrix=
.com">lars.kurth@citrix.com</a>&gt; wrote:</div><div><br></div><blockquote t=
ype=3D"cite"><div><span>Hi all,</span><br><span>as agreed please find attach=
ed the meeting invite</span><br><span>Regards</span><br><span>Lars</span><br=
><span></span><br><span>## Agenda (provisional)</span><br><span>I copied wha=
t was discussed on this thread so far <a href=3D"https://docs.google.com/doc=
ument/d/1RWylmNmBXOrgGLARj6_ynK50P7SZPl4LpnmhGaPglJw/edit?usp=3Dsharing">htt=
ps://docs.google.com/document/d/1RWylmNmBXOrgGLARj6_ynK50P7SZPl4LpnmhGaPglJw=
/edit?usp=3Dsharing</a>, which I will use as pad to write down minutes. Feel=
 free to make agenda suggestions and copy relevant information into the doc,=
 prior to the meeting.</span><br></div></blockquote><br><div>I would like to=
 add an agenda item to discuss the level of security support that will be as=
serted in SUPPORT.md for driver domains which contain untrusted PCI devices.=
 &nbsp;Will Xen security support be different for SR-IOV devices? &nbsp;GPUs=
 vs. NICs?</div><div><br></div><div>There have been past discussions on this=
 topic and a proposed PCI-iommu-bugs.txt file to help Xen users and develope=
rs understand the risks [2][3][4] that may arise from a hostile device and p=
otentially buggy firmware. &nbsp;If we can document specific risks, we can a=
sk firmware developers to make specific improvements to improve the security=
 of PCI emulation.</div><div><br></div><div>There is an active effort [4] un=
derway to improve firmware security in servers (and eventually desktops), in=
cluding a reduction of attack surface due to SMM. &nbsp;There is also work u=
nderway [5][6] to perform secure boot between individual PCI devices and ser=
ver motherboards. &nbsp;Some of these concepts may already be deployed in Az=
ure.</div><div><br></div><div>Several stakeholders will be attending or pres=
enting at the PSEC [6] conference.</div><div><br></div><div>Rich</div><div><=
br></div><div>[1]&nbsp;Performance Isolation Exposure in Virtualized Platfor=
ms with PCI Passthrough I/O Sharing,&nbsp;<a href=3D"https://mediatum.ub.tum=
.de/doc/1187609/972322.pdf">https://mediatum.ub.tum.de/doc/1187609/972322.pd=
f</a></div><div><br></div><div>[2] &nbsp;Securing Self-Virtualizing Ethernet=
 Devices,&nbsp;<a href=3D"https://www.usenix.org/system/files/conference/use=
nixsecurity15/sec15-paper-smolyar.pdf">https://www.usenix.org/system/files/c=
onference/usenixsecurity15/sec15-paper-smolyar.pdf</a></div><div><br></div><=
div>[3] &nbsp;Denial-of-Service Attacks on PCI Passthrough Devices,&nbsp;<a h=
ref=3D"http://publications.andre-richter.com/richter2015denial.pdf">http://p=
ublications.andre-richter.com/richter2015denial.pdf</a></div><div><br></div>=
<div><div><span style=3D"background-color: rgba(255, 255, 255, 0);">[4] Open=
 Compute Open System Firmware,&nbsp;<a href=3D"http://www.opencompute.org/wi=
ki/Open_System_Firmware">http://www.opencompute.org/wiki/Open_System_Firmwar=
e</a></span></div></div><div><br></div><div>[5] Open Compute Security,&nbsp;=
<a href=3D"http://www.opencompute.org/wiki/Security">http://www.opencompute.=
org/wiki/Security</a></div><div><br></div><div>[6] Firmware attestation:&nbs=
p;<a href=3D"https://www.platformsecuritysummit.com/prepare/#attestation">ht=
tps://www.platformsecuritysummit.com/prepare/#attestation</a></div><div><br>=
</div></div></body></html>=

--Apple-Mail-D9592BEA-4955-4DC0-8121-42303959B0FA--


--===============0241977543943897326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0241977543943897326==--
