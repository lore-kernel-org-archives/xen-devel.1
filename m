From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: Fixes tag needs work in the xen-tip tree
Date: Tue, 15 Jan 2019 16:39:02 -0500
Message-ID: <3b87ef37-3ca8-88cf-fe8f-3e8ee6af6975@oracle.com>
References: <20190116080620.4c2c143f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Z4JFOmEhMLFZ69tj1UJhy3wiMr4AN4hVK"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116080620.4c2c143f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wen Yang <wen.yang99@zte.com.cn>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Z4JFOmEhMLFZ69tj1UJhy3wiMr4AN4hVK
Content-Type: multipart/mixed; boundary="s7roISkloo2Amv68gzmhPrcOFHbozNHy9";
 protected-headers="v1"
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen Devel <Xen-devel@lists.xensource.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wen Yang <wen.yang99@zte.com.cn>,
 Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <3b87ef37-3ca8-88cf-fe8f-3e8ee6af6975@oracle.com>
Subject: Re: linux-next: Fixes tag needs work in the xen-tip tree
References: <20190116080620.4c2c143f@canb.auug.org.au>
In-Reply-To: <20190116080620.4c2c143f@canb.auug.org.au>

--s7roISkloo2Amv68gzmhPrcOFHbozNHy9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 1/15/19 4:06 PM, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   786e1048e7f4 ("pvcalls-front: fix potential null dereference")
>
> has a malformed Fixes tag:
>
>   Fixes: 9f51c05dc41a ("pvcalls-front: Avoid get_free_pages(GFP_KERNEL)=

>   under spinlock")
>
> It should not be split over 2 lines.
>


Thanks, fixed.

-boris


--s7roISkloo2Amv68gzmhPrcOFHbozNHy9--

--Z4JFOmEhMLFZ69tj1UJhy3wiMr4AN4hVK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEExAVKDNg/TOdD61Yyit52kIbKwbIFAlw+UvYACgkQit52kIbK
wbJLWxAAlYJb5qTJcKP7aPrZvOsOP7f/YR3FtbUvwxH1JqzXMkcrY1lQaf47+SdE
7ZlfD0to+iG3RYqG2aQHEdWmEqXUeBJDLegzPgAFQv2veKu8YIx7LPT7PWAuSsiG
ttg0KTt3jq8bFvjaJElwnt0pG9DKiz+VSsyeSzFA32ecdBsE67PqrNbj4QE/8WJ/
cikqypygxRgu6zJnellkQKpekIkMUE5cEqLo5d5i9Xi/nCunAxOWuVZBusUexm8J
6ibEIjskfjqxYB+/QONrtCxmK9PqT9Sj5v2S3fcVxthDVqtTL/VbHhEeybzeJGaw
U/78/e7jKaDDUAaeBuss5A1jNaE+HHX3IQh+D6ZYXwdPmYmvCIKSmTzChXzAfIXw
h6tBDdMJ3rgtQNcQQFgGFjgJLQOxccoMZ5qmACD3CikwWGMi8z7QLM39ZRRLI7mp
lsJWpoG94B9PmyzA2WLEp+UDyMbsib+BiNhzl1cPrz+Dv5SOGva/y4LlBwDa2eas
5hRIZIvySf3AVEwXTuF3mWDtNGL64JlRaR3ITQNWn7v0KHF4rIBxpDDl9rzIpAbJ
qp/8LT+ZUarZBjwkgMu0PYnLcNMz2jUcd0jueew9rrjpShhBn20PWmZSws2P7bs5
ZfJ3/ZFNTtFFS0GlH0/ZJ5RQvMiEh6nEVHZh2OZvNhBNU8Ew3Gc=
=xBW/
-----END PGP SIGNATURE-----

--Z4JFOmEhMLFZ69tj1UJhy3wiMr4AN4hVK--
