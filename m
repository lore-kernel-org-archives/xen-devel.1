From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 00/17] Add support for qemu-xen
 runnning in a Linux-based stubdomain.
Date: Thu, 15 Nov 2018 19:57:08 +0100
Message-ID: <20181115185708.GI781@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23494.5998.10340.694382@mariner.uk.xensource.com>
 <20181016173240.GA1563@mail-itl>
 <23494.9572.676973.726194@mariner.uk.xensource.com>
 <20181016204628.GD1563@mail-itl>
 <23495.21043.960987.833172@mariner.uk.xensource.com>
 <20181017160559.GB2755@mail-itl>
 <23515.12398.298018.490061@mariner.uk.xensource.com>
 <20181101173207.GB1638@mail-itl>
 <20181115174144.GM1302@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4951074698622917386=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6zbB=N2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gNMpH-0001lc-W5
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 18:57:16 +0000
In-Reply-To: <20181115174144.GM1302@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>, Eric Shelton <eshelton@pobox.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============4951074698622917386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="73fGQZLCrFzENemP"
Content-Disposition: inline


--73fGQZLCrFzENemP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2018 at 05:41:44PM +0000, Anthony PERARD wrote:
> On Thu, Nov 01, 2018 at 06:32:07PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Nov 01, 2018 at 04:57:18PM +0000, Ian Jackson wrote:
> > > Marek Marczykowski-G=C3=B3recki writes ("Re: [RFC PATCH v2 00/17] Add=
 support for qemu-xen runnning in a Linux-based stubdomain."):
> > > > 2. pv console
> > > >   pros:
> > > >    - no qemu modifications
> > > >    - same read()/write() on libxl side
> > > >   cons:
> > > >    - no out of band reset, needs libxl handling for that (skipping
> > > >      negotiation)
> > >=20
> > > Doesn't this potentially mean that the qmp console connection can
> > > become irrecoverably desynchronised ?  I don't know how you would
> > > recover from the situation where another libxl process had got halfway
> > > through some qmp stuff and been terminated (for whatever reason; maybe
> > > the calling toolstack crashed).
> >=20
> > That's right, it could result in irrecoverably desynchronised
> > connection. So, we need out of band reset.
>=20
> Actually, it looks like we can recover that situation without out of
> band reset. It's even in the spec[1]:

That's interesting. And it mention serial console explicitly as the use
case for this. Does it apply to monitor socket too, or guest agent only?
I'd much prefer to use console, as the code would be much simpler (the
same handling for local and stubdomain qemu).

Also, this doesn't cover capabilities (re-)negotiation. While actual
capabilities are probably not a problem, libxl do store qemu version
=66rom the server greeting (is it used anywhere?).

(...)

> previous section:
>   2.6 Forcing the JSON parser into known-good state
>   -------------------------------------------------
>=20
>   Incomplete or invalid input can leave the server's JSON parser in a
>   state where it can't parse additional commands.  To get it back into
>   known-good state, the client should provoke a lexical error.
>=20
>   The cleanest way to do that is sending an ASCII control character
>   other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
>   line).
>=20
>   Sadly, older versions of QEMU can fail to flag this as an error.  If a
>   client needs to deal with them, it should send a 0xFF byte.

That's weird as guest-sync-delimiter documentation (still?) mention
0xFF. In both directions. Does it mean the new recommendation is to use
ASCII control character in one direction, but expect 0xFF in the other?

> [1] https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/interop/qmp-spec=
=2Etxt;h=3D8f7da0245d51447be7df2b3d4b105bad9fbec0b3;hb=3DHEAD#l231

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--73fGQZLCrFzENemP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvtwYQACgkQ24/THMrX
1ywJuQf+LCySLezyvIsm95C8voezyCjVm/qAiMEhz1prvyGyjnsNcbdY4mfFRMu2
uf9XhJiq9tg3gEcR1ADYWyuZ4ZAPQgtFebXUnhwqQgTgU5fzNPs75oiDOT6pJbvb
EZa+uAWBNGXWoiOgr+6/e9FKCF94MLx5o1lZRF3KkI6/BuCIRip31sc/5sWQ9p0r
TzQJSuyUVyXx7PSoEnNlhr+2fe8ZEcxbzFC6/1sYQGqo9784aZV4bFkuhJsg272M
qAdv4HSwKQxaLSkNObmP89BlWfisLHmJiJpR/V/0aRo4dJ2SxFIG5GpOAnl3MTdI
K1mon/YCeyJb1y+m5aYUOvuBrht86w==
=LhuS
-----END PGP SIGNATURE-----

--73fGQZLCrFzENemP--


--===============4951074698622917386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4951074698622917386==--
