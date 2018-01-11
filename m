From: Rich Persaud <persaur@gmail.com>
Subject: Consensus in Parallel Universe Responses to
	Spectre/Meltdown
Date: Wed, 10 Jan 2018 22:38:59 -0500
Message-ID: <59386D6B-B3B2-4BBD-9D75-9C7EF34F2EE5@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============7441417965779394907=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, DougGoldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Committers <committers@xenproject.org>, Anthony Liguori <aliguori@amazon.com>, "security@xen.org" <security@xen.org>, Anthony Liguori <anthony@codemonkey.ws>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7441417965779394907==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-15521C92-342B-4141-A0F1-8CA9E8CE6226


--Apple-Mail-15521C92-342B-4141-A0F1-8CA9E8CE6226
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Jan 10, 2018, at 11:39, Ian Jackson <ian.jackson@eu.citrix.com> wrote:
>=20
> Jan Beulich writes ("Re: Radical proposal v2: Publish Amazon's verison now=
, Citrix's version soon"):
>> There are a couple of instances of "a branch", and I'm not really
>> clear on which one that would be, yet in part my opinion depends
>> on that, as this will affect what state certain branches will be in
>> for subsequent work. As I agree with the PVH shim being the
>> better baseline for work going forward, in particular I wouldn't like
>> to see the Vixen series becoming the base of any branch going to
>> be maintained going forward.
>=20
> Anthony Liguori writes ("Re: [Xen-devel] Radical proposal v2: Publish Amaz=
on's verison now, Citrix's version soon"):
>> What I would suggest is the following:
>> 1) Merge Vixen into staging
>> 2) Backport Vixen into stable-4.10 and cut a release
>=20
> We do not have time any longer (if we had time to start with) to
> reconcile these divergent views.

[ Disclaimer: non-technical, PM-oriented message ahead.  Opinions expressed a=
re those of this individual and not former/current employers or clients. ]

Having worked with Xen since 2005, helping to ship XenServer, XenClient and O=
penXT, I would like to challenge assertions that the community of Xen (or $H=
W_vendor or $OS_vendor or $APP_vendor) developers and users must settle for a=
 non-consensus long-term mitigation.

Across the computer industry, it is clear that a small subset of specialists=
 have known about this issue for some time:  developers who worked on candid=
ate fixes ahead of the public announcement, experts who warned about microar=
chitecture risks years ago, and any adversaries who acted on their warnings.=
  Some people had advance information & time to consider candidate solutions=
, most [1] of the world did not.

As a customer of $HW_vendor / Xen / $OS_vendor / $APP_vendor, the last thing=
 I want to hear is that world-class specialists who have had weeks/months to=
 evaluate candidate fixes have been unable to reach agreement and propose to=
 delegate the decision TO CUSTOMERS (?!)  That would be customers with only d=
ays of exposure to the CVE details, who still have to keep their regular bus=
iness running, while trying to understand a complex security issue that elud=
ed experts for decades.

As a general-purpose open-source hypervisor not tied to one operating system=
 or use case, Xen has always been susceptible to fragmentation.  It can seem=
 easier to make private modifications vs. upstreaming/revising changes for a=
cceptance to a public codebase that serves many stakeholders.  The non-upstr=
eamed Xen forks of Amazon EC2, Citrix XenClient and Bromium have made the Xe=
n community less strong, by reducing public Xen contributions, including but=
 not limited to security.

Yet=E2=80=A6 a once-in-decades (?) security issue has brought forth a public=
 contribution from the private, parallel Xen universe that is Amazon EC2, ac=
companied by engineering resources to review and test a long-term solution t=
hat could be acceptable to the public Xen codebase.  If merged, this contrib=
ution could reduce fragmentation, increase dev/test resources and expand the=
 risk pool of Xen customers sharing a common, battle-tested mitigation.  Rec=
onciliation of private/public Xen universes is never easy, but in this uniqu=
e instance it would make the Xen community stronger.

Notes:

1) PVH is widely acknowledged as the long-term future of Xen.  The recent se=
curity issue makes it even more important that PVH be well designed and wide=
ly tested with resources from the broader Xen community.  Strategic PVH impr=
ovements need not be rushed to solve a tactical security issue. There are a n=
umber of Xen and security companies who have not yet contributed to recent p=
ublic Xen design discussions, including Bromium.  If there is lack of design=
 consensus, we can call upon additional Xen contributors to help achieve con=
sensus.

2) Security:  large swathes of customers in many markets have neither the ti=
me nor expertise to make complex security decisions which involve functional=
 tradeoffs and non-obvious interactions among opaque operating systems, micr=
