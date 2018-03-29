From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Mar 2018 10:32:18 +0200
Message-ID: <20180329083217.GH30726@aepfle.de>
References: <20180327092655.28530-1-olaf@aepfle.de>
 <20180329082545.sxx57zod4rttxqc6@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0523406877789292606=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180329082545.sxx57zod4rttxqc6@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============0523406877789292606==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cW+P/jduATWpL925"
Content-Disposition: inline


--cW+P/jduATWpL925
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, Roger Pau Monn=C3=A9 wrote:

> IMO if hardware TSC scaling is supported vtsc_tolerance_khz should be
> ignored, and the TSC should be scaled by the hardware always in order
> to provide accurate values.

Good point, I will double check that part and do nothing if hardware
scaling happens to be available on the current host.

Olaf

--cW+P/jduATWpL925
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWrykiwAKCRBdQqD6ppg2
fs+cAKCOoOB0gGldKDFGNGTjM8LdzuEWYwCg2kZaZAIaJEJkI5pv6zMIJzIqz/4=
=mOJK
-----END PGP SIGNATURE-----

--cW+P/jduATWpL925--


--===============0523406877789292606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0523406877789292606==--
