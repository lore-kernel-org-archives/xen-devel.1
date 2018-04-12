From: Doug Goldstein <cardoe@cardoe.com>
Subject: broken build on staging docs
Date: Thu, 12 Apr 2018 18:07:32 -0500
Message-ID: <fa4e69bb-8278-4aec-960b-c0db32ef5503@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5287291173375671663=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ccc0=hb=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1f6lJb-0001SF-Ct
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 23:07:39 +0000
Received: by mail-yb0-x22e.google.com with SMTP id i13-v6so3092450ybl.4
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 16:07:37 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5287291173375671663==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="l1xTV6Y6pkfneofFtlz9UQJQXkh5rlFi3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--l1xTV6Y6pkfneofFtlz9UQJQXkh5rlFi3
Content-Type: multipart/mixed; boundary="s4yFcgegoyOk356mtGrbRwD0Nw8Nkk8vF";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Lars Kurth <lars.kurth@citrix.com>
Message-ID: <fa4e69bb-8278-4aec-960b-c0db32ef5503@cardoe.com>
Subject: broken build on staging docs

--s4yFcgegoyOk356mtGrbRwD0Nw8Nkk8vF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Since change 7782db9260d4c6499458de4e8d9866bc0427e143 the build has been
broken. See https://gitlab.com/xen-project/xen/pipelines/20403549 for
logs. Ultimately its because HTML::TreeBuilder::XPath is now a required
Perl module. Previously the only necessary Perl modules where those
shipped in the core of Perl. While I've got no problem updating all the
containers to include it, there is a bit of a conundrum where
CentOS/RHEL don't actually package and include it. I've also checked
EPEL and its not included. Not sure what approach folks would like to
take as this will require people to bust out CPAN for RHEL/CentOS based
builds.

--=20
Doug Goldstein


--s4yFcgegoyOk356mtGrbRwD0Nw8Nkk8vF--

--l1xTV6Y6pkfneofFtlz9UQJQXkh5rlFi3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlrP5rdfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl2k5Q/9EP1pNrKvG2zpjL4Oi++/aRtG8eX1tHSYigbrHj/vOh3ZdhIlB/xYgb+W
Ntj26gcVBE1Qc+fXCxqE3d6VzflSFieMnMZ7qn0vh+SOG7YKSCg36xh3OwjWfKoL
Wzx8+NNDoytUdNmo37aNbD/a+OHeWqt9iRUzcT4/7dATjqTnOwBVmeu1PtjT2CKY
uC365fqiSvJGqL9O2xD8S0+MeGPU6ZfLq1pvYDMPcRZsEE4D4OPKgZPEufwhUML8
mYU2V5ewHeQNFRC/Hcdy4f8Wclt12fFOjsITkQE5PYvTatHhFGxF9Mn2OJvCTxVS
RDa5Jf0m3H0l89GIUyilF+x6odfStlzak8jWaOdGmTazMTU5f2QNy8tcgTDaMNKL
+vy3jbnDSHX2es+3BDiNq5/0WbfCyzcYjMeJNceAJ4xek6kankz1XtUGMZoj1/PL
UlWJNvb47IVbhw5pwibMPy6Drpbsos4GGIGFYYlU78TNgNmPTJ1wfsC6ZzNnGNKK
U/WApk3zOB+zEmrC7KgQCeGEAQSC1XSgYG3hZ/cXsSnsIxk8NCmJq0b1QGUjpT7/
Mki3QZKyfPc9gz9xRBj8Vm2f8rzbXt2gMOtRZB2LiwBbOlr72Kh0YoOWE1g8QLAD
V5TzXngMOsR45OQKcgoPeR2BuLtRYzrc85AaGeGA7yr1KIKE+9g=
=Hddj
-----END PGP SIGNATURE-----

--l1xTV6Y6pkfneofFtlz9UQJQXkh5rlFi3--


--===============5287291173375671663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5287291173375671663==--
