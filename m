From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: do not fail device removal if
 backend domain is gone
Date: Fri, 9 Feb 2018 12:41:58 +0100
Message-ID: <20180209114158.GL2070@mail-itl>
References: <20180208232213.4105-1-marmarek@invisiblethingslab.com>
 <20180209112704.quwohlkqphs5ufrn@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8362428786067388209=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180209112704.quwohlkqphs5ufrn@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============8362428786067388209==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2018 at 11:27:04AM +0000, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 09, 2018 at 12:22:13AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Backend domain may be independently destroyed - there is no
> > synchronization of libxl structures (including /libxl tree) elsewhere.
> > Backend might also remove the device info from its backend xenstore
> > subtree on its own.
> > If such situation is detected, do not fail the removal, but finish the
> > cleanup of the frontend side.
> >=20
> > This is just workaround, the real fix should watch when the device
> > backend is removed (including backend domain destruction) and remove
> > frontend at that time. And report such event to higher layer code, so
> > for example libvirt could synchronize its state.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  tools/libxl/libxl_device.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
> > index 1b796bd392..1f58a99a23 100644
> > --- a/tools/libxl/libxl_device.c
> > +++ b/tools/libxl/libxl_device.c
> > @@ -997,6 +997,13 @@ void libxl__initiate_device_generic_remove(libxl__=
egc *egc,
> >              goto out;
> >          }
> > =20
> > +        /* if state_path is empty, assume backend is gone (backend dom=
ain
> > +         * shutdown?), cleanup frontend only; rc=3D0 */
> > +        if (!state) {
> > +            LOG(WARN, "backend %s already removed, cleanup frontend on=
ly", be_path);
> > +            goto out;
> > +        }
> > +
>=20
> I think INFO should be used instead of WARN, since this doesn't look
> to be a cause for concern from an admin PoV.

Ok, will change.

> I'm also wondering, if you jump to 'out' here, you avoid the call to
> libxl__xs_transaction_commit and instead end up calling
> libxl__xs_transaction_abort, which means the above call to
> libxl__xs_path_cleanup will not be committed to xenstore, is this
> really desired?
>
> It seems to me libxl might leak xenstore frontend entries in that
> case.

That call is only if aodev->force. In other cases cleanup is done in
device_hotplug_done()->libxl__device_destroy(), which have its own transact=
ion.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlp9+YYACgkQ24/THMrX
1ywbrgf+IQ0VWeGkyObHNq4pVuGi5Q/L2NqqUnigBMf8EE7UjB6R2HgV+iIM2Rhm
s6ixJVGrBxEOuHrk4t1IOWfvSX26eozWx6VldEgR65cJ155D5MHpi6ovqzsiDh4c
bauyzQJGWHAcipUD3LMpctyQxX5oTZLiW5bks+9kDbiScG0UOcr7dviBthmMnrWN
ke71ocseKbE35b3LkuuNpIJ807feZrCSoZcae5LrSq6++dIbkdg1/RSAJmbccSsg
sLnyyHNrpGhvkCpY+WK07wk6lxwlqKAWBy9IVN1QfmJWOm+Nzs9zwN7ClobMpU97
or5BfpyYsgPCyJWmJ7edTAQ26lclMA==
=zd6X
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--


--===============8362428786067388209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8362428786067388209==--
