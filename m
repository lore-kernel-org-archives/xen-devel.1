From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH for-4.11] tools: set DEBUG_DIR from configure
Date: Fri, 25 May 2018 17:19:03 +0200
Message-ID: <20180525151903.GA21503@aepfle.de>
References: <20180327161344.94634-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2263103617733392459=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zfce=im=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fMEUq-0006m7-I4
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 15:19:13 +0000
In-Reply-To: <20180327161344.94634-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============2263103617733392459==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 27, Roger Pau Monne wrote:

> Allow the path to be set from a configure command line option.

Please backport 641f9ce2fa to 4.10 ASAP. See
https://lists.xenproject.org/archives/html/xen-devel/2018-02/msg02749.html

Thanks.

Olaf

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWwgpZAAKCRBdQqD6ppg2
fpcZAJ46iI/C0TuXVAH0GmwVmg+I8amFvgCfaijmFfaI2ziy171KAAHmniRkrYQ=
=hPMp
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--


--===============2263103617733392459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2263103617733392459==--
