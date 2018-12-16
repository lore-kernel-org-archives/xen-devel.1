From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Race condition on device add hanling in xl devd
Date: Sun, 16 Dec 2018 02:47:43 +0100
Message-ID: <20181216014743.GA5040@mail-itl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2384604979095135901=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KREk=OZ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gYLX5-0002JI-Dy
 for xen-devel@lists.xenproject.org; Sun, 16 Dec 2018 01:47:51 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0D5C5CBD
 for <xen-devel@lists.xenproject.org>; Sat, 15 Dec 2018 20:47:47 -0500 (EST)
Received: from mail-itl (ip5b40a57c.dynamic.kabel-deutschland.de
 [91.64.165.124])
 by mail.messagingengine.com (Postfix) with ESMTPA id 063AA1026D
 for <xen-devel@lists.xenproject.org>; Sat, 15 Dec 2018 20:47:46 -0500 (EST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============2384604979095135901==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've found a race condition with handling new devices in driver domain.
xl devd calls hotplug script when new device is detected in xenstore. At
the same time, asynchronously, kernel create actual backend device (vif
in my case). In rare circumstances (especially under high system load)
it may happen that hotplug script is executed before kernel create the
device, and the hotplug script fails. When hotplug scripts were called
by udev, that race didn't existed as udev was informed about the device
by the kernel.
I'm not sure if the race applies to backend in dom0 - haven't happened
to me, but that doesn't really prove anything.

Can you remind me why in driver domain xl devd is used now, instead of
udev?

A workaround could be implemented in hotplug script itself - wait for
the device there. I'm not sure how proper solution could look like. Some
synchronization between xl devd and the kernel (like xl devd monitoring
uevents)?

The setup:
 - Xen 4.8.4, but I believe the same would happen in xen-unstable
 - Linux 4.19.2 (dom0), Linux 4.14.74 (domU)
 - problem happens when starting a domU with network backend in another
   domU
 - happen more often when Xen run nested in KVM (-> slow), but happened
   to me on bare metal too

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlwVrr8ACgkQ24/THMrX
1yyxUgf/UYpPTo7d/keuv5C/Ig6ySdl6GwTnDC3CRtdB23hSNQgd3IbTbGRQpFXs
k7tNaNaI37pmTv2zReMIK+bGnweOM8XPGrZp6RAlyVJa17u/sK/uXevNaPebaYhk
Cl+sox5yZ8ItIgyDHz1WE8nL5K9lG0tVH8vaVHNAKuJ0RnH7Uf5S2BqmcjQOS8Nn
olJDABcp4vkPJdrwwtLWt987msIxKl8aBi/lyGMW11jvQ0bnGsv4191Ok1C+c9Px
ATft/dbeGehsytKE//iLPfOayizg9VbieQk1aKfFnX956M4UuqyWGT0Y9aHcsBg3
ENrvDgRwE0N7YWeHxbGo852hChS8Bw==
=KRnN
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--


--===============2384604979095135901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2384604979095135901==--
