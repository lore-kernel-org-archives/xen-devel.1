From: Rich Persaud <persaur@gmail.com>
Subject: Re: x86 Community Call: Wed Oct 10,
 14:00 - 15:00 UTC - Call for agenda items
Date: Tue, 9 Oct 2018 16:32:44 -0400
Message-ID: <052DBDCC-CC76-4C1D-AA0F-D472870A7010@gmail.com>
References: <32C44945-4CE1-4118-94B9-1064B24872CF@citrix.com>
 <4460D131-1AB5-4BBA-BCA5-ACBF2852FE7B@citrix.com>
 <CABfawhkAYa0RSFAf_V44OSw2pxV75qr2Oh42LP_tx6Z32B5ggg@mail.gmail.com>
 <54320110-5cdb-82db-a03c-6c4e46cc6598@citrix.com>
 <04B1E6EF-0C14-4D8F-9AB7-EF5BF3F3DD46@citrix.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0830933498401434669=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ssjx=mv=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1g9ygU-0004Ky-60
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 20:32:50 +0000
Received: by mail-it1-x144.google.com with SMTP id c23-v6so4760108itd.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Oct 2018 13:32:47 -0700 (PDT)
In-Reply-To: <04B1E6EF-0C14-4D8F-9AB7-EF5BF3F3DD46@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Julien Grall <julien.grall@arm.com>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "Matt.Spencer@arm.com" <Matt.Spencer@arm.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, John Ji <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, Daniel Kiper <daniel.kiper@oracle.com>, "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, Xen-devel <xen-devel@lists.xenproject.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, "intel-xen@intel.com" <intel-xen@intel.com>, Jarvis.Roach@
List-Id: xen-devel@lists.xenproject.org


--===============0830933498401434669==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-4EA655D7-C4F7-44F0-8BA5-A29DA65F108D
Content-Transfer-Encoding: 7bit


--Apple-Mail-4EA655D7-C4F7-44F0-8BA5-A29DA65F108D
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Lars,

