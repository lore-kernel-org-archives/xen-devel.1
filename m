From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v5] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 29 Mar 2018 10:58:34 +0200
Message-ID: <20180329085834.GI30726@aepfle.de>
References: <20180327092655.28530-1-olaf@aepfle.de>
 <20180329082545.sxx57zod4rttxqc6@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6788134216565148694=="
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


--===============6788134216565148694==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HuXIgs6JvY9hJs5C"
Content-Disposition: inline


--HuXIgs6JvY9hJs5C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, Roger Pau Monn=C3=A9 wrote:

> AFAICT in the chunk above you will disable vtsc without checking if
> the hardware supports TSC scaling, which leads to inaccurate TSC values
> on hardware that could provide accurate results without the software
> emulation overhead.

Is that really the case? Maybe I get the logic wrong, but what I see is:
what ever my change does, or if a HVM domain runs on a host with scaling
feature, disable vtsc. hvm_get_tsc_scaling_ratio has no side effects.
Isnt the purpose to not emulate vtsc if the hardware supports scaling?

Olaf

--HuXIgs6JvY9hJs5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWryqtwAKCRBdQqD6ppg2
foBzAJ9mPCCOXxcHuZGZVhp+hqvnXpkN2wCg+CtmTBuShfA3x6JnOuBQ1I+W0IQ=
=8u+/
-----END PGP SIGNATURE-----

--HuXIgs6JvY9hJs5C--


--===============6788134216565148694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6788134216565148694==--
