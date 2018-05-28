From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH for-4.11] tools: set DEBUG_DIR from configure
Date: Mon, 28 May 2018 08:06:11 +0200
Message-ID: <20180528060611.GA7595@aepfle.de>
References: <20180327161344.94634-1-roger.pau@citrix.com>
 <20180525151903.GA21503@aepfle.de>
 <23304.12272.757552.289764@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7302884128194090934=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=bc41=ip=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fNBIT-0002wn-Ho
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 06:06:22 +0000
In-Reply-To: <23304.12272.757552.289764@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7302884128194090934==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 25, Ian Jackson wrote:

> Can you please provide that information ?  That should really have
> been in your commit message, as the git commit id.  TBH, most of what
> is in that email could profitably have been in your commit message...

Perhaps 641f9ce2fa should have been more verbose.

Do you want me to provide a verbose backport, or would that be against
the rules of how backporting from master is supposed to be done?

Olaf

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWwucUAAKCRBdQqD6ppg2
fuyZAKCGTljvMvbNu+0Sxq2gOkbsFVPypQCg1jBSBhTU2lu77KtIvhqjdrRyx+k=
=DALi
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--


--===============7302884128194090934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7302884128194090934==--
