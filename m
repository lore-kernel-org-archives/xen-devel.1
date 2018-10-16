From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Tue, 16 Oct 2018 22:46:28 +0200
Message-ID: <20181016204628.GD1563@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
 <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3461329037263871891=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x11d=m4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gCWEe-0008DL-CY
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 20:46:36 +0000
In-Reply-To: <23494.9572.676973.726194@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org


--===============3461329037263871891==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2018 at 06:52:36PM +0100, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: [RFC PATCH v2 00/17] Add sup=
port for qemu-xen runnning in a Linux-based stubdomain."):
> > On Tue, Oct 16, 2018 at 05:53:02PM +0100, Ian Jackson wrote:
> > > I think you may need a quoting
> > > scheme, or to use nul.
> >=20
> > The main reason for this over alternatives (including nul) is using
> > shell script on the stubdomain side to handle this. Handling nul char in
> > shell is major PITA.
>=20
> Ah.  Yes.  You could handle multiple arguments in multiple xenstore
> keys easily enough though, I think ?
>=20
> Or you could pass a shell string.=20

=46rom those two options I'd prefer multiple xenstore keys as much
cleaner. We do have them as an array in libxl already.

So, let image/dmargs be actually a directory with entries like:
 - image/dmargs/000 =3D -xen-domid
 - image/dmargs/001 =3D 123
 - image/dmargs/002 =3D -nodefaults
 ...

I wonder if there needs to be arguments count, or iterating until ENOENT
is enough?

> That is, you could shell escape the
> arguments in libxl.  Shell escaping is a bit fiddly but not too
> hard.[1] Then in the stubdom you can just say sh -c.
>=20
> [1] One algorithm would be
>    1. replace all \ in each argument with '\\'
>    2. replace all ' in each argument with '\''
>    3. put ' ' around each argument
>    4. concatenate with spaces in between
>=20
> > > | xenstore values should normally be 7-bit ASCII text strings
> > > | containing bytes 0x20..0x7f only
> > >=20
> > > I think you could have separate xenstore keys for the seperate
> > > arguments, or you could encode it somehow.
> >=20
> > What "normally" means in this context? For me it doesn't mean other
> > characters are prohibited.
>=20
> The reasoning is explained in the surrounding text,  Basically, it
> makes debugging (listing xenstore by hand, etc) very annoying.
>=20
> > > >     * qemu can access saved state (if any) at its FD 3
> > > >     * qemu can write its state (for save/migration) to its FD 4
> > >=20
> > > That's a description of the protocol to *qemu*.  Is the toolstack then
> > > responsible for the protocol across the domain boundary ?  I think it
> > > would be nice to specify that here too.
> >=20
> > Well, toolstack is responsible for qemu command line (and QMP), so it is
> > part of the stubdomain protocol...
>=20
> Err, I mean, you are specifying a protocol at the qemu boundary.  It
> is good to write that down.  But it would be nice to also write down
> the protocol at the stubdom boundary, even though both halves of it
> are actually implemented by part of the toolstack (the stubdom side
> being scripts passed in by the toolstack).
>=20
> > > This is awkward, isn't it.  The Xen PV console protocol has no reset
> > > mechanism.  Can we use libvchan here and provide qmp vchans ?
> >=20
> > That would be an option too. Require (trivial) vchan->unix socket proxy.
>=20
> Yes.  Or teaching qemu about libvchan.

That's also an option. I'll see how hard it would be to add this to
qemu.

> Hey, we should teach socat about libvchan :-).

:)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvGTiQACgkQ24/THMrX
1yzf4wgAhdWTztVC7qS1N2YnXHX/5sSqeHE2MY136xUqRBZNmI+9TgTXoZAbwXXG
Q7oXZIZObcA5Skuu0TuM6num8eyjNJ6YGY0TUhD0F7oYarg02cO2kRHliMgZvdn4
0OaNvuhUd0Q6Ne5JMsT4k34SepNgPOxLp/v8uIwzv9ZE+2xwnDiSkOgz3UYmS19Y
B9DijClAWfddJXuJpz7Dwffl+9bMI301OsAZaZCBJ142d71jZjgBtS26CWn+IYRl
kzNtW0o8OMIRkaB9eWeqzL7i7iou4H796tJp4QgPQqemHzRMtMG0uEd0uYA8A6PA
kDPLa5iSXfskBbAL1gviX2J91F24rQ==
=SWMW
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--


--===============3461329037263871891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3461329037263871891==--
