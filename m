From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3] new config option vtsc_tolerance_khz to
 avoid TSC emulation
Date: Tue, 6 Mar 2018 13:11:26 +0100
Message-ID: <20180306131126.23f86a32.olaf@aepfle.de>
References: <20180306104133.22106-1-olaf@aepfle.de>
 <af47cc31-d3cb-023a-1229-ab9eb013f985@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4026433540467264667=="
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

--===============4026433540467264667==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/T2TED7u7FWbgDHgF5mJkAm9"; protocol="application/pgp-signature"

--Sig_/T2TED7u7FWbgDHgF5mJkAm9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 6 Mar 2018 11:07:54 +0000
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> We should see about using better sources of information.=C2=A0 For one, m=
any
> Intel systems actually expose the TSC frequency in the bottom of the
> PLATFORM_INFO MSR, although this isn't architectural, and has been
> replaced with CPUID information in Skylake.

I'm not familiar with that.
Is it what arch/x86/kernel/tsc_msr.c:cpu_khz_from_msr()
gets from MSR_PLATFORM_INFO + MSR_FSB_FREQ?

Olaf

--Sig_/T2TED7u7FWbgDHgF5mJkAm9
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWp6FbgAKCRBdQqD6ppg2
fiDKAJ0bVT99NxSX3YVIzuuyJplq6kfVsACZAcgRCAwyeBkd5sus1n4uh+av7k8=
=WB0o
-----END PGP SIGNATURE-----

--Sig_/T2TED7u7FWbgDHgF5mJkAm9--


--===============4026433540467264667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4026433540467264667==--
