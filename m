From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 02/17] Document ioemu Linux stubdomain
 protocol
Date: Thu, 21 Feb 2019 19:17:34 +0100
Message-ID: <20190221181734.GG5348@mail-itl>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
 <27fbf2868a07046d4287a35d2b93483ae4a1f6dd.1548710973.git-series.marmarek@invisiblethingslab.com>
 <20190221153925.rwxv44nrxluq56ne@zion.uk.xensource.com>
 <20190221170822.GU21228@mail-itl>
 <20190221173154.onisjck5hgk7s67k@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0823955482470738655=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W4UY=Q4=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gwsuk-0006uZ-Hg
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 18:17:42 +0000
In-Reply-To: <20190221173154.onisjck5hgk7s67k@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0823955482470738655==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline


--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 21, 2019 at 05:31:54PM +0000, Wei Liu wrote:
> On Thu, Feb 21, 2019 at 06:08:22PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Feb 21, 2019 at 03:39:25PM +0000, Wei Liu wrote:
> > > On Mon, Jan 28, 2019 at 10:30:19PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Add documentation for upcoming Linux stubdomain for qemu-upstream.
> > > >=20
> > > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblet=
hingslab.com>
> > > > ---
> > > >  docs/misc/stubdom.txt | 50 +++++++++++++++++++++++++++++++++++++++=
+++++-
> > > >  1 file changed, 50 insertions(+)
> > > >=20
> > > > diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
> > > > index 4c524f2..9c94c6b 100644
> > > > --- a/docs/misc/stubdom.txt
> > > > +++ b/docs/misc/stubdom.txt
> > > > @@ -75,6 +75,56 @@ Defined commands:
> > > >     - "running" - success
> > > > =20
> > > > =20
> > > > +Toolstack to Linux ioemu stubdomain protocol
> > > > +--------------------------------------------
> > > > +
> > > > +This section describe communication protocol between toolstack and
> > > > +qemu-upstream running in Linux stubdomain. The protocol include
> > > > +expectations of both stubdomain, and qemu.
> > > > +
> > > > +Setup (done by toolstack, expected by stubdomain):
> > > > + - Block devices for target domain are connected as PV disks to st=
ubdomain,
> > > > +   according to configuration order, starting with xvda
> > > > + - Network devices for target domain are connected as PV nics to s=
tubdomain,
> > > > +   according to configuration order, starting with 0
> > > > + - [not implemented] if graphics output is expected, VFB and VKB d=
evices are set for stubdomain
> > > > +   (its backend is responsible for exposing them using appropriate=
 protocol
> > > > +   like VNC or Spice)
> > > > + - other target domain's devices are not connected at this point t=
o stubdomain
> > > > +   (may be hot-plugged later)
> > > > + - QEMU command line is stored in
> > > > +   /vm/<target-uuid>/image/dmargs xenstore dir, each argument as s=
eparate key
> > > > +   in form /vm/<target-uuid>/image/dmargs/NNN, where NNN is 0-padd=
ed argument
> > > > +   number
> > > > + - target domain id is stored in /local/domain/<stubdom-id>/target=
 xenstore path
> > > > +?? - bios type is stored in /local/domain/<target-id>/hvmloader/bi=
os
> > >=20
> > > Since you're defining a new protocol here, you have the liberty to
> > > eliminate this uncertainty, unless for some reason you want it to be
> > > compatible with the old stubdom?
> >=20
> > I'm not sure who access this xenstore key, since I haven't found how is
> > it used in minios based stubdomain. Is it used by qemu?
>=20
> It is read by hvmloader afaict.

Ah, in that case I think it should be removed from this (and minios)
spec, because it is irrelevant to stubdomain.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlxu6z4ACgkQ24/THMrX
1ywTlQf/YZr2k9eKj+9umYSmDwe/64Pu18PpoieNhS1h4fOTB82Cao6hHYNIwXbJ
4Uu0R8mpOp1UiKAm2FgBVVXlxZuI2+99F2szFnOPKHQ4bYibbpkyB0odOzUxvWfX
oCsUYt/QUls1q9xK4t8ibP/U6WmgGOnZx6OksffGlpV539jSbBMaLOV7hgWfzOwU
vezjWyv5zdd+yLwUSlnAE9MaHOz8WVl/Q/4GBi8cOvbEfuXdtZbJXqI9/kSo2WDX
NNL0Zq5Qy8gjsMVGDGUjm1V9rAj/ehbH+4QpoCKPk8rcu4anA5g45LDlrg+mSEpx
RUtxwOT2XbANFSCUOdVFuzpvIuX/DA==
=kYqX
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--


--===============0823955482470738655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0823955482470738655==--
