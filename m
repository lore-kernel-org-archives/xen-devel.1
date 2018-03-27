From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH for-4.11] tools: set DEBUG_DIR from configure
Date: Tue, 27 Mar 2018 18:18:08 +0200
Message-ID: <20180327161807.GD30726@aepfle.de>
References: <20180327161344.94634-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3991088557508087173=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t++c=gr=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1f0rIf-0003vA-V1
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 16:18:18 +0000
In-Reply-To: <20180327161344.94634-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============3991088557508087173==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 27, Roger Pau Monne wrote:

> +AC_ARG_WITH([debugdir],
> +    AS_HELP_STRING([--with-debugdir=DIR],
> +    [Path to directory for debug symbols. [PREFIX/usr/lib/debug]]),
> +    [debugdir_path=$withval],
> +    [debugdir_path=$prefix/usr/lib/debug])

Would that create /usr/usr/lib/debug per default?

Olaf

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWrpuvAAKCRBdQqD6ppg2
fh6FAJ9aVjxYz4GwTfGssOz1soHAWh2jqQCgmULU8FIxKBqh1S5eceWKGr9FVFY=
=LhK5
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--


--===============3991088557508087173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3991088557508087173==--
