From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: do not fail device removal if
 backend domain is gone
Date: Fri, 9 Feb 2018 16:11:06 +0100
Message-ID: <20180209151105.GO2070@mail-itl>
References: <20180208232213.4105-1-marmarek@invisiblethingslab.com>
 <20180209112704.quwohlkqphs5ufrn@MacBook-Pro-de-Roger.local>
 <20180209114158.GL2070@mail-itl>
 <20180209121039.5nx4crwkpchrv7m3@MacBook-Pro-de-Roger.local>
 <20180209130833.GM2070@mail-itl>
 <20180209143908.sf6lgrmpkpiggchg@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5241022634649147624=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180209143908.sf6lgrmpkpiggchg@MacBook-Pro-de-Roger.local>
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


--===============5241022634649147624==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Content-Disposition: inline


--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 09, 2018 at 02:39:08PM +0000, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 09, 2018 at 02:08:33PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Feb 09, 2018 at 12:10:39PM +0000, Roger Pau Monn=C3=A9 wrote:
> > > On Fri, Feb 09, 2018 at 12:41:58PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Fri, Feb 09, 2018 at 11:27:04AM +0000, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > I'm also wondering, if you jump to 'out' here, you avoid the call=
 to
> > > > > libxl__xs_transaction_commit and instead end up calling
> > > > > libxl__xs_transaction_abort, which means the above call to
> > > > > libxl__xs_path_cleanup will not be committed to xenstore, is this
> > > > > really desired?
> > > > >
> > > > > It seems to me libxl might leak xenstore frontend entries in that
> > > > > case.
> > > >=20
> > > > That call is only if aodev->force. In other cases cleanup is done in
> > > > device_hotplug_done()->libxl__device_destroy(), which have its own =
transaction.
> > >=20
> > > Hm, right, but this would still be incorrect in the force case then?
> > > Or is this simply not needed for the 'force' case?
> >=20
> > In that case, the first libxl__xs_path_cleanup will indeed be aborted.
> > But then it will be cleaned up the same way as in !force case.
> > Anyway, this is about the case when backend is already gone, so 'force'
> > doesn't really change anything - it was forcefully removed already, by
> > shutting down the backend domain (or removing backend using something
> > else)...
>=20
> Are you sure? The libxl__xs_path_cleanup call is not for removing the
> backend entries but the frontend ones. Ie: the backend entries not
> being present doesn't imply the frontend entries also not being
> present.

But libxl__device_destroy do remove frontend entries.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlp+KokACgkQ24/THMrX
1yxmQgf+KtgIwFfh78hxMuoZW6+6cPxnmxmn57lwEG2zlAxi7IKBJ4X8JY2NfccR
hSm2NBJfnT1rV8UQHlMBOvp1aPveFNa1n0r0Y2nUZEtj4pOvZIOIX57SBy9m7HeP
JGae6+vZMFl2YSkamwUBEQbv4XJJbLfZqr0ftWPzLvRDd6Yci6ErUdwdGN3TQREP
kdxu/Q4fktPh4qKl821indQ683hOlAD5TNOSduC5x3v0yP1VzGyRsXB6fEvshJhD
v+PPhhqnjguI2tkKcA/vUQqCBncJdzf14gJ40ykcPzx1DLXfxi8ml7fSB5A3DO6f
UpauR/jTNdUZoCvXPjl8lu9Q01tj+A==
=L4V2
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--


--===============5241022634649147624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5241022634649147624==--
