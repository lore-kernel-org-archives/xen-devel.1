From: Rich Persaud <persaur@gmail.com>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th
Date: Sat, 12 May 2018 13:38:36 -0400
Message-ID: <49358881-974F-4949-8FF7-9B0F804A9632@gmail.com>
References: <5D69D457-6EAB-4FF9-AF94-3D818F9035EC@citrix.com>
 <4d359a64b6bc43b9a489a0754c4b4ae8@dornerworks.com>
 <999c02cc-31b1-c404-7f88-84789c0d84b0@epam.com>
 <alpine.DEB.2.10.1804061323500.6016@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1805071708060.4953@sstabellini-ThinkPad-X260>
 <78c07b55-c301-598e-3894-009f2bdda1ac@arm.com>
 <alpine.DEB.2.10.1805080841580.4953@sstabellini-ThinkPad-X260>
 <CABcWhv4qY62_0vhAVGOz1y0hsqkRn4WQ8=UW_JnEXk5NhpTVDA@mail.gmail.com>
 <alpine.DEB.2.10.1805101244360.9199@sstabellini-ThinkPad-X260>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============2568748233628509131=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gm94=h7=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1fHYTf-0008KE-Ln
 for xen-devel@lists.xenproject.org; Sat, 12 May 2018 17:38:39 +0000
Received: by mail-qk0-x235.google.com with SMTP id d125-v6so6917271qkb.8
 for <xen-devel@lists.xenproject.org>; Sat, 12 May 2018 10:38:38 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1805101244360.9199@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, Davorin Mista <davorin.mista@aggios.com>, "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, dgdegra@tycho.nsa.gov, paul_luperto@prqa.com, Denys Balatsko <denys.balatsko@globallogic.com>, julien.grall@arm.com, Rich Persaud <persaur@gmail.com>, vfachin@de.adit-jv.com, anastassios.nanos@onapp.com, Praveen Kumar <kpraveen.lkml@gmail.com>, robin.randhawa@arm.com, committers@xenproject.org, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>, Jonathan Daugherty <jtd@galois.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, =?utf-8?Q?Mirela_Simonovi=C4=87?= <mirela.simonovic@aggios.com>, Jarvis Roach <Jarvis.Roach@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org


--===============2568748233628509131==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-8B4FD762-74AA-404D-A66D-5721AD6831A8
Content-Transfer-Encoding: 7bit


--Apple-Mail-8B4FD762-74AA-404D-A66D-5721AD6831A8
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On May 10, 2018, at 15:51, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 10 May 2018, Praveen Kumar wrote:
>>> Yeah, you are right. It looks like turning Dom0 into a DomU is not good
>>> enough. Maybe for this option to be viable we would actually have to
>>> terminate (or pause and never unpause?) dom0 after boot.
>>=20
>> Just a thought !
>> How about keeping Dom0 still be there, but DomUs given Dom0 privilege, wi=
th
>> restricted permission on mission critical resources ? And if anyhow Dom0
>> crashes,
>> the best contended among the existing DomUs take the ownership of Dom0 ?
>=20
> I don't think this is easily doable, also it wouldn't solve the issue of
> removing dom0 from the system. But see below.
>=20
>=20
>>>> However, you surely need an entity to handle domain crash. You don't
>> want to
>>>> reboot your platform (and therefore you safety critical domain) for a
>> crashed
>>>> UI, right? So how this is going to be handled in your option?
>>=20
>>> We need to understand the certification requirements better to know the
>>> answer to this. I am guessing that UI crashes are not handled from the
>>> certification point of view -- maybe we only need to demonstrate that
>>> the system is not affected by them?
>>=20
>> Where can we find the certification requirements details ?
>=20
> Yes, I think we need to understand the requirements better to figure out
> the right way forward for Dom0.
>=20
> For instance, here is another idea: we could have Xen boot multiple
> domains at boot time from device tree, as suggested in the dom0-less
> approach. All of the domains booted from Xen are "mission-critical". The
> first domain could still be dom0. Once booted, Dom0 can start other VMs,
> however, Xen would restrict Dom0 from doing any operations affecting the
> first set of mission-critical domains.
>=20
> This way, we would get the flexibility of being able to start/stop
> domains at run time, but at the same time we might still be able to
> avoid certifications for Dom0, because Dom0 cannot affect the mission
> critical applications.
>=20
> Is this approach actually feasible? We need to read the requirements to
> know. I am hoping Artem will chime in on this :-)

