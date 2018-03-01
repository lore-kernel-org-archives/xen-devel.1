From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/6] xen/domain: Reduce the quantity of
 initialisation for system domains
Date: Thu, 01 Mar 2018 11:10:08 +0100
Message-ID: <1519899008.9145.11.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3890407196307652603=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-2-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3890407196307652603==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hwi/ANzqQd9L7lrz3jdf"


--=-hwi/ANzqQd9L7lrz3jdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 14:14 +0000, Andrew Cooper wrote:
>  * System domains don't need watchdog initialisation or iomem/irq
> rangesets,
>    and will not plausibly be a xenstore or hardware domain.
>  * The idle domain doesn't need scheduler initialisation (and in
> particular,
>    removing this path allows for substantial scheduler cleanup), and
> isn't
>    liable to ever need late_hwdom_init().
>=20
> Move all of these initialisations pass the DOMCRF_dummy early exit,
> and into
> non-idle paths.  rangeset_domain_initialise() remains because it
> makes no
> allocations, but does initialise a linked list and spinlock.  The
> poolid
> parameter can be dropped as sched_init_domain()'s parameter is now
> unconditionally 0.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-hwi/ANzqQd9L7lrz3jdf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX0YAACgkQFkJ4iaW4
c+74VA//UBVSLzevUSHsLT0O8+01u4nz0qhQQcJUzgNfGw4FM1A1yJizTHbH84Hd
byAlqlrTIB6CMlH6G6UwOahXqN7Cz/vrlakr9iBp5H79qVxvWKaO27ak/tAukmmh
8jMjs64dZEKbQlzyYajtpNPjLSEe+bIqj4tplqnWHFi4O0jepJj1ktJLeF/qIxNS
nVr0wkzHDx3IXwLZ1cU5E9LhrFEPe5i1SbS1vTKyk/YMs/O9dTBipv4hkbcmEx1C
6+WrG8R1VN9G2Bk8fEmvaWTfEJ3dPGY1eG1OTGmJ7eoeMTsmyQ/OoiBYvn20wrAP
rWM92KIg4m0xIztPOIhN78xU5QKJEPLo4KY5vZh1M5Lh/pc/v23A5mjYfbPPo16T
loHQEHw9Lm2tW/2Hgl7va7JiEhx1EbgZuaI3sAKIah5+p4eP5y8dXe1JyY2B4T7J
4wLHjCqtN33gYX5Gbkao1IPH8edQODednAPuPpug5qI15AyZbmMUCNs03Zf8T1Yo
S5DlNLg1V+qb8qsvnXuP5vFq6KWk7zPA/EWI4CchLSrG7NMoJ3KOGvTOk7H13pnu
KKmV7Gp11B1DzR9b8MEXXQnaz/Kwsp6B0h6+br41Mq6BUNHc5gg8jHteALCYwe0D
+ppMAgBIvx3dV8TQQ7FmyxZJKzpulKmsEiz8ZCcGe4J/rNFIhRs=
=vy28
-----END PGP SIGNATURE-----

--=-hwi/ANzqQd9L7lrz3jdf--



--===============3890407196307652603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3890407196307652603==--
