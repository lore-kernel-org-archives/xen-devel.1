From: Rich Persaud <persaur@gmail.com>
Subject: Re: Anyone using blktap2?
Date: Fri, 17 May 2019 02:36:41 -0400
Message-ID: <26874323-BD77-48C7-AA7F-83B964CDDBEC@gmail.com>
References: <20190513153414.GU2798@zion.uk.xensource.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============1561318555218019052=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UlUR=TR=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hRWU1-0000BD-HW
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 06:36:45 +0000
Received: by mail-io1-xd44.google.com with SMTP id a17so4601966iot.8
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 23:36:44 -0700 (PDT)
In-Reply-To: <20190513153414.GU2798@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Alistair Francis <alistair.francis@xilinx.com>
List-Id: xen-devel@lists.xenproject.org


--===============1561318555218019052==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366
Content-Transfer-Encoding: 7bit


--Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On May 13, 2019, at 11:34, Wei Liu <wei.liu2@citrix.com> wrote:
>=20
> Hello
>=20
> Seeing that you were the last people who changed blktap2 in a meaningful
> way: do you use it at all?

As discussed F2F in a Xen Summit 2017 design session: OpenXT and Citrix XenS=
erver use blktap. VHD encryption support was recently upstreamed from OpenXT=
 to the Citrix-maintained repo [1] for blktap3 [2], now used by OpenXT.  Pri=
or versions of OpenXT use blktap2.

Citrix changed the license of XAPI blktap from GPL to BSD, to enable non-OSS=
 features in the paid version of XenServer. The XAPI blktap repo is actively=
 maintained, with dozens of commits in 2018 and 2019, the most recent being t=
his week.

If the XAPI [3] blktap repos are part of Xen Project, should LibXL support a=
 Xen Project feature that is actively maintained and shipping in production s=
ystems? Does the blktap3 repo [1] need to be separated from XAPI?  Perhaps a=
 topic for discussion at the upcoming Xen Summit.

> I'm thinking about dropping it (again).

What would be the proposed mechanism for Xen VM block storage backed by thin=
-provisioned VHD files with per-VM encryption keys? This capability was suff=
iciently valuable to be upstreamed by Citrix, from OpenXT to Xen Project XAP=
I in 2018. =20

With the imminent arrival of Windows Hyper-V and WSL2 Linux 4.19 on develope=
r desktops, VHD support (i.e. Microsoft storage interoperability) in Xen may=
 be a feature to improve rather than remove.

Rich

[1] https://github.com/xapi-project/blktap

[2] https://wiki.xenproject.org/wiki/Blktap3

[3] https://xenproject.org/developers/teams/xen-api/


--Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-eq=
uiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"=
></div><div dir=3D"ltr">On May 13, 2019, at 11:34, Wei Liu &lt;<a href=3D"ma=
ilto:wei.liu2@citrix.com">wei.liu2@citrix.com</a>&gt; wrote:</div><div dir=3D=
"ltr"><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><span>Hello</span=
><br><span></span><br><span>Seeing that you were the last people who changed=
 blktap2 in a meaningful</span><br><span>way: do you use it at all?</span><b=
r></div></blockquote><div><br></div><span style=3D"background-color: rgba(25=
5, 255, 255, 0);">As discussed F2F in a Xen Summit 2017 design session: Open=
XT and Citrix XenServer use blktap. VHD encryption support was recently upst=
reamed from OpenXT to the Citrix-maintained repo [1] for blktap3 [2], now us=
ed by OpenXT. &nbsp;Prior versions of OpenXT use blktap2.</span></div><div d=
ir=3D"ltr"><div><span style=3D"background-color: rgba(255, 255, 255, 0);"><b=
r></span></div><div><span style=3D"background-color: rgba(255, 255, 255, 0);=
">Citrix changed the license of XAPI blktap from GPL to BSD, to enable non-O=
SS features in the paid version of XenServer. The XAPI blktap repo is active=
ly maintained, with dozens of commits in 2018 and 2019, the most recent bein=
g this week.</span></div><div><br></div><div>If the XAPI [3] blktap repos ar=
e part of Xen Project, should LibXL support a Xen Project feature that is ac=
tively maintained and shipping in production systems? Does the blktap3 repo [=
1] need to be separated from XAPI? &nbsp;Perhaps a topic for discussion at t=
he upcoming Xen Summit.<br><div><br><blockquote type=3D"cite"><div dir=3D"lt=
r"><span></span><span>I'm thinking about dropping it (again).</span><br></di=
v></blockquote><div><br></div><div>What would be the proposed mechanism for X=
en VM block storage backed by thin-provisioned VHD files with per-VM encrypt=
ion keys? This capability was sufficiently valuable to be upstreamed by Citr=
ix, from OpenXT to Xen Project XAPI in 2018. &nbsp;</div><div><br></div><div=
>With the imminent arrival of Windows Hyper-V and WSL2 Linux 4.19 on develop=
er desktops, VHD support (i.e. Microsoft storage interoperability) in Xen ma=
y be a feature to improve rather than remove.</div><div><br></div>Rich</div>=
<div><br></div><div>[1]&nbsp;<a href=3D"https://github.com/xapi-project/blkt=
ap">https://github.com/xapi-project/blktap</a></div><div><br></div><div><div=
><span style=3D"background-color: rgba(255, 255, 255, 0);">[2]&nbsp;<a href=3D=
"https://wiki.xenproject.org/wiki/Blktap3">https://wiki.xenproject.org/wiki/=
Blktap3</a></span></div></div><div><br></div></div><div>[3]&nbsp;<a href=3D"=
https://xenproject.org/developers/teams/xen-api/">https://xenproject.org/dev=
elopers/teams/xen-api/</a></div><div><br></div></div></div></body></html>=

--Apple-Mail-77EA62B2-00E8-477C-BB1D-F51E1C2B8366--


--===============1561318555218019052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1561318555218019052==--
