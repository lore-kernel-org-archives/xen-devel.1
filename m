From: Steven Haigh <netwiz@crc.id.au>
Subject: RFE: Detect NUMA misconfigurations and prevent machine
 freezes
Date: Wed, 29 Aug 2018 15:33:27 +1000
Message-ID: <6564259.GaOmOO5kt2@wopr.lan.crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1938094062874115011=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l4uh=lm=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1fut6t-0003u1-Fo
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 05:33:43 +0000
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:7dde:9b4c:5101:58f9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id A44E6200BF
 for <xen-devel@lists.xenproject.org>; Wed, 29 Aug 2018 15:33:34 +1000 (AEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============1938094062874115011==
Content-Type: multipart/signed; boundary="nextPart1646231.vzua2xEGky"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart1646231.vzua2xEGky
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

When playing with NUMA support recently, I noticed a host would always hang=
=20
when trying to create a cpupool for the second NUMA node in the system.

I was using the following commands:
# xl cpupool-create name=3D\"Pool-1\" sched=3D\"credit2\
# xl cpupool-cpu-remove Pool-0 node:1
# xl cpupool-cpu-add Pool-1 node:1

After the last command, the system would hang - requiring a hard reset of t=
he=20
machine to fix.

I tried a different variation with the same result:
# xl cpupool-create name=3D\"Pool-1\" sched=3D\"credit2\
# xl cpupool-cpu-remove Pool-0 node:1
# xl cpupool-cpu-add Pool-1 12

It turns out that the RAM was installed sub-optimally in this machine. A=20
partial output from 'xl info -n' shows:
numa_info              :
node:    memsize    memfree    distances
  0:     67584      62608      10,21
  1:             0              0      21,10

A machine where we could get this working every time shows:
node:    memsize    memfree    distances
  0:     34816      30483      10,21
  1:     32768      32125      21,10

As we can deduce RAM misconfigurations in this scenario, I believe we shoul=
d=20
check to ensure that RAM configuration / layout is sane *before* attempting=
 to=20
split the system and print a warning.

This would prevent a hard system freeze in this scenario.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB https://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart1646231.vzua2xEGky
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAluGMCcACgkQQa811Xp9
MdzWlg/+KtMDVnPhuunbqFiagZSTOv69M408psTvlwJgS4h+RpqZopAZIitAgw2u
mwgp6ZSPixu2Qe/eaHIs1gZRrrsDktwF+PrqyoCCO1LzdgJCWvbwnlhJzuykD8WL
PfgfT5/PUNCeOSSFml5H8n5WX8ECGgX6gaf9lRiywSEgzNTBgDTT6Hs2bXvdHCc/
VDmUUTtPxmSUDWc1MhOuUwN0ljFUPDgUY8aB7X8nsT73nSLLAbinozKHq6e053ce
zjsi4rnKrGlwDs4UHmhBTTxm7g2CcvWYy8MM4KLFSvlGH7aRQs9gmOaIlwNxjBZ9
vQRjGOZv42z8btn4KJNTMfLk7dgniGgQMytbVcjdrMIccEaTU25Uuu/o/7rkNiOu
H5gPfhUuUxdMk8CZxDiirWCxbnJlAkLLLY0lRAiQ7DyRTy08fqwF/wzpSmAstKOk
Is/Bb9/hx5SFu15LaKG/uh1GdMhuv7szvyZdzKTyKIB6K5HiRlJ3nTQ7PNsPJ6Z0
6zyAsRtsirCIVihIqamkm+zbGtrLJLwW2grC1zFaQAI6M22umtBXBPrbi3NUumck
uLzoHI32Yvrh/Uvm8lUROgYEWgv68GJyGTof6Jx1xM2JWP2V2jX9OTKpuomxJ7yW
6B1MTGdrU514JZD2o54JC24WnoMjGl2DRiDQVB4KERP6/4mQZyI=
=ktiQ
-----END PGP SIGNATURE-----

--nextPart1646231.vzua2xEGky--





--===============1938094062874115011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1938094062874115011==--
