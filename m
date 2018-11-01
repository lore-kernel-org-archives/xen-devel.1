From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 07/17] libxl: add save/restore
 support for qemu-xen in stubdomain
Date: Thu, 1 Nov 2018 18:16:23 +0100
Message-ID: <20181101171623.GC2580@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <b13d7decb6d5d3b1d3a3e97348707f2180e46020.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.13241.636952.929175@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8811542327078776727=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7tsl=nm=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gIGa6-0000ei-L7
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:16:30 +0000
In-Reply-To: <23515.13241.636952.929175@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8811542327078776727==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uXxzq0nDebZQVNAZ"
Content-Disposition: inline


--uXxzq0nDebZQVNAZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 05:11:21PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 07/17] libxl: add =
save/restore support for qemu-xen in stubdomain"):
> > Rely on a wrapper script in stubdomain to attach FD 3/4 of qemu to
> > relevant consoles.
> ...
> >      if (state->saved_state) {
> > -        /* This file descriptor is meant to be used by QEMU */
> > -        *dm_state_fd =3D open(state->saved_state, O_RDONLY);
> > -        flexarray_append(dm_args, "-incoming");
> > -        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
> > +        if (is_stubdom) {
> > +            /* Linux stubdomain connects specific FD to STUBDOM_CONSOL=
E_RESTORE
> > +             */
> > +            flexarray_append(dm_args, "-incoming");
> > +            flexarray_append(dm_args, "fd:3");
>=20
> I think this hardcoded fd is troublesome.  For example, we don't have
> anywhere to write down the list of hardcoded fds being used like this.
> I mean, libxl and the Linux qemu stubdom wrapper script are allowed to
> cooperate, but at least this needs a clear comment in the wrapper
> script, and a reference here to the in-tree location of the script.

This is exactly what I'm writing about in cover letter. And indeed some
#define would be helpful here.

> I'm missing the code which is transfers the data from the
> state->saved_state to the console.  Am I just being dim ?

This is done by existing code by connecting STUBDOM_CONSOLE_RESTORE to
that file. See libxl_dm.c:spawn_stub_launch_dm.

> > diff --git a/tools/libxl/libxl_dom_suspend.c b/tools/libxl/libxl_dom_su=
spend.c
> ...
> >          /* Save DM state into filename */
> > +        if (dm_domid) {
> > +            /* if DM is in stubdomain, instruct it to use console, whi=
ch is
> > +             * connected to a file pointed by filename */
> > +            filename =3D "/proc/self/fd/4";
>=20
> Same comment (mutatis mutandi).
>=20
> Ian.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--uXxzq0nDebZQVNAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvbNOcACgkQ24/THMrX
1ywgdwf+MRPFpD1v/bY2uohdrAXPD/DlD24yVqcQdFph2UskTA+nSi0HAVRQtc1U
iAEgStviNKHuy6ilypVBkkj9tT1wcsmSbr8WkT58ZkXrr+hzU10ECU6HBIBvRsvZ
ueLSFgSRh/uSjeucdehY/IFdbYa/6FsJDpdWzkzCTTgQsODQHLJi8AoKlxzrW6KL
FgJzf71zRmGxZdrb/P8BkQS9Cl6BEgy4yh+wHvHE4vNfC732YH3l+QrkRb863mrx
Oyuwg52TQwigXSe3ICPS8CaJh+XwhjnPje/G1Gqa6j4ldkji9gP/KgLYxabQEnCm
XBnlI3mGGM7bB8frMV/03CTeArttDw==
=unVO
-----END PGP SIGNATURE-----

--uXxzq0nDebZQVNAZ--


--===============8811542327078776727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8811542327078776727==--
