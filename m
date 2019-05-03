From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] sched/credit: avoid priority boost for
 capped domains when unpark
Date: Fri, 03 May 2019 18:48:45 +0200
Message-ID: <9434ed49fc68a05999e130abfde973663ed41d2d.camel@suse.com>
References: <20190503153839.19932-1-elnikety@amazon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8161936866514395340=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O1yy=TD=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hMbMs-0006GF-98
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:49:02 +0000
In-Reply-To: <20190503153839.19932-1-elnikety@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eslam Elnikety <elnikety@amazon.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Lars Kurth <lars.kurth@xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============8161936866514395340==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lqFLndsQ9Pd4FqObVpYf"


--=-lqFLndsQ9Pd4FqObVpYf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-05-03 at 15:38 +0000, Eslam Elnikety wrote:
> When unpausing a capped domain, the scheduler currently clears the
> CSCHED_FLAG_VCPU_PARKED flag before vcpu_wake(). This, in turn,
> causes the
> vcpu_wake to set CSCHED_PRI_TS_BOOST, resulting in an unfair credit
> boost. The
> comment around the changed lines already states that clearing the
> flag should
> happen AFTER the unpause. This bug was introduced in commit
> be650750945
> "credit1: Use atomic bit operations for the flags structure".
>=20
> Original patch author credit: Xi Xiong.
>=20
Mmm... I'm not an expert of these things, but doesn't this means we
need a "Signed-off-by: Xi Xiong <xxx@yyy.zzz>" then? Cc-ing Lars...

> Signed-off-by: Eslam Elnikety <elnikety@amazon.com>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Petre Eftime <epetre@amazon.com>
>
About the patch itself:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

With just one suggestion...

> --- a/xen/common/sched_credit.c
> +++ b/xen/common/sched_credit.c
> @@ -1538,7 +1538,7 @@ csched_acct(void* dummy)
>                  svc->pri =3D CSCHED_PRI_TS_UNDER;
> =20
>                  /* Unpark any capped domains whose credits go
> positive */
> -                if ( test_and_clear_bit(CSCHED_FLAG_VCPU_PARKED,
> &svc->flags) )
> +                if ( test_bit(CSCHED_FLAG_VCPU_PARKED, &svc->flags)
> )
>                  {
>                      /*
>                       * It's important to unset the flag AFTER the
> unpause()
> @@ -1547,6 +1547,8 @@ csched_acct(void* dummy)
>                       */
>                      SCHED_STAT_CRANK(vcpu_unpark);
>                      vcpu_unpause(svc->vcpu);
> +                    /* Now clear the PARKED flag */
> +                    clear_bit(CSCHED_FLAG_VCPU_PARKED, &svc->flags);
>
I don't think adding the comment here is necessary. The one which is
already present, explains things well enough, and this one does not add
much.

Acked-by stands anyway, but I'd prefer it to be removed (which I think
could be done when committing the patch?).

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-lqFLndsQ9Pd4FqObVpYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzMcO0ACgkQFkJ4iaW4
c+4vdQ/9H+X4yiuCoBt/UsAQ6DyM0HzDg3Wnb1w/rVPUPmWf52OnIczuIA0E7rNQ
iArMT8Krof+qVpPhsnveax1NFXmwbwyHo/R0FJK4Qi++WUJRoKlp4veekKKO9+i0
4JV25w3gC42IrCOGDfZi9+bmptvlIcJYnz1oNZmHrTQUS1ZUkBHuETdY+ZfbWF+P
BsEkOspyoC7YdtyuWPr/8bmeG1Pv+e0llng1JhwJWigtxIYjPuP5Yfbo7xF4saah
KPSGB4U5zZV2Xvg7uyqSRgQXQK0jWfnwuLfcB5K24v34krHw+XJt03tB2/pTqY87
VoXr3FAmjP86q3pibELS2Y2qIHmiqWCy2OmV3nLhunKbPfF8FmURvbBrRKGiNn/r
lttXYG9YX6IlHz4sPbxw+GQpU3bELszWiYsnFDZQTWu8i6+WYFcqXvOevgJw3EGT
6eTLcYv+TWHwIqT933Dw3+iJDlbdph8xIo9CDSxsB42ThAux05dqEJ4+LpJgFVIK
YsZ7/j92zeXgXqanNLB6OXm4Vtxti1VfbdBlahUdAcc+yHYZnkdRbZkn87VaN0YB
4+zUXqzQNJWXE3AbVyL07Z+oQ/z4pNtA0ji5RjBSxNE+gvLvLJ54m8BOkCo7nT0z
BsUc15WinpWE8N+Lsmsc1/gUaYrHgX1JndeUKs34d+dtK9XpOX0=
=Ye/I
-----END PGP SIGNATURE-----

--=-lqFLndsQ9Pd4FqObVpYf--



--===============8161936866514395340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8161936866514395340==--
