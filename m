From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Mar 2018 12:05:32 +0200
Message-ID: <20180329100532.GL30726@aepfle.de>
References: <20180327092655.28530-1-olaf@aepfle.de>
 <5ABCBA3502000078001B7055@prv1-mh.provo.novell.com>
 <20180329081755.GG30726@aepfle.de>
 <5ABCC17902000078001B709B@prv1-mh.provo.novell.com>
 <20180329092321.GJ30726@aepfle.de>
 <5ABCD48402000078001B7187@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3771247888291435650=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ABCD48402000078001B7187@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org


--===============3771247888291435650==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dfmC41YZQlborXoK"
Content-Disposition: inline


--dfmC41YZQlborXoK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 29, Jan Beulich wrote:

> Actually I was wrong - we have an abstraction already, just that
> it's upper case: ABS(). But it requires its input to have signed type.

Would this be acceptable?
khz_diff = ABS((long)cpu_khz - (long)gtsc_khz);

Olaf

--dfmC41YZQlborXoK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWry6aQAKCRBdQqD6ppg2
ftyXAKC9SFlA4rRHUgxF7+bnvKhJvbG0vQCeKfDwrkRaGtxut/sJaQ+2o0FmqX4=
=ZKFL
-----END PGP SIGNATURE-----

--dfmC41YZQlborXoK--


--===============3771247888291435650==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3771247888291435650==--
