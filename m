From: Rich Persaud <persaur@gmail.com>
Subject: Re: Xen (both x86 and Arm) Community Call: Feb 13 -
 16:00 - 17:00 UTC - Call for Agenda Items
Date: Tue, 12 Feb 2019 20:31:58 -0500
Message-ID: <97C3A7EE-063A-4D73-975B-F133AF01C941@gmail.com>
References: <13380756-2FA8-4F12-ADAC-1AF590578F3E@xenproject.org>
 <75D16A2E-7DA5-403D-8F7B-6F71ED408270@xenproject.org>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0821549785665760367=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F1qi=QU=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1gtjP7-0003Bu-BA
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 01:32:01 +0000
Received: by mail-it1-x141.google.com with SMTP id l131so1756107ita.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 17:32:00 -0800 (PST)
In-Reply-To: <75D16A2E-7DA5-403D-8F7B-6F71ED408270@xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt Spencer <Matt.Spencer@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, "intel-xen@intel.com" <intel-xen@intel.c>
List-Id: xen-devel@lists.xenproject.org


--===============0821549785665760367==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-F3691BA5-04CB-4F29-818E-8971A9C981AF
Content-Transfer-Encoding: 7bit


--Apple-Mail-F3691BA5-04CB-4F29-818E-8971A9C981AF
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Feb 11, 2019, at 05:05, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
>=20
> Hi all,=20
>=20
> we have the community call for February coming up this Wednesday. My since=
re apologies, that I have not asked for agenda items last week. A current ag=
enda (primarily a skeleton) is available at  https://docs.google.com/documen=
t/d/15ZLzQcH794jufDZW1oNYVY2D12CnVqxQ-klFAqkd2bU/edit#heading=3Dh.mz1wjb9vek=
jn
>=20
> Please propose topics by either editing the running agenda document at htt=
ps://docs.google.com/document/d/1Ufv9XcQO0zIAVeFbFCAHAeEIB9Ap4Y4srAm4vI8I01I=
/edit# or by replying to the mail. Ideally by a few hours before the meeting=
!

Proposed agenda items:

1.  Tailored instances of Xen: continuing the Nov 2018 discussion of KCONFIG=
/L0  hypervisor use cases.  More details upcoming via wiki page.

2.  Macro supply chains:  what are best practices for maintaining Xen macros=
 which originate in other open-source communities, e.g. QEMU or Linux?  Woul=
