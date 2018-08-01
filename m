From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 08/17] xl: add stubdomain related
 options to xl config parser
Date: Wed, 1 Aug 2018 23:52:12 +0200
Message-ID: <20180801215212.GA1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <12aeb8a67d09c3b1551245aa1ea597d9af78ee0c.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpuwrGMQ8L-xMEwfHhGRPs=gTver=R=cpv98testjp7-Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6138573464774639502=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkz2X-00022N-FL
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 21:52:17 +0000
In-Reply-To: <CAKf6xpuwrGMQ8L-xMEwfHhGRPs=gTver=R=cpv98testjp7-Lg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============6138573464774639502==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rymfx6HOR/0f6nvJ"
Content-Disposition: inline


--rymfx6HOR/0f6nvJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:35:59AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
>=20
> No Signed-off-by

Sigh, does anyone know how to configure git-series (or git commit) to add
it automatically? I know how to do that for git format-patch, but it
seems git-series doesn't use it.

> > ---
> >  docs/man/xl.cfg.pod.5.in | 23 +++++++++++++++++++----
> >  tools/xl/xl_parse.c      |  7 +++++++
> >  2 files changed, 26 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/man/xl.cfg.pod.5.in b/docs/man/xl.cfg.pod.5.in
> > index 099a28d..9c8ff31 100644
> > --- a/docs/man/xl.cfg.pod.5.in
> > +++ b/docs/man/xl.cfg.pod.5.in
> > @@ -2636,10 +2636,25 @@ model which they were installed with.
> >
> >  =3Ditem B<device_model_override=3D"PATH">
> >
> > -Override the path to the binary to be used as the device-model. The
> > -binary provided here MUST be consistent with the
> > -B<device_model_version> which you have specified. You should not
> > -normally need to specify this option.
> > +Override the path to the binary to be used as the device-model running=
 in
> > +toolstack domain. The binary provided here MUST be consistent with the
> > +B<device_model_version> which you have specified. You should not norma=
lly need
> > +to specify this option.
> > +
> > +=3Ditem B<stubdomain_kernel=3D"PATH">
> > +
> > +Override the path to the kernel image used as device-model stubdomain.
> > +The binary provided here MUST be consistent with the
> > +B<device_model_version> which you have specified.
> > +In case of B<qemu-xen-traditional> it is expected to be MiniOS-based s=
tubdomain
> > +image, in case of B<qemu-xen> it is expected to be Linux-based stubdom=
ain
> > +kernel.
> > +
> > +=3Ditem B<stubdomain_ramdisk=3D"PATH">
> > +
> > +Override the path to the ramdisk image used as device-model stubdomain.
> > +The binary provided here is to be used by a kernel pointed by B<stubdo=
main_kernel>.
> > +It is known to be used only by Linux-based stubdomain kernel.
>=20
> If provided to a mini-os stubdom, it would be loaded into memory but not =
used?

Yes, exactly.

Technically it is possible to package stubdomain as just kernel binary
(with initramfs embedded), so this option wouldn't be needed at all.
But it's far less convenient for debugging and customization.

> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--rymfx6HOR/0f6nvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltiK4wACgkQ24/THMrX
1yzX0QgAkX5SHnXUtclAEE3nHEtrtf6mQzf7GssJYezq1kVmzlZoT5afw6pZUGWD
k+hRUkQ3NK2lUAXqbkPVtx5MVsAAsmpi9QvKKhNmr6x2tqyeX0oQ/dk5PWavldAD
PDV0gBeOCPwlWnw3nir0SYy44fw8xH/yuznGRcT8Y61lNhMI6fJ3M/+37W19TLtn
+2EWeo4O9O6/L7gVdMwZR2RhSyuvKy1+gvFXhvPNs/m/AP3JAhad97zE2p1pMArk
8GLkOP4EFis5iKC54hvlAC91Rk0/ZRRBERpbRuWiUmUzjHkYfa6D8+w6elZ+/qLf
HdaGyM0pqZzY/tE+hzzb2g2PwukXlQ==
=cn4D
-----END PGP SIGNATURE-----

--rymfx6HOR/0f6nvJ--


--===============6138573464774639502==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6138573464774639502==--
