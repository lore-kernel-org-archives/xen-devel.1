From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v1 7/8] PM / Hibernate: use
 pfn_to_online_page()
Date: Mon, 19 Nov 2018 14:16:53 +0100
Message-ID: <20181119131653.GA27556__1480.86856720528$1542633346$gmane$org@amd>
References: <20181119101616.8901-1-david@redhat.com>
 <20181119101616.8901-8-david@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4687955112231350195=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lwbq=N6=ucw.cz=pavel@srs-us1.protection.inumbo.net>)
 id 1gOjQ9-00041n-CT
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 13:16:57 +0000
In-Reply-To: <20181119101616.8901-8-david@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Len Brown <len.brown@intel.com>, Michal Hocko <mhocko@suse.com>, linux-pm@vger.kernel.org, pv-drivers@vmware.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-doc@vger.kernel.org, kexec-ml <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: xen-devel@lists.xenproject.org


--===============4687955112231350195==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2018-11-19 11:16:15, David Hildenbrand wrote:
> Let's use pfn_to_online_page() instead of pfn_to_page() when checking
> for saveable pages to not save/restore offline memory sections.
>=20
> Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlvyt8UACgkQMOfwapXb+vKC6ACeIzp6Bg+hmUwQWwjh+ih57//k
JAoAoJFh/JwjaBISFtEww2yg/SP3hHMv
=Xcas
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--


--===============4687955112231350195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4687955112231350195==--