This NIST document ("A Methodology for Determining Forensic Data Requirement=
s for Detecting Hypervisor Attacks" [1]) appears to be focused on the applic=
ation of LibVMI in some contexts.  It is a NIST Interagency or Internal Repo=
rt (NISTIR) document with a narrower scope than other NIST publications, e.g=
. Special Publications (SP).  NISTIR documents are:

https://www.nist.gov/nist-research-library/nist-series-publications
"... Interim or final reports on work performed by NIST for outside sponsors=
 (both government and non-government).  May also report results of NIST proj=
ects of transitory or limited interest, including those that will be publish=
ed subsequently in more comprehensive form."

If the Xen community wishes to provide feedback on this NISTIR draft, I sugg=
est compiling a single document, including:

 - any inaccuracies + supporting references
 - vulnerability scope boundaries, including Xen hypervisor, Linux kernel af=
fecting KVM, KVM module for Linux kernel, QEMU and hypervisor toolstack(s)
 - additional sample attack(s) and evidence coverage for forensic analysis
 - additional references on hypervisor security / vulnerability analysis
 - missing perspectives (e.g. impact of features selected via KCONFIG, disag=
gregation)
 - other feedback

If a single list can be compiled, each item can be numbered and Xen communit=
y viewpoints can be aggregated for possible consensus in unified feedback, o=
r individuals could submit their feedback separately.

Rich

[1] https://csrc.nist.gov/CSRC/media/Publications/nistir/8221/draft/document=
s/nistir-8221-draft.pdf

> On Oct 9, 2018, at 14:20, Lars Kurth <lars.kurth@citrix.com> wrote:
>=20
> Hi all,
> I added a NIST Security Paper to the agenda which is currently under revie=
w and is full of inaccuracies and could potentially become very problematic t=
o the project and vendors using Xen if officially published by NIST without b=
eing corrected (it needs responses by the end of week). I will be struggling=
 to do this alone and would like to enlist help, in particular from people w=
ith a security background. That would also be significantly more powerful th=
an me providing the feedback.
> Regards
> Kars
>=20

--Apple-Mail-4EA655D7-C4F7-44F0-8BA5-A29DA65F108D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><s=
pan></span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D=
"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D=
"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-=
8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=3D"=
content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span>=
</span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D"t=
ext/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"l=
tr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"=
><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=3D"co=
ntent-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"><span></=
span></div><div dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D"tex=
t/html; charset=3Dutf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr=
"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><=
div dir=3D"ltr"></div><div dir=3D"ltr">Lars,</div><div dir=3D"ltr"><br></div=
><div dir=3D"ltr">This NIST document ("A Methodology for Determining Forensi=
c Data Requirements for Detecting Hypervisor Attacks" [1]) appears to be foc=
used on the application of LibVMI in some contexts. &nbsp;It is a NIST Inter=
agency or Internal Report (NISTIR) document with a&nbsp;<span style=3D"backg=
round-color: rgba(255, 255, 255, 0);">narrower scope than other NIST publica=
tions, e.g. Special Publications (SP). &nbsp;NISTIR documents are:</span></d=
iv><div dir=3D"ltr"><br></div><div dir=3D"ltr"><a href=3D"https://www.nist.g=
ov/nist-research-library/nist-series-publications">https://www.nist.gov/nist=
-research-library/nist-series-publications</a></div><div dir=3D"ltr">"...&nb=
sp;<span style=3D"background-color: rgba(255, 255, 255, 0);">Interim or fina=
l reports on work performed by&nbsp;NIST for outside sponsors (both governme=
nt and non-government).&nbsp;&nbsp;May also report results of&nbsp;NIST proj=
ects of transitory or limited interest, including those that will be publish=
ed subsequently in more comprehensive form."</span></div><div dir=3D"ltr"><s=
pan style=3D"background-color: rgba(255, 255, 255, 0);"><br></span></div><di=
v dir=3D"ltr">If the Xen community wishes to provide feedback on this NISTIR=
 draft, I suggest compiling a single document, including:</div><div dir=3D"l=
tr"><br></div><div dir=3D"ltr">&nbsp;- any inaccuracies + supporting referen=
ces</div><div dir=3D"ltr">&nbsp;- vulnerability scope boundaries, including X=
en hypervisor, Linux kernel affecting KVM, KVM module for Linux kernel, QEMU=
 and hypervisor toolstack(s)</div><div dir=3D"ltr">&nbsp;- additional sample=
 attack(s) and evidence coverage for forensic analysis</div><div dir=3D"ltr"=
>&nbsp;- additional references on hypervisor security / vulnerability analys=
is</div><div dir=3D"ltr"><span style=3D"background-color: rgba(255, 255, 255=
, 0);">&nbsp;- missing perspectives (e.g. impact of features selected via KC=
ONFIG, disaggregation)</span></div><div dir=3D"ltr">&nbsp;- other feedback</=
div><div dir=3D"ltr"><br></div><div dir=3D"ltr">If a single list can be comp=
iled, each item can be numbered and Xen community viewpoints can be aggregat=
ed for possible consensus in unified feedback, or individuals could submit t=
heir feedback separately.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">R=
ich</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">[1]&nbsp;<a href=3D"htt=
ps://csrc.nist.gov/CSRC/media/Publications/nistir/8221/draft/documents/nisti=
r-8221-draft.pdf">https://csrc.nist.gov/CSRC/media/Publications/nistir/8221/=
draft/documents/nistir-8221-draft.pdf</a></div><div dir=3D"ltr"><br>On Oct 9=
, 2018, at 14:20, Lars Kurth &lt;<a href=3D"mailto:lars.kurth@citrix.com">la=
rs.kurth@citrix.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><d=
iv dir=3D"ltr"><span>Hi all,</span><br><span>I added a NIST Security Paper t=
o the agenda which is currently under review and is full of inaccuracies and=
 could potentially become very problematic to the project and vendors using X=
en if officially published by NIST without being corrected (it needs respons=
es by the end of week). I will be struggling to do this alone and would like=
 to enlist help, in particular from people with a security background. That w=
ould also be significantly more powerful than me providing the feedback.</sp=
an><br><span>Regards</span><br><span>Kars</span><br><br></div></blockquote><=
/div></div></div></div></div></div></div></div></div></div></body></html>=

--Apple-Mail-4EA655D7-C4F7-44F0-8BA5-A29DA65F108D--


--===============0830933498401434669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0830933498401434669==--
