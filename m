From: Rich Persaud <persaur@gmail.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
	4.10.1
Date: Mon, 8 Jan 2018 17:08:57 -0500
Message-ID: <E43C556A-7832-4A3F-BEAB-0B5C877C9CDD@gmail.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <4F771D10-4A3C-4F73-B02C-CDFB211A0A75@gmail.com>
 <CA+aC4ktW9yK7hX1ynxWHtFuJer-mw847XO=M0T8ghBBmcV2ZhQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============0149647936112215176=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=p7ta=ed=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1eYfbJ-0005sS-8Q
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 22:09:01 +0000
Received: by mail-it0-x22d.google.com with SMTP id u62so9258436ita.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 14:08:59 -0800 (PST)
In-Reply-To: <CA+aC4ktW9yK7hX1ynxWHtFuJer-mw847XO=M0T8ghBBmcV2ZhQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, committers@xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============0149647936112215176==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-DBAE291F-9EB1-4EB1-95B7-5DFBAC8B8F61
Content-Transfer-Encoding: 7bit


--Apple-Mail-DBAE291F-9EB1-4EB1-95B7-5DFBAC8B8F61
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Jan 8, 2018, at 16:44, Anthony Liguori <anthony@codemonkey.ws> wrote:
>> On Mon, Jan 8, 2018 at 1:01 PM, Rich Persaud <persaur@gmail.com> wrote:
>> On a similarly pragmatic note: would a variation of Anthony's vixen patch=
 series be suitable for pre-PVH Xen 4.6 - 4.9?  These versions are currently=
 documented as security-supported (Oct 2018 - July 2020).
>>=20
>> There are production environments where upgrading to Xen 4.10 in a timefr=
ame of days or weeks is not practical.
>>=20
>> Will PCI passthrough for PV guests be supported in any of the solutions t=
hat are being considered?  If not, it would be helpful to document this in t=
he Spectre/Meltdown XSA and/or FAQ, including timeline or complexity estimat=
es for the return of security support for Xen PV driver domains.  SUPPORT.md=
 will also need an update.
>=20
> It's not particularly hard to plumb through I think

An earlier discussion [1] suggested that it was feasible but not easy.  This=
 feature is used for device driver (e.g. NIC or USB) domains in OpenXT and Q=
ubes deployments.


> but if you are using PCI passthrough for PV, then you really shouldn't wor=
ry about
> Spectre/Meltdown.  That PV guest can already read all of physical
> memory (since no IOMMU is used) and they can also write to all
> physical memory which is far worse than what you can do with
> Spectre/Meltdown.

We may be using different terminology?  OpenXT and Qubes typically require I=
OMMU for PV driver domains.  XSM can [2] enforce a policy which requires tha=
t an IOMMU be present before a driver domain is started.  =20

Rich

[1] https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00475.ht=
ml

[2] https://www.mail-archive.com/xen-devel@lists.xen.org/msg118728.html


--Apple-Mail-DBAE291F-9EB1-4EB1-95B7-5DFBAC8B8F61
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div></div><div>O=
n Jan 8, 2018, at 16:44, Anthony Liguori &lt;<a href=3D"mailto:anthony@codem=
onkey.ws">anthony@codemonkey.ws</a>&gt; wrote:<br></div><blockquote type=3D"=
cite"><div><span>On Mon, Jan 8, 2018 at 1:01 PM, Rich Persaud &lt;<a href=3D=
"mailto:persaur@gmail.com">persaur@gmail.com</a>&gt; wrote:</span><blockquot=
e type=3D"cite"><span>On a similarly pragmatic note: would a variation of An=
thony's vixen patch series be suitable for pre-PVH Xen 4.6 - 4.9? &nbsp;Thes=
e versions are currently documented as security-supported (Oct 2018 - July 2=
020).</span><br></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span>There are production environments w=
here upgrading to Xen 4.10 in a timeframe of days or weeks is not practical.=
</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockqu=
ote><blockquote type=3D"cite"><span>Will PCI passthrough for PV guests be su=
pported in any of the solutions that are being considered? &nbsp;If not, it w=
ould be helpful to document this in the Spectre/Meltdown XSA and/or FAQ, inc=
luding timeline or complexity estimates for the return of security support f=
or Xen PV driver domains. &nbsp;SUPPORT.md will also need an update.</span><=
br></blockquote><span></span><br><span>It's not particularly hard to plumb t=
hrough I think </span></div></blockquote><div><br></div><div><span style=3D"=
background-color: rgba(255, 255, 255, 0);">An earlier discussion [1] suggest=
ed that it was feasible but not easy. &nbsp;</span>This feature is used for d=
evice driver (e.g. NIC or USB) domains in OpenXT and Qubes deployments.</div=
><div><br></div><br><blockquote type=3D"cite"><div><span>but if you are&nbsp=
;</span><span>using PCI passthrough for PV, then you really shouldn't worry a=
bout</span><br><span>Spectre/Meltdown. &nbsp;That PV guest can already read a=
ll of physical</span><br><span>memory (since no IOMMU is used) and they can a=
lso write to all</span><br><span>physical memory which is far worse than wha=
t you can do with</span><br><span>Spectre/Meltdown.</span><br></div></blockq=
uote><div><br></div><div>We may be using different terminology? &nbsp;OpenXT=
 and Qubes typically require IOMMU for PV driver domains. &nbsp;XSM can [2] e=
nforce a policy which requires that an IOMMU be present before a driver doma=
in is started. &nbsp;&nbsp;</div><div><br></div><div>Rich</div><div><br></di=
v><div>[1]&nbsp;<a href=3D"https://lists.xenproject.org/archives/html/xen-de=
vel/2018-01/msg00475.html">https://lists.xenproject.org/archives/html/xen-de=
vel/2018-01/msg00475.html</a></div><div><br></div><div>[2]&nbsp;<a href=3D"h=
ttps://www.mail-archive.com/xen-devel@lists.xen.org/msg118728.html">https://=
www.mail-archive.com/xen-devel@lists.xen.org/msg118728.html</a></div><div><b=
r></div><blockquote type=3D"cite"><div><span></span></div></blockquote></div=
></body></html>=

--Apple-Mail-DBAE291F-9EB1-4EB1-95B7-5DFBAC8B8F61--


--===============0149647936112215176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0149647936112215176==--
