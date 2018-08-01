From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 04/17] libxl: Build the domain with a
 Linux based stubdomain
Date: Wed, 1 Aug 2018 16:37:15 +0200
Message-ID: <20180801143715.GV1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <f893b4caf7113d08e56264260e9ffc10b171b7fa.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xptrvrpzj1EqzZypPK15zmu597zy_oGDtrEF4wGLWU=5gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6145515537827097235=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKf6xptrvrpzj1EqzZypPK15zmu597zy_oGDtrEF4wGLWU=5gA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Simon Gaiser <simon@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============6145515537827097235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xmaaO/kAkmiSHqEM"
Content-Disposition: inline


--xmaaO/kAkmiSHqEM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:26:06AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > From: Eric Shelton <eshelton@pobox.com>
> >
> > This will build a Linux-based stubdomain with QEMU upstream.
> >
> > Signed-off-by: Eric Shelton <eshelton@pobox.com>
> >
> > Simon:
> >  * use initramfs instead of disk with rootfs
> >  * don't initialize qmp (unused in Qubes)
> >  * Make libxl_domain_need_memory consistent with actual stubdoma build
> >    code (bugfix relevant also for non-linux case)
> >  * Make stubdomain memory size configurable
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> >
> > Marek:
> >  * Make kernel and ramdisk paths configurable.
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
>=20
> <snip>
>=20
> > @@ -1983,10 +1997,8 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl=
__stub_dm_spawn_state *sdss)
> >          dm_config->num_vkbs =3D 1;
> >      }
> >
> > -    stubdom_state->pv_kernel.path
> > -        =3D libxl__abs_path(gc, "ioemu-stubdom.gz", libxl__xenfirmware=
dir_path());
> > -    stubdom_state->pv_cmdline =3D GCSPRINTF(" -d %d", guest_domid);
>=20
> This dropped line isn't restored anywhere else, afaics.  Does this
> break mini-os stubdoms?

No, mini-os gets cmdline from xenstore anyway. And
libxl__build_device_model_args_old do add -d domid there.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--xmaaO/kAkmiSHqEM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlthxZsACgkQ24/THMrX
1ywpKgf8DBfzuowi3wBMz6y+2ofZnVgBslb07f1yY+z6g8GaNgNEqc1AebtKM+PN
MD9AsRpQ0pXMBF+cKg+fggu3LkqC1XDcsZJvw17ptgAeblY9ogZKHtk7jdWTeZ+B
cHizDgYZiBXpZoYtt1OL0DtHFEDj8TOAFAWLLD7o3fjlBxkdhjIk21FICC87lHGU
16m+kg1dVSzJLlWSXRq8ghpwZdmcCV8mM7ML57Xct0sFuAScDEaE1CzTBRV9BPtr
4SJIlyiwq3rUG2SmDl2ctoixLqPmd8cVmQsYzieQQH8/13erph1P8B5cLcNZclRw
783sRU/gRaAAqUGBZW9W6jBuJFx5yA==
=r6YK
-----END PGP SIGNATURE-----

--xmaaO/kAkmiSHqEM--


--===============6145515537827097235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6145515537827097235==--
