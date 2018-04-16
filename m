From: Daniel Reichelt <hacking@nachtgeist.net>
Subject: Re: [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector
Date: Mon, 16 Apr 2018 22:15:31 +0200
Message-ID: <8fd1c8ae-081c-a3fb-a643-b23e70c68798@nachtgeist.net>
References: <cfd09166-352d-cbcf-961e-a3070831a713@nachtgeist.net>
 <ec006143-70a1-0554-d352-daf6b08af4c8@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6332113871906213717=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=x6vl=hf=nachtgeist.net=hacking@srs-us1.protection.inumbo.net>)
 id 1f8AXJ-0002xo-BZ
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 20:15:37 +0000
In-Reply-To: <ec006143-70a1-0554-d352-daf6b08af4c8@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6332113871906213717==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oHa849YxkViirsegBNeUboSW0A53lGo5p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oHa849YxkViirsegBNeUboSW0A53lGo5p
Content-Type: multipart/mixed; boundary="kdor7A6QfYmKnOldshmh0KQv4DY3dr4Fl";
 protected-headers="v1"
From: Daniel Reichelt <hacking@nachtgeist.net>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-ID: <8fd1c8ae-081c-a3fb-a643-b23e70c68798@nachtgeist.net>
Subject: Re: [Xen-devel] [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector
References: <cfd09166-352d-cbcf-961e-a3070831a713@nachtgeist.net>
 <ec006143-70a1-0554-d352-daf6b08af4c8@suse.com>
In-Reply-To: <ec006143-70a1-0554-d352-daf6b08af4c8@suse.com>

--kdor7A6QfYmKnOldshmh0KQv4DY3dr4Fl
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

> Upstream commit 36104cb9012a82e73c32a3b709257766b16bcd1d fixed that. It=

> needs to be added to stable as well.

Thanks for the ptr!

Daniel


--kdor7A6QfYmKnOldshmh0KQv4DY3dr4Fl--

--oHa849YxkViirsegBNeUboSW0A53lGo5p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEg2wMpOXGvc4nunsZnjl+Rc/8gF8FAlrVBGMXHGhhY2tpbmdA
bmFjaHRnZWlzdC5uZXQACgkQnjl+Rc/8gF/+5hAAuiJgxCvDmAdNGvghdscIZT/k
9HcU7Gpn1ziveHFzrtvPoA7q4CqwodDBE+slX0tm5gVQDq59uH4s2ouUFg/uAu0R
lWTZI1AOZHbbDe4RDE6m0efBLJfmQI8nJSKIoblxPi7RwnIROt79Nri8zr01Rt60
rByea66QEvgb64EB4qSoLYrbK0tWsd7tlKNBPuuYwQhs8+DAQQGToz0SPDh7ocFg
R6g7nqC3mm4ub6EC0WEnQgcvry083oI1guSq9FDjSsPxXXRtyUTplzCZWEWh3/j4
TyCTV/g1Bi+qQfSJ+9c+q65sCpRxfSIRlM2nIvjfuKdi18yNAG7Ov3lGgjfj8Cpr
BaHyWPcYxftbDkFm5wxw0z2G80zbLu0TMrEngSCGokA9mA8y6+h52bkeODzCmfF+
tkI86DIWwR3/pv+3dHorgzkulZH21Y+fDDGRdOk0Dm5KhCOdr1O6LWxnlvK0v5PD
BeUCoVksb68yhMM5bs0BdqPs0fGluF96Dv0aiGEHg+46hkXrhM18as8hohWH/8YP
U5ieB9LGNLQL+fBkjRxZcRyAog9bjLPLcrR2QV5e+uyJ2TGnw0JkbGjZhnRr/Y4L
ZOXeiX+Hp7e42cnAJg4huEtVu4chfcD3aLNvEssnisfx/EV2zEgJURarKoGTdF/i
CSVzn9bugWU2bXTJp9w=
=OPpv
-----END PGP SIGNATURE-----

--oHa849YxkViirsegBNeUboSW0A53lGo5p--


--===============6332113871906213717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6332113871906213717==--
