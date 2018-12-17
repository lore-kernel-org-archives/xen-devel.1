From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Race condition on device add hanling in xl devd
Date: Mon, 17 Dec 2018 13:23:15 +0100
Message-ID: <20181217122315.GC23474@mail-itl>
References: <20181216014743.GA5040@mail-itl>
 <20181217094059.rvoptuzp6im52jyp@mac>
 <20181217120001.GB23474@mail-itl>
 <20181217121855.zsrn6fvliz4f5yul@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3860142941642220811=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gYrve-0006qs-4Q
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 12:23:22 +0000
In-Reply-To: <20181217121855.zsrn6fvliz4f5yul@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============3860142941642220811==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2018 at 01:18:55PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Dec 17, 2018 at 01:00:01PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Dec 17, 2018 at 10:40:59AM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Sun, Dec 16, 2018 at 02:47:43AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > A workaround could be implemented in hotplug script itself - wait f=
or
> > > > the device there. I'm not sure how proper solution could look like.=
 Some
> > > > synchronization between xl devd and the kernel (like xl devd monito=
ring
> > > > uevents)?
> > >=20
> > > There's already a synchronization mechanism, libxl waits for the
> > > backend to switch to state 2 (XenbusStateInitWait) before running the
> > > hotplug scripts [0].
> > >=20
> > > Maybe netback sets state 2 before creating the backend device?
> > >=20
> > > It looks to me like the backend needs to be sure everything needed by
> > > the hotplug script is in place before switching to state 2.
> >=20
> > I've done some more tests and I think that's something else. I've added
> > a loop waiting for /sys/class/net/$vif to a hotplug script, but it timed
> > out (5s). I don't see _any_ kernel messages related to the device.
> >=20
> > It may be some bug in nested virtualization in KVM...
>=20
> In your message you said you have also observed this behavior when
> running on bare metal, so it's likely not related to nested
> virtualization?

Yes, but on bare metal is so hard to reproduce (like 0.1% or even less
startups), I'm not really sure if that was the same problem, as the
problem doesn't leave that much logs...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwXlTMACgkQ24/THMrX
1yw+8QgAmef6WfNQHXjwJ0MVb4JiS1Mu0aitChIVXanbiEvhxFl5S0y2NM4dYXmO
cJL3IIfo9m0TGOq7zL0qfIQ/7c50klDgyRG0xT1aUrCILdr3cbtI8W1sapqKcA9+
DNzjV+PFL/P9/3cyj3KoQhS+N40jWFWLu3h49Y9TgtIaL5PEEJWF0oz7f84YOS8M
+GTHzHbH3t5k5gYBr74i05MfB3cKgbKk9mxBH2W2GzXbp6HECnb1lT6njR1kqwBg
atn+rCp9HZGXf87hHW+/eMXe+i7v0vE58nr5FIq4vEWOuKf6OIcbkuqJmxUCUDP9
wvu56lWB9xSWE+nOuLfiGSxLPJhJCg==
=Ufej
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--


--===============3860142941642220811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3860142941642220811==--
