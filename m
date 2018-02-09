From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: libxl - avoid calling block script
Date: Fri, 9 Feb 2018 12:35:13 +0100
Message-ID: <20180209113513.GK2070@mail-itl>
References: <20180209010242.GA2297@mail-itl>
 <20180209105524.y35zzjwhfqvokswz@MacBook-Pro-de-Roger.local>
 <20180209110355.jgd3vp24nlwledyt@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0767176952214191748=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180209110355.jgd3vp24nlwledyt@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============0767176952214191748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline


--svExV93C05KqedWb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2018 at 11:03:55AM +0000, Roger Pau Monn=C3=A9 wrote:
> Really adding Ian and Wei.
>=20
> On Fri, Feb 09, 2018 at 10:55:24AM +0000, Roger Pau Monn=C3=A9 wrote:
> > So the problem is creation time for domains that have quite a lot of
> > disks attached. Adding Ian and Wei who know more about the async
> > dispatch system, but I think (at least from a technical PoV) it
> > should be possible to parallelize device attachment and thus hotplug
> > script execution. Devices are independent from each other.

In theory yes, but in practice block script (at least on Linux) takes a
lock and serialize execution...

> > Also the Linux hotplug scripts in general seem extremely convoluted,
> > I'm not sure whether we could gain some speed there just by
> > simplification.

Well, we're comparing a bunch of fork+exec(), including starting bash
(default /bin/sh on most systems), with just a single stat() call...
Handling scripts in libxl itself also takes some time (in my case libxl
live in libvirt, which may or may not have an impact). For a domU with
4 disks, getting rid of hotplug scripts saved about 2s of startup time.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlp99/AACgkQ24/THMrX
1yzsDgf+Ohol8IuZ3AKz+i9sZGV0t09XPOB4DTpHlhSiV4Dq2cWQALFPbjvJyGrB
pSS4SjnVC3nWjTkYf0wpPll/CNNNOXox9L+9zm2sl3yCadZb7PnNL17i4KyXpJRh
O756cpsu7KqrYpEaVWfnqYBRZAGQMN9vfTsjtK4aWQ7jNaLS1laddCj+VR5Ajonu
rKcypnMb5tlTew8cabnFXuo/ei65Id1RSZFuvqthZhVaBioOL1h7m/w+vAjxmUq9
Jj9IvLU4kQ7AD/wxU+moS82xKufJPI2a+bjI/QWQYIYCHSw1CjxGytVnZo0JhTA0
ci+ZO12I9jCoBtonEoUejKEUuECnVQ==
=Z1pF
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--


--===============0767176952214191748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0767176952214191748==--
