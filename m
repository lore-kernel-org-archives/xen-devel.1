From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/misc/xenpm: fix getting info when
 some CPUs are offline
Date: Wed, 31 Oct 2018 11:53:16 +0100
Message-ID: <20181031105316.GC32486@mail-itl>
References: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
 <5BD9770602000078001F6A4F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4340347143211169464=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zqf5=nl=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gHo7n-0004XP-RE
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 10:53:23 +0000
In-Reply-To: <5BD9770602000078001F6A4F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============4340347143211169464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gr/z0/N6AeWAPJVB"
Content-Disposition: inline


--gr/z0/N6AeWAPJVB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 31, 2018 at 03:33:58AM -0600, Jan Beulich wrote:
> >>> On 30.10.18 at 23:16, <marmarek@invisiblethingslab.com> wrote:
> > --- a/tools/misc/xenpm.c
> > +++ b/tools/misc/xenpm.c
> > @@ -1231,7 +1231,7 @@ int main(int argc, char *argv[])
> >          xc_interface_close(xc_handle);
> >          return ret;
> >      }
> > -    max_cpu_nr =3D physinfo.nr_cpus;
> > +    max_cpu_nr =3D physinfo.max_cpu_id;
>=20
> Isn't this off by 1 then? max_cpu_nr is misnamed, all loops using it
> are of the form
>=20
>     for ( i =3D 0; i < max_cpu_nr; i++ )

Oh, you're right. This doesn't affect smt=3Doff case, because the last cpu
is offline anyway...

> I'm also afraid there are further quirks here, with various constructs
> along the lines of (as bodies of aforementioned for())
>=20
>         if ( show_cxstat_by_cpuid(xc_handle, i) =3D=3D -ENODEV )
>             break;
>=20
> which I suspect would terminate processing early when hitting a true
> gap (i.e. not one resulting from a parked CPU).=20

How that would happen? Hotplug?
Also I've tried to look at error codes to distinguish offline cpu and
avoid printing that error, but looks EINVAL is used for a lot of cases.

> But I guess it wouldn't
> be appropriate to ask you to deal with this at the same time.
>=20
> Jan
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--gr/z0/N6AeWAPJVB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvZiZwACgkQ24/THMrX
1ywrhQf+MFDx8GdWONzf9z0bAJ7UTei0SFs9O8k4eityiZ1wkiRDqtY8dYLInN29
D4R+oEFA5AU2nNEqGFWcjjijDhr7hX05FSzuSTin8Pjqu3RyFb/Gyx0PDH5o9PeE
jhFN5hRjvhEkiTCaG8xSBxwsM1uo+Zh+1UHq4HXDvoaHpC0e3aWnpxsNLbq+1j17
J8J+aKZH63lrOrCSosttKKBhvtwYioktqJsuRsxAeKWIkb0l29xcJybTVvOTtQ8u
xIoewAB3JikXyVlheYMMspAw37UAeNmezIz0G3n3CZtJlXdEB8zF3YtWb2w8UT2X
mAZv7Gz+Rc43dbAIinObLpcGB3ggDA==
=HkZC
-----END PGP SIGNATURE-----

--gr/z0/N6AeWAPJVB--


--===============4340347143211169464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4340347143211169464==--
