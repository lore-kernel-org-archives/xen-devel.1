From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/6] xen/sched: Remove {init,
 destroy}_domain() interfaces
Date: Thu, 01 Mar 2018 12:00:34 +0100
Message-ID: <1519902034.9145.15.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6717682673784728105=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519827268-18199-5-git-send-email-andrew.cooper3@citrix.com>
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


--===============6717682673784728105==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dvaOzOYiNq2huDHVtYhT"


--=-dvaOzOYiNq2huDHVtYhT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 14:14 +0000, Andrew Cooper wrote:
> These hooks have one single caller (sched_{init,destroy}_domain()
> respectively) and are all identical (when implemented).
>=20
> Previous changes have ensured that only real domains reach these
> functions, so
> ASSERT() that system domains are not seen. Call
> sched_{alloc,free}_domdata()
> directly, and handle d->sched_priv directly.
>=20
> The net diffstat is:
>   add/remove: 0/8 grow/shrink: 1/7 up/down: 7/-335 (-328)
>   function                                     old     new   delta
>   sched_destroy_domain                         130     137      +7
>   sched_init_domain                            138     137      -1
>   rt_dom_destroy                                 6       -      -6
>   null_dom_destroy                               6       -      -6
>   csched_dom_destroy                             9       -      -9
>   csched2_dom_destroy                            9       -      -9
>   sched_rtds_def                               264     248     -16
>   sched_null_def                               264     248     -16
>   sched_credit_def                             264     248     -16
>   sched_credit2_def                            264     248     -16
>   sched_arinc653_def                           264     248     -16
>   ops                                          264     248     -16
>   rt_dom_init                                   52       -     -52
>   null_dom_init                                 52       -     -52
>   csched_dom_init                               52       -     -52
>   csched2_dom_init                              52       -     -52
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
--=-dvaOzOYiNq2huDHVtYhT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX3VIACgkQFkJ4iaW4
c+6IWQ/8CxsirWcvjJX22i5uiVK6p7UrMRnoRHRUIr/zMgLTKlA0+gsHLlGYJ0FT
705e75AomzssBMMUYF/5EozpUzZp4/k5jL/r/t+jzDOEdtrgpNJy/S+yyvOnmCBK
DQmOzGHnqAZM5Sq++LJ1bf5/q2ibm5dBiNGR/cI20wqAzyU9jMEZcdLsU9lcaNbf
nZUMcPauRaKQj6wSJ4nYi3BNHPx7yUVzoi0nkFDG6LRNvaMgQ9bVBNmstTCgLMM8
E/1S/53IdJoAP+sYoSeW6C4XG+P4QQ0w7WG4WsIxXlTpIH0ufPCUvZmYJWG9sQ2P
CUP/8YMMsyXjiXjbu0hrX4PEw0i203k1LJx2hiBa9HEoUj8XIlXFsPq+5VrQT8Fi
6XvYpjo9I+TuuxV/kF/WhY4BwgOPazVpc1K+E1BgARydSsVbpG3RaXZh/je9KK2t
K2D0UqwTh6E0DgFUdnny9kk0k9NxwttqupUVMrujpVv5JlS0xasaH4nFdeoNptF3
bBeEW8tM5UuAimeJs5rydLUnPVEOKBoECxZGCn54Fw9ID4so9YEj+3gFUqVAUoJX
PjminIZ9VQBTcM2wwzQEnMEXem4RyexXozARYDvR0Jxrj7HK7m18sKRfOC3fU4TM
ImY62ZnkTM4NQ/sldKvkqJNTpO3Pr4cB8m4n1kFhOBVDqSAM0go=
=6xLx
-----END PGP SIGNATURE-----

--=-dvaOzOYiNq2huDHVtYhT--



--===============6717682673784728105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6717682673784728105==--
