From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v9] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Thu, 13 Sep 2018 09:39:13 +0200
Message-ID: <20180913093913.328a523a.olaf@aepfle.de>
References: <20180607130829.18811-1-olaf@aepfle.de>
 <20180626191113.2d8e6876.olaf@aepfle.de>
 <20180801181747.170405d8.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3281782390074541580=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180801181747.170405d8.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Lars Kurth <lars.kurth@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

--===============3281782390074541580==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/f/tgnFqHw2aabL/jRYZO1wt"; protocol="application/pgp-signature"

--Sig_/f/tgnFqHw2aabL/jRYZO1wt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Andrew, Lars,

this patch was not applied yet, even after a few "pings".

I think it needs an approval from Andrew before it can go in, unless the
bug has to be fixed in some other way.

Please take some time to review that change.

Thanks,
Olaf

Am Wed, 1 Aug 2018 18:17:47 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Am Tue, 26 Jun 2018 19:11:13 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
> > Am Thu,  7 Jun 2018 15:08:29 +0200
> > schrieb Olaf Hering <olaf@aepfle.de>: =20
> > > Add an option to control when vTSC emulation will be activated for a
> > > domU with tsc_mode=3Ddefault. Without such option each TSC access from
> > > domU will be emulated, which causes a significant perfomance drop for
> > > workloads that make use of rdtsc.   =20
> > Andrew,
> > do you have any comments on this patch/approach? =20
> Andrew,
> any comments on this patch?
> https://lists.xen.org/archives/html/xen-devel/2018-06/msg00398.html

--Sig_/f/tgnFqHw2aabL/jRYZO1wt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5oUIQAKCRBdQqD6ppg2
fiTzAKCYvYZBTuVwXEdjUzXl0vF4GV3TGwCZAQD5KQ2LEtV+N4bTur5iW69Ucu4=
=neim
-----END PGP SIGNATURE-----

--Sig_/f/tgnFqHw2aabL/jRYZO1wt--


--===============3281782390074541580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3281782390074541580==--