ocode and hardware.  This category of customer wants to know that, (a) they a=
re no worse off than "most" other customers, (b) they are on a supported pat=
h that will lead to a widely deployed long-term solution, and (c) they have c=
lear documentation on operational constraints during their journey from temp=
orary fix to long-term solution.

3) Community:  given the unprecedented nature of this Amazon code contributi=
on, it is in the interest of the Xen community for Amazon EC2 to migrate to a=
 solution that is used by upstream Xen customers.  This requires an incremen=
tal, bisectable path between already-deployed EC2 Vixen and in-development P=
VH shim.  The reason for the Xen community to support this approach, however=
 difficult, is to un-fork Amazon's version of Xen, in exchange for expanding=
 the pool of Xen deployments which share a common risk profile.

Henry Baker posted [2] to the Cryptography mailing list about optimistic con=
currency control:

"=E2=80=A6 Speculation is an extremely common, and an entirely human, reacti=
on to *latency*. If the latency of some operation is too long, we pretend th=
at the most common case is occurring and try to fix things later if/when we f=
ind out that we've been wrong =E2=80=A6 Only in the 20th and 21st centuries h=
ave we had the luxury of speed-of-light communications and sub-second latenc=
ies, so that we can often replace *optimistic* concurrency control with *pes=
simistic* concurrency control.  When an ancient Roman general took his army o=
ver the horizon, he might be out of contact for *months*, so pessimistic con=
currency control simply wasn't an option. If he screwed up, the only option w=
as to send *another general and another army* over the horizon to repair the=
 damage that the first general and army had caused."
Some teams working with Xen appear to have developed independent (?) mitigat=
ions for Spectre/Meltdown, in advance of public disclosure.  Some of those m=
itigations have already shipped to commercial customers.  By definition, eac=
h parallel, private effort addressed a narrower set of requirements than tho=
se of the broader Xen community.  We have now moved onto real-time coordinat=
ion where early private assumptions can be revisited in public, as we seek c=
onsensus on a unified, long-term solution and timeline for addressing every i=
ndividual PV feature regression.
Each privately developed mitigation may be useful to a subset of Xen users. =
 Each can be hosted in a short-lived branch, with documentation of tradeoffs=
 and an index of all mitigation branches.  Organizations with the time and r=
esources to evaluate these short-lived branches may adopt one that matches t=
heir constraints.  But the broader Xen community needs consensus on the path=
 to a unified solution that can be merged to release trees *and widely deplo=
yed*.
However long it takes to realize broad consensus on a solution for release b=
ranches, consensus is what customers expect in a critical fix from a trusted=
 open-source provider of general-purpose virtualization.  If customers were s=
atisfied with less, they would be using a more narrowly-focused hypervisor. =
 We can educate users that for many software stacks, Spectre/Meltdown is not=
 a "patch and forget" security issue, but one that will have industry-wide o=
perational and economic impact for months/years.
Rich
[1] https://techcrunch.com/2018/01/06/how-tier-2-cloud-vendors-banded-togeth=
er-to-cope-with-spectre-and-meltdown/
[2] http://www.metzdowd.com/pipermail/cryptography/2018-January/033541.html


