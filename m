From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH] automation: add SLES 11 SP4 dockerfile
Date: Wed, 18 Jul 2018 11:44:40 +0200
Message-ID: <20180718094404.GA8304@aepfle.de>
References: <20180717200305.4067-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8375223222813676055=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mcpn=kc=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ffj1P-0004zj-5G
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 09:45:23 +0000
In-Reply-To: <20180717200305.4067-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============8375223222813676055==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 17, Wei Liu wrote:

> No OVMF because it requires gcc 4.4 or later.

Fine.

> No seabios because it requires anonymous union initialisation

It is required to build Xen like that (with a custom compiler from gcc48.rpm):

test -x "$(type -p gcc)" && CC=$_
test -x "$(type -p gcc-4.8)" && CC=$_
make \
        CC=$CC \
        HOSTCC=$CC \
        xen

make \
        CC=$CC \
        GCC=$CC \
        HOSTCC=$CC \
        HOST_CC=$CC \
        BUILD_CC=$CC \
        tools stubdom

> No QEMU upstrea because sed doesn't support -E.

libvirt+QEMU upstream does not support SLE11 anymore due to the
requirement for a newer glib2. In case Xen wants to stick with qemu-2.12
for a while, SLE11 could still be tested for fun and education.


Olaf

--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW08L/QAKCRBdQqD6ppg2
fgt0AJ4sdLs0Gc4EWfHjzcuuyFjlGSinAQCfaSx8NlMJM1/kkukgjhuU5AoZRvw=
=i9R4
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--


--===============8375223222813676055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8375223222813676055==--
