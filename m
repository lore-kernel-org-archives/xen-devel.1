From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 03/17] libxl: Handle Linux stubdomain
 specific QEMU options.
Date: Tue, 16 Oct 2018 19:51:55 +0200
Message-ID: <20181016175155.GC1563@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <084e43a6ca74c8cb6ffb7301497f425b413cfc42.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.7417.911789.655502@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0364719111854693528=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x11d=m4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gCTVh-0003XK-18
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 17:52:01 +0000
In-Reply-To: <23494.7417.911789.655502@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============0364719111854693528==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline


--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 06:16:41PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 03/17] libxl: Hand=
le Linux stubdomain specific QEMU options."):
> > From: Eric Shelton <eshelton@pobox.com>
> >=20
> > This patch creates an appropriate command line for the QEMU instance
> > running in a Linux-based stubdomain.
> ...
> > -static const char *libxl_tapif_script(libxl__gc *gc)
> > +static const char *libxl_tapif_script(libxl__gc *gc,
> > +                                      const libxl_domain_build_info *i=
nfo)
> >  {
> >  #if defined(__linux__) || defined(__FreeBSD__)
> > +    if (info->stubdomain_version =3D=3D LIBXL_STUBDOMAIN_VERSION_LINUX)
> > +        return libxl__sprintf(gc, "/etc/qemu-ifup");
> > +    return libxl__strdup(gc, "no");
> > +#else
> > +    return GCSPRINTF("%s/qemu-ifup", libxl__xen_script_dir_path());
> > +#endif
> > +}
> > +
> > +static const char *libxl_tapif_downscript(libxl__gc *gc,
> > +                                          const libxl_domain_build_inf=
o *info)
> > +{
> > +#if defined(__linux__) || defined(__FreeBSD__)
> > +    if (info->stubdomain_version =3D=3D LIBXL_STUBDOMAIN_VERSION_LINUX)
> > +        return libxl__sprintf(gc, "/etc/qemu-ifdown");
>=20
> We should never have permitted this #ifdefery.  The resulting diff
> here is almost incomprehensible due to the 3 levels of improper
> nesting: diff, ifdef, and code.
>=20
> Also we do not currently support any dom0's other than Linux and
> FreeBSD anyway!  So the #ifdef is entirely redundant.  This wasn't=20
> noticed when 2b2ef0c54459722943db6166da28e098af12a9e6
>   "libxl: don't use a qemu-ifup script on FreeBSD"
> was prepared and accepted.
>=20
> AFAICT this part of this patch is separating out the down and up
> versions of libxl_tapif_script.  The resulting two functions are quite
> similar though.
>=20
> I suggest the following series of small changes:
>    1. Drop the #if and all the code in the #else
>    2. Add a libxl__device_action parameter to libxl_tapif_script
>    3. Make your new code check for linux stubdom and if so
>        pass    "qemu" + (action =3D=3D add) ? "up" :
>                         (action =3D=3D remove) ? "down" : (abort(),0)
>        or some such
>=20
> What do you think ?

Given updated stubdomain doesn't need qemu-ifup/ifdown at all, this
whole chunk can be dropped.

> > @@ -1099,10 +1118,31 @@ static int libxl__build_device_model_args_new(l=
ibxl__gc *gc,
> >                  return ERROR_INVAL;
> >              }
> >              if (b_info->u.hvm.serial) {
> > -                flexarray_vappend(dm_args,
> > -                                  "-serial", b_info->u.hvm.serial, NUL=
L);
> > -            } else if (b_info->u.hvm.serial_list) {
> > +                if (is_stubdom) {
> > +                    flexarray_vappend(dm_args,
> > +                                      "-serial",
> > +                                      GCSPRINTF("/dev/hvc%d",
> > +                                                STUBDOM_CONSOLE_SERIAL=
),
> > +                                      NULL);
> > +                } else {
> > +                    flexarray_vappend(dm_args,
> > +                                      "-serial", b_info->u.hvm.serial,=
 NULL);
> > +                }
> > +            } else if (b_info->u.hvm.serial_list &&
> > +                    b_info->u.hvm.serial_list[0]) {
> >                  char **p;
> > +                if (is_stubdom) {
> > +                    if (b_info->u.hvm.serial_list[1]) {
>=20
> This can't possibly be right.  The 2nd if is in the else of a
> condition which will always catch all of its cases.

Oh, indeed.

> Also,
>=20
> > +                    flexarray_vappend(dm_args,
> > +                                      "-serial",
> > +                                      GCSPRINTF("/dev/hvc%d",
> > +                                                STUBDOM_CONSOLE_SERIAL=
),
>=20
> it repeats some of the code.
>=20
> > @@ -1503,7 +1543,9 @@ static int libxl__build_device_model_args_new(lib=
xl__gc *gc,
> >               * If qemu isn't doing the interpreting, the parameter is
> >               * always raw
> >               */
> > -            if (disks[i].backend =3D=3D LIBXL_DISK_BACKEND_QDISK)
> > +            if (libxl_defbool_val(b_info->device_model_stubdomain))
> > +                format =3D "host_device";
>=20
> So I infer that you have created in qemu a "block device format"
> called "host_device" which is actually a pv frontend ?  Or are we
> using Linux's blkfront here ?  In which case why not "raw" ?

"format" is actually passed to "driver" option for -drive. And according
to qemu documentation, "raw" should be used only for regular file, not
block devices. And since qemu 3.0, "raw" driver rejects block devices[1].

> > +            } else if (libxl_defbool_val(b_info->device_model_stubdoma=
in)) {
> > +                target_path =3D GCSPRINTF("/dev/xvd%c", 'a' + disk);
>=20
> Needs an error check in case disk is too large.

Ok.

> Thanks,
> Ian.

[1] https://qemu.weilnetz.de/doc/qemu-doc.html#g_t_002ddrive-file_003djson_=
003a_007b_002e_002e_002e_007b_0027driver_0027_003a_0027file_0027_007d_007d-=
_0028since-3_002e0_0029

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvGJTsACgkQ24/THMrX
1yz3WAf+Ik+fb+qmRnPUT3Azq+sfd+tTPnxDC8Vsky+Q2jGUJCx2yrW/kQsg+GLE
GI24c1zVnOw1HGRY9X5Kv7aseV2bjmhTB2sw2LrHXzSoQNh5Recw3LFYPpVrkipF
qlLw4I9MoyP5DmW1oDksu0ShEDVpHYtt1AsVJ9l1Znd08GR0/okRvYYXRfzghV3h
iQzUWFOXf2Ke7ZRnf4nYhvzz4MClURSB1d7X/tVoiDdEzEiz39gW0nmkwldRucNd
YOjpftNuLdLjbEWboC7fARX89Y2Hz/fQsbEpD0i4VaUZEaN7oqSDUUYw5DGe4Hqp
/rqmAA8a1QMvqmc9sj1iaWDG5vewpw==
=twdF
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--


--===============0364719111854693528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0364719111854693528==--