--Apple-Mail-15521C92-342B-4141-A0F1-8CA9E8CE6226
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><blockquote type=3D"cite"><span>On Jan 10, 2018, at 11:39, Ian J=
ackson &lt;<a href=3D"mailto:ian.jackson@eu.citrix.com">ian.jackson@eu.citri=
x.com</a>&gt; wrote:</span><br></blockquote><blockquote type=3D"cite"><span>=
</span><br></blockquote><blockquote type=3D"cite"><span>Jan Beulich writes (=
"Re: Radical proposal v2: Publish Amazon's verison now, Citrix's version soo=
n"):</span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>There are a couple of instances of "a branch", and I'm not really<=
/span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote ty=
pe=3D"cite"><span>clear on which one that would be, yet in part my opinion d=
epends</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>on that, as this will affect what state certain bra=
nches will be in</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>for subsequent work. As I agree with the P=
VH shim being the</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>better baseline for work going forward, i=
n particular I wouldn't like</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>to see the Vixen series becom=
ing the base of any branch going to</span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>be maintained going fo=
rward.</span><br></blockquote></blockquote><blockquote type=3D"cite"><span><=
/span><br></blockquote><blockquote type=3D"cite"><span>Anthony Liguori write=
s ("Re: [Xen-devel] Radical proposal v2: Publish Amazon's verison now, Citri=
x's version soon"):</span><br></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>What I would suggest is the following:</span><br></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<span>1) Merge Vixen into staging</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>2) Backport Vixen into s=
table-4.10 and cut a release</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span=
>We do not have time any longer (if we had time to start with) to</span><br>=
</blockquote><blockquote type=3D"cite"><span>reconcile these divergent views=
.</span><br></blockquote><span></span><br><span>[ Disclaimer: non-technical,=
 PM-oriented message ahead. &nbsp;Opinions expressed are those of this indiv=
idual and not former/current employers or clients. ]</span><br><span></span>=
<br><span>Having worked with Xen since 2005, helping to ship XenServer, XenC=
lient and OpenXT, I would like to challenge assertions that the community of=
 Xen (or $HW_vendor or $OS_vendor or $APP_vendor) developers and users must s=
ettle for a non-consensus long-term mitigation.</span><br><span></span><br><=
span>Across the computer industry, it is clear that a small subset of specia=
lists have known about this issue for some time: &nbsp;developers who worked=
 on candidate fixes ahead of the public announcement, experts who warned abo=
ut microarchitecture risks years ago, and any adversaries who acted on their=
 warnings. &nbsp;Some people had advance information &amp; time to consider c=
andidate solutions, most [1] of the world did not.</span><br><span></span><b=
r><span>As a customer of $HW_vendor / Xen / $OS_vendor / $APP_vendor, the la=
st thing I want to hear is that world-class specialists who have had weeks/m=
onths to evaluate candidate fixes have been unable to reach agreement and pr=
opose to delegate the decision TO CUSTOMERS (?!) &nbsp;That would be custome=
rs with only days of exposure to the CVE details, who still have to keep the=
ir regular business running, while trying to understand a complex security i=
ssue that eluded experts for decades.</span><br><span></span><br><span>As a g=
eneral-purpose open-source hypervisor not tied to one operating system or us=
e case, Xen has always been susceptible to fragmentation. &nbsp;It can seem e=
asier to make private modifications vs. upstreaming/revising changes for acc=
eptance to a public codebase that serves many stakeholders. &nbsp;The non-up=
streamed Xen forks of Amazon EC2, Citrix XenClient and Bromium have made the=
 Xen community less strong, by reducing public Xen contributions, including b=
ut not limited to security.</span><br><span></span><br><span>Yet=E2=80=A6 a o=
nce-in-decades (?) security issue has brought forth a public contribution fr=
om the private, parallel Xen universe that is Amazon EC2, accompanied by eng=
ineering resources to review and test a long-term solution that could be acc=
eptable to the public Xen codebase. &nbsp;If merged, this contribution could=
 reduce fragmentation, increase dev/test resources and expand the risk pool o=
f Xen customers sharing a common, battle-tested mitigation. &nbsp;Reconcilia=
tion of private/public Xen universes is never easy, but in this unique insta=
nce it would make the Xen community stronger.</span><br><span></span><br><sp=
an>Notes:</span><br><span></span><br><span>1) PVH is widely acknowledged as t=
he long-term future of Xen. &nbsp;The recent security issue makes it even mo=
re important that PVH be well designed and widely tested with resources from=
 the broader Xen community. &nbsp;Strategic PVH improvements need not be rus=
hed to solve a tactical security issue. There are a number of Xen and securi=
ty companies who have not yet contributed to recent public Xen design discus=
sions, including Bromium. &nbsp;If there is lack of design consensus, we can=
 call upon additional Xen contributors to help achieve consensus.</span><br>=
<span></span><br><span>2) Security: &nbsp;large swathes of customers in many=
 markets have neither the time nor expertise to make complex security decisi=
ons which involve functional tradeoffs and non-obvious interactions among op=
aque operating systems, microcode and hardware. &nbsp;This category of custo=
mer wants to know that, (a) they are no worse off than "most" other customer=
s, (b) they are on a supported path that will lead to a widely deployed long=
-term solution, and (c) they have clear documentation on operational constra=
ints during their journey from temporary fix to long-term solution.</span><b=
r><span></span><br><span>3) Community: &nbsp;given the unprecedented nature o=
f this Amazon code contribution, it is in the interest of the Xen community f=
or Amazon EC2 to migrate to a solution that is used by upstream Xen customer=
s. &nbsp;This requires an incremental, bisectable path between already-deplo=
yed EC2 Vixen and in-development PVH shim. &nbsp;The reason for the Xen comm=
unity to support this approach, however difficult, is to un-fork Amazon's ve=
rsion of Xen, in exchange for expanding the pool of Xen deployments which sh=
are a common risk profile.</span><br><span></span><br>Henry Baker posted [2]=
 to the Cryptography mailing list about optimistic concurrency control:</div=
