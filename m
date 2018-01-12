From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 1/5] x86/idt: Factor out enabling and
 disabling of ISTs
Date: Fri, 12 Jan 2018 14:12:33 -0600
Message-ID: <566cdc3b-b440-bb8e-1cd7-4bb760384938@cardoe.com>
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6036320166558118698=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6036320166558118698==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="IuabGTX0fXV163unThBCci9cnsrAQpX0o"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IuabGTX0fXV163unThBCci9cnsrAQpX0o
Content-Type: multipart/mixed; boundary="CEwC1iMTbR7UmwEpVtr4Kos4UTGLUxIXN";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
Message-ID: <566cdc3b-b440-bb8e-1cd7-4bb760384938@cardoe.com>
Subject: Re: [Xen-devel] [PATCH 1/5] x86/idt: Factor out enabling and
 disabling of ISTs
References: <1515782244-6412-1-git-send-email-andrew.cooper3@citrix.com>
 <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1515782244-6412-2-git-send-email-andrew.cooper3@citrix.com>

--CEwC1iMTbR7UmwEpVtr4Kos4UTGLUxIXN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/12/18 12:37 PM, Andrew Cooper wrote:
> All alteration of IST settings (other than the crash path) happen in an=

> identical triple.  Introduce helpers to keep the triple in sync, and re=
duce
> the risk of opencoded mistakes.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--CEwC1iMTbR7UmwEpVtr4Kos4UTGLUxIXN--

--IuabGTX0fXV163unThBCci9cnsrAQpX0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpZFrJfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl2ZUxAAhYj6IGFM9RKbavlAQjlQQDBEZ2SVvOs4ukzgHkCsMVgBofxW77srbQRB
slUwySF96dxf1IMGvvkAQ5/NH8o5GNljoQ5G/8VeRmxQwlYQIc1WnBFmBSIDfuDv
UQSWw1KIx1bCbEwa4/ZnmYQhDP+tE8ATh55Jxjo0gpGmD8hF+xu26UIyXE/Qn9fa
AnUnb235BYw7XouIJ+XJeX3d83u60HUVp9epc8wdwSHVNcnv68cy+QiggnG+IuzL
NJni8Kj5hPeyYVwoyARcDxk6lb8sC+Gj5mPTDqAFhR+IfuE67zhP0L0KsNY0zzaA
vgPXAKXHt0xnP7HDLe3Xh25jmPrGu5/tF9nFJxtsmkTbdQ1XpdR5VUMsQE/hDkLN
X2GkMNSbN+cIhxkJJqGe0HnPRdkbs3BcOBV26KAeb5NLLwYVpRx+vRAQmHZHUGQh
eQbkBNEpeuEA9XtpA1CFfDQM3YJMs5Ee5p3B8gK7LplaWuxT9XCpxSy7ZvEy3FXq
aHrUzUycRCDBZZ3ELVyl1IuQbtdCCfa7igxCwEqD/p5oDIoLHnoie8UFD5ZlftJR
dWMdPi6y8aOK85ABqe0Bs+34B0ld8oKFR0LUDkBkj1pdyD6M/r6jcKVucgV1VH5L
Dsby6u9172ZI4DAyR27hV5a2qqHKmEdHbCR51POoRKfUTB4Fj0I=
=A75B
-----END PGP SIGNATURE-----

--IuabGTX0fXV163unThBCci9cnsrAQpX0o--


--===============6036320166558118698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6036320166558118698==--
