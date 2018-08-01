From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 03/17] libxl: Handle Linux stubdomain
 specific QEMU options.
Date: Wed, 1 Aug 2018 17:55:39 +0200
Message-ID: <20180801155539.GW1371@mail-itl>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
 <1dad6c1a0f8cf4ca4d4f34a0a9762fcdfbc28fa1.1533009377.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpvwd3XUd8E3CZFjdbX5zJQfROTN-Ce9B6=2CEygUuuR7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0471335319644487939=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8sl1=kq=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fktTW-0007yp-Au
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 15:55:46 +0000
In-Reply-To: <CAKf6xpvwd3XUd8E3CZFjdbX5zJQfROTN-Ce9B6=2CEygUuuR7g@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Eric Shelton <eshelton@pobox.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============0471335319644487939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGfVcqCQYT4RlWas"
Content-Disposition: inline


--ZGfVcqCQYT4RlWas
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2018 at 10:25:22AM -0400, Jason Andryuk wrote:
> On Mon, Jul 30, 2018 at 11:56 PM, Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> > From: Eric Shelton <eshelton@pobox.com>
> >
> > This patch creates an appropriate command line for the QEMU instance
> > running in a Linux-based stubdomain.
> >
> > NOTE: a number of items are not currently implemented for Linux-based
> > stubdomains, such as:
> > - save/restore
> > - QMP socket
> > - graphics output (e.g., VNC)
> >
> > Signed-off-by: Eric Shelton <eshelton@pobox.com>
> >
> > Simon:
> >  * fix disk path
> >  * fix cdrom path and "format"
> >  * pass downscript for network interfaces
> > ---
> <snip>
> > @@ -1099,10 +1118,21 @@ static int libxl__build_device_model_args_new(l=
ibxl__gc *gc,
> >                  return ERROR_INVAL;
> >              }
> >              if (b_info->u.hvm.serial) {
> > -                flexarray_vappend(dm_args,
> > -                                  "-serial", b_info->u.hvm.serial, NUL=
L);
> > +                if (is_stubdom) {
> > +                    flexarray_vappend(dm_args,
> > +                                      "-serial",
> > +                                      GCSPRINTF("/dev/hvc%d", STUBDOM_=
CONSOLE_SERIAL),
> > +                                      NULL);
> > +                } else {
> > +                    flexarray_vappend(dm_args,
> > +                                      "-serial", b_info->u.hvm.serial,=
 NULL);
> > +                }
> >              } else if (b_info->u.hvm.serial_list) {
> >                  char **p;
> > +                if (is_stubdom) {
> > +                    flexarray_vappend(dm_args,
> > +                                      "-serial", "/dev/hvc1", NULL);
>=20
> Should this also be GCSPRINTF("/dev/hvc%d", STUBDOM_CONSOLE_SERIAL)
> instead of hardcoding hvc1?

Yes. Anyway,  multiple serial consoles are incompatible with
stubdomain anyway - should it error out if serial_list have multiple
elements? Or silently ignore others?

> > +                }
> >                  for (p =3D b_info->u.hvm.serial_list;
> >                       *p;
> >                       p++) {
>=20
> <snip>
>=20
> > @@ -1550,8 +1584,8 @@ static int libxl__build_device_model_args_new(lib=
xl__gc *gc,
> >
> >              if (disks[i].is_cdrom) {
> >                  drive =3D libxl__sprintf(gc,
> > -                         "if=3Dide,index=3D%d,readonly=3Don,media=3Dcd=
rom,id=3Dide-%i",
> > -                         disk, dev_number);
> > +                         "if=3Dide,readonly=3Don,media=3Dcdrom,id=3Did=
e-%i",
> > +                         dev_number);
>=20
> What is the impact of dropping index?

Leftover from Qubes-specific part of this patch (non-cdrom disks are
converted to SCSI for readonly support, dropping index avoids hitting
IDE limitation of 4 disks). I'll remove this chunk.

> >                  if (target_path)
> >                      drive =3D libxl__sprintf(gc, "%s,file=3D%s,format=
=3D%s",
>=20
> Regards,
> Jason

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ZGfVcqCQYT4RlWas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlth1/sACgkQ24/THMrX
1yyhBQgAlqkUpbv+gLJ6cZhgcH2zjuuOIYhtrki3pqNewoQFhseaMwZN6T12OBss
tbDtHnxG+VxRhqteeDdxXw1KJvQmyK/zsDwKco1idJ0loda6ZFDGPBiO7JXnyTEQ
Y7xgWorMvgicTynwsw6Dln675scb69B1caOLhpBmIsMtfflrYq8bg0lzKe5gR3Yt
lHy4yCqENDda7dqT6v28QRoheTQl4+VJfPJQGz9Q+PYKAQ9ED/UZfMnuooeYoXEw
B9pAg4zc2lyidFQbkRjxfibTkbWRtHKbMy7hMVNMZnVTR18f5DGiFsQz78F/BRIj
eGoRNc5Gtq/rLvTQzCLNCzD3qMKMug==
=Wnno
-----END PGP SIGNATURE-----

--ZGfVcqCQYT4RlWas--


--===============0471335319644487939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0471335319644487939==--
