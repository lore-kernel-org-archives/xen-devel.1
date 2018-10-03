From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] libxl: Restore scheduling parameters after
 migrate in best-effort fashion
Date: Wed, 03 Oct 2018 14:16:11 +0200
Message-ID: <56338afc80b5de10c9fa514b173928733f7380b2.camel@suse.com>
References: <20181002154926.24280-1-george.dunlap@citrix.com>
 <04dfacd1-4ff2-20b4-2bcd-df24ebe10ad6@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4520464642790088849=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mdhf=mp=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g7g4i-00023D-0g
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 12:16:20 +0000
In-Reply-To: <04dfacd1-4ff2-20b4-2bcd-df24ebe10ad6@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4520464642790088849==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZnhWYeT7/rq8TTXphSNB"


--=-ZnhWYeT7/rq8TTXphSNB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-10-03 at 12:53 +0200, Juergen Gross wrote:
> On 02/10/2018 17:49, George Dunlap wrote:
> > Commit 3b4adba ("tools/libxl: include scheduler parameters in the
> > output of xl list -l") added scheduling parameters to the set of
> > information collected by libxl_retrieve_domain_configuration(), in
> > order to report that information in `xl list -l`.
> >=20
> > Unfortunately, libxl_retrieve_domain_configuration() is also called
> > by
> > the migration / save code, and the results passed to the restore /
> > receive code.  This meant scheduler parameters were inadvertently
> > added to the migration stream, without proper consideration for how
> > to
> > handle corner cases.  The result was that if migrating from a host
> > running one scheduler to a host running a different scheduler, the
> > migration would fail with an error like the following:
> >=20
> > libxl: error: libxl_sched.c:232:sched_credit_domain_set: Domain
> > 1:Getting domain sched credit: Invalid argument
> > libxl: error: libxl_create.c:1275:domcreate_rebuild_done: Domain
> > 1:cannot (re-)build domain: -3
> >=20
> > Luckily there's a fairly straightforward way to set parameters in a
> > "best-effort" fashion.  libxl provides a single struct containing
> > the
> > parameters of all schedulers, as well as a parameter specifying
> > which
> > scheduler.  Parameters not used by a given scheduler are ignored.
> > Additionally, the struct contains a parameter to specify the
> > scheduler.  If you specify a specific scheduler,
> > libxl_domain_sched_params_set() will fail if there's a different
> > scheduler.  However, if you pass LIBXL_SCHEDULER_UNKNOWN, it will
> > use
> > the value of the current scheduler for that domain.
> >=20
> > In domcreate_stream_done(), before calling libxl__build_post(), set
> > the scheduler to LIBXL_SCHEDULER_UNKNOWN.  This will propagate
> > scheduler parameters from the previous instantiation on a best-
> > effort
> > basis.
> >=20
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Acked-by: Juergen Gross <jgross@suse.com>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-ZnhWYeT7/rq8TTXphSNB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlu0swsACgkQFkJ4iaW4
c+4qyg/8CYE3NM/maFOAsN4f2dxgtHa7wK2yael8lhWOJtO7aI+gjfz68ogmeTWQ
bLBnB2NszBBw8d2xB2tZQejAWcDUjLdwjxtWpZWpkIPuRystgWXmcbDvYTspKDUf
W1yj/UeHyWQE/5c3rAYCD/nSVp1opg5e/NU0vGEf0vm7D2hkkA67UHj+naM7pV6v
e/A8LDoKG5WogAmNCx5JQPmGrfeknExOBRjHp+M2r6FUkGEzi+AOCDN0IYq1E89U
zKDqtrNVj2/Mg4a10eVJ8SdWEWDK+iITGhrTbyV4YYiarJaV9Xjr1Q1qBudIBwn+
F7VlGthAJ6h0qvA7Fe7+vMM15kZjNWlvga9zRd5Wzf2Lav2rqnvmod3qszwYT/Sr
WEw7DDiRS8ft7i5gjC+EQByM+51dk1wiAka7VPgjDcBrPZocuFY1d3rzpWPTiz3l
nKxOMEVeg/p/vhGFrgZHYpeMO98Llu1BnR9crQ6CgloBwt6s1VWeu/pJ/UjPe16E
Us3ogtmLAQM7UH72gwOXjBg5HKydWpK/44mIo+j8Wv7nOnNXh4Ddp65iZH0Hypsd
n9F+pS5zlQ0tN7kySOLOTcwlDIUMFfhOCP1zY1FkgKdSY6vDCIw4Zi0JMut31Mof
LdjX1o7y2ULAJZUFAOaYx3qpICg3B4iopZ5qHVmMAcevwD5JZ8Q=
=+1Uw
-----END PGP SIGNATURE-----

--=-ZnhWYeT7/rq8TTXphSNB--



--===============4520464642790088849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4520464642790088849==--
