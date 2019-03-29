From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2] xen/sched: fix credit2 smt idle handling
Date: Fri, 29 Mar 2019 18:06:21 +0100
Message-ID: <d06ee8f0df0df5826f57b4714284d9683eabfca7.camel@suse.com>
References: <20190328154622.4370-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5965387118893875793=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9uxv-0006G9-Bd
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 17:06:51 +0000
In-Reply-To: <20190328154622.4370-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5965387118893875793==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-jZkVFOdDeLKRd6o7Rk6g"


--=-jZkVFOdDeLKRd6o7Rk6g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-28 at 16:46 +0100, Juergen Gross wrote:
> Credit2's smt_idle_mask_set() and smt_idle_mask_clear() are used to
> identify idle cores where vcpus can be moved to. A core is thought to
> be idle when all siblings are known to have the idle vcpu running on
> them.
>=20
> Unfortunately the information of a vcpu running on a cpu is per
> runqueue. So in case not all siblings are in the same runqueue a core
> will never be regarded to be idle, as the sibling not in the runqueue
> is never known to run the idle vcpu.
>=20
> Use a credit2 specific cpumask of siblings with only those cpus
> being marked which are in the same runqueue as the cpu in question.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - use credit2 per-cpu specific sibling mask
> ---
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-jZkVFOdDeLKRd6o7Rk6g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeUI0ACgkQFkJ4iaW4
c+62WBAAoh80jTcEA6mM6ix/kBE8YtchfoWESZN9HkWB1Z3NAJF1naW4nWbpCiRD
aCOUFraWOtkbffJxMnNvfJ0GrIo2Otk9Hw1U0aeIbrFkdJWXq3pzg3EM4eFxLZsQ
9K+kU5WcZGmki582Q56YNgmNbbQ43i401biQRAvxHKGeZ1gAhZY5+RK5hNY2zQpG
ddlmGKeykWoayuqYoB4tmfJyVUpCGHXvcRv10Y/mSRBh+JNlgKTvqYLIHRXgk0GA
8bbHDcfEQGmStHb2sj8A8qwsKEopowctCdundRe5hLZejQO7BUlroTZ9aSPs43jY
51hIUFtNYYb3dMNEQ08wfKc+ZidFnVLKb35cHSmJnZbW/1SpGKMhcsO+uzB/HD+0
EfawacYb1H1f743u+leLQmCCPVOtki5rnopyROt/0XUHjv8Lj0uTbSV+/sBQjEXp
4goYsSRJ3QY7zJ9cFWzGXISXkNbANXs+DlOb0g9wfgr1KFUX3+uSOIawc2+dpxOW
uWZ+Tj+B6t2fXQgIihV26RWAkONktBJqAQHaCveBgMvhqRALDe16GPz1xIQPl5v4
QkLYkLpNxyPD9fkzHfuk+/dlm8Ww+mEKRjBhOJhGOaszaZrAAPpUoQEbyBSsC+IY
nghJ/3l3n66fOclGnD8jhzqKGDUzUVlgbPWuH9S0G4OT11sWyEk=
=w8Me
-----END PGP SIGNATURE-----

--=-jZkVFOdDeLKRd6o7Rk6g--



--===============5965387118893875793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5965387118893875793==--
