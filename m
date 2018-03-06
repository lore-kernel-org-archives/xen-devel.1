From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Tue, 6 Mar 2018 12:20:58 +0100
Message-ID: <20180306122058.019da551.olaf@aepfle.de>
References: <20180306104133.22106-1-olaf@aepfle.de>
 <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8513091183457866186=="
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

--===============8513091183457866186==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/J.5O6KJ=Lw/NKb0VH2BU=Eo"; protocol="application/pgp-signature"

--Sig_/J.5O6KJ=Lw/NKb0VH2BU=Eo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Mar 2018 11:07:54 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> This looks like it should be part of the set_tsc_info hypercall, not a
> separate hypercall.

How would one adjust the value at runtime with set_tsc_info of a running do=
mU?
It seems to me set_tsc_info does way more than just applying some values, it
uses runtime data such as get_s_time.

Olaf

--Sig_/J.5O6KJ=Lw/NKb0VH2BU=Eo
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWp55mgAKCRBdQqD6ppg2
fji8AKC8JrZpqA6lFNCW7Zc6/x2Uqz/m6ACeLXxGVnjojrKyJ2ZCJPgmjm3KaX8=
=rztZ
-----END PGP SIGNATURE-----

--Sig_/J.5O6KJ=Lw/NKb0VH2BU=Eo--


--===============8513091183457866186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8513091183457866186==--
