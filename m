From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Mon, 12 Mar 2018 10:15:08 +0100
Message-ID: <20180312101508.4a9444c2.olaf@aepfle.de>
References: <20180306104133.22106-1-olaf@aepfle.de>
 <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5276904649864506958=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFy?= =?UTF-8?B?Y3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

--===============5276904649864506958==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/LPdW5b0ZcJqC96FxSHjtXFo"; protocol="application/pgp-signature"

--Sig_/LPdW5b0ZcJqC96FxSHjtXFo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Mar 2018 11:07:54 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> > Add a new domctl XEN_DOMCTL_set_vtsc_tolerance_khz to adjust the
> > tolerance value of a running domU that is supposed to be migrated. =20
> Please can we not proliferate the domctls.
> This looks like it should be part of the set_tsc_info hypercall, not a
> separate hypercall.

How should this approach be implemented? To me it looks like set_tsc_info
should be called only once for a not-yet-active domU, but I'm not familiar
with timekeeping.
If it can be just called once, and there should be a way to adjust the=20
tolerance value, then XEN_DOMCTL_settscinfo would need to be changed to=20
have subcommands.

Olaf

--Sig_/LPdW5b0ZcJqC96FxSHjtXFo
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWqZFHAAKCRBdQqD6ppg2
fqa1AJ9wpYLVjEL6Fit8HzVPi4bev6G4AACgkMX9JaY42+GV2j8R/jaEnmgnxoU=
=dYf8
-----END PGP SIGNATURE-----

--Sig_/LPdW5b0ZcJqC96FxSHjtXFo--


--===============5276904649864506958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5276904649864506958==--
