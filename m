From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Wed, 1 Aug 2018 18:17:47 +0200
Message-ID: <20180801181747.170405d8.olaf@aepfle.de>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <20180626191113.2d8e6876.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7632870035223851247=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180626191113.2d8e6876.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============7632870035223851247==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/UaUvqNRRbyxprW/lPMiVMTg"; protocol="application/pgp-signature"

--Sig_/UaUvqNRRbyxprW/lPMiVMTg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 26 Jun 2018 19:11:13 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Am Thu,  7 Jun 2018 15:08:29 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
> > Add an option to control when vTSC emulation will be activated for a
> > domU with tsc_mode=3Ddefault. Without such option each TSC access from
> > domU will be emulated, which causes a significant perfomance drop for
> > workloads that make use of rdtsc. =20
> Andrew,
> do you have any comments on this patch/approach?


Andrew,

any comments on this patch?

https://lists.xen.org/archives/html/xen-devel/2018-06/msg00398.html

Olaf

--Sig_/UaUvqNRRbyxprW/lPMiVMTg
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW2HdKwAKCRBdQqD6ppg2
fnWfAKCWiRzb6J0K4TZKY/ELSC2evNCSPwCfaRASprvCeXO9YbGKkQbht+QyNNE=
=HMxG
-----END PGP SIGNATURE-----

--Sig_/UaUvqNRRbyxprW/lPMiVMTg--


--===============7632870035223851247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7632870035223851247==--