><div><br></div><div><i>"=E2=80=A6&nbsp;<span style=3D"background-color: rgb=
a(255, 255, 255, 0);">Speculation is an extremely common, and an entirely hu=
man, reaction to *latency*.  If the latency of some operation is too long, w=
e pretend that the most common case is occurring and try to fix things later=
 if/when we find out that we've been wrong&nbsp;</span></i><i style=3D"backg=
round-color: rgba(255, 255, 255, 0);">=E2=80=A6&nbsp;Only in the 20th and 21=
st centuries have we had the luxury of speed-of-light communications and sub=
-second latencies, so that we can often replace *optimistic* concurrency con=
trol with *pessimistic* concurrency control. &nbsp;</i><i><span style=3D"bac=
kground-color: rgba(255, 255, 255, 0);">When an ancient Roman general took h=
is army over the horizon, he might be out of contact for *months*, so pessim=
istic concurrency control simply wasn't an option.  If he screwed up, the on=
ly option was to send *another general and another army* over the horizon to=
 repair the damage that the first general and army had caused.</span><span s=
tyle=3D"-webkit-text-size-adjust: auto; background-color: rgb(255, 255, 255)=
;">"</span></i></div><div><pre><font face=3D"UICTFontTextStyleTallBody"><spa=
n style=3D"white-space: normal; background-color: rgba(255, 255, 255, 0);">S=
ome teams working with Xen appear to have developed independent (?) mitigati=
ons for Spectre/Meltdown, in advance of public disclosure. &nbsp;Some of tho=
se mitigations have already shipped to commercial customers. &nbsp;By defini=
tion, each parallel, private effort addressed a narrower set of requirements=
 than those of the broader Xen community. &nbsp;We have now moved onto real-=
time coordination where early private assumptions can be revisited in public=
, as we seek consensus on a unified, long-term solution and timeline for add=
ressing every individual PV feature regression.</span></font></pre><pre><fon=
t face=3D"UICTFontTextStyleTallBody"><span style=3D"white-space: normal; bac=
kground-color: rgba(255, 255, 255, 0);">Each privately developed mitigation m=
ay be useful to a subset of Xen users. &nbsp;Each can be hosted in a short-l=
ived branch, with documentation of tradeoffs and an index of all mitigation b=
ranches. &nbsp;Organizations with the time and resources to evaluate these s=
hort-lived branches may adopt one that matches their constraints. &nbsp;But t=
he broader Xen community needs consensus on the path to a unified solution t=
hat can be merged to release trees *and widely deployed*.</span></font></pre=
><pre><span style=3D"white-space: normal; background-color: rgba(255, 255, 2=
55, 0); font-family: UICTFontTextStyleTallBody;">However long it takes to re=
alize broad consensus on a solution for release branches, consensus is what c=
ustomers expect in a critical fix from a trusted open-source provider of gen=
eral-purpose virtualization. &nbsp;If customers were satisfied with less, th=
ey would be using a more narrowly-focused hypervisor. &nbsp;We can educate u=
sers that for many software stacks, Spectre/Meltdown is not a "patch and for=
get" security issue, but one that will have industry-wide operational and ec=
onomic impact for months/years.</span></pre><pre><font face=3D"UICTFontTextS=
tyleTallBody"><span style=3D"white-space: normal; background-color: rgba(255=
, 255, 255, 0);">Rich</span></font></pre><pre><span style=3D"-webkit-text-si=
ze-adjust: auto; background-color: rgb(255, 255, 255);">[1] </span><a href=3D=
"https://techcrunch.com/2018/01/06/how-tier-2-cloud-vendors-banded-together-=
to-cope-with-spectre-and-meltdown/">https://techcrunch.com/2018/01/06/how-ti=
er-2-cloud-vendors-banded-together-to-cope-with-spectre-and-meltdown/</a></p=
re><pre><span style=3D"white-space: normal; background-color: rgba(255, 255,=
 255, 0); font-family: UICTFontTextStyleTallBody;">[2] </span><a href=3D"htt=
p://www.metzdowd.com/pipermail/cryptography/2018-January/033541.html" style=3D=
"white-space: normal; background-color: rgba(255, 255, 255, 0); font-family:=
 UICTFontTextStyleTallBody;">http://www.metzdowd.com/pipermail/cryptography/=
2018-January/033541.html</a></pre></div></div><div><br></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></body></html>=

--Apple-Mail-15521C92-342B-4141-A0F1-8CA9E8CE6226--


--===============7441417965779394907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7441417965779394907==--
