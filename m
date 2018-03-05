From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] new config option vtsc_khz_tolerance to
 avoid TSC emulation
Date: Mon, 5 Mar 2018 18:05:58 +0100
Message-ID: <20180305180558.23203362.olaf@aepfle.de>
References: <20180305113555.8467-1-olaf@aepfle.de>
 <5A9D51A902000078001AE868@prv-mh.provo.novell.com>
 <20180305151835.6d36d52e.olaf@aepfle.de>
 <5A9D661402000078001AE986@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2247459188074238424=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9D661402000078001AE986@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFyY3p5a293?= =?UTF-8?B?c2tpLUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

--===============2247459188074238424==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/8c6drcmXyNw9PRyFwyfqE/z"; protocol="application/pgp-signature"

--Sig_/8c6drcmXyNw9PRyFwyfqE/z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 05 Mar 2018 07:45:24 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> I'm only talking about additions you make, and I don't see a size
> difference between "vtsc_khz_tolerance" and "vtsc_tolerance_khz".

Oh, I misunderstood that sentence. I will change the name as suggested.

Olaf

--Sig_/8c6drcmXyNw9PRyFwyfqE/z
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWp149gAKCRBdQqD6ppg2
frSUAJ4jGfoOAFQ0PjVcrX3MD+s8SrHJawCg+teQGsDyzDyS/24Qz4oWLIAPTdo=
=p0AU
-----END PGP SIGNATURE-----

--Sig_/8c6drcmXyNw9PRyFwyfqE/z--


--===============2247459188074238424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2247459188074238424==--
