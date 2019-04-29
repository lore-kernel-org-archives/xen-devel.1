From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
Date: Tue, 30 Apr 2019 00:08:35 +0200
Message-ID: <20190429220835.GH1502@mail-itl>
References: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
 <23750.52986.475586.327869@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2769364146426843373=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JedT=S7=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hLES1-00074n-UC
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 22:08:42 +0000
In-Reply-To: <23750.52986.475586.327869@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2769364146426843373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pq8tEKHpn00JYbZk"
Content-Disposition: inline


--Pq8tEKHpn00JYbZk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 11:16:26AM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[PATCH] python: Adjust xc_physin=
fo wrapper for updated virt_caps bits"):
> > Commit f089fddd94 "xen: report PV capability in sysctl and use it in
> > toolstack" changed meaning of virt_caps bit 1 - previously it was
> > "directio", but was changed to "pv" and "directio" was moved to bit 2.
> > Adjust python wrapper, and add reporting of both "pv_directio" and
> > "hvm_directio".
>=20
> Thanks for your attention to this...
>=20
> But:
>=20
> > index cc8175a11e..0a8d8f407e 100644
> > --- a/tools/python/xen/lowlevel/xc/xc.c
> > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > @@ -973,7 +973,8 @@ static PyObject *pyxc_physinfo(XcObject *self)
> >      xc_physinfo_t pinfo;
> >      char cpu_cap[128], virt_caps[128], *p;
> >      int i;
> > -    const char *virtcap_names[] =3D { "hvm", "hvm_directio" };
> > +    const char *virtcap_names[] =3D { "hvm", "pv",
> > +                                    "hvm_directio", "pv_directio" };
>=20
> It seems quite wrong that we have no way to keep this in sync - and
> not even comments in both places!  (This is not your fault...)

I'll add a comment...

> > @@ -989,6 +990,10 @@ static PyObject *pyxc_physinfo(XcObject *self)
> >      for ( i =3D 0; i < 2; i++ )
> >          if ( (pinfo.capabilities >> i) & 1 )
> >            p +=3D sprintf(p, "%s ", virtcap_names[i]);
> > +    if (pinfo.capabilities & XEN_SYSCTL_PHYSCAP_directio)
> > +        for ( i =3D 0; i < 2; i++ )
> > +            if ( (pinfo.capabilities >> i) & 1 )
> > +              p +=3D sprintf(p, "%s ", virtcap_names[i+2]);
> >      if ( p !=3D virt_caps )
> >        *(p-1) =3D '\0';
>=20
> I'm not sure I like this.  AFAICT the +2 is magic, and you in fact
> treat the two halves of this array together as a single array.  So
> this should either be two arrays, or, more likely, something like this
> maybe:
>=20
>   +              p +=3D sprintf(p, "%s_directio ", virtcap_names[i]);
>=20
> What do you think ?

Makes sense.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Pq8tEKHpn00JYbZk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzHdeMACgkQ24/THMrX
1ywS+wf+K1YdZ8n4Si0TtfznGU48crJa1AFKc2FELATzElszCX1UTon3Vl9DA8ug
42g1vM5wzVI/LVCyKlzPWcvmkO5AFHjIlYp1eilC6jRWYnyb3Z+lnzKEwDsBZSSR
1ikPlQpvi8Z0FuspEsoovRIZhBIST8917WbYmcZuk/1jLlhGmuRmFKvQV3VNYmFz
xeCGa0KUdluwhzX74HUknEhp+/vJ5O4ykvnLN1soumsMgTDjKLJuoPPYg9k58qdc
vVi0uFczcpRET0To5BATL3C8NiQWwViM1LxNMxrXRkNSyRRzBs1OhSgpOkWthoCO
LOtITpSEwZTMFVi9+rcdut3zRbQ/CQ==
=Pp3S
-----END PGP SIGNATURE-----

--Pq8tEKHpn00JYbZk--


--===============2769364146426843373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2769364146426843373==--
