From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 02/17] Document ioemu Linux stubdomain
 protocol
Date: Thu, 21 Feb 2019 18:08:22 +0100
Message-ID: <20190221170822.GU21228@mail-itl>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
 <27fbf2868a07046d4287a35d2b93483ae4a1f6dd.1548710973.git-series.marmarek@invisiblethingslab.com>
 <20190221153925.rwxv44nrxluq56ne@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8806001794426238762=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W4UY=Q4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gwrpl-0007hF-0k
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 17:08:29 +0000
In-Reply-To: <20190221153925.rwxv44nrxluq56ne@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============8806001794426238762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4h5NFqzjLBhle1zP"
Content-Disposition: inline


--4h5NFqzjLBhle1zP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 02/17] Document ioemu Linux stubdomain protocol

On Thu, Feb 21, 2019 at 03:39:25PM +0000, Wei Liu wrote:
> On Mon, Jan 28, 2019 at 10:30:19PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Add documentation for upcoming Linux stubdomain for qemu-upstream.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  docs/misc/stubdom.txt | 50 +++++++++++++++++++++++++++++++++++++++++++=
+-
> >  1 file changed, 50 insertions(+)
> >=20
> > diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
> > index 4c524f2..9c94c6b 100644
> > --- a/docs/misc/stubdom.txt
> > +++ b/docs/misc/stubdom.txt
> > @@ -75,6 +75,56 @@ Defined commands:
> >     - "running" - success
> > =20
> > =20
> > +Toolstack to Linux ioemu stubdomain protocol
> > +--------------------------------------------
> > +
> > +This section describe communication protocol between toolstack and
> > +qemu-upstream running in Linux stubdomain. The protocol include
> > +expectations of both stubdomain, and qemu.
> > +
> > +Setup (done by toolstack, expected by stubdomain):
> > + - Block devices for target domain are connected as PV disks to stubdo=
main,
> > +   according to configuration order, starting with xvda
> > + - Network devices for target domain are connected as PV nics to stubd=
omain,
> > +   according to configuration order, starting with 0
> > + - [not implemented] if graphics output is expected, VFB and VKB devic=
es are set for stubdomain
> > +   (its backend is responsible for exposing them using appropriate pro=
tocol
> > +   like VNC or Spice)
> > + - other target domain's devices are not connected at this point to st=
ubdomain
> > +   (may be hot-plugged later)
> > + - QEMU command line is stored in
> > +   /vm/<target-uuid>/image/dmargs xenstore dir, each argument as separ=
ate key
> > +   in form /vm/<target-uuid>/image/dmargs/NNN, where NNN is 0-padded a=
rgument
> > +   number
> > + - target domain id is stored in /local/domain/<stubdom-id>/target xen=
store path
> > +?? - bios type is stored in /local/domain/<target-id>/hvmloader/bios
>=20
> Since you're defining a new protocol here, you have the liberty to
> eliminate this uncertainty, unless for some reason you want it to be
> compatible with the old stubdom?

I'm not sure who access this xenstore key, since I haven't found how is
it used in minios based stubdomain. Is it used by qemu?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--4h5NFqzjLBhle1zP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxu2wYACgkQ24/THMrX
1yz/3Af9HK1E0AgldYNH4ygKIaecNCb8nx7mVPro4lbqOJJIezsA3f8nH0gpgoKG
eC34VzQAWiQxuMVl19mNI9QqiSQuqRIi5x5cSyg5FTr+hEKBF1LDMYymatGwJcLJ
MUMuNwnlMsTUnKaspXZ2XekTmAduWxMuP+QRRvjnG2JunvQyODh0VsG8LrbaONVq
ICTKQNxJHA68k/37XjntpU2h3R+6M91P5iknSLyvuU4M783btlSKBGNLr1eDO9sQ
x+wuozmQu58fLGeA5g/9Fx7eo+T6lTu9Nl1CYVgJzlF4AQwx+xnATvIWDrFcevz+
3XCVUs71n3Io2+NYPpA9xVsNQOdTJw==
=8M9N
-----END PGP SIGNATURE-----

--4h5NFqzjLBhle1zP--


--===============8806001794426238762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8806001794426238762==--
