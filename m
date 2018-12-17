From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Race condition on device add hanling in xl devd
Date: Mon, 17 Dec 2018 13:00:01 +0100
Message-ID: <20181217120001.GB23474@mail-itl>
References: <20181216014743.GA5040@mail-itl>
 <20181217094059.rvoptuzp6im52jyp@mac>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5403432534516723434=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gYrZD-0004bs-RP
 for xen-devel@lists.xenproject.org; Mon, 17 Dec 2018 12:00:11 +0000
In-Reply-To: <20181217094059.rvoptuzp6im52jyp@mac>
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


--===============5403432534516723434==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Content-Disposition: inline


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 17, 2018 at 10:40:59AM +0100, Roger Pau Monn=C3=A9 wrote:
> On Sun, Dec 16, 2018 at 02:47:43AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > I've found a race condition with handling new devices in driver domain.
> > xl devd calls hotplug script when new device is detected in xenstore. At
> > the same time, asynchronously, kernel create actual backend device (vif
> > in my case). In rare circumstances (especially under high system load)
> > it may happen that hotplug script is executed before kernel create the
> > device, and the hotplug script fails. When hotplug scripts were called
> > by udev, that race didn't existed as udev was informed about the device
> > by the kernel.
> > I'm not sure if the race applies to backend in dom0 - haven't happened
> > to me, but that doesn't really prove anything.
> >=20
> > Can you remind me why in driver domain xl devd is used now, instead of
> > udev?
>=20
> udev is Linux specific, while the current code works for Linux, NetBSD
> and FreeBSD.
>=20
> >=20
> > A workaround could be implemented in hotplug script itself - wait for
> > the device there. I'm not sure how proper solution could look like. Some
> > synchronization between xl devd and the kernel (like xl devd monitoring
> > uevents)?
>=20
> There's already a synchronization mechanism, libxl waits for the
> backend to switch to state 2 (XenbusStateInitWait) before running the
> hotplug scripts [0].
>=20
> Maybe netback sets state 2 before creating the backend device?
>=20
> It looks to me like the backend needs to be sure everything needed by
> the hotplug script is in place before switching to state 2.

I've done some more tests and I think that's something else. I've added
a loop waiting for /sys/class/net/$vif to a hotplug script, but it timed
out (5s). I don't see _any_ kernel messages related to the device.

It may be some bug in nested virtualization in KVM...

> Thanks, Roger.
>=20
> [0] http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/libxl/l=
ibxl_device.c;h=3Da4a8e9ac323e9d3804d36573181c74b7b5c63bc6;hb=3Drefs/heads/=
staging#l934

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwXj8EACgkQ24/THMrX
1ywvHQf/QqlhzkDaeImjFeaF3S6L/8zzLylf7vNdY2r3CkJxVo2LRgfhLRQwOz9a
EPjIDfursnek6HigT46fg7rmB36x9l4qaZR1QLVuWRYfodijDLWtza6Z07CjQkwn
HqqAzJ3dwLgbTx7qyd3S1qqAFlfObf1MG/gw4Ew/4opsWlYYZRAMynPGpQ4UAb+7
ZHQea1E3+ONGmmpfV69E3PGf/55VEIwy+WqAY/ntzzMipiRnrUHWwpmSmaHm0+U3
Drnt8fnVWQ3quvSBeK7iRxvjdbtKa4HMdZjTti4GbK5W35qhYdUEufUbbAaDdVL9
Xz/34l3U3FxvnGq/ALZMB9CIsd1qMQ==
=AXAW
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--


--===============5403432534516723434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5403432534516723434==--