d each macro benefit from a documented status (e.g. "Ignore upstream changes=
", "Monitor upstream changes", "Mirror upstream changes") with associated to=
oling?

3. Go toolchain:  is there community interest in collaborating on the develo=
pment of golang tools for local management of Xen?  Historically, OpenXT use=
d a combination of Haskell and Ocaml tools.  Some OpenXT community members a=
re using golang with Xen. Could these new tools find a home in upstream Xen?=


4. NVME passthrough performance: this is improved when VMEXITs are avoided b=
y using "posted interrupts" [1] available on Broadwell and later Xeon proces=
sors or AWS nested hypervisor "metal" [2].  For commodity x86 CPUs which do n=
ot have posted interrupts, Linux [3] and Hyper-V [4] have used "hybrid polli=
ng" to achieve good I/O performance at the cost of CPU cycles.  Is this appl=
icable to Xen?

Rich

[1] "VT-d Posted Interrupts" - Intel, 2012
https://events.static.linuxfound.org/sites/events/files/slides/VT-d%20Posted=
%20Interrupts-final%20.pdf
https://www.linux-kvm.org/images/7/70/2012-forum-nakajima_apicv.pdf

[2] Running Thousands of KVM Guests on Amazon i3.metal Instances, twosix, 20=
17
https://www.twosixlabs.com/running-thousands-of-kvm-guests-on-amazons-new-i3=
-metal-instances/

[3] "I/O Latency Optimization with Polling" - Western Digital, 2017
https://events.static.linuxfound.org/sites/events/files/slides/lemoal-nvme-p=
olling-vault-2017-final_0.pdf

[4] "Achieving 10-Million IOPS from a single VM on Windows Hyper-V" - MS, 20=
18
https://www.snia.org/sites/default/files/SDC/2018/presentations/Cloud_Storag=
e/Yang_L_Zhu_D_Achieving_10-Million_IOPS_from_a_single_VM_on_Windows_Hyper-V=
.pdf


--Apple-Mail-F3691BA5-04CB-4F29-818E-8971A9C981AF
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><div dir=3D"ltr"=
><span></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" conte=
nt=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div d=
ir=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"></div><div dir=3D"ltr">On Feb 11, 2019, at 05:05, La=
rs Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com">lars.kurth.xen@gmai=
l.com</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><blockquote type=3D"cit=
e"><div dir=3D"ltr"><meta http-equiv=3D"Content-Type" content=3D"text/html; c=
harset=3Dus-ascii"><p style=3D"margin: 0px 0px 2px 6px; font-stretch: normal=
; line-height: normal;" class=3D""><font color=3D"rgba(0, 0, 0, 0.85098)" fa=
ce=3D"Helvetica Neue" class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0=
.85098);" class=3D"">Hi all,&nbsp;</span></font></p><p style=3D"margin: 0px 0=
px 2px 6px; font-stretch: normal; line-height: normal;" class=3D""><font col=
or=3D"rgba(0, 0, 0, 0.85098)" face=3D"Helvetica Neue" class=3D""><span style=
=3D"caret-color: rgba(0, 0, 0, 0.85098);" class=3D""><br class=3D""></span><=
/font></p><p style=3D"margin: 0px 0px 2px 6px; font-stretch: normal; line-he=
ight: normal;" class=3D""><font face=3D"Helvetica Neue" class=3D""><font col=
or=3D"rgba(0, 0, 0, 0.85098)" class=3D""><span style=3D"caret-color: rgba(0,=
 0, 0, 0.85098);" class=3D"">we have the community&nbsp;</span></font><font c=
olor=3D"#000085" class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.8509=
8);" class=3D"">call</span></font><font color=3D"rgba(0, 0, 0, 0.85098)" cla=
ss=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098);" class=3D"">&nbs=
p;for February coming up this Wednesday. My sincere apologies, that I have n=
ot asked for agenda items&nbsp;</span></font><font color=3D"#000085" class=3D=
""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098);" class=3D"">last week=
. A current agenda (primarily a skeleton) is available at&nbsp;</span></font=
></font><font face=3D"Helvetica Neue" class=3D""><font color=3D"rgba(0, 0, 0=
, 0.85098)" class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098);" c=
lass=3D"">&nbsp;</span></font></font><font color=3D"#000085" face=3D"Helveti=
ca Neue" class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098);" cla=
ss=3D""><a href=3D"https://docs.google.com/document/d/15ZLzQcH794jufDZW1oNYV=
Y2D12CnVqxQ-klFAqkd2bU/edit#heading=3Dh.mz1wjb9vekjn" class=3D"">https://doc=
s.google.com/document/d/15ZLzQcH794jufDZW1oNYVY2D12CnVqxQ-klFAqkd2bU/edit#he=
ading=3Dh.mz1wjb9vekjn</a></span></font></p><div class=3D""><br class=3D""><=
/div><p style=3D"margin: 0px 0px 2px 6px; font-stretch: normal; line-height:=
 normal;" class=3D""><font color=3D"rgba(0, 0, 0, 0.85098)" face=3D"Helvetic=
a Neue" class=3D""><span style=3D"caret-color: rgba(0, 0, 0, 0.85098);" clas=
s=3D"">Please propose topics by either editing the running agenda document a=
t <a href=3D"https://docs.google.com/document/d/1Ufv9XcQO0zIAVeFbFCAHAeEIB9A=
p4Y4srAm4vI8I01I/edit#" class=3D"">https://docs.google.com/document/d/1Ufv9X=
cQO0zIAVeFbFCAHAeEIB9Ap4Y4srAm4vI8I01I/edit#</a> or by replying to the mail.=
 Ideally by a few hours before the meeting!</span></font></p><p style=3D"mar=
