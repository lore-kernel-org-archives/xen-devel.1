From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
Date: Sat, 14 Apr 2018 05:49:00 +0000
Message-ID: <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5051437120493957314=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4r7u=hd=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f7E40-0000HB-Fw
 for xen-devel@lists.xenproject.org; Sat, 14 Apr 2018 05:49:28 +0000
In-Reply-To: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5051437120493957314==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="QzkExfehBobXtt1alqr7Y8K1ont7Fhxbb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QzkExfehBobXtt1alqr7Y8K1ont7Fhxbb
Content-Type: multipart/mixed; boundary="s5YGoaFBzZlt2AVsNEs3fsgy3iPPE8uin";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Message-ID: <0bfe793f-272c-a98c-95eb-ee75f5ee6218@invisiblethingslab.com>
Subject: Re: [PATCH 0/3] x86: S3 resume adjustments
References: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>
In-Reply-To: <5AD0993002000078001BB0D0@prv1-mh.provo.novell.com>

--s5YGoaFBzZlt2AVsNEs3fsgy3iPPE8uin
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> 1: correct ordering of operations during S3 resume
> 2: suppress BTI mitigations around S3 suspend/resume
> 3: check feature flags after resume
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Simon, could you give this a try please?

Backported to 4.8 it works fine with the two fixes I sent earlier.

I now also tried staging. Resume is broken even without IBRS/IBPB. It
panics about a double fault somewhere after it starts to enable the
non-boot CPUs. Since the IBRS/IPBP problem happens before that point I
could test the patches anyway. With them it gets again to the point
where it double faults. So the patches are most likely fine.

I didn't really looked yet at the cause of the double fault.

Simon


--s5YGoaFBzZlt2AVsNEs3fsgy3iPPE8uin--

--QzkExfehBobXtt1alqr7Y8K1ont7Fhxbb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrRlnIACgkQkO9xfO/x
ly9MkRAAxjrgadmA78MltapyPtm3Aw76F2OhL24uFUmutVm4UXRiwURsgjAi3lGl
+eLQ16bPsKYgezRI0ftxwcMe+At6Rl7ETm/oj8aP9td8PbzBWXjdTecIC/ghus/K
kIsHWgmbkL+zJL3H/f/muQTv0B5IpIIhN8JP9HwuPg6ju8ElJ9uLriSj2OMjj9v+
W+E9AMlBdos7pf4EcMwn6M0dF+x+Q1zpsOXWmfsQtftz9VAoTrjtDRazm/G+eIov
A+B4x6TbBL1B9udttK3etIMzF/KnOYVfQ5UVcejTSlz9/kkZyQ6NubWZnlRiNQC7
OseKmy2x2XVxNUwSKqCQA2ic4kOdW1e3bm2xermnsbFGVYagLyhVLaKUJ4ndxFnI
Rv7kaiEFLC+50KYF7V+R+vDDM7BiiZ/gYU1tR3EEFY7+z2GaN3SWiPvw2Tym+6Ho
Xj53ROoAIYARYXGgCHH/CEYKu4Y7n9A8j0oDoYJPLuLDgRgtmPiWodMmjxjL582q
dolkw3/pTzoBG566PLpmfiZsAPovKUSSEfhVFpel8tmT5UBrjukCLDncx8ADtMMo
ydWwpeDZ27N2ylGtFJN+kaYrmr6ilpnyAfGOTrDmCGdSNV+UqSKv9UG+W2Ao0eey
6f4xjGz0A0Xqlxnu6Gh0daM3vht8cJy6asn1kcQs9mr+dJBSLkU=
=zwTu
-----END PGP SIGNATURE-----

--QzkExfehBobXtt1alqr7Y8K1ont7Fhxbb--


--===============5051437120493957314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5051437120493957314==--
