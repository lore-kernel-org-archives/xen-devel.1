From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 3/6] xen/sched: Improvements to the {alloc,
 free}_domdata() interfaces
Date: Thu, 01 Mar 2018 11:39:08 +0100
Message-ID: <1519900748.9145.14.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2620365390854737714=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-4-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Robert VanVossen <robert.vanvossen@dornerworks.com>
List-Id: xen-devel@lists.xenproject.org


--===============2620365390854737714==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-nfdQwfFewIfKIMwntaeZ"


--=-nfdQwfFewIfKIMwntaeZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 14:14 +0000, Andrew Cooper wrote:
> The main purpose of this change is for the subsequent cleanup it
> enables, but
> it stands on its own merits.
>=20
> In principle, these hooks are optional, but the SCHED_OP() default
> aliases a
> memory allocation failure, which causes arinc653 to play the
> dangerous game of
> passing its priv pointer back, and remembering not to actually free
> it.
>=20
> Redefine alloc_domdata to use ERR_PTR() for errors, NULL for nothing,
> and
> non-NULL for a real allocation, which allows the hook to become
> properly
> optional.  Redefine free_domdata to be idempotent.
>=20
> For arinc653, this means the dummy hooks can be dropped
> entirely.  For the
> other schedulers, this means returning ERR_PTR(-ENOMEM) instead of
> NULL for
> memory allocation failures, and modifying the free hooks to cope with
> a NULL
> pointer.  While making the alterations, drop some spurious casts to
> void *.
>=20
> Introduce and use proper wrappers for
> sched_{alloc,free}_domdata().  These are
> strictly better than SCHED_OP(), as the source code is visible to
> grep/cscope/tags, the generated code is better, and there can be
> proper
> per-hook defaults and checks.
>=20
> Callers of the alloc hooks are switched to using IS_ERR(), rather
> than
> checking for NULL.
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
--=-nfdQwfFewIfKIMwntaeZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX2EwACgkQFkJ4iaW4
c+5TzBAAjSViBx4IMm57/P7A+Lohc2yAPtnIIpUfe439NvtbO03teDOk7E0l77Mx
0GN8+ifdOOEvubDEJR7+SHIIE8fsWfOi42XtVVq7IXzlmNAxJBdsxc5Tbugfmw7s
LgDvJ/BNhYkgi8MiNfPgOsJVW/Fe6QLvtydgfHDbny0fXilqpVbvealtIzc6EfEN
tXAhVKDTMo+hvPUqgOBS3eHHtlTtKRSk+8IwSTr6/eS/X2smn/ks04ipoj0SLhn5
3hze5rJdaFsMF/xBLj6ik+Y59p4U37H0xasg57ZUnZX2vt/WVMm8fpPDX/3e5NyI
lh6w76YbDNtMjBSTpo9/8BqHYGW1/1srQGkcUXxVYcIP1EDc++y3tazHb37+yxIE
/JYm4ni9z6oEnsObY0K9gPzV0/933+SRokA3DwzlCg4GlDR2BcJrjF+A8pidnT5/
DkKKeILGnUV2gimHCh9h0lebgN/MA4pTI8ZaGpgb2QH3axsxf8DCADb1Zauk16ex
Dfmz032jFMp0yZJJhtM7iZavPx1FjR/eFfQMsO6pwB6tHeolWHBD3GomXlhexkq9
YSfeJZbWzBnIvaIdavQ5mU2C41mxBvCho1lTu4gShfBhGye8euM/0BdzPZ978/OP
qRtc6SM07jxaUxmmWNKZeLYvcbKaVY/uJmqEjmzJv+9xXPYY1tE=
=gQjU
-----END PGP SIGNATURE-----

--=-nfdQwfFewIfKIMwntaeZ--



--===============2620365390854737714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2620365390854737714==--
