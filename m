From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: libxl - avoid calling block script
Date: Fri, 23 Feb 2018 21:14:03 +0100
Message-ID: <20180223201403.GJ2023@mail-itl>
References: <20180209010242.GA2297@mail-itl>
 <20180209105524.y35zzjwhfqvokswz@MacBook-Pro-de-Roger.local>
 <20180209110355.jgd3vp24nlwledyt@MacBook-Pro-de-Roger.local>
 <20180209113513.GK2070@mail-itl>
 <20180223182856.5vcmlc2msqvpl7ya@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1116895485409770960=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180223182856.5vcmlc2msqvpl7ya@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1116895485409770960==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a7XSrSxqzVsaECgU"
Content-Disposition: inline


--a7XSrSxqzVsaECgU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 06:28:56PM +0000, Wei Liu wrote:
> On Fri, Feb 09, 2018 at 12:35:13PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Feb 09, 2018 at 11:03:55AM +0000, Roger Pau Monn=C3=A9 wrote:
> > > Really adding Ian and Wei.
> > >=20
> > > On Fri, Feb 09, 2018 at 10:55:24AM +0000, Roger Pau Monn=C3=A9 wrote:
> > > > So the problem is creation time for domains that have quite a lot of
> > > > disks attached. Adding Ian and Wei who know more about the async
> > > > dispatch system, but I think (at least from a technical PoV) it
> > > > should be possible to parallelize device attachment and thus hotplug
> > > > script execution. Devices are independent from each other.
> >=20
> > In theory yes, but in practice block script (at least on Linux) takes a
> > lock and serialize execution...
> >=20
> > > > Also the Linux hotplug scripts in general seem extremely convoluted,
> > > > I'm not sure whether we could gain some speed there just by
> > > > simplification.
> >=20
> > Well, we're comparing a bunch of fork+exec(), including starting bash
> > (default /bin/sh on most systems), with just a single stat() call...
> > Handling scripts in libxl itself also takes some time (in my case libxl
> > live in libvirt, which may or may not have an impact). For a domU with
> > 4 disks, getting rid of hotplug scripts saved about 2s of startup time.
> >=20
>=20
> Sorry for the late reply.
>=20
> If you really don't want block scripts, can you not specify a script
> that only does "exit 0"? That seems to be easier than modifying libxl
> and it is also useable in older versions of Xen.

But this is only one part of the picture. Something needs to set
physical-device xenstore entry. Libxl did that before, but it was
removed (see original message in this thread). I may write alternative
simplified block script for such case and measure performance of it, but
this feels overly complex, especially when libxl already have everything
it needs to quickly fill that xenstore entry.

Anyway, I'll go that way for now.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--a7XSrSxqzVsaECgU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqQdiQACgkQ24/THMrX
1yz2NQf+Pjh0birS6h3XM9I7+YZ2iYPlhAD4H9qSqbtI+jYpa3IU/P0NtMW7yI2U
cRkhBtXn6oPbwkEAjN2Y3eoUwQFQJqbJNFp4t4G/Wz4Yk4k9Nm2Q4kSz+sYcF2Zp
4Xd2Dplwq96G000+nivgMCYYL3FKyFJSEI8r/zpuhZOga187DPLdcniOBTmMjFkS
YzFz5CjewTb1W1j+w2cYkujs5sLU4k5C/BK3eTl7qvK2Jrmiy2oBJL9v6cnTqdFM
cmqqZPQAd1NdvPjKmMXPvEETMbH/Rz8odmvaudv70Aqy5fxwdlAIxIE5Lzbz1prj
Nq7fmCvlIGWeMBbd8/6tkJS/HQUraA==
=snPy
-----END PGP SIGNATURE-----

--a7XSrSxqzVsaECgU--


--===============1116895485409770960==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1116895485409770960==--
