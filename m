From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Tue, 6 Mar 2018 12:32:42 +0100
Message-ID: <20180306123242.44f69b41.olaf@aepfle.de>
References: <20180306104133.22106-1-olaf@aepfle.de>
 <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3168183267951956349=="
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

--===============3168183267951956349==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/2c/ecJP+3/e43JOldwbXljA"; protocol="application/pgp-signature"

--Sig_/2c/ecJP+3/e43JOldwbXljA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Mar 2018 11:07:54 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> > One option to avoid the TSC option is to run domUs with tsc_mode=3Dnati=
ve.
> > This has the drawback that migrating a domU from a "2.3GHz" class host
> > to a "2.4GHz" class host may change the rate at wich the TSC counter
> > increases, the domU may not be prepared for that. =20
>=20
> Given that you identify this specifically, why do you think this change
> is safe or sensible in the first place?=C2=A0 If using the options here, =
time
> will definitely drift in the VM after migrate.

This option is a variant of tsc_mode=3Ddefault for different hosts,
and tsc_mode=3Dnative for identical hosts. I think the tsc_mode can not
be adjusted for running domUs. So it gives some control to the host admin
about how to handle the drift.

Olaf

--Sig_/2c/ecJP+3/e43JOldwbXljA
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWp58WgAKCRBdQqD6ppg2
fnm1AJ9UEdFHXDr+eXjuljOxlU9tVLQiEQCg3pE+RTiIqNhoL2ZB1UcCouJyPps=
=mUAs
-----END PGP SIGNATURE-----

--Sig_/2c/ecJP+3/e43JOldwbXljA--


--===============3168183267951956349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3168183267951956349==--
