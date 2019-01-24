From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Don't add Xen's
 libs to LDFLAGS
Date: Thu, 24 Jan 2019 11:40:39 -0600
Message-ID: <9a1725c3-1119-886d-2d9d-11369ea5f207__38868.4351740935$1548351716$gmane$org@redhat.com>
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
 <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru>
 <87fttijvfm.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0369823113172413356=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I+KM=QA=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1gmizc-0006Gs-1m
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 17:40:44 +0000
In-Reply-To: <87fttijvfm.fsf@dusky.pond.sub.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0369823113172413356==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EZMrlU14vgKzwnjOGYDndQImM3kxp6W7t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EZMrlU14vgKzwnjOGYDndQImM3kxp6W7t
Content-Type: multipart/mixed; boundary="zJKZviSdD9hGhEQLYTITgfTFgbIEPGSsK";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>
Message-ID: <9a1725c3-1119-886d-2d9d-11369ea5f207@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] configure: Don't add Xen's libs to LDFLAGS
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
 <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru>
 <87fttijvfm.fsf@dusky.pond.sub.org>
In-Reply-To: <87fttijvfm.fsf@dusky.pond.sub.org>

--zJKZviSdD9hGhEQLYTITgfTFgbIEPGSsK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/24/19 2:45 AM, Markus Armbruster wrote:

>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> Revieved-by: Michael Tokarev <mjt@tls.msk.ru>
>=20
> Typo in Reviewed-by.

Should we tighten checkpatch.pl to flag suspicious-looking 'xxx-by:'
tags, to catch instances of typos?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--zJKZviSdD9hGhEQLYTITgfTFgbIEPGSsK--

--EZMrlU14vgKzwnjOGYDndQImM3kxp6W7t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlxJ+JcACgkQp6FrSiUn
Q2rIUQf6A4gzFoPMRvjHDslsPb4H+ZRXfMdW2IHug5577b+c7+S23SPRHAV+yZvl
kxzCIiVo3/Qq8MwPjSgJAIQ4xXxTYCr+/VPsUWB3QkPGjMI+m3WdDnPL4L2PO1Eb
eMUePef4z+/LZMtD5FBwFAiMTol8ie3OSpjW67m/081s9ljQrbiCE9x8S5UfQyms
M9p/Z3UES89dq0AqXIvZcJ0KltruA/8+bDHUegKdlTZqnADQLCNBz+AkEEPTw1Hi
5kzVJBPTwHUy1XfBDKDshlNy2dFLWobKVS3+u4IsqDizPeLGFTkuBAxaEF2HN8di
Kt5220nYHXSIKf5+a4e16K6gk3+lmg==
=a84x
-----END PGP SIGNATURE-----

--EZMrlU14vgKzwnjOGYDndQImM3kxp6W7t--


--===============0369823113172413356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0369823113172413356==--
