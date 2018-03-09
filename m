From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] tools/xenstore: add libdl dependency to
 libxenstore
Date: Fri, 9 Mar 2018 11:23:43 +0100
Message-ID: <20180309102343.GB12975@aepfle.de>
References: <20180307101744.32608-1-jgross@suse.com>
 <23199.51911.713278.912475@mariner.uk.xensource.com>
 <ac4b3f73-63b1-d081-aeed-a56d8a660d83@suse.com>
 <23199.54702.631341.284821@mariner.uk.xensource.com>
 <c0db67f3-707d-6e86-0fbd-7dfed9178d99@suse.com>
 <20180309083633.GA12975@aepfle.de>
 <579ae32f-1800-7416-ee5c-ef384804bca0@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5697667295889206307=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=1s9y=f7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1euFBl-0000mI-1M
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 10:23:49 +0000
In-Reply-To: <579ae32f-1800-7416-ee5c-ef384804bca0@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: ian.jackson@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============5697667295889206307==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 09, Juergen Gross wrote:

> So how does this work?

No idea, at least this output differs:

abuild@latitude:~> readelf -Wa /usr/lib64/libpython2.7.so | grep dlsym
00000000003e5e08  000000d900000007 R_X86_64_JUMP_SLOT     0000000000000000 dlsym@GLIBC_2.2.5 + 0
   217: 0000000000000000     0 FUNC    GLOBAL DEFAULT  UND dlsym@GLIBC_2.2.5 (10)
abuild@latitude:~> readelf -Wa /usr/lib64/libxenstore.so | grep dlsym
00000000002071b0  0000002b00000007 R_X86_64_JUMP_SLOT     0000000000000000 dlsym + 0
    43: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND dlsym

Olaf

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWqJgpAAKCRBdQqD6ppg2
fuWsAKCCYafAJHW/I68rXDLSR0P3dU4dsACeMoMLiSWbZat2KZBAopG7sAw91b4=
=eemk
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--


--===============5697667295889206307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5697667295889206307==--