gin: 0px 0px 2px 6px; font-stretch: normal; line-height: normal;" class=3D""=
></p></div></blockquote><div><div><br></div><div>Proposed agenda items:</div=
><div><br></div><div>1. &nbsp;Tailored instances of Xen: continuing the Nov 2=
018 discussion of KCONFIG/L0 &nbsp;hypervisor use cases. &nbsp;More details u=
pcoming via wiki page.</div><div><br></div><div>2. &nbsp;Macro supply chains=
: &nbsp;what are best practices for maintaining Xen macros which originate i=
n other open-source communities, e.g. QEMU or Linux? &nbsp;Would each macro b=
enefit from a documented status (e.g. "Ignore upstream changes", "Monitor up=
stream changes", "Mirror upstream changes") with associated tooling?</div><d=
iv><br></div><div>3. Go toolchain: &nbsp;is there community interest in coll=
aborating on the development of golang tools for local management of Xen? &n=
bsp;Historically, OpenXT used a combination of Haskell and Ocaml tools. &nbs=
p;Some OpenXT community members are using golang with Xen. Could these new t=
ools find a home in upstream Xen?</div><div><br></div><div>4. NVME passthrou=
gh performance: this is improved when VMEXITs are avoided by using "posted i=
nterrupts" [1] available on Broadwell and later Xeon processors or AWS neste=
d hypervisor "metal" [2]. &nbsp;For commodity x86 CPUs which do not have pos=
ted interrupts, Linux [3] and Hyper-V [4] have used "hybrid polling" to achi=
eve good I/O performance at the cost of CPU cycles. &nbsp;Is this applicable=
 to Xen?</div><div><br></div><div>Rich</div><div><br></div><div>[1] "VT-d Po=
sted Interrupts" - Intel, 2012</div><div><a href=3D"https://events.static.li=
nuxfound.org/sites/events/files/slides/VT-d%20Posted%20Interrupts-final%20.p=
df">https://events.static.linuxfound.org/sites/events/files/slides/VT-d%20Po=
sted%20Interrupts-final%20.pdf</a></div><div><a href=3D"https://www.linux-kv=
m.org/images/7/70/2012-forum-nakajima_apicv.pdf">https://www.linux-kvm.org/i=
mages/7/70/2012-forum-nakajima_apicv.pdf</a></div><div><br></div><div>[2] Ru=
nning Thousands of KVM Guests on Amazon i3.metal Instances, twosix, 2017</di=
v><div><a href=3D"https://www.twosixlabs.com/running-thousands-of-kvm-guests=
-on-amazons-new-i3-metal-instances/">https://www.twosixlabs.com/running-thou=
sands-of-kvm-guests-on-amazons-new-i3-metal-instances/</a></div><div><br></d=
iv><div>[3] "I/O Latency Optimization with Polling" - Western Digital, 2017<=
/div><div><a href=3D"https://events.static.linuxfound.org/sites/events/files=
/slides/lemoal-nvme-polling-vault-2017-final_0.pdf">https://events.static.li=
nuxfound.org/sites/events/files/slides/lemoal-nvme-polling-vault-2017-final_=
0.pdf</a></div><div><br></div><div>[4] "Achieving 10-Million IOPS from a sin=
gle VM on Windows Hyper-V" - MS, 2018</div><div><a href=3D"https://www.snia.=
org/sites/default/files/SDC/2018/presentations/Cloud_Storage/Yang_L_Zhu_D_Ac=
hieving_10-Million_IOPS_from_a_single_VM_on_Windows_Hyper-V.pdf">https://www=
.snia.org/sites/default/files/SDC/2018/presentations/Cloud_Storage/Yang_L_Zh=
u_D_Achieving_10-Million_IOPS_from_a_single_VM_on_Windows_Hyper-V.pdf</a></d=
iv></div><div><br></div></div></div></div></div></body></html>=

--Apple-Mail-F3691BA5-04CB-4F29-818E-8971A9C981AF--


--===============0821549785665760367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0821549785665760367==--
