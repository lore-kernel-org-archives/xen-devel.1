From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC 6/6] PM / Hibernate: exclude all
 PageOffline() pages
Date: Thu, 15 Nov 2018 08:48:10 +0100
Message-ID: <20181115074810.GA9055__24395.2134893791$1542268015$gmane$org@amd>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-7-david@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1312678857933920376=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TRFs=N2=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1gNCNp-0004fK-QO
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 07:48:13 +0000
In-Reply-To: <20181114211704.6381-7-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org


--===============1312678857933920376==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-11-14 22:17:04, David Hildenbrand wrote:
> The content of pages that are marked PG_offline is not of interest
> (e.g. inflated by a balloon driver), let's skip these pages.
>=20
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>

Acked-by: Pavel Machek <pavel@ucw.cz>

> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index b0308a2c6000..01db1d13481a 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -1222,7 +1222,7 @@ static struct page *saveable_highmem_page(struct zo=
ne *zone, unsigned long pfn)
>  	BUG_ON(!PageHighMem(page));
> =20
>  	if (swsusp_page_is_forbidden(page) ||  swsusp_page_is_free(page) ||
> -	    PageReserved(page))
> +	    PageReserved(page) || PageOffline(page))
>  		return NULL;
> =20
>  	if (page_is_guard(page))
> @@ -1286,6 +1286,9 @@ static struct page *saveable_page(struct zone *zone=
, unsigned long pfn)
>  	if (swsusp_page_is_forbidden(page) || swsusp_page_is_free(page))
>  		return NULL;
> =20
> +	if (PageOffline(page))
> +		return NULL;
> +
>  	if (PageReserved(page)
>  	    && (!kernel_page_present(page) || pfn_is_nosave(pfn)))
>  		return NULL;

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvtJLoACgkQMOfwapXb+vIKwQCgqMCGJ4BEWmMsp5gihD0MR/cx
lFwAnAqKSOIHgjFwhl+uKuaItXeOXj2x
=TTZ/
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--


--===============1312678857933920376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1312678857933920376==--
