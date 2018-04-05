From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] python: xc: fix max_cpu_index sign error
Date: Thu, 5 Apr 2018 18:45:25 +0200
Message-ID: <20180405164525.GH3176@mail-itl>
References: <1522932563-89973-1-git-send-email-epetre@amazon.com>
 <20180405125403.yuapvd6hv3xh7tdv@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4323354878601826302=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yxdc=g2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1f482V-0005ed-3u
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 16:47:07 +0000
In-Reply-To: <20180405125403.yuapvd6hv3xh7tdv@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Petre Eftime <epetre@amazon.com>
List-Id: xen-devel@lists.xenproject.org


--===============4323354878601826302==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tT3UgwmDxwvOMqfu"
Content-Disposition: inline


--tT3UgwmDxwvOMqfu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 05, 2018 at 01:54:03PM +0100, Wei Liu wrote:
> CC Marek
>=20
> On Thu, Apr 05, 2018 at 12:49:23PM +0000, Petre Eftime wrote:
> > When 0-indexing, maximum index is num_entries - 1. The python xc librar=
y had a
> > sign error where the minus was replaced by a plus, making tools that de=
pended
> > on it to look for CPUs that did not exist.
> >=20
> > Signed-off-by: Petre Eftime <epetre@amazon.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> > ---
> >  tools/python/xen/lowlevel/xc/xc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowle=
vel/xc/xc.c
> > index f501764..694bfa0 100644
> > --- a/tools/python/xen/lowlevel/xc/xc.c
> > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > @@ -1079,7 +1079,7 @@ static PyObject *pyxc_topologyinfo(XcObject *self)
> >          }
> >      }
> > =20
> > -    ret_obj =3D Py_BuildValue("{s:i}", "max_cpu_index", num_cpus + 1);
> > +    ret_obj =3D Py_BuildValue("{s:i}", "max_cpu_index", num_cpus - 1);
> > =20
> >      PyDict_SetItemString(ret_obj, "cpu_to_core", cpu_to_core_obj);
> >      Py_DECREF(cpu_to_core_obj);
> > --=20
> > 2.7.3.AMZN
> >=20
> >=20
> >=20
> >=20
> > Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. L=
azar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered =
in Romania. Registration number J22/2621/2005.
> >=20
> >=20
> > _______________________________________________
> > Xen-devel mailing list
> > Xen-devel@lists.xenproject.org
> > https://lists.xenproject.org/mailman/listinfo/xen-devel

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tT3UgwmDxwvOMqfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrGUqUACgkQ24/THMrX
1ywWawf/cpaExBjUv9E0ojhXoPj0+q+MChTBaS7OfVI60Qnn1/ai1UoHGkGj+Qca
JFhqxFxMk71ukqagPiE/NpJzshPor3iMIPFUPCbOMCkR8kGngvSOi9KbAM/sB8DK
9fRV4LzEMOotI8wpGspEJFWej4AuN5wbM52w39baLb2h11RGh34QCbN1cWxKteGG
8hZyKA6e6jKS+d5egUjkElzWVlJX7d6G0JW6+lpvOpmy8eq2lu3/SqArCcv2vuFZ
3l3eYsYE8lXPKgP62CNS6YR4Ho9UsbWIJxjc/xoxQOi7eJsbrd0wIUKgse+UWMiG
qQGeGkndyAcDnjnBdBXTA0K9xm9v4A==
=CiVN
-----END PGP SIGNATURE-----

--tT3UgwmDxwvOMqfu--


--===============4323354878601826302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4323354878601826302==--
