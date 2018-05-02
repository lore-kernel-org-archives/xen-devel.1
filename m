From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen: Add RING_COPY_RESPONSE()
Date: Thu, 3 May 2018 01:45:50 +0200
Message-ID: <20180502234550.GN1124@mail-itl>
References: <20180430215436.21062-1-marmarek@invisiblethingslab.com>
 <5AE966A902000078001BFF07@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5275438014556598578=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AE966A902000078001BFF07@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============5275438014556598578==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mGCtrYeZ202LI9ZG"
Content-Disposition: inline


--mGCtrYeZ202LI9ZG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2018 at 01:20:09AM -0600, Jan Beulich wrote:
> >>> On 30.04.18 at 23:54, <marmarek@invisiblethingslab.com> wrote:
> > Using RING_GET_RESPONSE() on a shared ring is easy to use incorrectly
> > (i.e., by not considering that the other end may alter the data in the
> > shared ring while it is being inspected).  Safe usage of a response
> > generally requires taking a local copy.
> >=20
> > Provide a RING_COPY_RESPONSE() macro to use instead of
> > RING_GET_RESPONSE() and an open-coded memcpy().  This takes care of
> > ensuring that the copy is done correctly regardless of any possible
> > compiler optimizations.
> >=20
> > Use a volatile source to prevent the compiler from reordering or
> > omitting the copy.
> >=20
> > This is complementary to XSA155.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Please don't forget to Cc maintainers of files you change.

According to MAINTAINERS, Konrad is the only one responsible for this
file (PUBLIC I/O INTERFACES AND PV DRIVERS DESIGNS). I have plugged
get_maintainer.pl to my git send-email, so this is automated.
Is anyone missing there?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--mGCtrYeZ202LI9ZG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrqTa0ACgkQ24/THMrX
1yyD+wf9EQiaylJofkNAl7ylrOvMNiXBiP0QzYTcOjbvYys/PzKNEuG2tDTiBCum
PPmCFG/H6qTZEh1skmyZ+eejXl/FLYcvnieumKhcFPSa6tLm+MA7YC3LScrD8y3F
WsWNH5ruyynibS4RsrlnZERP67eSCI4UT7IehnH92jtpzvMiWntFDmFyVGCYoMbo
C/RJgUOZMsnBrp3PwbW0PpQmcYWE2SCvFY5PQwECUEZNa52EHuS9JHI9WlVayGop
KqBHq8ycPtrxebE7IypENq/mYL+TaesCLI3Jz9dv9b/WNMwOh4mEX3YU/yOm5zzs
x08GvOTkXjHXuIyHfZNYPXDfvemt4A==
=MPW9
-----END PGP SIGNATURE-----

--mGCtrYeZ202LI9ZG--


--===============5275438014556598578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5275438014556598578==--
