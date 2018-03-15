From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 00/27] x86: PIE support and option to
 extend KASLR randomization
Date: Thu, 15 Mar 2018 09:48:36 +0100
Message-ID: <20180315084836.GA15953__40274.3406979882$1521103651$gmane$org@amd>
References: <20180313205945.245105-1-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3080996901976717656=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovbe=gf=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1ewOZ0-0005Ih-EV
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 08:48:42 +0000
In-Reply-To: <20180313205945.245105-1-thgarnie@google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Hocko <mhocko@suse.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, "H . Peter Anvin" <hpa@zytor.com>, kernel-hardening@lists.openwall.com, Christoph Lameter <cl@linux.com>, Jiri Slaby <jslaby@suse.cz>, Alok Kataria <akataria@vmware.com>, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Rad
List-Id: xen-devel@lists.xenproject.org


--===============3080996901976717656==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> These patches make the changes necessary to build the kernel as Position
> Independent Executable (PIE) on x86_64. A PIE kernel can be relocated bel=
ow
> the top 2G of the virtual address space. It allows to optionally extend t=
he
> KASLR randomization range from 1G to 3G.

Would you explain why PIE code is good idea?

You are adding less than 2 bits of randomness. Cost is new config
option, some size and performance impact, and more than 1000 lines of
code...

Is there some grand plan of adding 30 more bits of randomness with
future patch or something?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqqM2QACgkQMOfwapXb+vIPUQCgiwtu3igz+Mea6JgZEWaFBEa4
DdUAn1zcqcTDjpsItrwfFnQZ9XU/fRNQ
=OpfY
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--


--===============3080996901976717656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3080996901976717656==--
