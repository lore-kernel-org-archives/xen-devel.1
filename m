From: Steven Haigh <netwiz@crc.id.au>
Subject: Xen crashes with Ryzen 7 CPUs
Date: Sat, 23 Jun 2018 17:16:45 +1000
Message-ID: <1675755.4ap3tzzQVs@wopr.lan.crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1697728625198858684=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=8h5w=jj=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fWcnA-00005E-Hm
 for xen-devel@lists.xenproject.org; Sat, 23 Jun 2018 07:17:06 +0000
Received: from wopr.lan.crc.id.au
 (2407-e400-b000-201-99f-2048-53c8-43ff-cpe.spintel.net.au
 [IPv6:2407:e400:b000:201:99f:2048:53c8:43ff])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 1F95A20C93
 for <xen-devel@lists.xenproject.org>; Sat, 23 Jun 2018 17:16:55 +1000 (AEST)
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

--===============1697728625198858684==
Content-Type: multipart/signed; boundary="nextPart1659435.GrGiOsW0ln"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1659435.GrGiOsW0ln
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi all,

So I recently decided to upgrade the hardware on my home server from a good=
=20
old i5-2500k to a Ryzen 7 1700x - while throwing in 32Gb of DDR4 2400.

I have noticed that every time I boot Xen on the Ryzen 7, within a couple o=
f=20
minutes, the system crashes.

As this happens on both RHEL7 and Fedora 28, I figure theres something more=
=20
going on here.

Does anyone have a set of recommendations or experiences of running Xen on =
a=20
Ryzen CPU?

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart1659435.GrGiOsW0ln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlst890ACgkQQa811Xp9
MdxzJQ//cNtrEjvigKcki8crPWma2eLbdjis8Ua2aH7WvMmJu4MeAAzgSuYlbtbt
f3BYJNTZb1mzLBglzyRmxaPtSoVqaUIeh2BwyeocOol3lixs/gG3OyhDixXX0+5z
C1K7QJcTL7AivqQXo7mefrYcH12MgL/66e4NBIZ4xn6wm4wyKk3eEP9pnSUeaqmy
T2kvC6vI9YPahmjGNKsKEK2yvgq+f8LsaxrxaFIGkViSEmYge3CeERTaM1YS9jto
t1miEM0PttNIQI+LvcKNFScet2NQN4E1Om4ud/fOYrNM2iTJ2Bf1WGm9qdP1wXEe
lU1okeuDdibUDnQHTgqAlgOi8TEGYgbyQOgCSrDFilGfTV/Xr+bqvoz6VNaEBJu2
SITiCc9RuNSiUP1h3v6r26H2MesrB5DmRPcjYntwY7Tw0CDGpOS9Qs7O06SY/OB3
CIMxnuydkZJJReNTfyRjz/EN+qXA9UAj1D+6nhL9QTPUuyTJJ3PZ57Jm3g06hue1
n3pdgB5CMmrTW6z9EIE73Bny6gKDAL4wZmtiunIAFMFkWNwyoPlphaNlV3F3QyJ7
8uHvo2EW+uCGGPRpg6kurpO9gt6oBieNCCh4uGTNwzbElNpJ8Ly+FXo1bOpTu/we
saeRi+nwSivK2/xCnWXkj/2DoiaOBJGAIxIg0SIHP9kxJScndlk=
=D2Vu
-----END PGP SIGNATURE-----

--nextPart1659435.GrGiOsW0ln--





--===============1697728625198858684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1697728625198858684==--
