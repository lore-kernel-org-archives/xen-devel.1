From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Commit 331b51 breaks live migration on FreeBSD/Xen
 dom0
Date: Thu, 14 Mar 2019 23:34:30 +0100
Message-ID: <20190314223430.GA2014@mail-itl>
References: <20190314155403.vby5ox6pybajfruu@Air-de-Roger>
 <1597966e-961e-26af-0381-9b621ddea1b1@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8473098213670500235=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kyLN=RR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h4Yvu-00067Q-Uv
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 22:34:39 +0000
In-Reply-To: <1597966e-961e-26af-0381-9b621ddea1b1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8473098213670500235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2019 at 04:07:55PM +0000, Igor Druzhinin wrote:
> The change was supposed to be platform independent - it relies on the
> fact addr argument to mmap() works as expected - mmaps at the specified
> address.=20

You have this guarantee only with MAP_FIXED flag, otherwise the addr
argument is only a hint.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyK1vcACgkQ24/THMrX
1yy0Bwf/TQ/dFz0i7BnyoWzTR34vCPjWVQ4hivHUV6w3vJyBG3049C5dXSuMGhvx
dpt1DcltfFAghUo7Ngmtx2k2np8Utze2uimETqGLsoG/ErER/FwanEOMiQmI43Dl
Xkxc1jMPO4MqVsZjhR/rS2enTQETMsAOe+08DdCVO2JMhGQHNnQwpL/KFwc+HBNQ
SkeufbsXqCdhmpX+kbGWa5qrNTjGR3och4QYUByOo/FxtW7CaJiQZb+yUcGJ5fRd
57+uMficYe6Aeo6rXqR8isr4ksyQye800najk2VMsSths7u5UgBaGNNXdeCTJRcP
97d3BgAii30ltUEUumu7bkBHEvoO4Q==
=rVas
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--


--===============8473098213670500235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8473098213670500235==--