Is any of the x86 hardware domain (non dom0) work applicable to Arm?
https://lists.xenproject.org/archives/html/xen-devel/2014-03/msg00314.html

Daniel is giving a talk on TCB reduction with a Xen hardware domain:
http://platformsecuritysummit.com/#degraaf

Rich=

--Apple-Mail-8B4FD762-74AA-404D-A66D-5721AD6831A8
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div><span></span></div><div><div></div><di=
v>On May 10, 2018, at 15:51, Stefano Stabellini &lt;<a href=3D"mailto:sstabe=
llini@kernel.org">sstabellini@kernel.org</a>&gt; wrote:</div><div><br></div>=
<blockquote type=3D"cite"><span>On Thu, 10 May 2018, Praveen Kumar wrote:</s=
pan><br><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Yeah, you a=
re right. It looks like turning Dom0 into a DomU is not good</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>enough. Maybe for this option to be viable we would actually have to</spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>terminate (or pause and never unpause?) dom0 after boot.</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>Just a thought !</span><br></block=
quote><blockquote type=3D"cite"><span>How about keeping Dom0 still be there,=
 but DomUs given Dom0 privilege, with</span><br></blockquote><blockquote typ=
e=3D"cite"><span>restricted permission on mission critical resources ? And i=
f anyhow Dom0</span><br></blockquote><blockquote type=3D"cite"><span>crashes=
,</span><br></blockquote><blockquote type=3D"cite"><span>the best contended a=
mong the existing DomUs take the ownership of Dom0 ?</span><br></blockquote>=
<span></span><br><span>I don't think this is easily doable, also it wouldn't=
 solve the issue of</span><br><span>removing dom0 from the system. But see b=
elow.</span><br><span></span><br><span></span><br><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>However, you surel=
y need an entity to handle domain crash. You don't</span><br></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><span>want to</span><br></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>reboot your platform (and therefore you safety critical d=
omain) for a</span><br></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><span>crashed</span><br></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span>UI, right? So how t=
his is going to be handled in your option?</span><br></blockquote></blockquo=
te></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>We need to understand t=
he certification requirements better to know the</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>answer to=
 this. I am guessing that UI crashes are not handled from the</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>certification point of view -- maybe we only need to demonstrate that</s=
pan><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span>the system is not affected by them?</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockqu=
ote type=3D"cite"><span>Where can we find the certification requirements det=
ails ?</span><br></blockquote><span></span><br><span>Yes, I think we need to=
 understand the requirements better to figure out</span><br><span>the right w=
ay forward for Dom0.</span><br><span></span><br><span>For instance, here is a=
nother idea: we could have Xen boot multiple</span><br><span>domains at boot=
 time from device tree, as suggested in the dom0-less</span><br><span>approa=
ch. All of the domains booted from Xen are "mission-critical". The</span><br=
><span>first domain could still be dom0. Once booted, Dom0 can start other V=
Ms,</span><br><span>however, Xen would restrict Dom0 from doing any operatio=
ns affecting the</span><br><span>first set of mission-critical domains.</spa=
n><br><span></span><br><span>This way, we would get the flexibility of being=
 able to start/stop</span><br><span>domains at run time, but at the same tim=
e we might still be able to</span><br><span>avoid certifications for Dom0, b=
ecause Dom0 cannot affect the mission</span><br><span>critical applications.=
</span><br><span></span><br><span>Is this approach actually feasible? We nee=
d to read the requirements to</span><br><span>know. I am hoping Artem will c=
hime in on this :-)</span><br></blockquote><br><div>Is any of the x86 hardwa=
re domain (non dom0) work applicable to Arm?</div><div><a href=3D"https://li=
sts.xenproject.org/archives/html/xen-devel/2014-03/msg00314.html">https://li=
sts.xenproject.org/archives/html/xen-devel/2014-03/msg00314.html</a></div><d=
iv><br></div><div>Daniel is giving a talk on TCB reduction with a Xen hardwa=
re domain:</div><div><a href=3D"http://platformsecuritysummit.com/#degraaf">=
http://platformsecuritysummit.com/#degraaf</a></div><div><br></div><div>Rich=
</div></div></div></div></div></body></html>=

--Apple-Mail-8B4FD762-74AA-404D-A66D-5721AD6831A8--


--===============2568748233628509131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2568748233628509131==--
