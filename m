From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2] libxl: allow libxl_domain_suspend to
 simply suspend a domain, without saving it
Date: Wed, 4 Apr 2018 17:42:17 +0200
Message-ID: <20180404154217.GC5817@mail-itl>
References: <20180314143608.22615-1-marmarek@invisiblethingslab.com>
 <20180321165210.b5b6xw2y5ogumhil@citrix.com>
 <23227.31353.516795.789410@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5445749298155552137=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <23227.31353.516795.789410@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Marcus of Wetware Labs <marcus@wetwa.re>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============5445749298155552137==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Content-Disposition: inline


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2018 at 12:20:25PM +0100, Ian Jackson wrote:
> Wei Liu writes ("Re: [PATCH v2] libxl: allow libxl_domain_suspend to simp=
ly suspend a domain, without saving it"):
> > On Wed, Mar 14, 2018 at 03:36:08PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > When LIBXL_SUSPEND_NO_SAVE flag is set, no savefile will be written, =
but
> > > the domain will still be suspended (but not destroyed). The main reas=
on
> > > for this functionality is to suspend the host while some domains are
> > > running, potentially holding PCI devices. This will give a chance to a
> > > driver in such a domain to properly suspend the device.
> > >=20
> ...
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > Signed-off-by: Marcus of Wetware Labs <marcus@wetwa.re>
> >=20
> > The code and idea look fine.
> >=20
> > I would like to give Ian a chance to voice his opinion (he's currently
> > away).
>=20
> The API does seem a bit odd.  The intent is then that the domain will
> be un-suspended afterwards ?  This doesn't seem to be documented
> AFAICT in your patch.

Yes, there is already libxl_domain_resume for that.

> I don't think I agree with this part of the reaoning:
>=20
> > > It would be better to have a separate function for this, but in fact =
it
> > > should be named libxl_domain_suspend, then the current one renamed to
> > > libxl_domain_save. Since that would break API compatibility, keep it =
in
> > > the same function.
>=20
> I agree that libxl_domain_suspend is an unfortunate name, but can't we
> come up with an alternative new name ?  It does seem odd to bundle
> this into _save.

libxl_domain_just_suspend ?
It isn't bundling it into _save. There is no _save function - that's the
problem.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrE8lkACgkQ24/THMrX
1yyzNQf9GhjyutX9vC8jvqfZJcyKP6vLX9R7lRHHsnRVmcK2KF8wt52AzDFPwB/n
Rho46Mufq3F3YEj4pli45C+i3IHTl9yvNdgahd3n0qzSbG8dEAKD1PVR5GxgY9Ji
SflJc32c6RXk1ii9gtw7O9ISLdsdfah6DAGlwCFaD7i0+AXPIMCIlDo65tvnSsU1
M9NwIkaTWp1cu7LgLaNv3gL8Zt5HkOJ5VlGCjd48aaUjUhf0mzCGEjF6iGoXlTLQ
ycPf6HAIFKRQaoMaAuwk/m3vJjvUiQ05t9BaM5uSnLgVmpC4gaPZMmBvSIP/gx0e
/xDhWaCLp6TwbGQ6eIfAKKHFWT04ig==
=iaS4
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--


--===============5445749298155552137==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5445749298155552137==--
