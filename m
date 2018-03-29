From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Mar 2018 10:17:56 +0200
Message-ID: <20180329081755.GG30726@aepfle.de>
References: <20180327092655.28530-1-olaf@aepfle.de>
 <5ABCBA3502000078001B7055@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7086732645761381264=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5ABCBA3502000078001B7055@prv1-mh.provo.novell.com>
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


--===============7086732645761381264==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aYDVKSzuImP48n7V"
Content-Disposition: inline


--aYDVKSzuImP48n7V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 29, Jan Beulich wrote:

> >>> On 27.03.18 at 11:26, <olaf@aepfle.de> wrote:
> > +            khz_diff = cpu_khz > gtsc_khz ?
> > +                       cpu_khz - gtsc_khz : gtsc_khz - cpu_khz;
> abs() (or some variant of it, like __builtin_absl(), seeing that we
> don't appear to have any abstraction right now)?

I see no other usage of *abs*. Really optimize that one-shot function?

> d%d

A for an unsigned type? But I see it is done elsewhere, so it must be
correct.


Olaf

--aYDVKSzuImP48n7V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWryhMAAKCRBdQqD6ppg2
fiZeAJsEGEIt0CQWkccbfaXia9ljvAGsJACfVZz+MgXmKHrc3dCfJZ/yoIkaCU8=
=UuJL
-----END PGP SIGNATURE-----

--aYDVKSzuImP48n7V--


--===============7086732645761381264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7086732645761381264==--
